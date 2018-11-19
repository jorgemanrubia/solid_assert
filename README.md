# solid_assert

[![Build Status](https://travis-ci.org/jorgemanrubia/solid_assert.svg?branch=master)](https://travis-ci.org/jorgemanrubia/solid_assert)

*solid_assert* is a simple implementation of an `assert` utility in Ruby. It lets you write tests for your assumptions while coding.

Assertions are meant to test conditions about the integrity of your code. You should use them for testing assumptions like the following:

- If the flow reaches here, then this variable has to have this value.
- This line of code should never be executed.
- At this point, this list should contain one entry for each key in this hash.

# Installation

Add to your `Gemfile`:

```ruby
gem "solid_assert"
```

# Usage

You can enable/disable assertions with:

```ruby
SolidAssert.enable_assertions
SolidAssert.disable_assertions
```

Assertions are disabled by default and are typically used in development mode only. You might want to disable them in production for performance reasons.

Use `assert` for testing conditions. You can optionally provide an error message.

```ruby
assert some_string != "unexpected value"
assert user.authenticated?

assert apples_count > 5, "Not enough apples!"
assert !clients.empty?, "The list must NOT be empty!"
```

Use `invariant` for testing blocks of code. This comes handy
when testing your assumptions requires several lines of code.
You can provide an optional message too.

```ruby
invariant do
  one_variable = calculate_some_value
  other_variable = calculate_some_other_value
  one_variable > other_variable
end
```

```ruby
invariant "Lists must have equal sizes!" do
  len = calculate_list_length
  other_len = calculate_other_list_length
  len == other_len
end
```

### Assertion Error

Failed assertion will raise `SolidAssert::AssertionFailedError` error. You shouldn't catch it in a `rescue` block! If it raised then something is wrong with either your code or with you assumption. *Assertions shouldn't be used for handling error situations!* Use Ruby built-in exception handling for that.

## Rails

Create a file named `solid_assert.rb` in the `config/initializers` dir with the following content:

```ruby
SolidAssert.enable_assertions unless Rails.env.production?
```

This way assertions will be disabled in production and enabled in the rest of environments.

## References

- [Programming with assertions](https://docs.oracle.com/javase/8/docs/technotes/guides/language/assert.html). A great article on assertions. It is about the Java language, but the concepts apply to any programming language.
- There are good references to assertive programming in some classic books like [The Pragmatic Programmer From Journeyman to Master](http://www.amazon.com/exec/obidos/ASIN/020161622X/ref=nosim/jorgmanrpersp-20), [Code Complete](http://www.amazon.com/exec/obidos/ASIN/0735619670/ref=nosim/jorgmanrpersp-20) and [Writing solid code](http://www.amazon.com/exec/obidos/ASIN/1556155514/ref=nosim/jorgmanrpersp-20)
