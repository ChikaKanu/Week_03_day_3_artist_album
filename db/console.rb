require('pry')
require_relative('../models/album')
require_relative('../models/artist')

Artist.delete_all()
Album.delete_all()

  artist_1 = Artist.new({
  'name' => 'Abi'
  })
  artist_2 = Artist.new({
  'name' => 'Chika'
  })

  artist_1.save()

  album1 = Album.new({
    'title' => '7 Dreams',
    'genre' => 'heavy metal',
    'artist_id' => artist_1.id
    })


  album2 = Album.new({
    'title' => 'Gentle',
    'genre' => 'Pop',
    'artist_id' => artist_2.id
    })


  album1.save()
  album2.save()

  artist_1.albums
  album2.artist

# artists = Artist.all()
# albums = Album.all()



    binding.pry
    nil
