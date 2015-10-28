def create_post
  @post = FactoryGirl.build(:post)
  @post.save
  visit '/posts'
  click_link "New"
  fill_in "Title", with: @post.title
  fill_in "Body", with: @post.body
  click_button "Create Post"
end
