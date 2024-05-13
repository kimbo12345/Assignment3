import SwiftUI

struct BookingDetailsView: View {
    @Binding var booking: Booking
    var cancelAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Booking Details")
                .font(.largeTitle)
                .padding()
            
            Text("Place: \(booking.place)")
            Text("Date and Time: \(formatDate(booking.dateTime))")
            Text("Number of Seats: \(booking.seats)")
            ForEach(booking.selectedSeats, id: \.self) { seat in
                Text("Seat: \(seat)")
            }
            Text("Price: $\(booking.price)")
            
            Button("Cancel Booking") {
                cancelAction()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
