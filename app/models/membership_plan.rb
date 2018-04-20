class MembershipPlan < ApplicationRecord
  has_many :photographer_membership_plans
  has_many :photographers, through: :photographer_membership_plans
end
