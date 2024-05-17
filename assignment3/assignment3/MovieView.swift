//The View for the Movies
import SwiftUI

struct Movie {
    var title: String
    var description: String
    var length: String
    var ticketPrice: Double
}

enum TicketType: String, CaseIterable {
    case kids = "Kids"
    case adults = "Adults"
    case concession = "Concession"
}

struct MovieView: View {
    var username: String
    var movie: MenuView.Movie
    @State private var kidsQuantity: Int = 0
    @State private var adultsQuantity: Int = 0
    @State private var concessionQuantity: Int = 0
    
    // Dictionary mapping movie titles to image names
    let movieImages: [String: String] = [
        "Parasite (2019)": "image1",
        "Burning (2018)": "image2",
        "OldBoy (2003)": "image3"]
    
    // Total price calculation
    var totalPrice: Double {
        let kidsPrice = Double(kidsQuantity) * 9.99
        let adultsPrice = Double(adultsQuantity) * 12.99
        let concessionPrice = Double(concessionQuantity) * 10.99
        return kidsPrice + adultsPrice + concessionPrice
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // film poster
                    Text("\(movie.title)")
                        .font(.headline)
                        .fontWeight(.bold)
                    if let imageName = movieImages[movie.title] {
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 300)
                            .padding(.bottom)
                        Spacer()
                    } else {
                        Text("No poster available.")
                    }
                    Text("\(movie.description)")
                        .font(.subheadline)
                        .padding(.horizontal) // Add horizontal padding for better readability
                    Spacer()
                    Text("Duration: \(movie.length)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Spacer()
                    
                    // Ticket Quantity Steppers
                    VStack {
                        HStack {
                            Stepper("Kids (\(kidsQuantity))", value: $kidsQuantity, in: 0...10)
                            Spacer()
                        }.padding(.vertical)
                        
                        HStack {
                            Stepper("Adults (\(adultsQuantity))", value: $adultsQuantity, in: 0...10)
                            Spacer()
                        }.padding(.vertical)
                        
                        HStack {
                            Stepper("Concession (\(concessionQuantity))", value: $concessionQuantity, in: 0...10)
                            Spacer()
                        }.padding(.vertical)
                            .navigationBarBackButtonHidden(true)
                    }
                    
                    // Total Price
                    Text("Total Price: $\(totalPrice, specifier: "%.2f")")
                        .font(.headline)
                        .padding()
                    
                    // Button to Select Seats
                    NavigationLink(destination: TimeSelectionView(username: username, movie: movie, kidsQuantity: kidsQuantity, adultsQuantity: adultsQuantity, concessionQuantity: concessionQuantity)) {
                        Text("Select Seats")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            
                    }
                    .padding()
                    .disabled(kidsQuantity + adultsQuantity + concessionQuantity == 0) // Disable the button if no tickets are chosen
                    .opacity(kidsQuantity + adultsQuantity + concessionQuantity == 0 ? 0.5 : 1.0)

                    
                    Spacer()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                }
                .padding()
                .navigationTitle("\(movie.title)")
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}
