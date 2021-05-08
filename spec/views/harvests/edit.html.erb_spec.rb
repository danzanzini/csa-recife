require 'rails_helper'

RSpec.describe "harvests/edit", type: :view do
  before(:each) do
    @harvest = assign(:harvest, Harvest.create!(
      user: nil
    ))
  end

  it "renders the edit harvest form" do
    render

    assert_select "form[action=?][method=?]", harvest_path(@harvest), "post" do

      assert_select "input[name=?]", "harvest[user_id]"
    end
  end
end
