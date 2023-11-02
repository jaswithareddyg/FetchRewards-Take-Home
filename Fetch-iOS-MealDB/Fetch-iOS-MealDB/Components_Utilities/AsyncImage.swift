import SwiftUI

/// A view that asynchronously loads an image from a URL.
struct AsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    private let placeholder: Placeholder

    /// Initializes the AsyncImage with a URL and a placeholder view.
    /// - Parameters:
    ///   - url: The URL of the image to be loaded.
    ///   - placeholder: A closure that creates the placeholder view.
    init(url: URL, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

/// An image loader class that manages the data task to load the image asynchronously.
private final class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    /// Initializes the ImageLoader with a URL and begins the data task to fetch the image.
    /// - Parameter url: The URL of the image to be fetched.
    init(url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
