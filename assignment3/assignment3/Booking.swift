//
//  PreviousBookingsViewModel.swift
//  assignment3
//
//  Created by Jerry Lo on 16/5/2024.
//  oldcode

import Foundation

import Foundation

struct Booking {
    var movie: MenuView.Movie
    var selectedTime: String
    var selectedSeats: [Int]
    var kidsQuantity: Int
    var adultsQuantity: Int
    var concessionQuantity: Int
}


class PreviousBookingsViewModel: ObservableObject {
    @Published var previousBookings: [Booking] = []

    func addBooking(_ booking: Booking) {
        previousBookings.append(booking)
    }
}

