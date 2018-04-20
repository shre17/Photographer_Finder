class Photographer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :albums, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :photographer_membership_plans
  has_many :membership_plans, through: :photographer_membership_plans

end
