require 'list'

describe List do
  before(:each) {
    con = PG.connect :dbname => 'bookmark_manager_test'
    con.exec "INSERT INTO bookmarks(url) VALUES ('testurl1'), ('testurl2');"
   }
  it 'should return Ask Jeeves' do
    expect(List.all).to include ('testurl1')
    expect(List.all).to include ('testurl2')
  end
end