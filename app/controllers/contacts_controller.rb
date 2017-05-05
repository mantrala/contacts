class ContactsController < ApplicationController
  # can paginate to avoid perf problems
  def index
    @contacts = Contact.all
  end
end
