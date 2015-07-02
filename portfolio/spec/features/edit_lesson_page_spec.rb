require 'rails_helper'

describe "the edit project process" do
  it "edits a project" do
    testskill = Skill.create({:name => 'silly string', :description => 'blah'})
    testproject = Project.create({:title => "project title", :url => 'blah blah blah', :description => 'blah', :skill_id => testskill.id})

    visit skill_project_path(testskill, testproject)
    click_on 'Edit'
    fill_in 'Title', :with => 'nonrandom title'
    click_on 'Update Project'
    expect(page).to have_content 'nonrandom title'
  end

  it "gives error when no title is entered" do
    testskill = Skill.create({:name => 'random title', :description => 'blah'})
    testproject = Project.create({:title => "project title", :url => 'blah blah blah', :description => 'blah', :skill_id => testskill.id})
    visit edit_skill_project_path(testskill, testproject)
    fill_in 'Title', :with => ''
    click_on 'Update Project'
    expect(page).to have_content 'errors'
  end

end
