//
//  CoreDataManager.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/21.
//

import UIKit
import CoreData

// MARK: - Protocol
protocol CoreDataService {
    var context: NSManagedObjectContext? { get set }
    var userModel: UserModel? { get set }
    var userModelUpdated: (UserModel?) -> Void { get set }
    func loadUser()
    func saveUser()
    
}


// MARK: - CoreDataService

class CoreDataManager: CoreDataService {
    
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
                } else {
                    self.userModel = UserModel(context: self.context!)
                    self.userModel?.id = "2__hansol"
                    self.userModel?.name = "한솔"
                    self.userModel?.introduction = "ios Developer 🍎"
                    self.userModel?.address = "https://velog.io/@ho20128"
                }
            } catch {
                print("Error fetching data from context \(error)")
            }
        }
    }
    
    func saveUser() {
        if let context = context {
            do {
                try context.save()
                loadUser()
                print("User saved successfully.")
            } catch {
                print("Error saving user: \(error)")
            }
        }
    }
    
}
