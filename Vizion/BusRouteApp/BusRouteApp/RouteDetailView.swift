import SwiftUI

struct RouteDetailView: View {
    @ObservedObject var route: BusRoute

    var body: some View {
        VStack(spacing: 20) {
            Text("Paradas en la ruta:")
                .font(.headline)
            
            ForEach(route.stops, id: \.self) { stop in
                Text(stop)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
            
            Text("Mapa de la Ruta:")
                .font(.headline)
            
            // Mapa con paradas y posición del autobús
            MapView(route: route)
                .frame(height: 300)
                .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .navigationTitle(route.name)
        .onAppear {
            startMovingBus() // Inicia el movimiento del autobús al cargar la vista
        }
    }

    /// Temporizador para simular el movimiento del autobús
    func startMovingBus() {
        var index = 0 // Índice para recorrer las coordenadas
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            guard index < route.coordinates.count else {
                timer.invalidate() // Detener el temporizador al final de la ruta
                return
            }
            route.currentBusLocation = route.coordinates[index] // Actualizar la posición del autobús
            index += 1
        }
    }
}
