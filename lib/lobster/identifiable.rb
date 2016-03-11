require_relative 'uuid'

module Lobster

  # Mix-in for making an object uniquely identifiable by giving it an ID.
  # A {Uuid} is used to track the object.
  module Identifiable

    # Unique ID of the instance.
    # @return [Uuid]
    attr_reader :id

    # Checks whether another instance has the same ID as this one.
    # @param other [#id] An identifiable object.
    # @return [Boolean] +true+ if the instances have the same ID, +false+ if they don't.
    def equal?(other)
      other.respond_to?(:id) && id == other.id
    end

    # Creates a simple string representation of the instance.
    # @return [String] +Class(UUID)+
    def to_s
      "#{self.class}(#{id})"
    end

  end

end
