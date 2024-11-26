import SwiftUI

struct QRCodeScannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> QRCodeScannerViewController {
        QRCodeScannerViewController()
    }

    func updateUIViewController(_ uiViewController: QRCodeScannerViewController, context: Context) {}

    typealias UIViewControllerType = QRCodeScannerViewController
}
