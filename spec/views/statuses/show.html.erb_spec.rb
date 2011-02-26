require 'spec_helper'

describe "statuses/show.html.erb" do
  before(:each) do
    @status = assign(:status, stub_model(Status,
      :fb_id => "Fb",
      :from => "From",
      :message => "Message",
      :comments_count => 1,
      :likes_count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fb/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/From/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Message/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
