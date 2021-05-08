require 'rails_helper'

RSpec.describe "harvests/new", type: :view do
  before(:each) do
    assign(:harvest, Harvest.new(
      user: nil
    ))
  end

  it "renders new harvest form" do
    render

    assert_select "form[action=?][method=?]", harvests_path, "post" do

      assert_select "input[name=?]", "harvest[user_id]"
    end
  end
end
