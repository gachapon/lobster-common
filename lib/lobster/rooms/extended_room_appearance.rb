require_relative 'room_appearance'

module Lobster
  module Rooms

    # Styling information for a room visible to participants.
    class ExtendedRoomAppearance < RoomAppearance

      # Current topic or MotD (message of the day).
      # @return [String]
      attr_reader :topic

      # ID of the resource used for the banner image.
      # @return [Uuid, nil] +nil+ if the room doesn't have a banner.
      attr_reader :banner_id

      # ID of the resource used for the background image.
      # @return [Uuid, nil] +nil+ if the room doesn't have a background.
      attr_reader :background_id

      # @attribute [r] has_banner?
      # Indicates whether the room has a banner.
      # @return [Boolean]
      def has_banner?
        !!@banner_id
      end

      # @attribute [r] has_background?
      # Indicates whether the room has a background.
      # @return [Boolean]
      def has_background?
        !!@background_id
      end

      # Creates the extended room theme information.
      # @param id [Uuid] Unique ID of the room the theme applies to.
      # @param topic [String] Current topic or MotD (message of the day).
      # @param icon_id [Uuid, nil] ID of the resource used for the icon.
      #   Specify +nil+ for no icon.
      # @param banner_id [Uuid, nil] ID of the resource used for the banner image.
      #   Specify +nil+ for no banner image.
      # @param background_id [Uuid, nil] ID of the resource used for the background image.
      #   Specify +nil+ for no background image.
      def initialize(id, topic, icon_id = nil, banner_id = nil, background_id = nil)
        super(id, icon_id)
        @topic         = topic
        @banner_id     = banner_id
        @background_id = background_id
      end

    end

  end
end
