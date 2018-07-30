require "rails_helper"
RSpec.describe User, type: :model do
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:email).of_type :string}
    end
  end

  describe "validation" do
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of(:name).
      is_at_most(Settings.name_maximum_length)}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_length_of(:email).
      is_at_most(Settings.email_maximum_length)}
  end

  describe "association" do
    it {is_expected.to have_many(:posts).dependent :destroy}
    it {is_expected.to have_many(:comments).dependent :destroy}
    it {is_expected.to have_many(:user_groups).dependent :destroy}
    it {is_expected.to have_many(:groups).through :user_groups}
  end
end
