require 'spec_helper'

describe "stats/show" do
  before(:each) do
    @stat = assign(:stat, stub_model(Stat,
      :today_active_calories => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
