Bundler.require(:default)

$LOAD_PATH.unshift('lib')

require 'ext/string'
require 'table'
require 'multiplication_table'
require 'prime_number_generator'
require 'application'

app = Application.new
app.run
