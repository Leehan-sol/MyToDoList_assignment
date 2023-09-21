//
//  CatViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/01.
//

import UIKit
import Alamofire
import AlamofireImage

class PhotoViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = URL(string: "https://teamsparta.notion.site/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F6b77bb10-f505-4dec-b9be-8a741d0e7241%2FUntitled.png?table=block&id=3e12ad08-5b8e-4dd6-91dc-38fe272c1afc&spaceId=83c75a39-3aba-4ba4-a792-7aefe4b07895&width=580&userId=&cache=v2") {
            AF.request(imageURL).responseImage { response in
                switch response.result {
                case .success(let image):
                    self.image.image = image
                case .failure(let error):
                    print("Image download error: \(error)")
                }
            }
        }
    }
    
    
    
    deinit {
        print("PhotoVC 해제")
    }
    
    
}
