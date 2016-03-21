module Lobster
  module Users

    # Base-minimum information needed to create a user.
    # All other information about a user can be generated or inferred.
    class UserBase

      # Displayed name.
      # This is the string that all others see as the user's name.
      # @note The word +name+ is commonly used in place of +alias+ because +alias+ is a Ruby keyword.
      # @return [String]
      attr_reader :alias

      alias_method :name, :alias

      # Creates the user base information.
      # @param name [String] Displayed name (alias).
      def initialize(name)
        fail ArgumentError unless name.is_a?(String)
        @alias = name.dup.freeze
      end

    end

  end
end
