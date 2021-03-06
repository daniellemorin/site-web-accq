class Member < ActiveRecord::Base
  validates :name, presence: true
  validates :postal_code, presence: true  
  validates :email, presence: true, email: true, uniqueness: true
  self.per_page = 30
  def self.confirmed
    where("NOT confirmed_at IS NULL")
  end

  def self.unconfirmed
    where("confirmed_at IS NULL")
  end  
end
