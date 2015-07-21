class SkillPolicy
  attr_reader :user, :skill

  def initialize(user, skill)
    @user = user
    @skill = skill
  end

  def index?
    current_user
  end

  def show?
    current_user
  end

  def new?
    if @user
binding.pry
      @user.admin
    end
  end

  def create?
    @user.admin
  end

  def edit?
    @user.admin
  end

  def update?
    @user.admin
  end

  def destroy?
    @user.admin
  end
end
