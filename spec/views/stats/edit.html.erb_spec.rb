require 'spec_helper'

describe "stats/edit" do
  before(:each) do
    @stat = assign(:stat, stub_model(Stat,
      :today_active_calories => 1
    ))
  end

  it "renders the edit stat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stat_path(@stat), "post" do
      assert_select "input#stat_today_active_calories[name=?]", "stat[today_active_calories]"
    end
  end
end
