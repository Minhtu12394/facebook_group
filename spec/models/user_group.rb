require "rails_helper"
RSpec.describe UserGroup, type: :model do
  describe "association" do
    it {is_expected.to belong_to :group}
    it {is_expected.to belong_to :user}
  end
end
