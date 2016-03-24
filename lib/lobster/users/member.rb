require_relative 'user'

module Lobster
  module Users

    # Type of user that has registered an account.
    # Information about this user can persist even after they disconnect from the service.
    class Member < User

      # The clearance level of the user.
      # @return [Symbol] One of:
      #   - +:member+ - Has a registered account, but not a staff member.
      #   - +:mod+    - Basic staff member.
      #   - +:admin+  - Higher staff member - typically a server owner.
      #   - +:super+  - Internal user.
      attr_reader :clearance

      # Date and time the user created their account.
      # @return [Time]
      attr_reader :registration

      # @attribute [r] member?
      # Indicates whether the user is a member.
      # @return [Boolean] +false+
      def member?
        true
      end

      # Creates the guest instance.
      # @param id [Uuid] Unique ID.
      # @param name [String] Displayed name (alias).
      # @param is_online [Boolean] Flag indicating whether the user is online or not.
      # @param last_login [Time] Last time the user came online.
      # @param clearance [Symbol] One of:
      #   - +:member+ - Has a registered account, but not a staff member.
      #   - +:mod+    - Basic staff member.
      #   - +:admin+  - Higher staff member - typically a server owner.
      #   - +:super+  - Internal user.
      # @param registration [Time] Date and time the user created their account.
      def initialize(id, name, is_online, last_login, clearance, registration)
        super(id, name, is_online, last_login)
        @clearance    = clearance
        @registration = registration
      end

    end

  end
end
