class CreateMembershipPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :membership_plans do |t|
      t.string :name
      t.string :price_per_six_months
      t.string :feature_one
      t.string :feature_two
      t.string :feature_three
      t.string :feature_four
      t.string :feature_five

      t.timestamps
    end
  end
end
