class AdminUser < ApplicationRecord
  # :database_authenticatable
  # :registerable,
  # :recoverable
  # :rememberable
  # :trackable
  # :validatable
  # :confirmable
  # :lockable
  # :timeoutable
  # :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end
