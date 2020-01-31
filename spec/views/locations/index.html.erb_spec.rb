require 'rails_helper'

RSpec.describe "locations/index", type: :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :continent => "Continent",
        :country => "Country",
        :city => "City",
        :community => "Community",
        :street_address => "Street Address",
        :longitude => 2.5,
        :latitude => 3.5
      ),
      Location.create!(
        :continent => "Continent",
        :country => "Country",
        :city => "City",
        :community => "Community",
        :street_address => "Street Address",
        :longitude => 2.5,
        :latitude => 3.5
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Continent".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Community".to_s, :count => 2
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
