require_relative 'abstract_attribute'

module Lobster

  # Wraps a value or error depending on the outcome of some action.
  # This class can be used as a convenience mechanism to return a success or failure.
  # @abstract
  class Result

    # @attribute [r] ok?
    #   Indicates whether the result was successful.
    #   @abstract
    #   @return [Boolean]
    abstract :ok?

    # @attribute [r] fail?
    #   Indicates whether the result was a failure.
    #   @abstract
    #   @return [Boolean]
    abstract :fail?

    alias_method :success?, :ok?
    alias_method :value?, :ok?
    alias_method :error?, :fail?

    # Returns a default value if the result failed (contains an error).
    # @yieldreturn Default value to return if the result failed.
    # @return The value of the result if it was a success, otherwise the value returned by the block.
    def default
      if fail?
        yield
      else
        value
      end
    end

    protected

    def initialize; end

  end

end
