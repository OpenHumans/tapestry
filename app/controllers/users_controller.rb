class UsersController < ApplicationController
  before_filter( :only => :index ) {|c| c.check_section_disabled(Section::PUBLIC_DATA) }
  before_filter( :only => :shipping_address ) {|c| c.check_section_disabled(Section::SHIPPING_ADDRESS) }
  skip_before_filter :ensure_enrolled, :if => :okay_to_skip_ensure_enrolled
  skip_before_filter :ensure_active, :only => [ :deactivated, :switch_to, :tos, :accept_tos, :consent, :withdraw, :withdraw_confirm ]
  before_filter :load_current_user
  skip_before_filter :login_required, :only => [:initial, :create_initial, :new, :new_researcher, :new2, :create, :activate, :created, :create_researcher, :resend_signup_notification, :resend_signup_notification_form, :unauthorized, :index ]
  skip_before_filter :ensure_tos_agreement, :only => [:tos, :accept_tos, :switch_to, :index, :deactivated]
  # We enforce signing of the TOS before we enforce the latest consent; make sure that people *can* sign the TOS even when their consent is out of date
  skip_before_filter :ensure_latest_consent, :only => [:tos, :accept_tos, :consent, :switch_to, :index, :deactivated, :withdraw, :withdraw_confirm]
  # Make sure people sign the latest TOS and Consent before they do safety questionnaires
  skip_before_filter :ensure_recent_safety_questionnaire, :only => [:tos, :accept_tos, :consent, :switch_to, :index, :deactivated, :withdraw, :withdraw_confirm]
  # Make sure people sign the latest TOS and Consent before they review new datasets
  skip_before_filter :ensure_dataset_release, :only => [:tos, :accept_tos, :consent, :switch_to, :index, :deactivated, :withdraw, :withdraw_confirm]
  before_filter :load_selection, :only => :index

  def index
    @page_title = 'Participant profiles'
    @users = User.publishable
    @users = @users.where('users.id in (?)', @selection.target_ids) if @selection
    respond_to do |format|
      format.html {
        page = params[:page] || 1
        per_page = params[:per_page] || 20
        @users = @users.paginate(:page => page, :per_page => per_page)
      }
      format.json {
        respond_with @users
      }
    end
  end

  # If the "Signup" section of Tapestry is activated then it is okay to skip checking
  # that the current user is enrolled to access this controller.
  def okay_to_skip_ensure_enrolled
    include_section?(Section::SIGNUP) || action_name = "unauthorized"
  end

  def initial
    @user = User.new(params[:user])
  end

  def create_initial
    if current_user or User.all.count != 0 then
      # Something fishy going on here
      redirect_to root_url
      return
    end
    logout_keeping_session!
    @user = User.new(params[:user])
    @user.is_test = true
    success = @user && @user.save
    errors = @user.errors

    if success && errors.empty?
      # We deliberately do not use @user.activate! here because that presumes an enrollment step, and the database is presumably entirely empty at this point.
      @user.activated_at = Time.now.utc
      @user.activation_code = nil
      @user.is_admin = true
      @user.save!
      @user.log('Initial admin account created and activated.')
      flash[:notice]  = "Your account was created."
      redirect_to root_url
    else
      # TODO FIXME
      puts errors
      flash[:error]  = "Please double-check your signup information below."
      redirect_to initial_user_url
    end
  end

  def new_researcher
    @user = User.new(params[:user])
  end

  def new
    @user = User.new(params[:user])
  end

  def new2
    @user = User.new(params[:user])

    if params[:user] && @user.valid_for_attrs?(params[:user].keys)
      # Sometimes the error flash remains on the page, which is confusing. Kill it here if all is well.
      flash.delete(:error)

      @user.errors.clear
    else
      render :template => 'users/new'
    end
  end

  def edit
    @mailing_lists = MailingList.all
    @page_title = 'My Account' if @user == current_user
  end

  def update
    # If no mailing lists are selected, we don't get the parameter back from the browser
    params[:user]['mailing_list_ids'] = [] if not params[:user].has_key?('mailing_list_ids')

    # Avoid empty string phone numbers in the database
    if params[:user][:phone_number] == '' then
      params[:user][:phone_number] = nil
    end

    @old_user_email = @user.email

    if @user.update_attributes(params[:user])

      if @old_user_email != @user.email then
        @user.log "Changed email address from '#{@old_user_email}' to '#{@user.email}'"
        UserMailer.deliver_email_change_notification(@user, @old_user_email)
      end

      flash[:notice] = 'Account information updated.'
      redirect_to(params[:return_to] || root_url)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path
    end
  end

  def create_researcher
    logout_keeping_session!
    @user = User.new(params[:user])

    # Just in case, force the 'researcher' flag to true
    @user.researcher = true

    success = @user && verify_recaptcha(@user) && @user.save
    errors = @user.errors

    if success && errors.empty?
      accept_invite!
      # Sometimes the error flash remains on the page, which is confusing. Kill it here if all is well.
      flash.delete(:error)
      # Same for recaptcha_error. Why does this happen?
      flash.delete(:recaptcha_error)
      flash[:notice] = t('messages.sent_email_verification', :email => @user.email, :admin_email => ADMIN_EMAIL)
      redirect_to :action => 'created', :id => @user
    else
      flash.delete(:recaptcha_error)
      render :action => 'new_researcher'
    end
  end

  def create
    logout_keeping_session!
    @user = User.new(params[:user])

    if (params[:pgp_newsletter])
      if MailingList.find_by_name('PGP newsletter') then
        @user.mailing_lists = [ MailingList.find_by_name('PGP newsletter') ]
      end
    end

    success = @user && verify_recaptcha(@user) && @user.save
    errors = @user.errors

    if success && errors.empty?
      accept_invite!
      # Sometimes the error flash remains on the page, which is confusing. Kill it here if all is well.
      flash.delete(:error)
      # Same for recaptcha_error. Why does this happen?
      flash.delete(:recaptcha_error)
      flash[:notice] = t('messages.sent_email_verification', :email => @user.email, :admin_email => ADMIN_EMAIL)
      redirect_to :action => 'created', :id => @user
    else
