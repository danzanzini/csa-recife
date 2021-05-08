require 'rails_helper'

RSpec.describe "offerings/show", type: :view do
  before(:each) do
    @offering = assign(:offering, Offering.create!(
      published: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
  end
end
