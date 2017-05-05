class ContactsController < ApplicationController
  # can paginate to avoid perf problems
  def index
    @contacts = Contact.all
  end

  # can move this to be a background job for faster req processing
  def upload
    if params[:file] && params[:file].content_type != "text/csv"
      flash[:error] = "Only csv files are allowed"
      redirect_to root_url and return
    end

    begin
      ContactImporter.import(params[:file])
      redirect_to root_url, notice: "Contacts imported."
    rescue
      redirect_to root_url, error: "Upload failed. The dev team has been notified of it."
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.json { render json: @contact, status: 204 }
    end
  end
end
