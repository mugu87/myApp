require 'spec_helper'

describe "events/new" do
  before(:each) do
    assign(:event, stub_model(Event,
      :name => "MyString",
      :cause_id => 1,
      :description => "MyText",
      :fund => 1.5
    ).as_new_record)
  end

  it "renders new event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", events_path, "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "input#event_cause_id[name=?]", "event[cause_id]"
      assert_select "textarea#event_description[name=?]", "event[description]"
      assert_select "input#event_fund[name=?]", "event[fund]"
    end
  end
end
