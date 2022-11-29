require 'smarter_csv'

desc "Import all bible books, chapters & verses"

task import_bible: :environment do
  bible_book_names = [
    { number: 1, abbrev: "GEN", name: "Geneza" },
    { number: 2, abbrev: "EXO", name: "Exodul" },
    { number: 3, abbrev: "LEV", name: "Leviticul" },
    { number: 4, abbrev: "NUM", name: "Numeri" },
    { number: 5, abbrev: "DEU", name: "Deuteronomul" },
    { number: 6, abbrev: "JOS", name: "Iosua" },
    { number: 7, abbrev: "JDG", name: "Judecatorii" },
    { number: 8, abbrev: "RUT", name: "Rut" },
    { number: 9, abbrev: "1SA", name: "1 Samuel" },
    { number: 10, abbrev: "2SA", name: "2 Samuel" },
    { number: 11, abbrev: "1KI", name: "1 Imparati" },
    { number: 12, abbrev: "2KI", name: "2 Imparati" },
    { number: 13, abbrev: "1CH", name: "1 Cronici" },
    { number: 14, abbrev: "2CH", name: "2 Cronici" },
    { number: 15, abbrev: "EZR", name: "Ezra" },
    { number: 16, abbrev: "NEH", name: "Neemia" },
    { number: 17, abbrev: "EST", name: "Estera" },
    { number: 18, abbrev: "JOB", name: "Iov" },
    { number: 19, abbrev: "PSA", name: "Psalmii" },
    { number: 20, abbrev: "PRO", name: "Proverbele" },
    { number: 21, abbrev: "ECC", name: "Eclesiastul" },
    { number: 22, abbrev: "SOS", name: "Cantarea cantarilor" },
    { number: 23, abbrev: "ISA", name: "Isaia" },
    { number: 24, abbrev: "JER", name: "Ieremia" },
    { number: 25, abbrev: "LAM", name: "Plangerile lui Ieremia" },
    { number: 26, abbrev: "EZE", name: "Ezechiel" },
    { number: 27, abbrev: "DAN", name: "Daniel" },
    { number: 28, abbrev: "HOS", name: "Osea" },
    { number: 29, abbrev: "JOE", name: "Ioel" },
    { number: 30, abbrev: "AMO", name: "Amos" },
    { number: 31, abbrev: "OBA", name: "Obadia" },
    { number: 32, abbrev: "JON", name: "Iona" },
    { number: 33, abbrev: "MIC", name: "Mica" },
    { number: 34, abbrev: "NAH", name: "Naum" },
    { number: 35, abbrev: "HAB", name: "Habacuc" },
    { number: 36, abbrev: "ZEP", name: "Tefania" },
    { number: 37, abbrev: "HAG", name: "Hagai" },
    { number: 38, abbrev: "ZEC", name: "Zaharia" },
    { number: 39, abbrev: "MAL", name: "Maleahi" },
    { number: 40, abbrev: "MAT", name: "Matei" },
    { number: 41, abbrev: "MAR", name: "Marcu" },
    { number: 42, abbrev: "LUK", name: "Luca" },
    { number: 43, abbrev: "JOH", name: "Ioan" },
    { number: 44, abbrev: "ACT", name: "Faptele apostolilor" },
    { number: 45, abbrev: "ROM", name: "Romani" },
    { number: 46, abbrev: "1CO", name: "1 Corinteni" },
    { number: 47, abbrev: "2CO", name: "2 Corinteni" },
    { number: 48, abbrev: "GAL", name: "Galateni" },
    { number: 49, abbrev: "EPH", name: "Efeseni" },
    { number: 50, abbrev: "PHP", name: "Filipeni" },
    { number: 51, abbrev: "COL", name: "Coloseni" },
    { number: 52, abbrev: "1TH", name: "1 Tesaloniceni" },
    { number: 53, abbrev: "2TH", name: "2 Tesaloniceni" },
    { number: 54, abbrev: "1TI", name: "1 Timotei" },
    { number: 55, abbrev: "2TI", name: "2 Timotei" },
    { number: 56, abbrev: "TIT", name: "Tit" },
    { number: 57, abbrev: "PHM", name: "Filimon" },
    { number: 58, abbrev: "HEB", name: "Evrei" },
    { number: 59, abbrev: "JAM", name: "Iacov" },
    { number: 60, abbrev: "1PE", name: "1 Petru" },
    { number: 61, abbrev: "2PE", name: "2 Petru" },
    { number: 62, abbrev: "1JO", name: "1 Ioan" },
    { number: 63, abbrev: "2JO", name: "2 Ioan" },
    { number: 64, abbrev: "3JO", name: "3 Ioan" },
    { number: 65, abbrev: "JDE", name: "Iuda" },
    { number: 66, abbrev: "REV", name: "Apocalipsa" }
  ]

  bible_book_names.each do |book_params|
    Book.find_or_create_by(book_params)
  end

  filename = 'lib/assets/bible_translations/cornilescu.csv'
  verses = SmarterCSV.process(filename)
  verses.group_by { |verse| verse[:bookname] }.each do |book_name, first_group|
    puts "------ Start importing book: #{book_name} ------"
    book = Book.find_by_name(book_name)
    group_by_chapter_number = first_group.group_by { |verse| verse[:chapternumber] }
    chapter_params = group_by_chapter_number.keys.map { |chapter_number| { number: chapter_number, book_id: book.id  } }
    chapters_result = Chapter.insert_all(chapter_params, returning: %w[id])
    group_by_chapter_number.each do |chapter_number, second_group|
      chapter_id = chapters_result[chapter_number.to_i - 1]['id']
      verses_params = second_group.map { |params| { chapter_id:, number: params[:versenumber], value: params[:versetext] } }
      Verse.insert_all(verses_params)
    end
    puts "------ Finished importing book: #{book.name} ------"
  end
end