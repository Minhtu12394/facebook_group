require "rails_helper"
RSpec.describe Post, type: :model do
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:content).of_type :string}
      it {is_expected.to have_db_column(:group_id).of_type :integer}
      it {is_expected.to have_db_column(:user_id).of_type :integer}
    end
  end

  describe "validation" do
    it {is_expected.to validate_presence_of(:content)}
    it {is_expected.to validate_length_of(:content).
      is_at_most(Settings.post_contetn_maximum_lenght)}
  end

  describe "association" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :group}
    it {is_expected.to have_many(:comments).dependent(:destroy)}
  end
end
