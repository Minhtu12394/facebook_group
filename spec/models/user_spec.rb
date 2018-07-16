require "rails_helper"
RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create :user}
  let(:user1) {FactoryGirl.create :user}

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:email).of_type :string}
      it {is_expected.to have_db_column(:encrypted_password).of_type :string}
    end
  end

  describe "validation" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of(:name).
      is_at_most(Settings.name_maximum_length)}
    it {is_expected.to validate_uniqueness_of(:email).case_insensitive}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_length_of(:email).
      is_at_most(Settings.email_maximum_length)}
  end

  describe "association" do
    it {is_expected.to have_many(:posts).dependent(:destroy)}
    it {is_expected.to have_many(:comments).dependent(:destroy)}
    it {is_expected.to have_many(:user_groups).dependent(:destroy)}
    it {is_expected.to have_many(:groups).through(:user_groups)}
  end

  describe "is_group_creator?" do
    let!(:group){FactoryGirl.create(:group, name: "G1", creator_id: user.id)}
    context "user creat group" do
      it {expect(user.is_group_creator? group).to eq true}
    end
  end
end
