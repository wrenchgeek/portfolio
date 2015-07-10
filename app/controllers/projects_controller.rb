class ProjectsController < ApplicationController
  def new
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new
    authorize @project
  end

  def show
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
  end


  def create
    @skill = Skill.find(params[:skill_id])
    @project = @skill.projects.new(project_params)
    authorize @project
    if @project.save
      flash[:notice] = "New project added to " + @skill.name + "!"
      redirect_to skill_path(@project.skill)
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    authorize @project
  end

  def update
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    authorize @project
    if @project.update(project_params)
      flash[:notice] = @project.title + " has been updated!"
      redirect_to skill_project_path(@skill, @project)
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    flash[:notice] = @project.title + " has been deleted"
    redirect_to skill_path(@skill)
  end


private
  def project_params
    params.require(:project).permit(:title, :description, :url)
  end
end
