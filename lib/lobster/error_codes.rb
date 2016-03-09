module Lobster

  # Constants for error codes.
  module ErrorCodes

    # Some type of unexpected error occurred.
    UNEXPECTED = 0

    # The client is not authenticated.
    # The action being performed required authentication.
    NO_AUTHENTICATION = 1

    # The user is not authorized to perform an action.
    PERMISSION_DENIED = 2

    # The requested alias or name is already being used.
    NAME_TAKEN = 3

    # The host disallows guests from authenticating.
    # Registered users only.
    GUEST_AUTHENTICATION_NOT_ALLOWED = 4

    # The client is already authenticated.
    # An attempt was made to authenticate again.
    ALREADY_AUTHENTICATED = 5

    # An action took too long and was terminated.
    TIMEOUT = 6

    # An error or exception occurred while processing a request.
    INTERNAL = 7

    # No item with the provided ID, name, or alias was found.
    NOT_FOUND = 8

  end

end
