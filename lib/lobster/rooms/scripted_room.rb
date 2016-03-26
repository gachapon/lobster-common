require_relative 'room'

module Lobster
  module Rooms

    # Information about a room with a script running in it.
    # Scripted rooms allow custom events, games, and programs to run in rooms.
    class ScriptedRoom < Room

      # ID of the script running in the room.
      # @return [Uuid]
      attr_reader :script_id

      # Creates information about a scripted room.
      # @param id [Uuid] Unique ID of the room.
      # @param name [String] Visibly displayed name of the room.
      # @param description [String] Brief description of the purpose of the room.
      # @param owner_id [Uuid] ID of the user that owns the room.
      # @param creation [Time] Date and time the room was created.
      # @param script_id [Uuid] ID of the script running in the room.
      def initialize(id, name, description, owner_id, creation, script_id)
        super(id, name, description, owner_id, creation)
        @script_id = script_id
      end

    end

  end
end
