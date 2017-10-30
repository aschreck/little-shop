require 'rails_helper'

describe "When a visitor visits /items" do
  it "they see all existing items" do
    visit items_path

    expect(page).to have_content("Items")
  end
end