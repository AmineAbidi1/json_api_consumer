class Transaction < ActiveRecord::Base
  validates :uid, presence: true
end
