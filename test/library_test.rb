require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test

  def test_it_exists
    dpl = Library.new

    assert_instance_of Library, dpl
  end

  def test_books_starts_empty
    dpl = Library.new

    assert_equal [], dpl.books
  end

  def test_you_can_add_a_book
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    dpl.add_to_collection(fifth_season)
    assert_equal [fifth_season].flatten.uniq, dpl.books

    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)
    expected = [fifth_season, mockingbird, kingdoms].flatten.uniq

    assert_equal expected, dpl.books
  end

  def test_library_includes_books
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    assert_equal true, dpl.include?("To Kill a Mockingbird")
    assert_equal false, dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_sort_books_by_author_last_name
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    expected = [fifth_season, kingdoms, mockingbird]

    assert_equal expected, dpl.card_catalogue
  end

  def test_group_books_by_author
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    assert_equal [fifth_season, kingdoms], dpl.group_books_by_author("N.K. Jemisin")
  end

  def test_find_books_by_author
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    expected = {
      "The Fifth Season" => fifth_season,
      "The Hundred Thousand Kingdoms" => kingdoms
    }
    assert_equal expected, dpl.find_by_author("N.K. Jemisin")
  end

  def test_group_books_by_publication_date
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    assert_equal [mockingbird], dpl.group_books_by_publication_date("1960")
  end

  def test_find_books_by_publication_date
    dpl = Library.new
    nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    fifth_season = nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    kingdoms = nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    dpl.add_to_collection(fifth_season)
    dpl.add_to_collection(mockingbird)
    dpl.add_to_collection(kingdoms)

    expected = {
      "To Kill a Mockingbird" => mockingbird
    }

    assert_equal expected, dpl.find_by_publication_date("1960")
  end
end
