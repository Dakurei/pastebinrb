require "test_helper"

class PastebinrbTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Pastebinrb::VERSION
  end

  def test_initialize_pastebin
    refute_nil ::Pastebinrb::Pastebin.new("fake_dev_key")
  end

  def test_expiration_constants
    assert_equal("N", ::Pastebinrb::Expiration::NEVER)
    assert_equal("10M", ::Pastebinrb::Expiration::MINUTE_10)
    assert_equal("1H", ::Pastebinrb::Expiration::HOUR_1)
    assert_equal("1D", ::Pastebinrb::Expiration::DAY_1)
    assert_equal("1W", ::Pastebinrb::Expiration::WEEK_1)
    assert_equal("2W", ::Pastebinrb::Expiration::WEEK_2)
    assert_equal("1M", ::Pastebinrb::Expiration::MONTH_1)
    assert_equal("6M", ::Pastebinrb::Expiration::MONTH_6)
    assert_equal("1Y", ::Pastebinrb::Expiration::YEAR_1)
  end

  def test_error_on_no_content_in_paste_content
    p = ::Pastebinrb::Pastebin.new("fake_dev_key")
    assert_raises do
      p.paste_content
    end
  end

  def test_error_on_content_nil_in_paste_content
    p = ::Pastebinrb::Pastebin.new("fake_dev_key")
    # If api_dev_key is valid, response is "Bad API request, api_paste_code was empty"
    assert_equal("Bad API request, invalid api_dev_key", p.paste_content(nil))
  end

  def test_paste_content
    p = ::Pastebinrb::Pastebin.new("fake_dev_key")
    assert_equal("Bad API request, invalid api_dev_key", p.paste_content("Test"))
  end

  def test_error_on_no_link_get_raw
    p = ::Pastebinrb::Pastebin.new("fake_dev_key")
    assert_raises do
      p.get_raw
    end
  end

  def test_error_on_link_nil_get_raw
    p = ::Pastebinrb::Pastebin.new("fake_dev_key")
    assert_raises do
      p.get_raw(nil)
    end
  end

  def test_error_on_get_raw
    p = ::Pastebinrb::Pastebin.new("fake_dev_key")
    assert_equal("Error with this ID!", p.get_raw(""))
  end

  def test_get_raw
    p = ::Pastebinrb::Pastebin.new("fake_dev_key")
  end

end
