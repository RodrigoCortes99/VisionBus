import SwiftUI

struct NavBarView: View {
    var body: some View {
        TabView {
            RoutesView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Rutas")
                }

            QRCodeScannerView()
                .tabItem {
                    Image(systemName: "qrcode.viewfinder")
                    Text("Escanear QR")
                }

            TicketPurchaseView()
                .tabItem {
                    Image(systemName: "ticket.fill")
                    Text("Boletos")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Perfil")
                }
        }
    }
}
