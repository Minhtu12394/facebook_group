require "rails_helper"
RSpec.describe UserGroup, type: :model do
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:user_id).of_type :integer}
      it {is_expected.to have_db_column(:group_id).of_type :integer}
    end
  end

  describe "association" do
    it {is_expected.to belong_to :group}
    it {is_expected.to belong_to :user}
  end
end
