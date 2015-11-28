# PawsPlus

## Development

1. Intercepting emails with mailcatcher

  ```sh
  $ mailcatcher
  ==> smtp://127.0.0.1:1025
  ==> http://127.0.0.1:1080
  *** MailCatcher runs as a daemon by default. Go to the web interface to quit.
  ```

2. Initialize your database

  ```sh
  $ bin/rake db:build
  ```

3. Rebuild your database as needed in development mode

  ```sh
  $ bin/rake db:rebuild
  ```

4. Using the [Table Print](https://github.com/arches/table_print) gem

  Some examples of using the table print gem

  ```ruby
  tp Model.all
  ```

  ```ruby
  tp Model.all, "id", "name", "created_at"
  ```

  Table print allows you to use methods on the object as well
