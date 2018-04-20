class CreatePhotographerMembershipPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :photographer_membership_plans do |t|
      t.references :photographers, foreign_key: true
      t.references :membership_plans, foreign_key: true

      t.timestamps
    end
  end
end
