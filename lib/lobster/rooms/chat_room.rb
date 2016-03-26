require_relative 'room'

module Lobster
  module Rooms

    # Information about a standard room.
    class ChatRoom < Room

      # @param id [Uuid] Unique ID of the room.
      # @param name [String] Visibly displayed name of the room.
      # @param description [String] Brief description of the purpose of the room.
      # @param owner_id [Uuid] ID of the user that owns the room.
      # @param creation [Time] Date and time the room was created.
      def initialize(id, name, description, owner_id, creation)
        super(id, name, description, owner_id, creation)
      end

    end

  end
end
