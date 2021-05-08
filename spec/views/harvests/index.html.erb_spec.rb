require 'rails_helper'

RSpec.describe "harvests/index", type: :view do
  before(:each) do
    assign(:harvests, [
      Harvest.create!(
        user: nil
      ),
      Harvest.create!(
        user: nil
      )
    ])
  end

  it "renders a list of harvests" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
