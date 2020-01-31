require 'rails_helper'

RSpec.describe "parks/show", type: :view do
  before(:each) do
    @park = assign(:park, Park.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Climate/)
    expect(rendered).to match(/Operating Hours/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Activities/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
  end
end
