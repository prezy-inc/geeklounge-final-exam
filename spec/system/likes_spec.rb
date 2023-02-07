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
  end

  scenario "Micropostのパーシャルにいいねボタンが表示される" do
    visit user_path(1)
    within "#micropost-295" do
      expect(page).to have_css ".fa-thumbs-o-up"
    end
  end

  scenario "投稿にLikeできる", js: true do
    visit user_path(1)
    expect {
      find("#micropost-295").find_button("button").click
    }.to change(Like, :count).by(1)
  end

  scenario "投稿のLikeを解除できる", js: true do
    visit user_path(1)
    expect {
      find("#micropost-295").find_button("button").click
    }.to change(Like, :count).by(1)
    expect {
      find("#micropost-295").find_button("button").click
    }.to change(Like, :count).by(-1)
  end
end
