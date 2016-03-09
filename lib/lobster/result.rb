module Lobster

  # Wraps a value or error depending on the outcome of some action.
  # This class can be used as a convenience mechanism to return a success or failure.
  # In the case of a success, {#value} will be the value returned by the action.
  # In the case of a failure, {#error} will contain the error that caused the failure.
  class Result

    # Indicates whether the result was successful.
    def ok?
      @is_ok
    end

    # Indicates whether the result was a failure.
    def fail?
      !@is_ok
    end

    alias_method :'success?', :'ok?'
    alias_method :'value?', :'ok?'
    alias_method :'error?', :'fail?'

    # Value returned from the successful operation.
    # @raise Can't assume the result was successful and access the value when {#ok?} is +false+.
    def value
      fail 'Cannot access the value of a failed result.' unless @is_ok
      @value_error
    end

    # Error that caused the operation to fail.
    # @return [Error, nil] Information about the failure cause.
    #   This will be +nil+ if the result was a success.
    def error
      @is_ok ? nil : @value_error # Return nil if there was no error.
    end

    # Returns a default value if the result failed (contains an error).
    # @yieldreturn Default value to return if the result failed.
    # @return The value of the result if it was a success, otherwise the value returned by the block.
    def default
      @is_ok ? @value_error : yield
    end

    # Creates a new successful result.
    # @param value [Object] Value returned from the successful operation.
    # @return [Result] A successful result.
    def self.success(value = nil)
      Result.new(true, value)
    end

    # Creates a new failure result.
    # @param error [Error] Reason the operation failed.
    # @return [Result] A failure result.
    def self.failure(error)
      Result.new(false, error)
    end

    # Generates a string representation of the result.
    # @return [String]
    def to_s
      prefix = @is_ok ? 'Success' : 'Failure'
      "#{prefix}<#{@value_error}>"
    end

    private

    # Creates a new result.
    # @param is_ok [Boolean] +true+ if the result was a success or +false+ if it was a failure.
    # @param value_error [Object, Error] Either the return value of the operation
    #   or the error describing the cause of the failure.
    #   If +is_ok+ is +true+, then this should be the first option.
    #   If +is_ok+ is +false+, then this should be the latter option.
    # @!private
    # @note This method should not be called directly.
    #   It should be called from {self.success} or {self.failure}.
    def initialize(is_ok, value_error)
      @is_ok       = is_ok
      @value_error = value_error
    end

  end

end
