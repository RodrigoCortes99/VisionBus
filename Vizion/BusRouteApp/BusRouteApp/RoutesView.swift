import SwiftUI

struct RoutesView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: RouteDetailView(route: pueblaRoute)) {
                    VStack(alignment: .leading) {
                        Text(pueblaRoute.name)
                            .font(.headline)
                        Text("Ver detalles y paradas")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Rutas Escaneadas")
        }
    }
}
