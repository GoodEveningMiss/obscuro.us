class Ability
  include CanCan::Ability

  def initialize(user)
   
    # Anon user
    unless user
      can [:show, :new, :create], [List, Idea]
      
      
    else
      # Registered users
      can [:show, :new, :create], [List, Idea]
      can [:upvote, :downvote, :unvote], Idea
      
      # allow indexing of only their stuff
      can [:show, :update, :destroy], User, :id => user.id
      can [:dashboard, :destroy], List, :id => user.id
      # :edit, :update broken because "Unpermitted parameters: _destroy, id"
      # can :index, Idea # where owner
      
      
      
      
      # can :manage, List do | list | 
      #    list.try ( :owner ) == user
      # end
      
      # Admin users
      if user.role == 'admin'
       can :manage, :all
      end
    end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
