# COMMANDOS-VIRTUS

A plugin for the [commandos](http://github.com/mdelkins/commandos) library.
This plugin adds `Virtus.value_object` to your commandos commands.

## PREREQUISITES
* ruby-2.4.0

## INSTALLATION

In your Gemfile

```
gem 'commandos-virtus'
```

## EXAMPLES

```ruby
class FooCommand < Commandos::IAmACommand
  use Commandos::Plugins::VirtusPlugin

  values do
    string   :foo
    integer  :bar
    datetime :created_at
  end
end
```
