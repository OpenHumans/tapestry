class OauthToken < ActiveRecord::Base
  require 'net/http'
  require 'net/https'
  require 'uri'
  include ApplicationHelper

  belongs_to :user
  belongs_to :oauth_service
  validates_uniqueness_of :user_id, :oauth_service_id

  attr_reader :redirect_to
  attr_protected :requesttoken
  attr_protected :accesstoken

  def authorized?
    self.accesstoken
  end

  def revoke!
    return nil if !authorized?
    self.destroy if self.oauth_service.revoke_token(self)
  end

  def authorize!(next_page)
    if authorized?
      flash[:notice] = 'You have already authorized this service.'
      @redirect_to = next_page
      return nil
    end
    callback_uri = ROOT_URL + '/oauth_tokens/get_access_token?next_page=' + uriencode(next_page)
    base_uri = self.oauth_service.getrequesttoken_uri
    uri = URI.parse(base_uri)
    formdata = {
      'oauth_callback' => callback_uri,
      'oauth_consumer_key' => self.oauth_service.consumerkey,
      'oauth_nonce' => rand(2**64-1).to_s,
      'oauth_signature_method' => 'RSA-SHA1',
      'oauth_timestamp' => Time.new.to_i.to_s,
      'scope' => self.oauth_service.scope,
      'oauth_version' => '1.0'
    }
    formdata['oauth_signature'] = oauth_service.sign('POST', base_uri, formdata)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if uri.scheme == 'https'
    req = Net::HTTP::Post.new(uri.request_uri)
    req.set_form_data(formdata)
    resp = http.request(req)
    @oauth_token = uridecode(resp.body.scan(/oauth_token=([^&]*)/)[0][0])
    @oauth_token_secret = uridecode(resp.body.scan(/oauth_token_secret=([^&]*)/)[0][0])
    self.requesttoken = @oauth_token + ' ' + @oauth_token_secret
    @redirect_to = @oauth_service.authorizetoken_uri + '?oauth_token=' + uriencode(@oauth_token)
    save!
  end

  def get_access_token(token, verifier)
    return true if authorized?
    self.accesstoken = self.oauth_service.get_access_token(token, verifier)
    save!
    self.accesstoken
  end

  def oauth_request(method, uri, formdata)
    return self.oauth_service.oauth_request(self, method, uri, formdata)
  end
end