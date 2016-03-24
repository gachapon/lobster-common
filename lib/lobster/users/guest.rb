require_relative 'user'

module Lobster
  module Users

    # Type of user that doesn't have an account.
    # Typically, this is a user that is "just visiting" or doesn't want to create an account.
    class Guest < User

      # @attribute [r] clearance
      # The clearance level of the user.
      # @return [Symbol] +:guest+
      def clearance
        :guest
      end

      # @attribute [r] member?
      # Indicates whether the user is a member.
      # @return [Boolean] +false+
      def member?
        false
      end

      # Creates the guest instance.
      # @param id [Uuid] Unique ID.
      # @param name [String] Displayed name (alias).
      # @param is_online [Boolean] Flag indicating whether the user is online or not.
      # @param last_login [Time] Last time the user came online.
      def initialize(id, name, is_online, last_login)
        super(id, name, is_online, last_login)
      end

    end

  end
end
