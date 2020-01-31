require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      :continent => "MyString",
      :country => "MyString",
      :city => "MyString",
      :community => "MyString",
      :street_address => "MyString",
      :longitude => 1.5,
      :latitude => 1.5
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input[name=?]", "location[continent]"

      assert_select "input[name=?]", "location[country]"

      assert_select "input[name=?]", "location[city]"

      assert_select "input[name=?]", "location[community]"

      assert_select "input[name=?]", "location[street_address]"

      assert_select "input[name=?]", "location[longitude]"

      assert_select "input[name=?]", "location[latitude]"
    end
  end
end
