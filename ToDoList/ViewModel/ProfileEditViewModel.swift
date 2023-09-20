//
//  ProfileEditViewModel.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/20.
//

import Foundation
import UIKit
import CoreData

class ProfileEditViewModel {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    var container: NSPersistentContainer!
    
    var dataChangedHandler: ((UserModel) -> Void)?
    var userModel: UserModel?
    
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
