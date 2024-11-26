import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Perfil del Usuario")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Text("Aquí puedes configurar tus preferencias.")
                .font(.subheadline)
        }
    }
}
