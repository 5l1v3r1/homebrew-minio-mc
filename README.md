homebrew-minio-mc
===============
[![Build Status](https://travis-ci.org/dutchcoders/homebrew-minio-mc.svg?branch=master)](https://travis-ci.org/dutchcoders/homebrew-minio-mc)

Homebrew formula for minio-mc.

## Usage

```bash
$ brew tap dutchcoders/homebrew-minio-mc
$ brew install minio-mc
```

## Troubleshooting

* Make sure you're using the right formula.  `brew info minio-mc` should have a
  From line similar to this:

  ```text
  From: https://github.com/dutchcoders/homebrew-minio-mc/blob/master/Formula/minio-mc.rb
  ```

  If your formula points elsewhere, then you need to retap the minio-mc formula.
  Do so with the following sequence of commands:

  ```text
  brew uninstall minio-mc --force
  brew prune
  brew tap dutchcoders/homebrew-minio-mc
  brew tap --repair
  brew install minio-mc
  ```
* Run `brew update` — then try again.
* Run `brew doctor` — the doctor diagnoses common issues.
* You can create a gist log with `brew gist-logs minio-mc`.
* Use `--verbose` to get the verbose output, i.e. `brew install --verbose minio-mc`.
* Use `--debug` to be in the debug mode. In the debug mode, when failing, you
  can go into the interactive shell to check the building files before homebrew
  neutralizing them.
