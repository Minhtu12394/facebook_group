require "rails_helper"
RSpec.describe Group, type: :model do

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:creator_id).of_type :integer}
    end
  end

  describe "validation" do
    it {is_expected.to validate_presence_of :name}
  end

  describe "association" do
    it {is_expected.to have_many(:user_groups).dependent(:destroy)}
    it {is_expected.to have_many(:users).through(:user_groups)}
    it {is_expected.to have_many(:posts).dependent(:destroy)}
  end

  describe "group order by time" do
    let!(:group){FactoryGirl.create(:group)}
    let!(:group1){FactoryGirl.create(:group)}
    context "order by time" do
      it {expect(Group.order_by_time).to eq [group1, group]}
    end
  end
end
