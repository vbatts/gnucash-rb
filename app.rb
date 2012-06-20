#!/usr/bin/env ruby

require 'rubygems'
require 'mysql'
require 'active_record'

ActiveRecord::Base.logger = Logger.new('log/debug.log')
ActiveRecord::Base.configurations = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection('development')


