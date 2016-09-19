class NotificatiosMailMailer < ApplicationMailer
  default from: "RavAPP <#{ENV['MAIL_ADDRESS']}>",
          to: Proc.new { Notification.actives.pluck(:email) }

 def notification_email(recomendacion)
   @recomendation = recomendacion
   mail(subject: "Nueva Recomendación en RAV")
 end

end
