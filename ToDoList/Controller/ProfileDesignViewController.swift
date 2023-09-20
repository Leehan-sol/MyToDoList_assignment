//
//  ProfileDesignViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/17.
//

import UIKit
import SwiftUI
import CoreData

// MARK: - UIViewController

class ProfileDesignViewController: UIViewController {
    
    //MARK: -Properties
    
    lazy var userId: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var menuButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(named: "Menu"), for: .normal)
        return btn
    }()
    
    lazy var userImage: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "_")
        img.contentMode = .scaleToFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 50
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.gray.cgColor
        return img
    }()
    
    lazy var postNumber: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var followerNumber: UILabel = {
        let label = UILabel()
        label.text = "598"
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
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var follower: UILabel = {
        let label = UILabel()
        label.text = "follower"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var following: UILabel = {
        let label = UILabel()
        label.text = "following"
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var userIntroduction: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    lazy var userAddress: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
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
    
    lazy var middleButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(named: "Grid"), for: .normal)
        return btn
    }()
    
    lazy var middleBorderBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var middleBar: UIView = {
        let view = UIView()
        view.addSubview(middleBorderBar)
        view.addSubview(middleButton)
        return view
    }()
    
    lazy var bottomBar: UIView = {
        let view = UIView()
        view.addSubview(bottomButton)
        return view
    }()
    
    lazy var bottomButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(named: "profile"), for: .normal)
        btn.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    
    
    // MARK: - StackView
    
    lazy var postStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [postNumber, post])
        st.spacing = 5
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .center
        return st
    }()
    
    lazy var followerStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [followerNumber, follower])
        st.spacing = 5
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .center
        return st
    }()
    
    lazy var followingStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [followingNumber, following])
        st.spacing = 5
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .center
        return st
    }()
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [postStackView, followerStackView, followingStackView])
        st.spacing = 5
        st.axis = .horizontal
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    lazy var detailStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [userName, userIntroduction, userAddress])
        st.spacing = 2
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    lazy var buttonStackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [followButton, messageButton, moreButton])
        st.spacing = 8
        st.axis = .horizontal
        st.distribution = .fillProportionally
        st.alignment = .fill
        return st
    }()
    
    
    // MARK: - CollectionView
    
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        flowLayout.scrollDirection = .vertical
        return cv
    }()
    
    
    // MARK: - variable
    
    let catPhotos: [UIImage] = [#imageLiteral(resourceName: "のせ猫『節黒仙翁』"), #imageLiteral(resourceName: "3b44bb8c-eab7-408c-9a46-54537cc03f97"), #imageLiteral(resourceName: "해연갤 - 붕붕이 취미_ 좀 이상한 고양이 짤 모으기 (1)"), #imageLiteral(resourceName: "Try to be an avocado today 🥑"), #imageLiteral(resourceName: "Zey"), #imageLiteral(resourceName: "e377cf34-3484-4148-af24-d199654385f3"), #imageLiteral(resourceName: "The Pastel-Hued World Of Instagram Artist Michele Bisaillon - IGNANT"), #imageLiteral(resourceName: "해연갤 - 붕붕이 취미_ 좀 이상한 고양이 짤 모으기"), #imageLiteral(resourceName: "_ 복사본"), #imageLiteral(resourceName: "_ 1"), #imageLiteral(resourceName: "_ (3)"), #imageLiteral(resourceName: "Follow_ @elegant_ee 1")]
    var viewModel = ProfileViewModel()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraint()
        setupCollectionView()
        viewModel.loadUser()
        
        self.viewModel.onCompleted = { [weak self] user in
            DispatchQueue.main.async {
                self?.userId.text = self?.viewModel.userModel?.id
                self?.userName.text = self?.viewModel.userModel?.name
                self?.userIntroduction.text = self?.viewModel.userModel?.introduction
                self?.userAddress.text = self?.viewModel.userModel?.address
            }
        }
    }
    
    
    deinit {
        print("ProfileDesignVC 해제")
    }
    
    
    // MARK: - Func
    
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(userId)
        view.addSubview(backButton)
        view.addSubview(menuButton)
        view.addSubview(userImage)
        view.addSubview(stackView)
        view.addSubview(detailStackView)
        view.addSubview(buttonStackView)
        view.addSubview(collectionView)
        view.addSubview(bottomBar)
        view.addSubview(middleBar)
        
        userId.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        detailStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        middleBorderBar.translatesAutoresizingMaskIntoConstraints = false
        middleButton.translatesAutoresizingMaskIntoConstraints = false
        middleBar.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setupConstraint(){
        NSLayoutConstraint.activate([
            userId.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userId.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            menuButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            userImage.topAnchor.constraint(equalTo: userId.bottomAnchor, constant: 14),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: userId.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            
            detailStackView.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 20),
            detailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buttonStackView.topAnchor.constraint(equalTo: detailStackView.bottomAnchor, constant: 10),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            middleBorderBar.topAnchor.constraint(equalTo: middleBar.topAnchor, constant: 3),
            middleBorderBar.leadingAnchor.constraint(equalTo: middleBar.leadingAnchor),
            middleBorderBar.trailingAnchor.constraint(equalTo: middleBar.trailingAnchor),
            middleBorderBar.heightAnchor.constraint(equalToConstant: 1),
            
            middleButton.centerYAnchor.constraint(equalTo: middleBar.centerYAnchor),
            middleButton.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width / 6),
            
            middleBar.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 5),
            middleBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            middleBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            middleBar.heightAnchor.constraint(equalToConstant: 40),
            
            collectionView.topAnchor.constraint(equalTo: middleBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomBar.topAnchor),
            
            bottomButton.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 15),
            bottomButton.centerXAnchor.constraint(equalTo: bottomBar.centerXAnchor),
            
            bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomBar.heightAnchor.constraint(equalToConstant: 70)
            
        ])
    }
    
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func profileButtonTapped() {
        let editVC = ProfileViewController()
        let editVM = ProfileEditViewModel()
        editVC.viewModel = editVM
        
        let managedObjectContext = self.viewModel.context
        editVM.context = managedObjectContext
        editVM.container = viewModel.container
        editVM.userModel = viewModel.userModel
        
        editVM.dataChangedHandler = { [weak self] (newUser: UserModel) in
            self?.userId.text = newUser.id
            self?.userName.text = newUser.name
            self?.userIntroduction.text = newUser.introduction
            self?.userAddress.text = newUser.address
            
            do {
                try managedObjectContext?.save()
            } catch {
                print("Error saving data to Core Data: \(error)")
            }
        }
        
        editVC.modalPresentationStyle = .fullScreen
        self.present(editVC, animated: true, completion: nil)
    }
    
    
}



// MARK: - UICollectionViewDataSource

extension ProfileDesignViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! CollectionViewCell
        cell.imageView.image = catPhotos[indexPath.row]
        return cell
    }
    
    
}


// MARK: -UICollectionViewDelegateFlowLayout

extension ProfileDesignViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width - 4) / 3
        let size = CGSize(width: width, height: width)
        return size
    }
    
}



// MARK: - Preview

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
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

