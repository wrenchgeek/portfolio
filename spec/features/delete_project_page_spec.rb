require 'rails'

describe "the delete project process" do
  it "deletes a project" do
    testSkill = Skill.create({name: 'foo', description: 'bar'})
    testProject = Project.create({title: 'stuff', description: 'junk', url: 'website'})
    visit skill_project_path(testSkill, testProject)
    click_on 'Delete'
    expect(page).to have_content 'deleted'
  end
end
