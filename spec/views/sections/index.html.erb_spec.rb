require 'spec_helper'

describe "sections/index.html.erb" do
  before(:each) do
    assign(:sections, [
      stub_model(Section),
      stub_model(Section)
    ])
  end

  it "renders a list of sections" do
    render
  end
end
