class ShippingAddress < ActiveRecord::Base
  stampable
  acts_as_paranoid_versioned :version_column => :lock_version

  # PH: I realize this is heavy handed but I could not get stubbing to work, though I'm still sure there is a simple way to do it without resorting to this kind of model-side intervention!
  unless Rails.env == 'test'
    # Our version of gmaps4rails (1.3.x) also does geocoding via google maps.
    # Doing so didn't require an API key in the past, but it does now.
    # gmaps4rails removed geocoding functionality completely as of v2,
    # delegating it to geocoder. For now, let's just disable the address
    # validation/geocoding - this fixes saving (unvalidated!) shipping
    # addresses for participants.
    # We will need to (bulk) validate addresses anyway before shipping anything
    # to participants.

    # Setting :check_process to false forces an update to the geocoordinates on every save/update
    #acts_as_gmappable :check_process => false
  end

  def gmaps4rails_address
    @address = address_line_1
    @address += ", #{address_line_2}" unless address_line_2.nil? or address_line_2 == ''
    @address += ", #{address_line_3}" unless address_line_2.nil? or address_line_3 == ''
    @address += ", #{city}, #{state} #{zip}"
    @address
  end

  belongs_to :user

  validates_presence_of     :user_id
  validates_presence_of     :address_line_1
  validates_presence_of     :city
  validates_presence_of     :state
  validates_presence_of     :zip
  validates_presence_of     :phone

  attr_accessible :address_line_1, :address_line_2, :address_line_3,
                  :city, :state, :zip, :phone

  include SiteSpecific::Validations rescue {}

  def as_multiline_string
    @a = address_line_1
    @a << "\n" << address_line_2 if address_line_2 and address_line_2 != ''
    @a << "\n" << address_line_3 if address_line_3 and address_line_3 != ''
    @a << "\n" << city << ', ' << state << '  ' << zip
    @a
  end

end
