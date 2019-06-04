def prep_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec "TRUNCATE bookmarks;"
  connection.exec "INSERT INTO bookmarks (url)
  VALUES ('http://www.makersacademy.com') , ('http://www.destroyallsoftward.com'), ('http://google.com');"
end