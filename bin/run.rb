Bundler.require(:default)

$LOAD_PATH.unshift('lib')

require 'application'
require 'table'
require 'multiplication_table'
require 'ext/string'

app = Application.new
app.run