#      flash[:error]  = "Please double-check your signup information below.<br/>&nbsp;"
      flash.delete(:recaptcha_error)
#      errors.each { |k,v|
#        # We only show e-mail and captcha errors; the rest is indicated next to the field.
#        if (k == 'base') then
#         flash[:error] += "<br/>#{CGI.escapeHTML(v)}"
#        elsif (k == 'email') then
#         flash[:error] += "<br/>#{k} #{CGI.escapeHTML(v)}"
#        end
#      }
      render :action => 'new2'
    end
  end

  def created
    # DO NOT REMOVE THIS LINE! load_current_user can not load @user here yet,
    # because the user has not logged in yet.
    @user = User.find_by_id(params[:id])
    if not @user then
      flash[:error] = "User not found. Please try again."
      redirect_to root_path
      return
    end
    signup_enrollment_step = EnrollmentStep.find_by_keyword('signup')
    @user.log('Signed mini consent form version ' + LATEST_CONSENT_VERSION,signup_enrollment_step)
  end

  def destroy
    UserMailer.delete_request(@user).deliver
    logout_killing_session!
    flash[:notice] = "A request to delete your account has been sent."
    redirect_back_or_default page_url(:logged_out)
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:code]) unless params[:code].blank?
    case
    when (!params[:code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Your account is now activated. Please sign-in to continue."
      redirect_to login_path
    when params[:code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default(root_path)
    else
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default(root_path)
    end
  end

  def resend_signup_notification
    @user = nil
    if (params[:id]) then
      @user = User.find_by_id(params[:id])
    elsif (params[:user][:email]) then
      @user = User.find_by_email(params[:user][:email])
    end
    if not @user or @user.active? then
      # We deliberately return 'unknown user' when the user account is already active. No data leak here.
      flash.now[:error] = "Unknown user"
      render :template => 'users/resend_signup_notification_form'
      return
    end
    UserMailer.signup_notification(@user).deliver
    flash[:notice] = t('messages.resent_email_verification', :email => @user.email, :admin_email => ADMIN_EMAIL)
    render :template => 'users/created'
  end

  def resend_signup_notification_form
  end

  def accept_enrollment
    if current_user.enrolled and not current_user.enrollment_accepted
      current_user.enrollment_accepted = Time.now()
      current_user.save!
      redirect_to root_url
    else
      # We should never get here.
      redirect_to root_url
    end
  end

  def consent
  end

  def tos
  end

  def unauthorized
  end

  def deactivated
  end

  def accept_tos
    tos_version = LATEST_TOS_VERSION
    if current_user.accept_tos(tos_version)
      flash[:notice] = 'Thank you for agreeing with our Terms of Service.'
    end
    redirect_back_or_default(root_url)
  end

  def participant_survey
     redirect_to google_survey_url(GoogleSurvey.find(1))
  end

  def show_log
    @log = current_user.user_logs.where('user_comment is not null').order('created_at DESC')
    @log = @log.paginate(:page => params[:page] || 1, :per_page => 20)
  end

  # GET /users/shipping_address
  def shipping_address
    # If there is a shipping address for this user, show edit form, otherwise show new form
    if current_user.shipping_address.nil? then
      redirect_to new_shipping_address_path(:return_to => params[:return_to])
    else
      redirect_to edit_shipping_address_path(current_user.shipping_address.id, :return_to => params[:return_to])
    end
  end

  def edit_study
    @user = current_user
    @study = Study.approved.not_third_party.open_now.where('id = ?',params[:study_id]).first
    if @study.nil? then
      # Only open collection events should be available here
      redirect_to page_path( :collection_events )
      return
    end
    if not @user.study_participants.empty? and not @user.study_participants.where('study_id = ?',@study.id).empty? then
      @study_participant = @user.study_participants.where('study_id = ?',@study.id).first
    else
      @study_participant = nil
    end

    respond_to do |format|
      format.html
      format.xml  { render :xml => @studies }
    end
  end

  def update_study
    @user = current_user
    @study = Study.find(params[:study_id])

    if params[:study_participant]['status'] == 'interested'

      if @study.shipping_address_required and @user.shipping_address.nil? then
        flash[:error] = 'This study requires that you provide a shipping address.'
        redirect_to(user_edit_study_url(:study_id => @study.id))
        return
      end

      if @study.phone_number_required and
          @user.shipping_address.nil? and
          @user.phone_number.nil? then
        flash[:error] = 'This study requires that you provide a phone number.'
        redirect_to(user_edit_study_url(:study_id => @study.id))
        return
      end

    end

    if @user.study_participants.empty? or @user.study_participants.where('study_id = ?',@study.id).empty? then
      @user.studies << @study
    end

    @sp = @user.study_participants.where('study_id = ?',@study.id).first

    if @study.auto_accept and params[:study_participant]['status'] == 'interested' then
      @status = 'accepted'
    else
      @status = params[:study_participant]['status']
    end

    @sp.status = StudyParticipant::STATUSES[@status]

    if @sp.save
      flash[:notice] = 'Participation status updated.'
      redirect_to page_path( :collection_events )
    else
      format.html { render :action => "edit_study" }
    end
  end

  def withdraw
    @removal_request = RemovalRequest.new(params[:removal_request] || {})
  end

  def withdraw_confirm
    if params[:commit] == 'Cancel'
      flash[:notice] = 'Withdrawal canceled.'
      return redirect_to root_url
    end
    if params[:removal_request]
      rr = RemovalRequest.new(params[:removal_request])
      rr.update_attributes(:user => @user)
      rr.save!
      if rr.destroy_samples
        @user.log('Requested destruction of tissue samples and cell lines.')
      end
      if rr.remove_data
        @user.log('Requested removal of data from public database.')
        unless @user.suspended_at
          @user.suspended_at = Time.now
          @user.save!
        end
      end
    end
    @user.log('Withdrew from the study.')
    @user.deactivated_at = Time.now
    @user.can_reactivate_self = false
    @user.save!
    UserMailer.withdrawal_notification(@user).deliver
    UserMailer.withdrawal_staff_notification(@user).deliver
    redirect_to new_withdrawal_comment_path
  end

  def switch_to
    target_uid = params[:switch_to_id].to_i
    return access_denied unless target_uid > 0
    if target_uid == User.find(target_uid).verify_userswitch_cookie(session[:switch_back_to])
      session[:user_id] = target_uid
      session.delete :real_uid
      session.delete :switch_back_to
      # at this point @user is still the target user, and @user.controlling_user is still set
      # to the admin uid, so this log entry will be correct
      @user.log('Admin logged out from user account.')
    elsif current_user.is_admin?
      session[:real_uid] = current_user.id
      session[:switch_back_to] = current_user.create_userswitch_cookie
      session[:user_id] = target_uid
      # the controlling_user field is only set on the next redirect, so fake it here to make
      # the log entry correct
      @target_user = User.find(target_uid)
      @target_user.controlling_user = current_user
      @target_user.log('Admin logged in as user.')
    else
      return access_denied
    end
    flash[:notice] = "Switched to #{User.find(session[:user_id]).full_name}'s account (id=#{session[:user_id]})"
    redirect_to root_url
  end

  private

  def load_current_user
    @user = current_user
  end

  def ensure_invited
    unless session[:invited]
      flash[:error] = 'You must enter an invited email address to sign up.'
      redirect_to root_url
    end
  end

  def accept_invite!
    @invite = InvitedEmail.first(:conditions => { :email => session[:invited_email] })
    @invite.accept! if @invite
  end
end
