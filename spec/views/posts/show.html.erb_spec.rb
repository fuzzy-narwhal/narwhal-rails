require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :likes => 1,
      :post_id => "Post",
      :from => "From",
      :to => "To",
      :message => "Message",
      :picture => "Picture",
      :link_url => "Link Url",
      :link_name => "Link Name",
      :link_caption => "Link Caption",
      :link_description => "Link Description",
      :movie_url => "Movie Url",
      :icon => "Icon",
      :attribution => "Attribution",
      :comments => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Post/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/From/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/To/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Message/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Picture/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link Caption/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Link Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Movie Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Icon/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Attribution/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
