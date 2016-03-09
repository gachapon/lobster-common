require_relative 'error_codes'

module Lobster

  # Information about something that went wrong.
  class Error

    # Integer code representing the error type.
    # @return [Fixnum] Error type as an integer.
    attr_reader :code

    # Extra information associated with the error.
    # This data can be used to create a localized error string.
    # @return [Hash{Symbol => String}] Set of keys and values containing additional information about the error.
    attr_reader :data

    # Creates a new error.
    # @param code [Fixnum] Integer code representing the error type.
    # @param data [Hash{Symbol => String}] Extra information associated with the error.
    def initialize(code, data = {})
      @code = code
      @data = Hash[data.map do |k, v|
        [k, v.to_s.freeze]
      end].freeze
    end

    # Generates a string representation of the error.
    # @return [String]
    def to_s
      symbol = Error.get_code_symbol(code)
      str = "Error: #{symbol}"
      if data.any?
        str + " #{data}"
      else
        str
      end
    end

    # Attempts to get a symbol that represents an error code.
    # This method looks through {Lobster::ErrorCodes} for matching values.
    # @param code [Fixnum] Integer code representing the error type.
    # @return [Symbol, Fixnum] A symbol representing the error type or its integer code if a symbol couldn't be found.
    def self.get_code_symbol(code)
      Lobster::ErrorCodes.constants.find do |constant|
        Lobster::ErrorCodes.const_get(constant) == code
      end || code
    end

  end

end
