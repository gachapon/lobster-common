require_relative '../identifiable'

module Lobster
  module Rooms

    # Information about the appearance of a room to everyone, including users not in the room.
    class RoomAppearance
      include Identifiable

      # ID of the resource used for the icon.
      # @return [Uuid, nil] +nil+ if the room doesn't have an icon.
      attr_reader :icon_id

      # @attribute [r] has_icon?
      # Indicates whether the room has an icon.
      # @return [Boolean]
      def has_icon?
        !!@icon_id
      end

      # Creates the room theme information.
      # @param id [Uuid] Unique ID of the room the theme applies to.
      # @param icon_id [Uuid, nil] ID of the resource used for the icon.
      #   Specify +nil+ for no icon.
      def initialize(id, icon_id = nil)
        @id      = id
        @icon_id = icon_id
      end

    end

  end
end
