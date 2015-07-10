require 'rails_helper'

describe "the add skill proces" do
  it "adds a new skill" do
    visit skills_path
    click_on 'Add a Skill'
    fill_in 'Name', with: 'Random Title'
    fill_in 'Description', with: 'Blah Blah'
    click_on 'Create Skill'
    expect(page).to have_content 'Random Title'
  end

  it "gives error when no title is entered" do
    visit new_skill_path
    click_on 'Create Skill'
    expect(page).to have_content 'errors'
  end
end
