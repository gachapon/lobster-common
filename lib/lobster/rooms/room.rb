require_relative 'room_base'
require_relative '../identifiable'

module Lobster
  module Rooms

    # Basic information about a room on the server.
    # @abstract
    class Room < RoomBase
      include Identifiable

      # ID of the user that owns the room.
      # @return [Uuid] User ID.
      attr_reader :owner_id

      # Date and time the room was created.
      # @return [Time]
      attr_reader :creation

      protected

      # Creates the room information.
      # @param id [Uuid] Unique ID of the room.
      # @param name [String] Visibly displayed name of the room.
      # @param description [String] Brief description of the purpose of the room.
      # @param owner_id [Uuid] ID of the user that owns the room.
      # @param creation [Time] Date and time the room was created.
      def initialize(id, name, description, owner_id, creation)
        super(name, description)
        @id       = id
        @owner_id = owner_id
        @creation = creation
      end

    end

  end
end
