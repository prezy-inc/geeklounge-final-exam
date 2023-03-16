require 'rails_helper'

RSpec.describe Like, type: :model do
  it "User, Micropostと紐付いたLikeを作成できる" do
    like = FactoryBot.build(:like)
    expect(like).to be_valid
  end

  it "Userが紐付いていないとLikeを作成できない" do
    like = FactoryBot.build(:like, user_id: nil)
    expect(like).to_not be_valid
  end

  it "Micropostが紐付いていないとLikeを作成できない" do
    like = FactoryBot.build(:like, micropost_id: nil)
    expect(like).to_not be_valid
  end

  it "同じUserが同じMicropostに対して2回以上Likeを作成できない" do
    expect {
      like = FactoryBot.create(:like)
      like2 = FactoryBot.create(:like)
    }.to raise_error do |error|
      if error.is_a?(ActiveRecord::RecordNotUnique) || error.is_a?(ActiveRecord::RecordInvalid)
      else
        raise error
      end
    end
  end
end
