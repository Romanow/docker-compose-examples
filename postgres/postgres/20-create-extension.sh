#!/usr/bin/env bash

set -e

export PGPASSWORD=postgres
psql -U postgres -d services -c 'CREATE EXTENSION hstore;'
