# COMMANDOES-VIRTUS

A plugin for the [commandoes](http://github.com/mdelkins/commandoes) library.
This plugin adds `Virtus.value_object` to your commandoes commands.

## PREREQUISITES
* ruby-2.4.0

## INSTALLATION

In your Gemfile

```
gem 'commandoes-virtus'
```

## EXAMPLES

```ruby
class FooCommand < Commandoes::IAmACommand
  use Commandoes::Plugins::VirtusPlugin

  values do
    string   :foo
    integer  :bar
    datetime :created_at
  end
end
```
