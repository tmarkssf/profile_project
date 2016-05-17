class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Message Sent. Thank you for Contacting Me!"
      redirect_to new_contact_path
    else
      flash[:danger] = "An Error Occured With Your Message. Please Try Again."
      redirect_to new_contact_path
  end
end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end