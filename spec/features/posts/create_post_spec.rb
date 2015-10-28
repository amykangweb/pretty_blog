require 'rails_helper'

describe "Create Post" do
  before do
    @post = FactoryGirl.build(:post)
    @post.save
    visit '/posts'
    click_link "New"
  end

  it "is successful when title and body are not blank" do
    fill_in "Title", with: @post.title
    fill_in "Body", with: @post.body
    click_button "Create Post"
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.body)
  end

  it "is unsuccessful when title is blank" do
    fill_in "Body", with: @post.body
    click_button "Create Post"
    expect(page).to have_content("Title cannot be blank.")
  end

  it "is unsuccessful when body is blank" do
    fill_in "Title", with: @post.title
    click_button "Create Post"
    expect(page).to have_content("Post body cannot be blank.")
  end
end
