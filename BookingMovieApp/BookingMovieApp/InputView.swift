import SwiftUI

struct InputView: View {
    @Binding var booking: Booking
    var confirmAction: () -> Void
    @State private var showConfirmation = false

    let places = ["Select", "Place 1", "Place 2", "Place 3"]
    @State private var selectedSeats: [String: Bool] = [:]

    var body: some View {
        Form {
            Section(header: Text("Booking Information")) {
                Picker("Place", selection: $booking.place) {
                    ForEach(places, id: \.self) { place in
                        Text(place)
                    }
                }
                DatePicker("Date", selection: $booking.dateTime, displayedComponents: .date)
                DatePicker("Time", selection: $booking.dateTime, displayedComponents: .hourAndMinute)
                SeatSelectionView(selectedSeats: $selectedSeats)
                Text("Number of Seats: \(selectedSeats.values.filter({$0}).count)")
                Text("Total Price: $\(Int(selectedSeats.values.filter({$0}).count) * 20)")
            }

            Section {
                Button("Confirm Booking") {
                    booking.seats = selectedSeats.values.filter({$0}).count
                    booking.price = Int(booking.seats) * 20
                    booking.selectedSeats = selectedSeats.compactMap { $0.key }
                    confirmAction()
                }
                .disabled(booking.place == "Select" || selectedSeats.values.filter({$0}).count == 0)
            }
        }
        .sheet(isPresented: $showConfirmation) {
            BookingDetailsView(booking: $booking, cancelAction: {
                showConfirmation = false
                booking = Booking()
            })
        }
    }
}
