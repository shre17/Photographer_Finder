class Admin::MembershipPlansController < ApplicationController
  before_action :set_membership_plan, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  def index
    @membership_plans = MembershipPlan.all
  end

  def show
  end

  def new
    @membership_plan = MembershipPlan.new
  end

  def edit
  end

  def create
    @membership_plan = MembershipPlan.new(membership_plan_params)

    respond_to do |format|
      if @membership_plan.save
        format.html { redirect_to admin_membership_plan_path(@membership_plan), notice: 'Membership plan was successfully created.' }
        format.json { render :show, status: :created, location: @membership_plan }
      else
        format.html { render :new }
        format.json { render json: @membership_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @membership_plan.update(membership_plan_params)
        format.html { redirect_to admin_membership_plan_path(@membership_plan), notice: 'Membership plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership_plan }
      else
        format.html { render :edit }
        format.json { render json: @membership_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @membership_plan.destroy
    respond_to do |format|
      format.html { redirect_to admin_membership_plans_url, notice: 'Membership plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_membership_plan
      @membership_plan = MembershipPlan.find(params[:id])
    end

    def membership_plan_params
      params.require(:membership_plan).permit(:name, :price_per_six_months, :feature_one, :feature_two, :feature_three, :feature_four, :feature_five)
    end
end