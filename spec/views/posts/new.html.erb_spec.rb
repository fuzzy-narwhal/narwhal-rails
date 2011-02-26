require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post,
      :likes => 1,
      :post_id => "MyString",
      :from => "MyString",
      :to => "MyString",
      :message => "MyString",
      :picture => "MyString",
      :link_url => "MyString",
      :link_name => "MyString",
      :link_caption => "MyString",
      :link_description => "MyString",
      :movie_url => "MyString",
      :icon => "MyString",
      :attribution => "MyString",
      :comments => 1
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_likes", :name => "post[likes]"
      assert_select "input#post_post_id", :name => "post[post_id]"
      assert_select "input#post_from", :name => "post[from]"
      assert_select "input#post_to", :name => "post[to]"
      assert_select "input#post_message", :name => "post[message]"
      assert_select "input#post_picture", :name => "post[picture]"
      assert_select "input#post_link_url", :name => "post[link_url]"
      assert_select "input#post_link_name", :name => "post[link_name]"
      assert_select "input#post_link_caption", :name => "post[link_caption]"
      assert_select "input#post_link_description", :name => "post[link_description]"
      assert_select "input#post_movie_url", :name => "post[movie_url]"
      assert_select "input#post_icon", :name => "post[icon]"
      assert_select "input#post_attribution", :name => "post[attribution]"
      assert_select "input#post_comments", :name => "post[comments]"
    end
  end
end
