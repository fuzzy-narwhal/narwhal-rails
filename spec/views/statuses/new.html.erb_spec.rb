require 'spec_helper'

describe "statuses/new.html.erb" do
  before(:each) do
    assign(:status, stub_model(Status,
      :fb_id => "MyString",
      :from => "MyString",
      :message => "MyString",
      :comments_count => 1,
      :likes_count => 1
    ).as_new_record)
  end

  it "renders new status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statuses_path, :method => "post" do
      assert_select "input#status_fb_id", :name => "status[fb_id]"
      assert_select "input#status_from", :name => "status[from]"
      assert_select "input#status_message", :name => "status[message]"
      assert_select "input#status_comments_count", :name => "status[comments_count]"
      assert_select "input#status_likes_count", :name => "status[likes_count]"
    end
  end
end
