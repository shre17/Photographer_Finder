class PhotographerMembershipPlan < ApplicationRecord
  belongs_to :photographers, optional: true
  belongs_to :membership_plans, optional: true
end
