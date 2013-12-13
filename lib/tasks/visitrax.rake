require 'csv'

namespace :visitrax do 
  desc "Import visitrax CSV data"
  task :import => :environment do
    csv_text = File.read("#{Rails.root}/lib/tracks.csv")
    csv = CSV.parse(csv_text, headers: true)

    # speed up search/creation
    categories = {}
    artists = {}
    volumes = {}
    
    #{"ARTIST"=>"? & THE MYSTERIONS", "TRACK_TITLE"=>"NINETY SIX TEARS", "CATEGORY"=>"OLDIES", "YEAR"=>"2002","NO."=>"19", "INDEX"=>"CD0475", "LOCATION"=>"CD0475-19", "VOLUME_ARTIST"=>"VARIOUS", "VOLUME_TITLE"=>"STEVE'S MIX #11"}
    csv.each do |row|
      row = row.to_hash.with_indifferent_access
      # check category
      cat = lookup_or_create({name: (row["CATEGORY"] || "").titlecase}, Category, categories)
      categories[cat.name] ||= cat

      # check artists - track and volume
      art = lookup_or_create({name: row["ARTIST"]}, Artist, artists)
      artists[art.name] ||= art
      
      vol_art = (row["ARTIST"] == row["VOLUME_ARTIST"]) && art || lookup_or_create({name: row["VOLUME_ARTIST"]}, Artist, artists)
      artists[vol_art.name] ||= vol_art
      
      # check volume
      puts "VOLUME cat is #{cat} and #{cat.id}"
      vol = lookup_or_create({name: row["VOLUME_TITLE"], location: row["INDEX"], year: row["YEAR"], category_id: cat.id, artist_id: vol_art.id}, Volume, volumes)
      volumes[vol.name] ||= vol
      
      # now create track
      # attr_accessible :artist_id, :category_id, :index, :title, :volume_id
      track = lookup_or_create({name: row["TRACK_TITLE"], category_id: cat.id, artist_id: art.id, volume_id: vol.id, index: row["NO."].to_i}, Track)
      
    end
  end
  
  def lookup_or_create(attrs, klass, store={})
    puts "going to create #{klass.to_s} with #{attrs.inspect}"
    return if attrs[:name].blank?
    obj = store[attrs[:name]] || klass.create(attrs)
  end
  
end