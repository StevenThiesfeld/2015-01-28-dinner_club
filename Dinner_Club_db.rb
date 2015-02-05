require 'pry'
require 'sqlite3'

DATABASE2 = SQLite3::Database.new('Dinner_Club.db')

#DATABASE2.execute("DROP TABLE members")
#DATABASE2.execute("CREATE TABLE members (id INTEGER PRIMARY KEY, name TEXT, spent INTEGER)")

require_relative 'members'
