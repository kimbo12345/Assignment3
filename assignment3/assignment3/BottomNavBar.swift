import SwiftUI

struct BottomNavBar: View {
    var username: String
    
    //Navigation 
    var body: some View {
        HStack {
            NavigationLink(destination: MenuView(username: username)) {
                Image(systemName: "house")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: PreviousBookingsView()) {
                Image(systemName: "list.bullet")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding()
            
            Spacer()
            
            NavigationLink(destination: MoreView()) {
                Image(systemName: "ellipsis")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .padding()
        }
        .background(Color.white)
        .padding(.horizontal)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
    }
}
