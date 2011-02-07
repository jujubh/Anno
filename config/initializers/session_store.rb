# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Anno_session',
  :secret      => '6efa33a2e70c1e541a4d4cd2be57c2722302b6e69d48b84dcc6c49c14c4fbd0d578af66cfa4d79710e3e9caa8772077bc567669813a4a34a28a557e6e1a4268c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
