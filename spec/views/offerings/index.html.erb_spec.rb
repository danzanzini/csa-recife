require 'rails_helper'

RSpec.describe "offerings/index", type: :view do
  before(:each) do
    assign(:offerings, [
      Offering.create!(
        published: false
      ),
      Offering.create!(
        published: false
      )
    ])
  end

  it "renders a list of offerings" do
    render
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
