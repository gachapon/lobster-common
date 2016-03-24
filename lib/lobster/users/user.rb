require_relative 'user_base'
require_relative '../identifiable'
require_relative '../abstract_attribute'

module Lobster
  module Users

    # Basic information about a someone using the service.
    # @abstract
    class User < UserBase
      include Identifiable

      # Date and time the user last logged in.
      # This can also be thought of as the last time the user went from offline to online.
      # @note This attribute will be +nil+ if a user hasn't logged in.
      # @return [Time, nil]
      attr_reader :last_login

      # @!attribute [r] online?
      # Indicates whether the user is actively using the service.
      def online?
        @is_online
      end

      # @!attribute [r] clearance
      #   Indicates the security level of the user.
      #   This attribute is used when checking permissions.
      #   @abstract
      #   @return [Symbol] One of:
      #     - +:guest+  - Does not have a registered account.
      #     - +:member+ - Has a registered account, but not a staff member.
      #     - +:mod+    - Basic staff member.
      #     - +:admin+  - Higher staff member - typically a server owner.
      #     - +:super+  - Internal user.
      abstract :clearance

      # Indicates whether the user has a registered account.
      # @return [Boolean] +true+ if the user *does not* have an account.
      def guest?
        clearance == :guest
      end

      # @!attribute [r] member?
      #   Indicates whether the user has a registered account.
      #   @abstract
      #   @return [Boolean] +true+ if the user *does* have an account.
      #   @note All staff members are considered members except super users.
      abstract :member?

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

      protected

      # Creates the user instance.
      # @param id [Uuid] Unique ID.
      # @param name [String] Displayed name (alias).
      # @param is_online [Boolean] Flag indicating whether the user is online or not.
      # @param last_login [Time] Last time the user came online.
      def initialize(id, name, is_online, last_login)
        super(name)
        @id         = id
        @is_online  = is_online
        @last_login = last_login
      end

    end

  end
end
