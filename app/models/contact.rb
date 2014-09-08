class Contact < ActiveRecord::Base
  has_many :recipients
  has_many :messages, through: :recipients
  validates :name, presence: true
  validates :phone, presence: true
end
