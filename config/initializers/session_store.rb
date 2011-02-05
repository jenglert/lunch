# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_lunch_session',
  :secret      => '072672c762a8b5c47869010508260e104a9f5e1fc8a1a9c5442a12c4d5218ce0f51c00446d9b0ec4753dc38454207a6da1ed21e0bcac9483a068b60ba53c6aa7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
