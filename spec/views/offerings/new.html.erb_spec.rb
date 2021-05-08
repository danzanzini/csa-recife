require 'rails_helper'

RSpec.describe "offerings/new", type: :view do
  before(:each) do
    assign(:offering, Offering.new(
      published: false
    ))
  end

  it "renders new offering form" do
    render

    assert_select "form[action=?][method=?]", offerings_path, "post" do

      assert_select "input[name=?]", "offering[published]"
    end
  end
end
