require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'should return long date' do
    date = Time.zone.now
    assert_equal date.strftime("%A %d %B %Y - %H:%M %p"), long_date(date)
    assert_equal 'unknown', medium_date(nil)
  end

  test "should return medium date" do
    date = Time.zone.now
    assert_equal date.strftime("%m/%d/%Y at %H:%M %p"), medium_date(date)
    assert_equal 'unknown', medium_date(nil)
  end

  test "should return medium date 2" do
    date = Time.zone.now
    assert_equal date.strftime("%d %B %Y"), medium_date2(date)
    assert_equal 'unknown', medium_date2(nil)
  end

  test "should return short date" do
    date = Time.zone.now
    assert_equal date.strftime("%Y-%m-%d"), short_date(date)
    assert_equal 'unknown', short_date(nil)
  end

  test "should return US date" do
    date = Time.zone.now
    assert_equal date.strftime("%m/%d/%Y at %H:%M %p"), us_date(date)
    assert_equal 'unknown', us_date(nil)
  end

  test 'should return a header' do
    title = Faker::Lorem.word
    
    assert_dom_equal %{<header><h1>#{title}</h1><hr /></header>}, header(title: title)
  end

  test 'should return a header without a separator' do
    title = Faker::Lorem.word
    
    assert_dom_equal %{<header><h1>#{title}</h1></header>}, header(title: title, separator: false)
  end

  test 'should return a header with links' do
    title = Faker::Lorem.word
    link = link_to "some link", Faker::Internet.url

    assert_dom_equal %{<header><h1>#{title}</h1>#{link}<br /><hr /></header>}, header(title: title, links: [link])
  end

  test 'should return a header with a description' do
    title = Faker::Lorem.word
    description = Faker::Lorem.paragraph
    
    assert_dom_equal "<header><h1>#{title}</h1><hr />      <p class=\"jumbotron\">\n        #{description}\n      </p>\n</header>", header(title: title, description: description)
  end

  test 'should return a sub header' do
    skip
    title = Faker::Lorem.word
    
    assert_dom_equal %{<h4>#{title}</h4>
<hr>
}, sub_header(title: title)
  end

  test 'should return a sub header with links' do
    skip
    title = Faker::Lorem.word
    link = link_to "some link", Faker::Internet.url

    assert_dom_equal %{<h4>#{title}</h4>
#{link}
<hr>
}, sub_header(title: title, links: [link])
  end

  test 'should return a sub header without a separator' do
    skip
    title = Faker::Lorem.word
    
    assert_dom_equal %{<h4>#{title}</h4>
}, sub_header(title: title, separator: false)
  end

  test "should return a sub header with a description" do
    skip
    title = Faker::Lorem.word
    description = Faker::Lorem.paragraph
    
    assert_dom_equal %{<h4>#{title}</h4>
<hr>
<p class='jumbotron'>
#{description}
</p>
}, sub_header(title: title, description: description)
  end

  test "should return pagination without extra info" do
    skip
  end

  test "should return pagination with a different class" do
    skip
  end
end