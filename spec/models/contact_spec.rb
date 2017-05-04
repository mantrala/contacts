require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "has all the attributes defined attributes" do
    c = Contact.new
    expect(c.respond_to?(:first_name)).to eq(true)
    expect(c.respond_to?(:last_name)).to eq(true)
    expect(c.respond_to?(:phone_number)).to eq(true)
    expect(c.respond_to?(:email_address)).to eq(true)
    expect(c.respond_to?(:company_name)).to eq(true)
  end

  it "required fields for Contact" do
    c = Contact.new

    expect(c.valid?).to eq(false)
    expect(c.errors.count).to eq(6)
    expect(c.errors.messages[:first_name]).not_to eq(nil)
    expect(c.errors.messages[:last_name]).not_to eq(nil)
    expect(c.errors.messages[:phone_number]).not_to eq(nil)
    expect(c.errors.messages[:email_address]).not_to eq(nil)
    expect(c.errors.messages[:company_name]).not_to eq(nil)
  end

  it "validates email format" do
    c = Contact.new

    c.email_address = "abc@gmail.com"
    expect(c.valid?).to eq(false)

    expect(c.errors.count).to eq(4)
  end

  it "doesn't validate the email" do
    c = Contact.new

    c.email_address = "abc@gmail"
    expect(c.valid?).to eq(false)

    expect(c.errors.count).to eq(5)
  end
end
