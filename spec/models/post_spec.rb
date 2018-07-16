require "rails_helper"
RSpec.describe Post, type: :model do
  let!(:user){FactoryGirl.create(:user)}
  let!(:group){FactoryGirl.create(:group)}
  let!(:user2){FactoryGirl.create(:user)}

  describe "db schema" do
    context "column" do
      it {is_expected.to have_db_column(:content).of_type :string}
      it {is_expected.to have_db_column(:group_id).of_type :integer}
      it {is_expected.to have_db_column(:user_id).of_type :integer}
    end
  end

  describe "validation" do
    it {is_expected.to validate_presence_of :content}
    it {is_expected.to validate_length_of(:content).
      is_at_most(Settings.post_contetn_maximum_lenght)}
  end

  describe "association" do
    it {is_expected.to have_many(:comments).dependent(:destroy)}
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :group}
  end

  describe ".order_by_time" do
    let!(:post){FactoryGirl.create(:post, content: "abc", user_id: user.id, group_id: group.id)}
    let!(:post1){FactoryGirl.create(:post, content: "def", user_id: user.id, group_id: group.id)}
    context "post order by desc" do
      it{expect(Post.order_by_time).to eq [post1, post]}
    end
  end

  describe ".not_in_group" do
    let!(:post3){FactoryGirl.create(:post, content: "ahihi", user_id: user.id, group_id: "")}
    context "post not in any group" do
      it {expect(Post.not_in_group).to eq [post3]}
    end
  end

  describe "#belong_to?" do
    let!(:post4){FactoryGirl.create(:post, content: "post 4", user_id: user.id, group_id: group.id)}
    context "post belong to user?" do
      it do
        expect(post4.belong_to? user2).to eq false
      end
    end

    context "post not belong to user? " do
      it do
        expect(post4.belong_to? user).to eq true
      end
    end
  end

end
