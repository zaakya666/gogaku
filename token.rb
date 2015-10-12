
require "google_drive"

client = Google::APIClient.new
auth = client.authorization
auth.client_id = "417942958930-m6qcfqumabrl0v0kh4ilv0p0fjn53o2l.apps.googleusercontent.com" # 「クライアントID」の文字列
auth.client_secret = "IvMkjEg31ay_uZfYX0wtBBox" # 「クライアントシークレット」の文字列
auth.scope = "https://www.googleapis.com/auth/drive "
auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
print("2. Enter the authorization code shown in the page: ")
auth.code = $stdin.gets.chomp
auth.fetch_access_token!
access_token = auth.access_token
refresh_token = auth.refresh_token

session = GoogleDrive.login_with_oauth(access_token)

puts "your access_token is:\n#{access_token}"
puts "----"

puts "your refresh_token is:\n#{refresh_token}"
puts "----"

session.files.each do |file|
  puts file.title
end
puts "----"

puts "done!"