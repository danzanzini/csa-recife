require 'rails_helper'

RSpec.describe "offerings/edit", type: :view do
  before(:each) do
    @offering = assign(:offering, Offering.create!(
      published: false
    ))
  end

  it "renders the edit offering form" do
    render

    assert_select "form[action=?][method=?]", offering_path(@offering), "post" do

      assert_select "input[name=?]", "offering[published]"
    end
  end
end
