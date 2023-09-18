//
//  ProfileViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/18.
//

import UIKit
import CoreData


class ProfileViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    var container: NSPersistentContainer!
    
    var dataChangedHandler: ((UserModel) -> Void)?
    var userModel: UserModel?
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.tintColor = .black
        btn.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.text = "ID"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var idTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemGray6
        tf.layer.borderColor = UIColor.systemGray6.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemGray6
        tf.layer.borderColor = UIColor.systemGray6.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.text = "Introduction"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var introductionTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemGray6
        tf.layer.borderColor = UIColor.systemGray6.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "HomePage Address"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var addressTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemGray6
        tf.layer.borderColor = UIColor.systemGray6.cgColor
        tf.layer.cornerRadius = 8
        tf.layer.borderWidth = 1
        tf.textContentType = .emailAddress
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        return tf
    }()
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [idLabel, idTextField, nameLabel, nameTextField, introductionLabel, introductionTextField, addressLabel, addressTextField])
        st.spacing = 10
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    lazy var saveButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitle("  SAVE  ", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.white.cgColor
        btn.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        setupTextField()
        
    }
    
    
    deinit {
        print("Profile EditVC 해제")
    }
    
    
    func setupUI(){
        view.backgroundColor = .systemBackground
        
        view.addSubview(backButton)
        view.addSubview(stackView)
        view.addSubview(saveButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupConstraint(){
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 70),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    func setupTextField() {
        idTextField.delegate = self
        nameTextField.delegate = self
        introductionTextField.delegate = self
        addressTextField.delegate = self
        
        if let userModel = userModel {

            idTextField.text = userModel.id ?? ""
            nameTextField.text = userModel.name ?? ""
            introductionTextField.text = userModel.introduction ?? ""
            addressTextField.text = userModel.address ?? ""
        }
    }
    
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func saveButtonTapped() {
        if let userModel = userModel {
            saveUser()
            if let id = idTextField.text {
                userModel.id = id
            }
            if let name = nameTextField.text {
                userModel.name = name
            }
            if let introduction = introductionTextField.text {
                userModel.introduction = introduction
            }
            if let address = addressTextField.text {
                userModel.address = address
            }
            
            dataChangedHandler?(userModel)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveUser(){
        print(#function)
        do {
            try appDelegate?.saveContext()
            print("Success saving data")
        } catch {
            print("Error saving context \(error)")
        }
        
    }
    
    
}


// MARK: - UITextFieldDelegate
extension ProfileViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.idTextField {
            self.nameTextField.becomeFirstResponder()
        } else if textField == self.nameTextField {
            self.introductionTextField.becomeFirstResponder()
        } else if textField == self.introductionTextField {
            self.addressTextField.becomeFirstResponder()
        } else if textField == self.addressTextField {
            self.saveButtonTapped()
        }
        return true
    }
}



