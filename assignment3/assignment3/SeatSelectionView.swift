import Foundation

import SwiftUI

struct SeatSelectionView: View {
    var username: String
    var movie: MenuView.Movie
    var kidsQuantity: Int
    var adultsQuantity: Int
    var concessionQuantity: Int
    var selectedTime: String
    @State private var seats = Array(repeating: Seat(id: 0), count: 30).enumerated().map { index, seat in Seat(id: index) }
    @State private var selectedSeats: [Int] = []
    
    // Total price calculation
    var totalPrice: Double {
        let kidsPrice = Double(kidsQuantity) * 9.99
        let adultsPrice = Double(adultsQuantity) * 12.99
        let concessionPrice = Double(concessionQuantity) * 10.99
        let seatPrice = Double(selectedSeats.count) * 3.0
        return kidsPrice + adultsPrice + concessionPrice + seatPrice
    }
    
    var body: some View {
        VStack {
            Text("Select Seats")
                .font(.headline)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5), spacing: 10) {
                ForEach($seats.indices, id: \.self) { index in
                    Button(action: {
                        if selectedSeats.count < kidsQuantity + adultsQuantity + concessionQuantity {
                            seats[index].isSelected.toggle()
                            if seats[index].isSelected {
                                selectedSeats.append(index)
                            } else {
                                selectedSeats.removeAll { $0 == index }
                            }
                        } else if selectedSeats.contains(index) {
                            seats[index].isSelected.toggle()
                            selectedSeats.removeAll { $0 == index }
                        }
                    }) {
                        Rectangle()
                            .fill(seats[index].isSelected ? Color.blue : Color.gray)
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)
                            .shadow(radius: 3)
                            .disabled(selectedSeats.count == kidsQuantity + adultsQuantity + concessionQuantity && !selectedSeats.contains(index))
                    }
                }.navigationBarBackButtonHidden(true)
            }
            
            Text("Selected Seats: \(selectedSeats.count) - Total: $\(totalPrice, specifier: "%.2f")")
                .font(.subheadline)
                .padding()
            
            NavigationLink("Next", destination: PaymentView(
                username: username,
                movie: movie,
                kidsQuantity: kidsQuantity,
                adultsQuantity: adultsQuantity,
                concessionQuantity: concessionQuantity,
                selectedSeats: selectedSeats,
                selectedTime: selectedTime,
                totalPrice: totalPrice
            ))
            .disabled(selectedSeats.count != kidsQuantity + adultsQuantity + concessionQuantity)
        }
    }
}
