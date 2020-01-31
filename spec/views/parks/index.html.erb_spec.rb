require 'rails_helper'

RSpec.describe "parks/index", type: :view do
  before(:each) do
    assign(:parks, [
      Park.create!(
        :climate => "Climate",
        :operating_hours => "Operating Hours",
        :dog_friendly => false,
        :activities => "Activities",
        :national_park => false,
        :fees => 2,
        :lodging => false,
        :camping => false,
        :name => "Name",
        :size => 3.5,
        :location_id => 4
      ),
      Park.create!(
        :climate => "Climate",
        :operating_hours => "Operating Hours",
        :dog_friendly => false,
        :activities => "Activities",
        :national_park => false,
        :fees => 2,
        :lodging => false,
        :camping => false,
        :name => "Name",
        :size => 3.5,
        :location_id => 4
      )
    ])
  end

  it "renders a list of parks" do
    render
    assert_select "tr>td", :text => "Climate".to_s, :count => 2
    assert_select "tr>td", :text => "Operating Hours".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Activities".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
