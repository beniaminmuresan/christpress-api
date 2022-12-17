# frozen_string_literal: true

desc 'Import all bible books, chapters & verses'

task import_bible_references: :environment do
  require 'csv'

  filename = 'lib/assets/bible_references/references.csv'
  parsed_csv = CSV.parse(File.open(filename), headers: true)
  verse_references_params = parsed_csv.map { |line_csv| { verse_id: line_csv['VerseID'], reference_verse_id: line_csv['VerseRefID'] } }
  number = 0
  verse_references_params.in_groups_of(10_000, false) do |group|
    VerseReferenceVerse.insert_all(group)
    number += group.count
    puts "Imported #{number} references"
  end
end
