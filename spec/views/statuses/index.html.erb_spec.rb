require 'spec_helper'

describe "statuses/index.html.erb" do
  before(:each) do
    assign(:statuses, [
      stub_model(Status,
        :fb_id => "Fb",
        :from => "From",
        :message => "Message",
        :comments_count => 1,
        :likes_count => 1
      ),
      stub_model(Status,
        :fb_id => "Fb",
        :from => "From",
        :message => "Message",
        :comments_count => 1,
        :likes_count => 1
      )
    ])
  end

  it "renders a list of statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fb".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "From".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
