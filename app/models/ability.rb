class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    
    unless user.new_record?
      can [:index, :create], Discussion
      can :read, Discussion do |discussion|
        discussion.can_participate?(user)
      end
    end
  end
end
