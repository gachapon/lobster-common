# Top-level namespace for all lobster chat system classes.
module Lobster
end

require_relative 'lobster/version'
require_relative 'lobster/abstract_attribute'

require_relative 'lobster/error_codes'
require_relative 'lobster/error'
require_relative 'lobster/result'
require_relative 'lobster/success'
require_relative 'lobster/failure'
require_relative 'lobster/uuid'
require_relative 'lobster/identifiable'

require_relative 'lobster/users'
require_relative 'lobster/rooms'
