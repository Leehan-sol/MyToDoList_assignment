//
//  ViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        fetchImageURL()
    }
    
    
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        fetchImageURL()
    }
    
    
    func fetchImageURL() {
        let urlAddress = "https://api.thecatapi.com/v1/images/search"
        if let url = URL(string: urlAddress) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                if let safedata = data {
                    if let image = self.parseJSON(safedata) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
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
            print(error)
        }
        return nil
    }
    
    
}
