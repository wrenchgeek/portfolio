class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    @projects = @skill.projects.all
  end

  def new
    @skill = Skill.new
    authorize @skill
  end

  def create
    @skill = Skill.new(skill_params)
    # authorize @skill
    if @skill.save
      flash[:notice] = "Skill successfully added"
      redirect_to skills_path
    else
      render :new
    end
  end

  def edit
    @skill = Skill.find(params[:id])
    # authorize @skill
  end

  def update
    @skill = Skill.find(params[:id])
    # authorize @skill
    if @skill.update(skill_params)
      flash[:notice] = "Skill successfully updated"
      redirect_to skills_path
    else
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    # authorize @skill
    @skill.destroy
    flash[:notice] = "Skill successfully deleted"
    redirect_to skills_path
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :description)
  end

end
