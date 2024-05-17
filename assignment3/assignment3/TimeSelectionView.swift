import SwiftUI
//Information for time selection
struct TimeSelectionView: View {
    var username: String
    var movie: MenuView.Movie
    var kidsQuantity: Int
    var adultsQuantity: Int
    var concessionQuantity: Int
    let movieTimes: [String] = ["10:00 AM", "1:00 PM", "4:00 PM"] // Example movie times
    
    var body: some View {
        VStack {
            Text("Select Time")
                .font(.headline)
                .padding()
            
            List(movieTimes, id: \.self) { time in
                NavigationLink(time, destination: SeatSelectionView(username: username, movie: movie, kidsQuantity: kidsQuantity, adultsQuantity: adultsQuantity, concessionQuantity: concessionQuantity, selectedTime: time))
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationTitle("Movie Times")
        .navigationBarBackButtonHidden(true)
    }
}
