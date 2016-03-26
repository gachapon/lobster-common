module Lobster
  module Rooms

    # Minimal information needed to create a room.
    class RoomBase

      # Visibly displayed name of the room.
      # @return [String]
      attr_reader :name

      # Brief description of the purpose of the room.
      # @return [String]
      attr_reader :description

      # Creates the base of the room.
      # @param name [String] Visibly displayed name of the room.
      # @param description [String] Brief description of the purpose of the room.
      def initialize(name, description)
        @name        = name
        @description = description
      end

    end

  end
end
