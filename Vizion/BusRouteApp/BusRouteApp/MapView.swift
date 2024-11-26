import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @ObservedObject var route: BusRoute

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(parent: MapView) {
            self.parent = parent
        }

        // Renderizador para las líneas (ruta)
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Centrar el mapa en la primera coordenada de la ruta
        if let firstCoordinate = route.coordinates.first {
            let region = MKCoordinateRegion(
                center: firstCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            mapView.setRegion(region, animated: true)
        }

        // Dibujar la línea de la ruta
        let polyline = MKPolyline(coordinates: route.coordinates, count: route.coordinates.count)
        mapView.addOverlay(polyline)

        // Añadir marcadores para las paradas
        for (index, coordinate) in route.coordinates.enumerated() {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = route.stops[index]
            mapView.addAnnotation(annotation)
        }

        // Añadir marcador del autobús
        let busAnnotation = MKPointAnnotation()
        busAnnotation.coordinate = route.currentBusLocation
        busAnnotation.title = "Autobús en Ruta"
        mapView.addAnnotation(busAnnotation)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Actualizar marcador del autobús
        uiView.annotations.forEach { annotation in
            if annotation.title == "Autobús en Ruta" {
                uiView.removeAnnotation(annotation)
            }
        }
        
        let busAnnotation = MKPointAnnotation()
        busAnnotation.coordinate = route.currentBusLocation
        busAnnotation.title = "Autobús en Ruta"
        uiView.addAnnotation(busAnnotation)
    }
}
