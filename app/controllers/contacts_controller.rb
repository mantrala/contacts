class ContactsController < ApplicationController
  # can paginate to avoid perf problems
  def index
    @contacts = Contact.all
  end

  # can move this to be a background job for faster req processing
  def upload
    begin
      ContactImporter.import(params[:file])
      redirect_to root_url, notice: "Contacts imported."
    rescue
      redirect_to root_url, notice: "Upload failed. The dev team has been notified of it."
    end
  end
end
