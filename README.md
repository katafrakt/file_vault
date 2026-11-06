# File Vault

This is a demo app for running [Hanami](https://hanakai.org/hanami) application on [JRuby](https://www.jruby.org/). Functionally, it's a simple "file vault", where you upload the files from the disk and then [Apache Tika](https://tika.apache.org/) extracts metadata and text from them. Then it allows to search the files by filename, author, title or extracted text.

## Set up

### Install Java dependencies

```sh
gem install ruby-maven
rmvn dependency:copy-dependencies -DoutputDirectory=vendor/jars
```

### Start the application

``` sh
bundle install
bin/dev
```

## Areas covered

### Framework

- [x] Actions
- [x] Operations
- [x] Connecting and managing SQLite3 database
- [x] Repositories and relations
- [ ] Slices
- [x] Assets
- [x] Providers
- [x] RSpec tests
- [ ] Minitest tests

### Extras

- [x] Interfacing with a JVM-specific dependency
- [x] File uploads using [Shrine](https://shrinerb.com/)
- [ ] End-to-end testing with Playwright

### Process

- [x] Development flow
- [x] Generators
- [ ] Production release
- [ ] CI

