module AresMUSH
  module Compliments

    def self.handle_comps_given_achievement(char)
      char.update(comps_given: char.comps_given + 1)
      [ 1, 10, 20, 50, 100 ].reverse.each do |count|
        if (char.comps_given >= count)
          Achievements.award_achievement(char, "gave_comps", count)
        end
      end
    end

    def self.can_view_comps?(actor)
      return true if Global.read_config("compliments", "public_compliments")
      return false if !actor
      actor.has_permission?("view_comps")
    end

  end
end
