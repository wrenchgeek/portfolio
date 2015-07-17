class Reference < ActiveRecord::Base
  validates :name, presence: true
  validates :company, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
