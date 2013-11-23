require 'spec_helper'

describe "stats/new" do
  before(:each) do
    assign(:stat, stub_model(Stat,
      :today_active_calories => 1
    ).as_new_record)
  end

  it "renders new stat form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stats_path, "post" do
      assert_select "input#stat_today_active_calories[name=?]", "stat[today_active_calories]"
    end
  end
end
