import SwiftUI

struct TicketPurchaseView: View {
    @State private var selectedRoute: String = "Ruta 72-A"
    @State private var seatNumber: Int = 1
    @State private var ticketPrice: Double = 25.00
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Compra tu Boleto")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Picker("Selecciona una ruta:", selection: $selectedRoute) {
                Text("Ruta 72-A").tag("Ruta 72-A")
            }
            .pickerStyle(MenuPickerStyle())
            
            Stepper("Boletos: \(seatNumber)", value: $seatNumber, in: 1...50)
            
            Text("Precio: $\(ticketPrice, specifier: "%.2f") MXN")
                .font(.headline)
            
            Button(action: {
                showConfirmation = true
            }) {
                Text("Comprar Boleto")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .alert(isPresented: $showConfirmation) {
                Alert(
                    title: Text("Compra Exitosa"),
                    message: Text("Has comprado tu boleto para \(selectedRoute)."),
                    dismissButton: .default(Text("Aceptar"))
                )
            }
            
            Spacer()
        }
        .padding()
    }
}
