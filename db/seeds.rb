=begin
4.times do |i|
  room = Room.create!(

  )

  room.images.attach(io: File.open(Rails.root.join("db", "sample", "images", "room_#{i+1}.jpg")), filename: room.name)
end=end
