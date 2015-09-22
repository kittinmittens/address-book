require_relative '../models/address_book'

RSpec.describe AddressBook do
# #1
  let(:book) { AddressBook.new }

# #2
describe "attributes" do
  it "should respond to entries" do
    book = AddressBook.new
    expect(book).to respond_to(:entries)
  end

  it "should initialize entries as an array" do
    book = AddressBook.new
    expect(book.entries).to be_a(Array)
  end

  it "should initialize entries as empty" do
    book = AddressBook.new
    expect(book.entries.size).to eq 0
  end
end

describe "#add_entry" do
  it "adds only one entry to the address book" do
    book = AddressBook.new
    book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

    expect(book.entries.size).to eq 1
  end

  it "adds the correct information to entries" do
    book = AddressBook.new
    book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
    new_entry = book.entries[0]

    expect(new_entry.name).to eq 'Ada Lovelace'
    expect(new_entry.phone_number).to eq '010.012.1815'
    expect(new_entry.email).to eq 'augusta.king@lovelace.com'
  end
end

  # Test that AddressBook's .import_from_csv() method is working as expected
  describe "#import_from_csv" do
    it "imports the correct number of entries" do
# #3
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      # Check the size of the entries in AddressBook
      expect(book_size).to eql 5
    end

  end
end
