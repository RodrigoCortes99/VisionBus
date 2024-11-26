import Foundation
import CoreLocation

class BusRoute: Identifiable, ObservableObject {
    let id: String
    let name: String
    let stops: [String]
    let coordinates: [CLLocationCoordinate2D]
    
    @Published var currentBusLocation: CLLocationCoordinate2D // Ubicación en tiempo real del autobús
    
    init(id: String, name: String, stops: [String], coordinates: [CLLocationCoordinate2D], currentBusLocation: CLLocationCoordinate2D) {
        self.id = id
        self.name = name
        self.stops = stops
        self.coordinates = coordinates
        self.currentBusLocation = currentBusLocation
    }
}

let pueblaRoute = BusRoute(
    id: "1",
    name: "Ruta 72-A (Puebla)",
    stops: [
        "Parada 1: Mercado de Sabores",
        "Parada 2: Zócalo de Puebla",
        "Parada 3: Angelópolis",
        "Parada 4: Universidad Iberoamericana",
        "Parada 5: Estrella de Puebla"
    ],
    coordinates: [
        CLLocationCoordinate2D(latitude: 19.0437, longitude: -98.1988), // Mercado de Sabores
        CLLocationCoordinate2D(latitude: 19.0413, longitude: -98.2060), // Zócalo de Puebla
        CLLocationCoordinate2D(latitude: 19.0222, longitude: -98.2295), // Angelópolis
        CLLocationCoordinate2D(latitude: 19.0253, longitude: -98.2412), // Universidad Iberoamericana
        CLLocationCoordinate2D(latitude: 19.0514, longitude: -98.2206)  // Estrella de Puebla
    ],
    currentBusLocation: CLLocationCoordinate2D(latitude: 19.0437, longitude: -98.1988)
)
