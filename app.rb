#!/usr/bin/env ruby

require 'rubygems'
require 'mysql'
require 'active_record'

ActiveRecord::Base.logger = Logger.new('log/debug.log')
ActiveRecord::Base.configurations = YAML.load(File.read('config/database.yml'))
ActiveRecord::Base.establish_connection('development')

module Gnucash
  class Accounts < ActiveRecord::Base; end
  class Books < ActiveRecord::Base; end
  class BudgetAmounts < ActiveRecord::Base; end
  class Commodities < ActiveRecord::Base; end
  class Recurrences < ActiveRecord::Base; end
  class Schedxactions < ActiveRecord::Base; end
  class Slots < ActiveRecord::Base; end
  class Splits < ActiveRecord::Base; end
  class Transactions < ActiveRecord::Base; end
  class Versions < ActiveRecord::Base; end
end

if $0 == __FILE__
  a = Gnucash::Transactions.find :all, :limit => 5
  a.each {|x|
    p x
    puts
  }
end

# vim: set sts=2 sw=2 et ai:
