class User < ApplicationRecord
  has_many :rates
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
