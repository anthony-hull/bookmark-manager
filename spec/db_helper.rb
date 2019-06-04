def prep_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec "TRUNCATE bookmarks RESTART IDENTITY CASCADE;"
  connection.exec "INSERT INTO bookmarks (url,title)
  VALUES ('http://www.makersacademy.com','Makers Academy') , ('http://www.destroyallsoftward.com', 'Destroy'), ('http://google.com', 'Google');"
end