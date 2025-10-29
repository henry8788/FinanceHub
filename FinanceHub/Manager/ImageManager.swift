//
//  ImageManager.swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

import UIKit

// MARK: - Image Manager
/// Manages image downloading and caching
class ImageManager {
    // MARK: - Singleton
    static let shared = ImageManager()

    // MARK: - Properties
    private let imageCache = NSCache<NSURL, UIImage>()
    private let session: URLSession

    // MARK: - Initialization
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        self.session = URLSession(configuration: configuration)

        // Configure cache limits
        imageCache.countLimit = 100
        imageCache.totalCostLimit = 50 * 1024 * 1024 // 50 MB
    }

    // MARK: - Public Methods
    /// Fetches an image from URL with caching
    /// - Parameters:
    ///   - url: The URL of the image
    ///   - completionHandler: Completion handler called with the image or nil
    func fetchImage(url: URL, completionHandler: @escaping (UIImage?) -> Void) {
        // Check cache first
        if let cachedImage = imageCache.object(forKey: url as NSURL) {
            DispatchQueue.main.async {
                completionHandler(cachedImage)
            }
            return
        }

        // Download image
        session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }

            if let error = error {
                print("Image download error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
                return
            }

            guard let data = data,
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
                return
            }

            // Cache the image
            self.imageCache.setObject(image, forKey: url as NSURL)

            DispatchQueue.main.async {
                completionHandler(image)
            }
        }.resume()
    }

    // MARK: - Cache Management
    /// Clears all cached images
    func clearCache() {
        imageCache.removeAllObjects()
    }
}
