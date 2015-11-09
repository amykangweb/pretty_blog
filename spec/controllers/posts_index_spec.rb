require 'rails_helper'

describe Api::PostsController do
  before do
    @post = FactoryGirl.build(:post)
    @post.save
  end

  it "returns all posts" do
    get :index
    expect(response).to be_successful
    data = JSON.parse(response.body)
    expect(data).to have_content('"title"=>"Hello World!"')
    expect(data).to have_content('"body"=>"This is my first post."')
  end
end
