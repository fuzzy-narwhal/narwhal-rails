require 'spec_helper'

describe "pages/show.html.erb" do
  before(:each) do
    @page = assign(:page, stub_model(Page,
      :page_id => "Page"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Page/)
  end
end
