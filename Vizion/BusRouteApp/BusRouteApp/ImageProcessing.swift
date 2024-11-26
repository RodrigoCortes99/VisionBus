import CoreImage

/// Preprocesa una imagen para mejorar la detección de QR codes.
func preprocessImage(image: CIImage) -> CIImage? {
    // Convertir a escala de grises
    guard let grayscaleFilter = CIFilter(name: "CIPhotoEffectMono") else { return nil }
    grayscaleFilter.setValue(image, forKey: kCIInputImageKey) // Clave correcta
    
    // Ajustar el contraste
    guard let contrastFilter = CIFilter(name: "CIColorControls") else { return nil }
    contrastFilter.setValue(grayscaleFilter.outputImage, forKey: kCIInputImageKey)
    contrastFilter.setValue(1.5, forKey: "inputContrast") // Ajuste de contraste
    
    // Redimensionar la imagen
    guard let resizeFilter = CIFilter(name: "CILanczosScaleTransform") else { return nil }
    resizeFilter.setValue(contrastFilter.outputImage, forKey: kCIInputImageKey)
    resizeFilter.setValue(0.5, forKey: "inputScale") // Reducción al 50%
    
    return resizeFilter.outputImage
}
