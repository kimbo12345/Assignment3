import SwiftUI

struct ConfirmationView: View {
    var username: String
    var movie: MenuView.Movie
    var kidsQuantity: Int
    var adultsQuantity: Int
    var concessionQuantity: Int
    var selectedSeats: [Int]
    var selectedTime: String
    
    var body: some View {
        VStack {
            Text("Reservation Confirmation")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Movie: \(movie.title)")
                    .font(.headline)
                Text("Time: \(selectedTime)")
                    .font(.headline)
                Text("Seats: \(selectedSeats.count)")
                    .font(.headline)
                Text("Total Price: $\(calculateTotalPrice())")
                    .font(.headline)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            NavigationLink(destination: MenuView(username: username)) {
                Text("Confirm and Go Back To Menu")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    
    func calculateTotalPrice() -> Double {
        let kidsPrice = Double(kidsQuantity) * 9.99
        let adultsPrice = Double(adultsQuantity) * 12.99
        let concessionPrice = Double(concessionQuantity) * 10.99
        let seatPrice = Double(selectedSeats.count) * 3.0
        return kidsPrice + adultsPrice + concessionPrice + seatPrice
    }
}
