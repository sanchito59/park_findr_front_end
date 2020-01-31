require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :continent => "MyString",
      :country => "MyString",
      :city => "MyString",
      :community => "MyString",
      :street_address => "MyString",
      :longitude => 1.5,
      :latitude => 1.5
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

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
