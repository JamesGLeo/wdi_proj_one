require 'bundler'
Bundle.require
require './connection'

ROOT_PATH = DIR.pwd
DIR[ROOT_PATH+"/models/*.rb"].each { |file| require file }
 