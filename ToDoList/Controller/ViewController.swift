//
//  ViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var urlModel = URLModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        urlModel.fetchImageURL()
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIButton) {
        urlModel.fetchImageURL()
    }
    
    
    
    @IBAction func profileButtonPressed(_ sender: UIButton) {
        let destinationVC = ProfileDesignViewController()
        destinationVC.modalPresentationStyle = .fullScreen
              self.present(destinationVC, animated: true, completion: nil)
    }
    
}


// MARK: -URLManagerDelegate
extension ViewController: URLManagerDelegate {
    func didUpdateImage(_ urlModel: URLModel, image: UIImage) {
        DispatchQueue.main.async {
            self.imageView.image = image
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
