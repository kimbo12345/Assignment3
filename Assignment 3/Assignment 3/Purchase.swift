
import Foundation

struct Purchase: Identifiable {
    var id = UUID()
    var movie: Movie
    var seats: [String]
    var totalPrice: Double {
        Double(seats.count) * 20.0
    }
}
