import SwiftUI

struct CancellationView: View {
    var rebookAction: () -> Void

    var body: some View {
        VStack {
            Text("Booking Cancelled")
                .font(.largeTitle)
                .padding()

            Button("Book Another") {
                rebookAction()
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        }
    }
}
