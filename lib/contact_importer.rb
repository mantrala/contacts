require 'csv'

class ContactImporter

  def self.import(file)
    CSV.foreach(file.path, headers: true,  header_converters: :symbol) do |row|

      contact_hash = row.to_hash
      contact_hash[:phone_number] = normalize_phone(contact_hash[:phone_number])

      # what happens if the same record exist twice? What is the deciding factor for similar records?
      begin
        Contact.create!(contact_hash)
      rescue ActiveRecord::RecordInvalid => ex
        logger.error("Error creating a contact", ex.record.errors.full_messages)
      end
    end
  end

  # No specific rules given for the normalization.
  # I've assumed a few rules
  # - Number format will be US based
  # - All numbers will return this order: aaa.aaa.aaaa xaaa
  def self.normalize_phone(num = "")
    return if num.length == 0
 
    num.gsub!(/[^x0-9]/, "")

    return num if num.length < 10

    full_num, ext = num.split('x')

    if full_num.length > 10
      num = full_num[-10..-1]
      country_code = full_num[0...(full_num.length - 10)]
      full_num = num
    end

    phone = []

    phone << country_code if country_code
    phone << [full_num[0...3], full_num[3...6], full_num[6..10]]
    phone.compact.flatten!

    phone = phone.join('.')

    phone += " x#{ext}" if ext

    phone
  end
end