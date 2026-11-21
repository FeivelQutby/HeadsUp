import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let artist: String
}

enum Category: String, CaseIterable, Identifiable {
    case random = "Music"
    case film = "Film & Series"
    case food = "Food & Drinks"   // ← tambah
    case animal = "Animals"              // ← tambah
    case brand = "Brand"
    var id: String { rawValue }

    var songs: [Song] {
    switch self {
        case .food:
            return [
            // Indonesian food
            Song(title: "Rendang", artist: "Masakan Padang"),
            Song(title: "Nasi Goreng", artist: "Masakan Indonesia"),
            Song(title: "Sate Ayam", artist: "Masakan Indonesia"),
            Song(title: "Gado-Gado", artist: "Masakan Indonesia"),
            Song(title: "Soto Ayam", artist: "Masakan Indonesia"),
            Song(title: "Bakso", artist: "Masakan Indonesia"),
            Song(title: "Mie Goreng", artist: "Masakan Indonesia"),
            Song(title: "Nasi Padang", artist: "Masakan Padang"),
            Song(title: "Pempek", artist: "Masakan Palembang"),
            Song(title: "Gudeg", artist: "Masakan Yogyakarta"),
            Song(title: "Rawon", artist: "Masakan Jawa Timur"),
            Song(title: "Bebek Betutu", artist: "Masakan Bali"),
            Song(title: "Batagor", artist: "Masakan Bandung"),
            Song(title: "Siomay", artist: "Masakan Bandung"),
            Song(title: "Ketoprak", artist: "Masakan Jakarta"),
            Song(title: "Nasi Uduk", artist: "Masakan Jakarta"),
            Song(title: "Martabak", artist: "Street Food"),
            Song(title: "Bubur Ayam", artist: "Masakan Indonesia"),
            Song(title: "Mie Ayam", artist: "Masakan Indonesia"),
            Song(title: "Pecel Lele", artist: "Masakan Indonesia"),

            // International food
            Song(title: "Pizza", artist: "Masakan Italia"),
            Song(title: "Sushi", artist: "Masakan Jepang"),
            Song(title: "Ramen", artist: "Masakan Jepang"),
            Song(title: "Takoyaki", artist: "Masakan Jepang"),
            Song(title: "Burger", artist: "Masakan Amerika"),
            Song(title: "Hot Dog", artist: "Masakan Amerika"),
            Song(title: "Tacos", artist: "Masakan Meksiko"),
            Song(title: "Pasta Carbonara", artist: "Masakan Italia"),
            Song(title: "Croissant", artist: "Masakan Prancis"),
            Song(title: "Dim Sum", artist: "Masakan China"),
            Song(title: "Peking Duck", artist: "Masakan China"),
            Song(title: "Kimchi", artist: "Masakan Korea"),
            Song(title: "Bibimbap", artist: "Masakan Korea"),
            Song(title: "Pad Thai", artist: "Masakan Thailand"),
            Song(title: "Tom Yum", artist: "Masakan Thailand"),
            Song(title: "Pho", artist: "Masakan Vietnam"),
            Song(title: "Naan", artist: "Masakan India"),
            Song(title: "Butter Chicken", artist: "Masakan India"),
            Song(title: "Hummus", artist: "Masakan Timur Tengah"),
            Song(title: "Kebab Mr Ganteng", artist: "Masakan Turki"),
            Song(title: "Churros", artist: "Masakan Spanyol"),
            Song(title: "Tiramisu", artist: "Dessert Italia"),
            Song(title: "Cheesecake", artist: "Dessert"),
            Song(title: "Donut", artist: "Dessert"),
            Song(title: "Bubble Tea", artist: "Minuman Taiwan"),
            Song(title: "Matcha Latte", artist: "Minuman Jepang"),
            Song(title: "Es Teh Manis", artist: "Minuman Indonesia"),
            Song(title: "Es Campur", artist: "Minuman Indonesia"),
            Song(title: "Kopi Susu", artist: "Minuman Indonesia"),
            Song(title: "Cendol", artist: "Minuman Indonesia"),

            Song(title: "Panas 1", artist: "McD"),
            Song(title: "Mie Gacoan level 2", artist: "Mie Gacoan"),
            Song(title: "Ujang Kedu", artist: "Mie Gacoan"),
            Song(title: "Cendol", artist: "Minuman Indonesia"),
            Song(title: "Sate Ular", artist: "Minuman Indonesia"),
            Song(title: "Cendol", artist: "Minuman Indonesia"),
            ]

        case .animal:
            return [
            // Mammals
            Song(title: "Singa", artist: "Mamalia"),
            Song(title: "Harimau", artist: "Mamalia"),
            Song(title: "Gajah", artist: "Mamalia"),
            Song(title: "Jerapah", artist: "Mamalia"),
            Song(title: "Gorila", artist: "Mamalia"),
            Song(title: "Orangutan", artist: "Mamalia"),
            Song(title: "Panda", artist: "Mamalia"),
            Song(title: "Koala", artist: "Mamalia"),
            Song(title: "Kanguru", artist: "Mamalia"),
            Song(title: "Lumba-Lumba", artist: "Mamalia"),
            Song(title: "Paus Biru", artist: "Mamalia"),
            Song(title: "Beruang Kutub", artist: "Mamalia"),
            Song(title: "Serigala", artist: "Mamalia"),
            Song(title: "Rubah", artist: "Mamalia"),
            Song(title: "Kuda Nil", artist: "Mamalia"),
            Song(title: "Badak", artist: "Mamalia"),
            Song(title: "Cheetah", artist: "Mamalia"),
            Song(title: "Macan Tutul", artist: "Mamalia"),
            Song(title: "Kelelawar", artist: "Mamalia"),
            Song(title: "Landak", artist: "Mamalia"),

            // Birds
            Song(title: "Elang", artist: "Burung"),
            Song(title: "Merak", artist: "Burung"),
            Song(title: "Flamingo", artist: "Burung"),
            Song(title: "Pinguin", artist: "Burung"),
            Song(title: "Burung Hantu", artist: "Burung"),
            Song(title: "Kakaktua", artist: "Burung"),
            Song(title: "Cendrawasih", artist: "Burung"),
            Song(title: "Pelikan", artist: "Burung"),

            // Reptiles & Sea
            Song(title: "Komodo", artist: "Reptil"),
            Song(title: "Buaya", artist: "Reptil"),
            Song(title: "Anaconda", artist: "Reptil"),
            Song(title: "Kura-Kura", artist: "Reptil"),
            Song(title: "Bunglon", artist: "Reptil"),
            Song(title: "Hiu", artist: "Ikan"),
            Song(title: "Pari Manta", artist: "Ikan"),
            Song(title: "Gurita", artist: "Moluska"),
            Song(title: "Ubur-Ubur", artist: "Invertebrata"),
            Song(title: "Kuda Laut", artist: "Ikan"),
            Song(title: "Piranha", artist: "Ikan"),
            Song(title: "Bintang Laut", artist: "Echinodermata"),

            // Unique
            Song(title: "Platipus", artist: "Mamalia Unik"),
            Song(title: "Axolotl", artist: "Amfibi"),
            Song(title: "Tarsius", artist: "Mamalia"),
            Song(title: "Tapir", artist: "Mamalia"),
            Song(title: "Armadilo", artist: "Mamalia"),
            Song(title: "Capybara", artist: "Mamalia"),
            Song(title: "Sloth", artist: "Mamalia"),
            Song(title: "Kiwi", artist: "Burung"),
            ]

        case .brand:
            return [
            // Tech
            Song(title: "Apple", artist: "Teknologi"),
            Song(title: "Google", artist: "Teknologi"),
            Song(title: "Microsoft", artist: "Teknologi"),
            Song(title: "Samsung", artist: "Teknologi"),
            Song(title: "Tesla", artist: "Otomotif / Teknologi"),
            Song(title: "Meta", artist: "Teknologi"),
            Song(title: "Amazon", artist: "Teknologi / Retail"),
            Song(title: "Netflix", artist: "Streaming"),
            Song(title: "Spotify", artist: "Streaming"),
            Song(title: "TikTok", artist: "Media Sosial"),
            Song(title: "Instagram", artist: "Media Sosial"),
            Song(title: "Twitter / X", artist: "Media Sosial"),
            Song(title: "YouTube", artist: "Streaming"),
            Song(title: "WhatsApp", artist: "Komunikasi"),
            Song(title: "Airbnb", artist: "Travel"),
            Song(title: "Uber", artist: "Transportasi"),

            // Fashion
            Song(title: "Nike", artist: "Fashion / Olahraga"),
            Song(title: "Adidas", artist: "Fashion / Olahraga"),
            Song(title: "Supreme", artist: "Streetwear"),
            Song(title: "Gucci", artist: "Luxury Fashion"),
            Song(title: "Louis Vuitton", artist: "Luxury Fashion"),
            Song(title: "Zara", artist: "Fashion"),
            Song(title: "H&M", artist: "Fashion"),
            Song(title: "Uniqlo", artist: "Fashion"),

            // Food & Beverage
            Song(title: "McDonald's", artist: "Fast Food"),
            Song(title: "KFC", artist: "Fast Food"),
            Song(title: "Starbucks", artist: "Kopi"),
            Song(title: "Coca-Cola", artist: "Minuman"),
            Song(title: "Pepsi", artist: "Minuman"),
            Song(title: "Red Bull", artist: "Minuman Energi"),
            Song(title: "Indomie", artist: "Makanan"),
            Song(title: "Aqua", artist: "Minuman"),

            // Automotive
            Song(title: "Ferrari", artist: "Otomotif"),
            Song(title: "Lamborghini", artist: "Otomotif"),
            Song(title: "Rolls-Royce", artist: "Otomotif"),
            Song(title: "Porsche", artist: "Otomotif"),
            Song(title: "Toyota", artist: "Otomotif"),
            Song(title: "BMW", artist: "Otomotif"),
            Song(title: "Mercedes-Benz", artist: "Otomotif"),

            // Indonesian brands
            Song(title: "Gojek", artist: "Startup Indonesia"),
            Song(title: "Tokopedia", artist: "E-Commerce Indonesia"),
            Song(title: "Shopee", artist: "E-Commerce"),
            Song(title: "Traveloka", artist: "Travel Indonesia"),
            Song(title: "Kopi Kenangan", artist: "Kopi Indonesia"),
            ]
        case .film:
            return [
            // Action / Adventure
            Song(title: "Avengers: Endgame", artist: "Action"),
            Song(title: "Top Gun: Maverick", artist: "Action"),
            Song(title: "John Wick", artist: "Action"),
            Song(title: "Mad Max: Fury Road", artist: "Action"),
            Song(title: "Mission: Impossible", artist: "Action"),
            Song(title: "The Dark Knight", artist: "Action"),
            Song(title: "Black Panther", artist: "Action"),
            Song(title: "Spider-Man: No Way Home", artist: "Action"),
            Song(title: "Fast & Furious", artist: "Action"),
            Song(title: "Guardians of the Galaxy", artist: "Action"),

            // Horror / Thriller
            Song(title: "Get Out", artist: "Horror"),
            Song(title: "A Quiet Place", artist: "Horror"),
            Song(title: "Hereditary", artist: "Horror"),
            Song(title: "It", artist: "Horror"),
            Song(title: "Midsommar", artist: "Horror"),
            Song(title: "The Conjuring", artist: "Horror"),
            Song(title: "Parasite", artist: "Thriller"),
            Song(title: "Gone Girl", artist: "Thriller"),
            Song(title: "Knives Out", artist: "Thriller"),
            Song(title: "Saltburn", artist: "Thriller"),

            // Drama
            Song(title: "Oppenheimer", artist: "Drama"),
            Song(title: "The Shawshank Redemption", artist: "Drama"),
            Song(title: "Forrest Gump", artist: "Drama"),
            Song(title: "Whiplash", artist: "Drama"),
            Song(title: "La La Land", artist: "Drama"),
            Song(title: "Everything Everywhere All at Once", artist: "Drama"),
            Song(title: "The Whale", artist: "Drama"),
            Song(title: "Tár", artist: "Drama"),

            // Comedy
            Song(title: "The Grand Budapest Hotel", artist: "Comedy"),
            Song(title: "Superbad", artist: "Comedy"),
            Song(title: "Barbie", artist: "Comedy"),
            Song(title: "The Nice Guys", artist: "Comedy"),
            Song(title: "Game Night", artist: "Comedy"),

            // Sci-Fi
            Song(title: "Dune", artist: "Sci-Fi"),
            Song(title: "Interstellar", artist: "Sci-Fi"),
            Song(title: "Arrival", artist: "Sci-Fi"),
            Song(title: "The Martian", artist: "Sci-Fi"),
            Song(title: "Inception", artist: "Sci-Fi"),
            Song(title: "Avatar", artist: "Sci-Fi"),

            // Series
            Song(title: "Breaking Bad", artist: "Series / Drama"),
            Song(title: "Game of Thrones", artist: "Series / Fantasy"),
            Song(title: "Stranger Things", artist: "Series / Sci-Fi"),
            Song(title: "The Last of Us", artist: "Series / Drama"),
            Song(title: "Squid Game", artist: "Series / Thriller"),
            Song(title: "Wednesday", artist: "Series / Comedy"),
            Song(title: "Euphoria", artist: "Series / Drama"),
            Song(title: "Money Heist", artist: "Series / Thriller"),
            Song(title: "The Bear", artist: "Series / Drama"),
            Song(title: "Succession", artist: "Series / Drama"),
            Song(title: "The Crown", artist: "Series / Drama"),
            Song(title: "Ozark", artist: "Series / Thriller"),
            ]
        case .random:
            return [
            // *NSYNC
            Song(title: "Bye Bye Bye", artist: "*NSYNC"),

            // Adele
            Song(title: "Rolling in the Deep", artist: "Adele"),
            Song(title: "Someone Like You", artist: "Adele"),
            Song(title: "Hello", artist: "Adele"),
            Song(title: "Set Fire to the Rain", artist: "Adele"),
            Song(title: "Easy On Me", artist: "Adele"),

            // Backstreet Boys
            Song(title: "I Want It That Way", artist: "Backstreet Boys"),

            // Bebe Rexha
            Song(title: "Meant to Be", artist: "Bebe Rexha & Florida Georgia Line"),

            // Billie Eilish
            Song(title: "Bad Guy", artist: "Billie Eilish"),

            // BLACKPINK
            Song(title: "Pink Venom", artist: "BLACKPINK"),

            // Bob Marley
            Song(title: "No Woman No Cry", artist: "Bob Marley"),
            Song(title: "Could You Be Loved", artist: "Bob Marley"),

            // Bon Jovi
            Song(title: "Livin' on a Prayer", artist: "Bon Jovi"),
            Song(title: "You Give Love a Bad Name", artist: "Bon Jovi"),
            Song(title: "Bed Of Roses", artist: "Bon Jovi"),

            // Britney Spears
            Song(title: "...Baby One More Time", artist: "Britney Spears"),
            Song(title: "Oops!... I Did It Again", artist: "Britney Spears"),
            Song(title: "Toxic", artist: "Britney Spears"),

            // Bruno Mars
            Song(title: "Uptown Funk", artist: "Bruno Mars"),
            Song(title: "Just the Way You Are", artist: "Bruno Mars"),
            Song(title: "Grenade", artist: "Bruno Mars"),
            Song(title: "Die With Smile", artist: "Bruno Mars"),
            Song(title: "24K Magic", artist: "Bruno Mars"),

            // BTS
            Song(title: "Dynamite", artist: "BTS"),
            Song(title: "Butter", artist: "BTS"),

            // Carly Rae Jepsen
            Song(title: "Call Me Maybe", artist: "Carly Rae Jepsen"),

            // Celine Dion
            Song(title: "My Heart Will Go On", artist: "Celine Dion"),

            // Childish Gambino
            Song(title: "This Is America", artist: "Childish Gambino"),

            // Coldplay
            Song(title: "The Scientist", artist: "Coldplay"),
            Song(title: "Yellow", artist: "Coldplay"),
            Song(title: "Fix You", artist: "Coldplay"),

            // Daft Punk
            Song(title: "Get Lucky", artist: "Daft Punk"),

            // Dewa 19
            Song(title: "Pupus", artist: "Dewa 19"),

            // Drake
            Song(title: "One Dance", artist: "Drake"),
            Song(title: "God's Plan", artist: "Drake"),
            Song(title: "Hotline Bling", artist: "Drake"),

            // Dua Lipa
            Song(title: "Levitating", artist: "Dua Lipa"),

            // Eagles
            Song(title: "Hotel California", artist: "Eagles"),

            // Ed Sheeran
            Song(title: "Shape of You", artist: "Ed Sheeran"),
            Song(title: "Thinking Out Loud", artist: "Ed Sheeran"),
            Song(title: "Photograph", artist: "Ed Sheeran"),
            Song(title: "Perfect", artist: "Ed Sheeran"),
            Song(title: "Shivers", artist: "Ed Sheeran"),

            // Eurythmics
            Song(title: "Sweet Dreams (Are Made of This)", artist: "Eurythmics"),

            // Evanescence
            Song(title: "Bring Me to Life", artist: "Evanescence"),

            // Foster the People
            Song(title: "Pumped Up Kicks", artist: "Foster the People"),

            // Fugees
            Song(title: "Killing Me Softly", artist: "Fugees"),

            // fun.
            Song(title: "We Are Young", artist: "fun."),

            // Glass Animals
            Song(title: "Heat Waves", artist: "Glass Animals"),

            // Gotye
            Song(title: "Somebody That I Used to Know", artist: "Gotye"),

            // Green Day
            Song(title: "Boulevard of Broken Dreams", artist: "Green Day"),
            Song(title: "Wake Me Up When September Ends", artist: "Green Day"),
            Song(title: "American Idiot", artist: "Green Day"),

            // Guns N' Roses
            Song(title: "Sweet Child O' Mine", artist: "Guns N' Roses"),
            Song(title: "Welcome to the Jungle", artist: "Guns N' Roses"),

            // Harry Styles
            Song(title: "As It Was", artist: "Harry Styles"),
            Song(title: "Watermelon Sugar", artist: "Harry Styles"),

            // Imagine Dragons
            Song(title: "Radioactive", artist: "Imagine Dragons"),
            Song(title: "Demons", artist: "Imagine Dragons"),
            Song(title: "Believer", artist: "Imagine Dragons"),

            // John Denver
            Song(title: "Take Me Home, Country Roads", artist: "John Denver"),

            // Journey
            Song(title: "Don't Stop Believin'", artist: "Journey"),

            // Justin Bieber
            Song(title: "Peaches", artist: "Justin Bieber"),

            // Kate Bush
            Song(title: "Running Up That Hill", artist: "Kate Bush"),

            // Keane
            Song(title: "Somewhere Only We Know", artist: "Keane"),
            Song(title: "Everybody's Changing", artist: "Keane"),

            // Kendrick Lamar
            Song(title: "HUMBLE.", artist: "Kendrick Lamar"),
            Song(title: "Not Like Us", artist: "Kendrick Lamar"),

            // Lil Nas X
            Song(title: "Industry Baby", artist: "Lil Nas X"),
            Song(title: "Old Town Road", artist: "Lil Nas X"),
            Song(title: "Montero (Call Me By Your Name)", artist: "Lil Nas X"),

            // Linkin Park
            Song(title: "In the End", artist: "Linkin Park"),
            Song(title: "Numb", artist: "Linkin Park"),
            Song(title: "Crawling", artist: "Linkin Park"),

            // Madonna
            Song(title: "Material Girl", artist: "Madonna"),

            // Maroon 5
            Song(title: "This Love", artist: "Maroon 5"),
            Song(title: "Sunday Morning", artist: "Maroon 5"),

            // Marvin Gaye
            Song(title: "Let's Get It On", artist: "Marvin Gaye"),

            // Melinda
            Song(title: "Cinta Satu Malam", artist: "Melinda"),

            // Metallica
            Song(title: "Enter Sandman", artist: "Metallica"),

            // Miley Cyrus
            Song(title: "Flowers", artist: "Miley Cyrus"),

            // Nirvana
            Song(title: "Smells Like Teen Spirit", artist: "Nirvana"),
            Song(title: "Come As You Are", artist: "Nirvana"),

            // Oasis
            Song(title: "Wonderwall", artist: "Oasis"),
            Song(title: "Champagne Supernova", artist: "Oasis"),
            Song(title: "Don't Look Back in Anger", artist: "Oasis"),

            // Olivia Rodrigo
            Song(title: "Good 4 U", artist: "Olivia Rodrigo"),
            Song(title: "drivers license", artist: "Olivia Rodrigo"),
            Song(title: "deja vu", artist: "Olivia Rodrigo"),

            // OneRepublic
            Song(title: "Counting Stars", artist: "OneRepublic"),

            // Queen
            Song(title: "Bohemian Rhapsody", artist: "Queen"),
            Song(title: "We Will Rock You", artist: "Queen"),
            Song(title: "Don't Stop Me Now", artist: "Queen"),

            // Radiohead
            Song(title: "Creep", artist: "Radiohead"),
            Song(title: "Fake Plastic Trees", artist: "Radiohead"),

            // Rema
            Song(title: "Calm Down", artist: "Rema"),

            // Rihanna
            Song(title: "Umbrella", artist: "Rihanna"),
            Song(title: "We Found Love", artist: "Rihanna"),

            // Sabrina Carpenter
            Song(title: "Espresso", artist: "Sabrina Carpenter"),
            Song(title: "Please Please Please", artist: "Sabrina Carpenter"),

            // Sam Smith
            Song(title: "Stay With Me", artist: "Sam Smith"),
            Song(title: "Unholy", artist: "Sam Smith & Kim Petras"),

            // Sia
            Song(title: "Chandelier", artist: "Sia"),
            Song(title: "Cheap Thrills", artist: "Sia"),

            // Stevie Wonder
            Song(title: "Isn't She Lovely", artist: "Stevie Wonder"),

            // Steve Lacy
            Song(title: "Bad Habit", artist: "Steve Lacy"),

            // System of a Down
            Song(title: "Chop Suey!", artist: "System of a Down"),

            // Tate McRae
            Song(title: "Greedy", artist: "Tate McRae"),

            // Taylor Swift
            Song(title: "Shake It Off", artist: "Taylor Swift"),
            Song(title: "Blank Space", artist: "Taylor Swift"),
            Song(title: "Love Story", artist: "Taylor Swift"),
            Song(title: "Bad Blood", artist: "Taylor Swift"),
            Song(title: "Anti-Hero", artist: "Taylor Swift"),
            Song(title: "Cruel Summer", artist: "Taylor Swift"),

            // The Beatles
            Song(title: "Yesterday", artist: "The Beatles"),
            Song(title: "Let It Be", artist: "The Beatles"),
            Song(title: "Hey Jude", artist: "The Beatles"),

            // The Chainsmokers
            Song(title: "Closer", artist: "The Chainsmokers"),
            Song(title: "All We Know", artist: "The Chainsmokers"),

            // The Cranberries
            Song(title: "Zombie", artist: "The Cranberries"),
            Song(title: "Dreams", artist: "The Cranberries"),

            // The Killers
            Song(title: "Mr. Brightside", artist: "The Killers"),

            // The Kid LAROI
            Song(title: "Stay", artist: "The Kid LAROI & Justin Bieber"),

            // The Police
            Song(title: "Every Breath You Take", artist: "The Police"),
            Song(title: "Roxanne", artist: "The Police"),

            // The Weeknd
            Song(title: "Blinding Lights", artist: "The Weeknd"),
            Song(title: "Can't Feel My Face", artist: "The Weeknd"),
            Song(title: "Starboy", artist: "The Weeknd"),
            Song(title: "The Hills", artist: "The Weeknd"),
            Song(title: "Die For You", artist: "The Weeknd"),
            Song(title: "Save Your Tears", artist: "The Weeknd"),

            // Travis Scott
            Song(title: "Fe!n", artist: "Travis Scott"),

            // Tuti Wibowo
            Song(title: "Hamil Duluan", artist: "Tuti Wibowo"),

            // Via Vallen
            Song(title: "Lagi Syantik", artist: "Via Vallen"),
            Song(title: "Sayang", artist: "Via Vallen"),

            // Whitney Houston
            Song(title: "I Will Always Love You", artist: "Whitney Houston"),

            // Zara Larsson
            Song(title: "Lush Life", artist: "Zara Larsson"),
            Song(title: "Uptown Girl", artist: "Billy Joel"),


            Song(title: "RUNAWAY", artist: "AURORA"),

            Song(title: "Saturn", artist: "SZA"),

            ].shuffled()
        }
    }
}
