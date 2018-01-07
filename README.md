# Linter.tmbundle
Provides Linting functionality to TextMate to make it easier to write better quality code.

## Features
- Linting on request of Bash, JSON, Markdown and Ruby files
- Strips trailing whitespace on request from the end of lines (except after Ruby `__END__` blocks)
- Adds trailing newlines on request to the end of files missing them
- If set in `.tm_properties`'s [`scopeProperties`](https://gist.github.com/dvessel/1478685#other) (space separated, set either globally or for a given language like `[ source.ruby ]`):
  - `attr.linter.lint-on-save` automatically runs Linter on save for supported file types
  - `attr.linter.strip-whitespace-on-save` automatically strips trailing whitespace on save
  - `attr.linter.ensure-newline-on-save` automatically adds a training newline on save
  - `attr.linter.fix-on-save` automatically fixes lints if possible (e.g. with RuboCop).

## Installation

```bash
mkdir -p ~/Library/Application\ Support/TextMate/Bundles
cd ~/Library/Application\ Support/TextMate/Bundles
git clone https://github.com/MikeMcQuaid/Linter.tmbundle
```

## Status
The above features work for my day-to-day use.

Tested using TextMate 2. May work in TextMate 1 or Sublime Text; I've no idea.

[Patches welcome](https://github.com/MikeMcQuaid/Linter.tmbundle/pulls).

## Maintainers
[@MikeMcQuaid](https://github.com/MikeMcQuaid)

## License
Linter.tmbundle is under the [MIT License](http://en.wikipedia.org/wiki/MIT_License). The full license text is
available in
[LICENSE.txt](https://github.com/MikeMcQuaid/Linter.tmbundle/blob/master/LICENSE.txt).
