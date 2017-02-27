require 'test_helper'

module Commandos
  class IAmACommandTest < Minitest::Test
    class WhenUsingHelper < IAmACommandTest
      class FakeCommand < IAmACommand
        use Commandos::Plugins::VirtusPlugin

        values do
          bool     :bool
          date     :date
          datetime :datetime
          decimal  :decimal
          float    :float
          integer  :integer
          string   :string
          time     :time
        end
      end

      def subject
        FakeCommand
      end

      class AndValueIsTruthy < WhenUsingHelper
        def test_value_is_true
          assert_equal true, subject.new(bool: true).bool
          assert_equal true, subject.new(bool: "true").bool
          assert_equal true, subject.new(bool: "1").bool
        end
      end

      class AndValueIsFalsey < WhenUsingHelper
        def test_value_is_false
          assert_equal false, subject.new(bool: false).bool
          assert_equal false, subject.new(bool: "false").bool
          assert_equal false, subject.new(bool: "0").bool
        end
      end

      class AndValueIsNotCastableToATrueOrFalseValue < WhenUsingHelper
        def sut
          @sut ||= subject.new bool: :abc
        end

        def test_value_is_not_true_or_false
          refute_equal true,  sut.bool
          refute_equal false, sut.bool
          assert_equal :abc,  sut.bool
        end
      end

      class AndValueIsCastableToADate < WhenUsingHelper
        def sut
          @sut ||= subject.new date: "2010-01-04 05:00:14 PM"
        end

        def test_value_is_a_date
          assert_kind_of Date, sut.date
          assert_equal   Date.parse("2010-01-04"), sut.date
        end
      end

      class AndValueIsNotCastableToADate < WhenUsingHelper
        def sut
          @sut ||= subject.new date: :abc
        end

        def test_value_is_not_a_date
          refute_kind_of Date, sut.date
          assert_equal   :abc, sut.date
        end
      end

      class AndValueIsCastableToADateTime < WhenUsingHelper
        def sut
          @sut ||= subject.new datetime: "2010-01-04 05:00:14 PM"
        end

        def test_value_is_a_datetime
          assert_kind_of DateTime, sut.datetime
          assert_equal   DateTime.parse("2010-01-04 05:00:14 PM"), sut.datetime
        end
      end

      class AndValueIsNotCastableToADateTime < WhenUsingHelper
        def sut
          @sut ||= subject.new datetime: :abc
        end

        def test_value_is_not_a_datetime
          refute_kind_of DateTime, sut.datetime
          assert_equal   :abc,     sut.datetime
        end
      end

      class AndValueIsADecimal < WhenUsingHelper
        def sut
          @sut ||= subject.new decimal: "143.123"
        end

        def test_value_is_a_decimal
          assert_kind_of BigDecimal, sut.decimal
          assert_equal   BigDecimal('143.123'), sut.decimal
        end
      end

      class AndValueIsNotADecimal < WhenUsingHelper
        def sut
          @sut ||= subject.new decimal: :abc
        end

        def test_value_is_not_a_decimal
          refute_kind_of BigDecimal, sut.decimal
          assert_equal   :abc,       sut.decimal
        end
      end

      class AndValueIsAFloat < WhenUsingHelper
        def sut
          @sut ||= subject.new float: "143.123"
        end

        def test_value_is_a_float
          assert_kind_of Float, sut.float
          assert_equal   Float('143.123'), sut.float
        end
      end

      class AndValueIsNotAFloat < WhenUsingHelper
        def sut
          @sut ||= subject.new float: :abc
        end

        def test_value_is_not_a_float
          refute_kind_of Float, sut.float
          assert_equal   :abc,  sut.float
        end
      end

      class WhenValueIsCastableToAnInteger < WhenUsingHelper
        def sut
          @sut ||= subject.new integer: "143.123"
        end

        def test_value_is_a_number
          assert_kind_of Integer, sut.integer
          assert_equal   143,     sut.integer
        end
      end

      class WhenValueIsNotCastableToAnInteger < WhenUsingHelper
        def sut
          @sut ||= subject.new integer: :abc
        end

        def test_value_is_not_a_number
          refute_kind_of Integer, sut.integer
          assert_equal   :abc,  sut.integer
        end
      end

      class AndValueIsCastableToAString < WhenUsingHelper
        def sut
          @sut ||= subject.new string: :abc
        end

        def test_value_is_not_a_number
          assert_kind_of String, sut.string
          assert_equal   "abc",  sut.string
        end
      end

      class AndValueIsCastableToTime < WhenUsingHelper
        def sut
          @sut ||= subject.new time: "2010-01-04 05:00:14 PM"
        end

        def test_value_is_a_time
          assert_kind_of Time, sut.time
          assert_equal   Time.parse("2010-01-04 05:00:14 PM"), sut.time
        end
      end

      class AndValueIsNotCastableToTime < WhenUsingHelper
        def sut
          @sut ||= subject.new time: :abc
        end

        def test_value_is_not_a_time
          refute_kind_of Time, sut.time
          assert_equal   :abc, sut.time
        end
      end
    end
  end
end
