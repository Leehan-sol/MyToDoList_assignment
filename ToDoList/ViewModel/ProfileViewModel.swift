//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/20.
//

import UIKit
import CoreData

class ProfileViewModel {
    
    var userModel: UserModel? {
        didSet {
            onCompleted(userModel)
        }
    }
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    var container: NSPersistentContainer!
    
    var onCompleted: (UserModel?) -> Void = { user in }
    
    
    func loadUser() {
        print(#function)
        context?.perform {
            let request: NSFetchRequest<UserModel> = UserModel.fetchRequest()
            do {
                let fetchedUserModels = try self.context?.fetch(request)
                if let user = fetchedUserModels?.first {
                    self.userModel = user
                }
            } catch {
                print("Error fetching data from context \(error)")
            }
        }
    }
    
    
    func saveUser() {
        if let context = context {
            userModel = UserModel(context: context)
            userModel?.id = "2__hansol"
            userModel?.name = "한솔"
            userModel?.introduction = "ios Developer  🍎"
            userModel?.address = "https://velog.io/@ho20128"
        }
        
        do {
            try context?.save()
            print("User saved successfully.")
        } catch {
            print("Error saving user: \(error)")
        }
    }
 
    
    
    
    
}
