require 'minitest/autorun'
require 'email_builder'

describe EmailBuilder do

  NO_FIRST = {
    middle: "Joseph",
    last:   "Jackson",
  }

  it "parses `first` format" do
    format = EmailBuilder.parse("michael@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `last` format" do
    format = EmailBuilder.parse("jackson@example.org", NO_FIRST)
    assert_equal "last", format
  end

  it "parses `fl` format" do
    format = EmailBuilder.parse("mj@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `flast` format" do
    format = EmailBuilder.parse("mjackson@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `fmlast` format" do
    format = EmailBuilder.parse("mjjackson@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `first.last` format" do
    format = EmailBuilder.parse("michael.jackson@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `f.last` format" do
    format = EmailBuilder.parse("m.jackson@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `first.m.last` format" do
    format = EmailBuilder.parse("michael.j.jackson@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `first_last` format" do
    format = EmailBuilder.parse("michael_jackson@example.org", NO_FIRST)
    assert_nil format
  end

  it "parses `first_m_last` format" do
    format = EmailBuilder.parse("michael_j_jackson@example.org", NO_FIRST)
    assert_nil format
  end

end
