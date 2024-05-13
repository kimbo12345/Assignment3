import Foundation
import SwiftUI
import Combine


struct Booking {
    var place: String = ""
    var dateTime: Date = Date()
    var seats: Int = 1
    var price: Int = 0
    var selectedSeats: [String] = []
}
