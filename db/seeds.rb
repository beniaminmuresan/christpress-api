bible_book_names = [
  { number: 1, name: "Geneza" },
  { number: 2, name: "Exod" },
  { number: 3, name: "Leviticul" },
  { number: 4, name: "Numeri" },
  { number: 5, name: "Deuteronomul" },
  { number: 6, name: "Iosua" },
  { number: 7, name: "Judecatorii" },
  { number: 8, name: "Rut" },
  { number: 9, name: "1 Samuel" },
  { number: 10, name: "2 Samuel" },
  { number: 11, name: "1 Imparati" },
  { number: 12, name: "2 Imparati" },
  { number: 13, name: "1 Cronici" },
  { number: 14, name: "2 Cronici" },
  { number: 15, name: "Ezra" },
  { number: 16, name: "Neemia" },
  { number: 17, name: "Estera" },
  { number: 18, name: "Iov" },
  { number: 19, name: "Psalmii" },
  { number: 20, name: "Proverbe" },
  { number: 21, name: "Eclesiastul" },
  { number: 22, name: "Cantarea Cantarilor" },
  { number: 23, name: "Isaia" },
  { number: 24, name: "Ieremia" },
  { number: 25, name: "Plangerile lui Ieremia" },
  { number: 26, name: "Ezechiel" },
  { number: 27, name: "Daniel" },
  { number: 28, name: "Osea" },
  { number: 29, name: "Ioel" },
  { number: 30, name: "Amos" },
  { number: 31, name: "Obadia" },
  { number: 32, name: "Iona" },
  { number: 33, name: "Mica" },
  { number: 34, name: "Naum" },
  { number: 35, name: "Habacuc" },
  { number: 36, name: "Tefania" },
  { number: 37, name: "Hagai" },
  { number: 38, name: "Zaharia" },
  { number: 39, name: "Maleahi" },
  { number: 40, name: "Matei" },
  { number: 41, name: "Marcu" },
  { number: 42, name: "Luca" },
  { number: 43, name: "Ioan" },
  { number: 44, name: "Faptele Apostolilor" },
  { number: 45, name: "Romani" },
  { number: 46, name: "1 Corinteni" },
  { number: 47, name: "2 Corinteni" },
  { number: 48, name: "Galateni" },
  { number: 49, name: "Efeseni" },
  { number: 50, name: "Filipeni" },
  { number: 51, name: "Coloseni" },
  { number: 52, name: "1 Tesaloniceni" },
  { number: 53, name: "2 Tesaloniceni" },
  { number: 54, name: "1 Timotei" },
  { number: 55, name: "2 Timotei" },
  { number: 56, name: "Tit" },
  { number: 57, name: "Filimon" },
  { number: 58, name: "Evrei" },
  { number: 59, name: "Iacov" },
  { number: 60, name: "1 Petru" },
  { number: 61, name: "2 Petru" },
  { number: 62, name: "1 Ioan" },
  { number: 63, name: "2 Ioan" },
  { number: 64, name: "3 Ioan" },
  { number: 65, name: "Iuda" },
  { number: 66, name: "Apocalipsa" }
]

bible_book_names.each do |book_params|
  Book.find_or_create_by(book_params)
end

file = File.read('lib/tasks/assets/cornilescu.json')
all_books = JSON.parse(file)

all_books.each_with_index do |book_data, book_index|
  chapters = book_data['chapters']
  book_number = book_index + 1
  book = Book.find_by(number: book_number)
  chapters.each_with_index do |chapter_data, chapter_index|
    chapter_number = chapter_index + 1
    chapter = Chapter.create(number: chapter_number, book_id: book.id)
    chapter_data.each_with_index do |verse_value, verse_index|
      verse_number = verse_index + 1
      Verse.create(number: verse_number, value: verse_value, chapter_id: chapter.id)
    end
  end
end