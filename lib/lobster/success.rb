require_relative 'result'

module Lobster

  # Wraps a value for the successful outcome of an action.
  # @see Failure
  class Success < Result

    # @attribute [r] ok?
    # Indicates whether the result was successful.
    # @return [Boolean] +true+
    def ok?
      true
    end

    # @attribute [r] fail?
    # Indicates whether the result was a failure.
    # @return [Boolean] +false+
    def fail?
      false
    end

    # Value of the result from the successful action.
    attr_reader :value

    # Creates a new successful result.
    # @param value Value of the result from the successful action.
    def initialize(value = nil)
      @value = value
    end

    # Generates a string representation of the result.
    # @return [String] +Success(VALUE)+
    def to_s
      "Success(#{value})"
    end

  end

end
