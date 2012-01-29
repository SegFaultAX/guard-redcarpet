# Guard::Redcarpet

[Guard](https://github.com/guard/guard) extension for Markdown using the
[Redcarpet](https://github.com/tanoku/redcarpet) gem. There is an existing
[guard-markdown](https://github.com/darwalenator/guard-markdown) gem, but it
uses Kramdown.

## Install

This gem is an extension of Guard.

Installation (command-line):

    gem install guard-redcarpet

Or via your Gemfile:

    gem 'guard-redcarpet'

Add the template to your Guardfile:

    guard init redcarpet

## Options

You should familiarize yourself with the Redcarpet documentation before
exploring some of the advanced features of this gem.

### Output directory

The default Guard template watches for .html.md and .html.markdown files:

    guard 'redcarpet' do
      watch(/^.+(\.html\.markdown)$/)
      watch(/^.+(\.html\.md)$/)
    end

You can override the output directory with the `output` option:

    guard 'redcarpet', :output => 'compiled' do
      watch(/^.+(\.html\.markdown)$/)
      watch(/^.+(\.html\.md)$/)
    end

### Markdown and Render options

Options for the `Redcarpet::Markdown` and `Redcarpet::Render::HTML` objects can be
provided via the `markdown_options` and `render_options` options respectively.

    guard 'redcarpet', :markdown_options => { :strikethrough => true } do
      watch(/^.+(\.html\.markdown)$/)
      watch(/^.+(\.html\.md)$/)
    end


    guard 'redcarpet', :render_options => { :no_links => true } do
      watch(/^.+(\.html\.markdown)$/)
      watch(/^.+(\.html\.md)$/)
    end

Consult the Redcarpet 2.0 documentation for details.

## Special Thanks

Much of the code for this gem was a direct port of the [guard-haml
gem](https://github.com/manufaktor/guard-haml) by [Immanuel
Häussermann](https://github.com/manufaktor)

## Contribute

* Hosted on [Github:
  guard-redcarpet](https://github.com/SegFaultAX/guard-redcarpet)
* Report issues, questions, or comments to the [issue
  tracker](https://github.com/SegFaultAX/guard-redcarpet/issues)

## License

Copyright (c) 2011 Michael-Keith Bernard

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
