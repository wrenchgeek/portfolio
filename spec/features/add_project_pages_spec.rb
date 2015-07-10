require 'rails_helper'

describe "the add projects process" do
  it "adds a new project" do
    testSkill = Skill.create({name: "Random Title", description: "blah blah"})
    visit skill_path(testSkill)
    click_on "Add a new project"
    fill_in 'Title', with: 'Randomer Title'
    fill_in 'Description', with: 'Random Description'
    fill_in 'Url', with: 'www.google.com'
    click_on 'Create Project'
    expect(page).to have_content 'Randomer Title'
  end

  it "gives error when no title is entered" do
    testSkill = Skill.create({name: "Random Title", description: "blah blah blah"})
    visit new_skill_project_path(testSkill)
    click_on 'Create Project'
    expect(page).to have_content 'errors'
  end
end
