require 'pry'

require 'sqlite3'
#all caps = constant, variables that can't be changed accidentally

DATABASE = SQLite3::Database.new('Checksplitter.db')
#use for new OR existing databases
 #DATABASE.execute("DROP TABLE entries")
 #use for new databases ONLY
#DATABASE.execute("CREATE TABLE entries ( 'id' INTEGER PRIMARY KEY, 'check' INTEGER, 'tip' INTEGER, 'diners' INTEGER, 'total_check' INTEGER, 'split_check' INTEGER )")
DATABASE.results_as_hash = true

require_relative 'Checksplitter_entries.rb'

#binding.pry 