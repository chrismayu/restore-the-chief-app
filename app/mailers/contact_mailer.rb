class ContactMailer < ActionMailer::Base
    default from: ENV["SITE_EMAIL"]
 
      default :to => ENV["ADMIN_EMAIL"]

      def site_message(message)
        @message = message
        mail(:subject => "R_t_C - #{message.subject}", :reply_to => message.email,)
      end
  end