# frozen_string_literal: true

desc 'Import all bible books, chapters & verses'

task import_songs: :environment do
  filenames = Dir.entries('lib/assets/songs/').drop(2)
  filenames.each do |filename|
    xml = File.open("lib/assets/songs/#{filename}")
    hash_song = Hash.from_xml(xml)
    song = Song.create(name: hash_song['song']['title'])
    songs_data = hash_song['song']['lyrics'].split("\n").split { |el| el == '' }.reject(&:empty?).map { |el| el.map(&:strip) }
    songs_data.each do |song_data|
      song_part_name = song_data.first
      song_part = SongPart.create(name: song_part_name, song_id: song.id)
      song_line_values = song_data.drop(1)
      song_line_values.each do |song_line_value|
        SongLine.create(value: song_line_value, song_part_id: song_part.id)
      end
    end
  end
end
