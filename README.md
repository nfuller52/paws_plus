# PawsPlus

## Development

1. start the mailcatcher gem for intercepting emails

  ```sh
  $ mailcatcher
  ==> smtp://127.0.0.1:1025
  ==> http://127.0.0.1:1080
  *** MailCatcher runs as a daemon by default. Go to the web interface to quit.
  ```

2. create the database, run the migrations and seed the db with sample data

  ```sh
  $ bin/rake db:rebuild
  ```
