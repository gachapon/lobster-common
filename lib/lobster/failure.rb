require_relative 'result'

module Lobster

  # Wraps an error for a failed outcome of an action.
  # @see Success
  class Failure < Result

    # @attribute [r] ok?
    # Indicates whether the result was successful.
    # @return [Boolean] +false+
    def ok?
      false
    end

    # @attribute [r] fail?
    # Indicates whether the result was a failure.
    # @return [Boolean] +true+
    def fail?
      true
    end

    # Error that occurred during the action that caused it to fail.
    # @return [Error]
    attr_reader :error

    # Creates a new failure result.
    # @param error [Error] Error that occurred during the action that caused it to fail.
    def initialize(error)
      @error = error
    end

    # Generates a string representation of the result.
    # @return [String] +Failure(ERROR)+
    def to_s
      "Failure(#{error})"
    end

  end

end
