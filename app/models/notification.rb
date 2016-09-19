class Notification < ApplicationRecord

  def self.actives
    Notification.where('status = true')
  end
end
