class ContactMailer < ApplicationMailer
    def contact_mail(contact)
        @contact = contact
        mail to: "ytezuka5@gmail.com",subject: "confirmation"
    end
end
