desc "Import all bible books, chapters & verses"

task import_bible_references: :environment do
  require 'csv'

  filename = 'lib/assets/bible_references/references.csv'
  parsed_csv = CSV.parse(File.open(filename), headers: true)
  verse_references_params = parsed_csv.map { |line_csv| { verse_id: line_csv['VerseID'], reference_verse_id: line_csv['VerseRefID'] } }
  VerseReferenceVerse.insert_all(verse_references_params)
end