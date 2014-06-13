# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_appreview_session',
  :secret      => '1e0870a6e967186d66b7685a57f1413e9b0d37cdd192d05dc8e04133d11ffa23a8e94fa85140fbf4aab5b80847326a800f74cb48a93144c902b8c05b848b00ed'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
