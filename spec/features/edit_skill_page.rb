require 'rails_helper'

describe "the edit skill process" do
  it "edits a skill" do
    testskill = Skill.create({name: 'foo', description: 'bar'})
    visit skill_path(testskill)
    click_on 'Edit'
    fill_in 'Name', with: 'Foo'
    click_on 'Update Skill'
    expect(page).to have_content 'Foo'
  end

  it "gives error when no title is entered" do
    testskill = Skill.create({name: 'foo', description: 'bar'})
    visit edit_skill_path(testskill)
    fill_in 'Name', with: ''
    click_on 'Update Skill'
    expect(page).to have_content 'errors'
  end
end
