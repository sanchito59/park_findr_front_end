require 'rails_helper'

RSpec.describe "locations/show", type: :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :continent => "Continent",
      :country => "Country",
      :city => "City",
      :community => "Community",
      :street_address => "Street Address",
      :longitude => 2.5,
      :latitude => 3.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Continent/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Community/)
    expect(rendered).to match(/Street Address/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
  end
end
