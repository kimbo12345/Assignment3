import SwiftUI

struct ContentView: View {
    @State private var booking = Booking()
    @State private var showConfirmation = false
    @State private var showCancellation = false

    var body: some View {
        NavigationView {
            if showConfirmation {
                BookingDetailsView(booking: $booking, cancelAction: {
                    showConfirmation = false
                    showCancellation = true
                })
            } else if showCancellation {
                CancellationView(rebookAction: {
                    booking = Booking()
                    showCancellation = false
                })
            } else {
                InputView(booking: $booking, confirmAction: {
                    showConfirmation = true
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

