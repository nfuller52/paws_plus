# PawsPlus

## Development

1. Intercept emails with the [mailcatcher](http://mailcatcher.me/) gem

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

  ##### Basic usage of the [Table Print](https://github.com/arches/table_print) gem

  ###### Get everything

  ```ruby
  tp Garbage.all
  ```
  Will output the following table

  ```
  ID | NAME | SIZE | STINK | CREATED_AT              | UPDATED_AT
  ---|------|------|-------|-------------------------|------------------------
  1  | 1    | 0    | 5     | 2015-11-28 21:39:52     | 2015-11-28 21:39:52
  2  | 2    | 0    | 2     | 2015-11-28 21:39:52     | 2015-11-28 21:39:52
  3  | 3    | 0    | 4     | 2015-11-28 21:39:52     | 2015-11-28 21:39:52
  4  | 4    | 0    | 8     | 2015-11-28 21:39:52     | 2015-11-28 21:39:52
  ```

  ###### Specify fields (this *does* include method names)

  ```ruby
  tp Garbage.all, "id", "name", "stinkiness"
  ```

  Will output the following table

  ```
  ID | NAME | STINKINESS
  ---|------|-------------------------------
  1  | 1    | Take it out already!
  2  | 2    | Annoying.
  3  | 3    | Oh God, what is in there?
  4  | 4    | I just threw up in my mouth.
  5  | 5    | Is that baby poop or someth...
  6  | 6    | Get it away from me.
  7  | 7    | I feel nauseated.
  ```
