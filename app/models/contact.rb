class Contact < ActiveRecord::Base
  validates_presence_of :first_name,
                        :last_name, 
                        :phone_number,
                        :email_address,
                        :company_name

  validates_format_of :email_address, 
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

end
