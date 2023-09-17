//
//  ProfileDesignViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/17.
//

import UIKit

class ProfileDesignViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "2__hansol"
        return label
    }()
    
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        let backImage = UIImage(systemName: "chevron.backward")
        btn.setImage(backImage, for: .normal)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraint()
        
    }
    
    
    
    
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameLabel)
        view.addSubview(backButton)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func setupConstraint(){
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
      }
    
    
    
    
    
    
    
    
}
