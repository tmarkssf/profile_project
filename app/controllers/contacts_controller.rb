class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:message]
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Message sent. Thank you for contacting me!"
      redirect_to new_contact_path
    else
      flash[:danger] = "An error occured with your message. Please try again."
      redirect_to new_contact_path
  end
end
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end