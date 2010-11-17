# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_working_session',
  :secret      => '5ee46b886d8fdb2bb9160f939a3a2bb75e4504726a22b82255c2866987cb28a8b6b83d575e810b94a377fbf3018d7dcf4c814228c4d7051052fc45a8396d31c8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
