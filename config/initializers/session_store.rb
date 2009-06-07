# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fresh_app_session',
  :secret      => '996275380820a548158a5d6aa16b9b873722e574b86f84c2e4583c823aab2975bc5c58773a1e607ecbde85c72549f03504f1d6320ba737a5bd039875e9515e39'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
