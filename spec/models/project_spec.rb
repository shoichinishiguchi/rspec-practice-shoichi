require 'rails_helper'

RSpec.describe Project, type: :model do

  before do
    @user = FactoryBot.create(:user,:Joe)

    @project = @user.projects.create(
      name: "Test Project",
    )
  end

  it "is invalid without a name" do
    @project.name = nil
    @project.valid?
    expect(@project.errors[:name]).to include("can't be blank")
  end


  it "does not allow duplicate project names per user" do

    new_project = @user.projects.build(
      name: "Test Project",
    )

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it "allows two users to share a project name" do

    other_user = FactoryBot.create(:user, :Jane)
    other_project = other_user.projects.build(
      name: "Test Project",
    )

    expect(other_project).to be_valid

  end


  describe "late status" do
    it "is late when the due date is past today" do
      project = FactoryBot.create(:project, :due_yesterday)
      expect(project).to be_late
    end

    it "is on time when the due date is today" do
      project = FactoryBot.create(:project, :due_today)
      expect(project).to_not be_late
    end

    it "is on time when the due date is in the future" do
      project = FactoryBot.create(:project, :due_tomorrow)
      expect(project).to_not be_late
    end
  end

  it "can have many notes" do
    project = FactoryBot.create(:project, :with_notes)
    expect(project.notes.length).to eq 5
  end

end
