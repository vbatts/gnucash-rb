# Copyright 2012  Vincent Batts, Raleigh, NC, USA
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
# EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require 'rubygems'
require 'mysql'
require 'active_record'

=begin
This is intended to help me script my account access,
and provide alternate forms of manipulating the data.

http://wiki.gnucash.org/wiki/SQL
see the Entity Relaional Diagram image there
=end
module Gnucash
  class Accounts < ActiveRecord::Base
    set_primary_key = 'guid'
    belongs_to :split, :class_name => 'Splits'
    has_one :parent, :class_name => 'Accounts', :foreign_key => 'guid', :primary_key => 'parent_guid'
    has_one :commodity, :class_name => 'Commodities', :foreign_key => 'guid', :primary_key => 'commodity_guid'
  end
  class Books < ActiveRecord::Base
    set_primary_key = 'guid'
    has_one :root_account, :class_name => 'Accounts', :primary_key => 'root_account_guid'
  end
  class Billterms < ActiveRecord::Base
    set_primary_key = 'guid'
  end
  class BudgetAmounts < ActiveRecord::Base
    set_primary_key = 'guid'
    belongs_to :account, :class_name => 'Accounts', :primary_key => 'account_guid'
    belongs_to :bundget, :class_name => 'Budgets', :primary_key => 'budget_guid'
  end
  class Budgets < ActiveRecord::Base
    set_primary_key = 'guid'
    has_many :amounts, :class_name => 'BudgetAmounts'
  end
  class Commodities < ActiveRecord::Base
    set_primary_key = 'guid'
    belongs_to :account, :class_name => 'Accounts'
  end
  class Customers < ActiveRecord::Base; end
  class Employees < ActiveRecord::Base; end
  class Entries < ActiveRecord::Base; end
  class Gnclock < ActiveRecord::Base
    set_table_name 'gnclock'
  end
  class Invoices < ActiveRecord::Base; end
  class Jobs < ActiveRecord::Base; end
  class Lots < ActiveRecord::Base
  end
  class Orders < ActiveRecord::Base; end
  class Prices < ActiveRecord::Base; end
  class Recurrences < ActiveRecord::Base; end
  class Schedxactions < ActiveRecord::Base; end
  class Slots < ActiveRecord::Base; end
  class Splits < ActiveRecord::Base
    set_primary_key = 'guid'
    has_one :transaction, :class_name => 'Transactions', :foreign_key => 'guid', :primary_key => 'tx_guid'
    has_many :account, :class_name => 'Accounts', :foreign_key => 'guid', :primary_key => 'account_guid'
  end
  class TaxableEntries < ActiveRecord::Base; end
  class Taxables < ActiveRecord::Base; end
  class Transactions < ActiveRecord::Base
    set_primary_key = "guid"
    belongs_to :splits
  end
  class Vendors < ActiveRecord::Base; end
  class Versions < ActiveRecord::Base; end
end
