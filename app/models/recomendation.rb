class Recomendation < ApplicationRecord
  require 'unshorten'
  belongs_to :user
  before_save :unshorten_image
  after_create :send_email

  def unshorten_image
    self.imagen = Unshorten[self.imagen].to_s + "&raw=1"
  end
  private
    def send_email
      NotificatiosMailMailer.notification_email(self).deliver_now
    end
end
