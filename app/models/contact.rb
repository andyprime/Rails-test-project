class Contact < ActiveRecord::Base
validates_presence_of :firstname
validates_length_of :firstname, :minimum => 2
validates_presence_of :lastname
validates_length_of :lastname, :minimum => 2
validates_presence_of :address
validates_presence_of :email
validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i

validates_format_of :phone, :message => "must be a valid telephone number.",
    :with => /^[\(\)0-9\- \+\.]{10,20}$/ , :allow_blank => true

HUMANIZED_ATTRIBUTES = {
	:firstname => "First name",
	:lastname => "Last name"
}

def self.human_attribute_name(attr, options = {})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
end

end
