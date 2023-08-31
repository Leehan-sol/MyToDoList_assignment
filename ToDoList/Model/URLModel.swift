//
//  URLModel.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/31.
//

import Foundation
import UIKit

protocol URLManagerDelegate {
    func didUpdateImage(_ urlModel: URLModel, image: UIImage)
    func didFailWithError(error: Error)
}


struct URLModel {
    var delegate : URLManagerDelegate?
    
    func fetchImageURL() {
        let urlAddress = "https://api.thecatapi.com/v1/images/search"
        if let url = URL(string: urlAddress) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    delegate?.didFailWithError(error: error)
                    return
                }
                if let safedata = data {
                    if let image = self.parseJSON(safedata) {
                        delegate?.didUpdateImage(self, image: image)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ parseData: Data) -> UIImage? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([ImageData].self, from: parseData)
            if let firstImage = decodedData.first,
               let imageURL = URL(string: firstImage.url),
               let imageData = try? Data(contentsOf: imageURL),
               let image = UIImage(data: imageData) {
                return image
            }
        } catch {
            delegate?.didFailWithError(error: error)
        }
        return nil
    }
    
}
