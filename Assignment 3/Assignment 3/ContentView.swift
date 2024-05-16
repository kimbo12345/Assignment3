import SwiftUI

struct ContentView: View {
    @State private var selectedGenre = "All"
       @State private var purchases: [Purchase] = []
       @State private var showingPurchase = false
       @State private var currentPurchase: Purchase?
       @State private var showingHistory = false
    
    let genres = ["All", "Action", "Comedy", "Drama", "Sci-Fi", "Horror"]
    
    let movies: [Movie] = [
        Movie(name: "Fast X", genre: "Action", description: "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted and outdriven every foe in their path. Now, they must confront the most lethal opponent they've ever faced. Fueled by revenge, a terrifying threat emerges from the shadows of the past to shatter Dom's world and destroy everything -- and everyone -- he loves."),
        Movie(name: "Central Int", genre: "Comedy", description: "Accountant Calvin, who was the most popular boy at school, meets his ex-classmate, Bob, at a reunion. Little does he know that the meeting would wreak havoc in his quiet and peaceful life."),
        Movie(name: "Glass", genre: "Drama", description: "While David confronts Kevin, a group of armed men intervene. Now locked in a mental facility with Elijah, the two find their superhuman abilities being questioned by Ellie, a secretive psychiatrist."),
        Movie(name: "Pacific Rim", genre: "Sci-Fi", description: "A war ensues when the Kaiju, the monstrous sea creatures, attack human beings. The scientists develop massive robots, Jaegers, to combat them. However, they seem futile against the Kaiju's onslaught."),
        Movie(name: "Fall", genre: "Horror", description: "Two best friends Becky and Hunter decide to climb a 2000-foot-tall, abandoned tower. Soon, they find themselves stranded on it after the corroded ladder breaks."),
        Movie(name: "Kung Fu Panda 2", genre: "Action", description: "Dragon Warrior Po takes it upon himself to foil the plans of murderous peacock Shen, who intends to conquer China and destroy kung fu. For this, Po has to unveil the mystery of his own past.")
    ]
    
    var body: some View {
           NavigationView {
               VStack {
                   Picker("Genre", selection: $selectedGenre) {
                       ForEach(genres, id: \.self) {
                           Text($0)
                       }
                   }
                   .pickerStyle(SegmentedPickerStyle())
                   .padding()
                   
                   List {
                       ForEach(movies.filter { $0.genre == selectedGenre || selectedGenre == "All" }) { movie in
                           NavigationLink(destination: PurchaseView(purchase: Purchase(movie: movie, seats: ["A1", "A2"]))) {
                               ZStack {
                                   Image(movie.name)
                                       .resizable()
                                       .aspectRatio(contentMode: .fill)
                                       .frame(width: UIScreen.main.bounds.width, height: 150)
                                       .clipped()
                                   Text(movie.name)
                                       .font(.title)
                                       .fontWeight(.bold)
                                       .foregroundColor(.white)
                               }
                               .listRowInsets(EdgeInsets())
                           }
                       }
                   }
               }
               .navigationTitle("Movies")
           }
       }
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

