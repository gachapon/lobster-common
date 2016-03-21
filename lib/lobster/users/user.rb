require_relative 'user_base'
require_relative '../identifiable'

module Lobster
  module Users

    # Basic information about a someone using the service.
    class User < UserBase
      include Identifiable

      # Date and time the user last logged in.
      # This can also be thought of as the last time the user went from offline to online.
      # @note This attribute will be +nil+ if a user hasn't logged in.
      # @return [Time, nil]
      attr_reader :last_login

      # Date and time the member registered an account.
      # This attribute will be +nil+ for guests, since they have not registered.
      # @return [Time, nil]
      attr_reader :registration

      # Indicates whether the user is actively using the service.
      def online?
        @is_online
      end

      # Indicates the security level of the user.
      # This attribute is used when checking permissions.
      # @return [Symbol] One of:
      #   - +:guest+  - Does not have a registered account.
      #   - +:member+ - Has a registered account, but not a staff member.
      #   - +:mod+    - Basic staff member.
      #   - +:admin+  - Higher staff member - typically a server owner.
      #   - +:super+  - Internal user.
      attr_reader :clearance

      # Indicates whether the user has a registered account.
      # @return [Boolean] +true+ if the user *does not* have an account.
      def guest?
        clearance == :guest
      end

      # Indicates whether the user has a registered account.
      # @return [Boolean] +true+ if the user *does* have an account.
      # @note All staff members are considered members except super users.
      def member?
        !registration.nil?
      end

      # Indicates whether the user has basic staff member access.
      # @note Administrators and super users fall under this classification.
      def moderator?
        administrator? || clearance == :mod
      end

      # Indicates whether the user has staff member (owner) access.
      # @note Super users fall under this classification.
      def administrator?
        super? || clearance == :admin
      end

      # Indicates whether the user has super user access.
      def super?
        clearance == :super
      end

      # Indicates whether the user has an account and has staff access.
      # @note Internal super users (that don't have accounts) don't fall under this classification.
      def staff?
        member? && moderator?
      end

      alias_method :mod?, :moderator?
      alias_method :admin?, :administrator?
      alias_method :root?, :super?

      # Generates a string representation of the user's info.
      # @return [String] +Clearance("Alias" UUID)+
      def to_s
        "#{clearance.capitalize}(\"#{name}\" #{id})"
      end

      class << self

        # Creates a new guest user.
        # @param id [Uuid] Unique ID.
        # @param name [String] Displayed name (alias).
        # @param is_online [Boolean] Flag indicating whether the user is online or not.
        # @param last_login [Time] Last time the user came online.
        # @return [User] Guest user.
        def guest(id, name, is_online, last_login)
          fail ArgumentError unless id.is_a?(Uuid)
          fail ArgumentError unless name.is_a?(String)
          fail ArgumentError unless last_login.is_a?(Time)

          User.new(id, name, !!is_online, :guest, nil, last_login)
        end

        # Creates a new member user.
        # @param id [Uuid] Unique ID.
        # @param name [String] Displayed name (alias).
        # @param is_online [Boolean] Flag indicating whether the user is online or not.
        # @param clearance [Symbol] One of:
        #   - +:guest+  - Does not have a registered account.
        #   - +:member+ - Has a registered account, but not a staff member.
        #   - +:mod+    - Basic staff member.
        #   - +:admin+  - Higher staff member - typically a server owner.
        #   - +:super+  - Internal user.
        # @param registration [Time] Date and time the user's account was registered.
        # @param last_login [Time] Last time the user came online.
        # @return [User] Member user.
        def member(id, name, is_online, clearance, registration, last_login)
          fail ArgumentError unless id.is_a?(Uuid)
          fail ArgumentError unless name.is_a?(String)
          fail ArgumentError unless(last_login.nil? || last_login.is_a?(Time))
          fail ArgumentError unless verify_clearance(clearance)
          fail ArgumentError if clearance == :guest
          fail ArgumentError if((registration.nil? && clearance != :super) || !registration.is_a?(Time))

          User.new(id, name, !!is_online, clearance, registration, last_login)
        end

        private

        # Checks if a clearance is one of the valid symbols.
        # @param clearance [Symbol] Clearance value to check.
        # @return [Boolean] +true+ if +clearance+ is valid.
        def verify_clearance(clearance)
          case(clearance)
            when :guest, :member, :mod, :admin, :super
              true
            else
              false
          end
        end

      end

      # Creates the user instance.
      # @param id [Uuid] Unique ID.
      # @param name [String] Displayed name (alias).
      # @param is_online [Boolean] Flag indicating whether the user is online or not.
      # @param clearance [Symbol] One of:
      #   - +:guest+  - Does not have a registered account.
      #   - +:member+ - Has a registered account, but not a staff member.
      #   - +:mod+    - Basic staff member.
      #   - +:admin+  - Higher staff member - typically a server owner.
      #   - +:super+  - Internal user.
      # @param registration [Time] Date and time the user's account was registered.
      #   This should be +nil+ when +clearance+ is +:guest+.
      # @param last_login [Time] Last time the user came online.
      # @private
      # @note This method should not be called directly.
      #   Use {guest} or {member} methods instead.
      def initialize(id, name, is_online, clearance, registration, last_login)
        super(name)
        @id           = id
        @is_online    = is_online
        @clearance    = clearance
        @registration = registration
        @last_login   = last_login
      end

    end

  end
end
