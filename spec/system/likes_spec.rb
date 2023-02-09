require 'rails_helper'

RSpec.describe "Likes", type: :system do
  before do
    driven_by(:rack_test)
    visit root_path
    click_link "ログイン"
    fill_in "メールアドレス",	with: "study@geek-lounge.com"
    fill_in "パスワード",	with: "foobar"
    within ".row" do
      click_button "ログイン"
    end
    visit user_path(1)
  end

  scenario "Micropostのパーシャルにいいねボタンが表示される" do
    micropost_id = first(".micropost-partial")[:id]
    find("##{micropost_id}").has_css?(".fa-thumbs-o-up")
  end

  scenario "投稿にLikeできる", js: true do
    micropost_id = first(".micropost-partial")[:id]
    expect {
      within "##{micropost_id}" do
        find(".like-button").click
      end
    }.to change(Like, :count).by(1)
  end

  scenario "投稿のLikeを解除できる", js: true do
    micropost_id = first(".micropost-partial")[:id]
    within "##{micropost_id}" do
      find(".like-button").click
    end
    expect {
      within "##{micropost_id}" do
        find(".like-button").click
      end
    }.to change(Like, :count).by(-1)
  end
end
