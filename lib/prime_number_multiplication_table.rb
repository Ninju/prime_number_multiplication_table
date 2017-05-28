require 'bundler'

Bundler.require(:default)

$LOAD_PATH.unshift("lib")

require 'ext/string'
require 'prime_number_multiplication_table/table'
require 'prime_number_multiplication_table/multiplication_table'
require 'prime_number_multiplication_table/prime_number_generator'
require 'prime_number_multiplication_table/application'
