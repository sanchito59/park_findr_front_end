require 'rails_helper'

RSpec.describe "parks/new", type: :view do
  before(:each) do
    assign(:park, Park.new(
      :climate => "MyString",
      :operating_hours => "MyString",
      :dog_friendly => false,
      :activities => "MyString",
      :national_park => false,
      :fees => 1,
      :lodging => false,
      :camping => false,
      :name => "MyString",
      :size => 1.5,
      :location_id => 1
    ))
  end

  it "renders new park form" do
    render

    assert_select "form[action=?][method=?]", parks_path, "post" do

      assert_select "input[name=?]", "park[climate]"

      assert_select "input[name=?]", "park[operating_hours]"

      assert_select "input[name=?]", "park[dog_friendly]"

      assert_select "input[name=?]", "park[activities]"

      assert_select "input[name=?]", "park[national_park]"

      assert_select "input[name=?]", "park[fees]"

      assert_select "input[name=?]", "park[lodging]"

      assert_select "input[name=?]", "park[camping]"

      assert_select "input[name=?]", "park[name]"

      assert_select "input[name=?]", "park[size]"

      assert_select "input[name=?]", "park[location_id]"
    end
  end
end
