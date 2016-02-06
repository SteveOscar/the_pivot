class User < ActiveRecord::Base
  has_many :donations
  has_many :causes
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  enum role: %w(default admin)
  has_secure_password

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def supported_causes
    self.donations.map do |donation|
      Cause.find(donation.cause_id)
    end
  end
end
