require 'rails_helper'

describe "the delete skill process" do
  it "deletes a skill" do
    testSkill = Skill.create({name: "Bubbles", description: "blah"})
    visit skill_path(testSkill)
    click_on 'Delete'
    expect(page).to have_no_content 'Bubbles'
  end
end
