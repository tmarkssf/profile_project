class ContactMailer < ActionMailer::Base
  default to: 'tmarkssf@gmail.com'
  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(from: email, subject: 'Contact Me Form')
  end
end