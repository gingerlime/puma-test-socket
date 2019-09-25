#!/usr/bin/env puma

# The directory to operate out of.
#
# The default is the current directory.
#
directory "/app"

# Set the environment in which the rack's app will run. The value must be a string.
#
# The default is "development".
#
environment ENV["RAILS_ENV"] || "development"

# Store the pid of the server in the file at "path".
#
pidfile "/var/run/puma/puma.pid"

# Use "path" as the file to store the server info state. This is
# used by "pumactl" to query and control the server.
#
state_path "/var/run/puma/puma.state"

# Redirect STDOUT and STDERR to files specified. The 3rd parameter
# ("append") specifies whether the output is appended, the default is
# "false".
#
stdout_redirect "/var/log/puma.log", "/var/log/puma.log", true

# Configure "min" to be the minimum number of threads to use to answer
# requests and "max" the maximum.
#
# The default is "0, 16".
#
# threads 0, 16
threads 8, 8


# Bind the server to "url". "tcp://", "unix://" and "ssl://" are the only
# accepted protocols.
#
# The default is "tcp://0.0.0.0:9292".
#
bind 'unix:///var/run/puma/puma.sock'


# === Cluster mode ===

# How many worker processes to run.  Typically this is set to
# to the number of available cores.
#
# The default is "0".
#
workers ENV["PUMA_WORKERS"] || 16

# Allow workers to reload bundler context when master process is issued
# a USR1 signal. This allows proper reloading of gems while the master
# is preserved across a phased-restart. (incompatible with preload_app)
# (off by default)

# see https://github.com/puma/puma/blob/master/docs/deployment.md#restarting
prune_bundler
