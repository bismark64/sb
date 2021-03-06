# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
Sb::Application.config.secret_token = '59a9d6befcd00e55968d3b9598bd04cb8862202d80b7660c92c0bef5f48f2f09b394cac6a53593497b71967ae22692d3de11b841a95c5cf14dcd63eb2a96e2e6'
Sb::Application.config.secret_key_base = 'c1f1ba018660ecd57e9b'
