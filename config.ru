# This file is used by Rack-based servers to start the application.

$server_mode = 1

require_relative 'config/environment'

run Rails.application
