json.extract! membership_plan, :id, :name, :price_per_six_months, :feature_one, :feature_two, :feature_three, :feature_four, :feature_five, :created_at, :updated_at
json.url membership_plan_url(membership_plan, format: :json)
