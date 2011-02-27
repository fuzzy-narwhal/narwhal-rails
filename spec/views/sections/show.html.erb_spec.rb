require 'spec_helper'

describe "sections/show.html.erb" do
  before(:each) do
    @section = assign(:section, stub_model(Section))
  end

  it "renders attributes in <p>" do
    render
  end
end
