//
//  ProfileDesignViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/17.
//

import UIKit
import SwiftUI


// MARK: - Preview

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = ProfileDesignViewController
    
    func makeUIViewController(context: Context) -> ProfileDesignViewController {
        return ProfileDesignViewController()
    }
    
    func updateUIViewController(_ uiViewController: ProfileDesignViewController, context: Context) {
    }
}

@available(iOS 13.0.0, *)
struct ViewPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}


// MARK: - UIViewController
class ProfileDesignViewController: UIViewController {
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "2__hansol"
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
    
    lazy var menuButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        let backImage = UIImage(systemName: "text.justify")
        btn.setImage(backImage, for: .normal)
        return btn
    }()
    
    lazy var userImage: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "_ (3)")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 50
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.gray.cgColor
        return img
    }()
    
    lazy var postNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var followerNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var followingNumber: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var post: UILabel = {
        let label = UILabel()
        label.text = "post"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var follower: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var following: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var nickname: UILabel = {
        let label = UILabel()
        label.text = "이한솔"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var introduction: UILabel = {
        let label = UILabel()
        label.text = "ios Developer 🔥"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var link: UILabel = {
        let label = UILabel()
        label.text = "https://velog.io/@ho20128"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor.blue
        return label
    }()
    
    lazy var followButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(named: "Follow"), for: .normal)
        return btn
    }()
    
    lazy var messageButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(named: "Message"), for: .normal)
        return btn
    }()
    
    lazy var moreButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(named: "More"), for: .normal)
        return btn
    }()
    

    // MARK: - StackView
    
    lazy var numberStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [postNumber, followerNumber, followingNumber])
        st.spacing = 5
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .center
        return st
    }()
    
    lazy var nameStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [post, follower, following])
       st.spacing = 5
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .center
        return st
    }()
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [numberStackView, nameStackView])
       st.spacing = 5
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    lazy var detailStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [nickname, introduction, link])
       st.spacing = 2
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [followButton, messageButton, moreButton])
        st.spacing = 7
        st.axis = .horizontal
        st.distribution = .fillProportionally
        st.alignment = .fill
        return st
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraint()
        
    }
    
 
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(userName)
        view.addSubview(backButton)
        view.addSubview(menuButton)
        view.addSubview(userImage)
        view.addSubview(stackView)
        view.addSubview(detailStackView)
        view.addSubview(buttonStackView)
        
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    
    func setupConstraint(){
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            userImage.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 14),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 28),
            stackView.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            detailStackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
            detailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buttonStackView.topAnchor.constraint(equalTo: detailStackView.bottomAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            
        ])
    }
    
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    
    
    
}
