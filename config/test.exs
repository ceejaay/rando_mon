import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rando_mon, RandoMon.Repo,
  username: "cjem",
  password: "postgres",
  database: "rando_mon_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rando_mon, RandoMonWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "c8gqAE7YZuwrIniFEXVbgMCjg1JIdviW3zw6eDBSr0WWBZEE44uU7C6YgvoR5E56",
  server: false

# In test we don't send emails.
# c
config :rando_mon, RandoMon.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
config :bcrypt_elixir, :log_rounds, 4
