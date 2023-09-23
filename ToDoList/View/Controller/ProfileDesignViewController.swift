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
    
    // MARK: - Variable
    
    let catPhotos: [UIImage] = [#imageLiteral(resourceName: "のせ猫『節黒仙翁』"), #imageLiteral(resourceName: "3b44bb8c-eab7-408c-9a46-54537cc03f97"), #imageLiteral(resourceName: "해연갤 - 붕붕이 취미_ 좀 이상한 고양이 짤 모으기 (1)"), #imageLiteral(resourceName: "Try to be an avocado today 🥑"), #imageLiteral(resourceName: "Zey"), #imageLiteral(resourceName: "e377cf34-3484-4148-af24-d199654385f3"), #imageLiteral(resourceName: "The Pastel-Hued World Of Instagram Artist Michele Bisaillon - IGNANT"), #imageLiteral(resourceName: "해연갤 - 붕붕이 취미_ 좀 이상한 고양이 짤 모으기"), #imageLiteral(resourceName: "_ 복사본"), #imageLiteral(resourceName: "_ 1"), #imageLiteral(resourceName: "_ (3)"), #imageLiteral(resourceName: "Follow_ @elegant_ee 1")]
    var coreDataManager = CoreDataManager()
    var viewModel: ProfileViewModel!
    
    
    // MARK: - LifeCycle
    
    private let profileDesignView = ProfileDesignView()
    
    override func loadView() {
          view = profileDesignView
      }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = ProfileViewModel(coreDataManager: coreDataManager)
        setupAddTarget()
        
        viewModel.coreDataManager.loadUser()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        
        self.viewModel.coreDataManager.userModelUpdated = { [weak self] user in
            DispatchQueue.main.async {
                self!.profileDesignView.userId.text = user?.id
                self!.profileDesignView.userName.text = user?.name
                self!.profileDesignView.userIntroduction.text = user?.introduction
                self!.profileDesignView.userAddress.text = user?.address
            }
        }
    }
    
    
    deinit {
        print("ProfileDesignVC 해제")
    }
    
    
    // MARK: - Func
    
    func setupAddTarget(){
        profileDesignView.backButton.addTarget(self, action:#selector(backButtonTapped), for: .touchUpInside)
        profileDesignView.bottomButton.addTarget(self, action:#selector(profileButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func profileButtonTapped() {
        let editVC = ProfileEditViewController()
        let editVM = ProfileEditViewModel()
        editVC.viewModel = editVM
        editVM.userModel = self.viewModel.coreDataManager.userModel
        
        let managedObjectContext = self.viewModel.coreDataManager.context
        
        editVM.userModelUpdated = { [weak self] (newUser: UserModel) in
            self!.profileDesignView.userId.text = newUser.id
            self!.profileDesignView.userName.text = newUser.name
            self!.profileDesignView.userIntroduction.text = newUser.introduction
            self!.profileDesignView.userAddress.text = newUser.address
            
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


