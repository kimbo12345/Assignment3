import SwiftUI

struct SeatSelectionView: View {
    @Binding var selectedSeats: [String: Bool]

    let rows = ["A", "B", "C", "D", "E"]
    let numbers = Array(1...6)

    var body: some View {
        List {
            ForEach(rows, id: \.self) { row in
                DisclosureGroup("\(row) Row") {
                    ForEach(numbers, id: \.self) { number in
                        Button(action: {
                            let seat = "\(row)\(number)"
                            selectedSeats[seat] = !(selectedSeats[seat] ?? false)
                        }) {
                            HStack {
                                Text("\(row)\(number)")
                                Spacer()
                                if selectedSeats["\(row)\(number)"] == true {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
