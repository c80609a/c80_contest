
require 'mysql2'
require 'dotenv/load'

user_name = 'dummy'
env = 'test'
db_name = "#{user_name}_#{env}_db"
pass = ENV['DB_PASS']

puts '---[ CREATE DATABASE ]------------------ '
puts "\t\t user_name = #{user_name}"
puts "\t\t env = #{env}"
puts "\t\t db_name = #{db_name}"

begin
  client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => pass)
  client.query("CREATE DATABASE #{db_name};")
  client.query("GRANT ALL PRIVILEGES ON #{db_name}.* TO #{user_name}@localhost IDENTIFIED by '#{pass}';")
  client.query("FLUSH PRIVILEGES;")
rescue => e
  puts "\t\t #{e}"
end

# puts '---[ FILL DATABASE ]-------------------- '
# %x`mysql -uroot -p #{db_name} < db.sql`