require "rails_helper"
RSpec.describe Comment, type: :model do
  let!(:user){FactoryGirl.create(:user)}
  let!(:user2){FactoryGirl.create(:user)}
  let!(:post){FactoryGirl.create(:post)}
  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:content).of_type :string}
      it {is_expected.to have_db_column(:user_id).of_type :integer}
      it {is_expected.to have_db_column(:post_id).of_type :integer}
    end
  end

  describe "validation" do
    it {is_expected.to validate_presence_of :content}
  end

  describe "association" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :post}
  end

  describe "user create comment " do
    let!(:comment){FactoryGirl.create(:comment, user_id: user.id, post_id: post.id)}
    context "comment belong to user? " do
      it do
        expect(comment.belong_to? user).to eq true
      end
    end

    context "comment belong to user2?" do
      it do
        expect(comment.belong_to? user2).to eq false
      end
    end
  end
end
