//
//  CoreDataManager.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/21.
//

import UIKit
import CoreData

protocol CoreDataService {
    func loadUser()
    func saveUser()
    
}

class CoreDataManager {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    var container: NSPersistentContainer!
    
    var userModel: UserModel? {
        didSet {
            userModelUpdated(userModel)
        }
    }
    
    var userModelUpdated: (UserModel?) -> Void = { user in }
    
    func loadUser() {
        print(#function)
        context?.perform {
            let request: NSFetchRequest<UserModel> = UserModel.fetchRequest()
            do {
                let fetchedUserModels = try self.context?.fetch(request)
                if let user = fetchedUserModels?.first {
                    self.userModel = user
                    print(user)
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
            userModel?.introduction = "ios Developer 🍎"
            userModel?.address = "https://velog.io/@ho20128"
        }
        
        do {
            try context?.save()
            loadUser()
            print("User saved successfully.")
        } catch {
            print("Error saving user: \(error)")
        }
    }
    
    
    
}
