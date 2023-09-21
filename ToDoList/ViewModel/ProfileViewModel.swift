//
//  ProfileViewModel.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/20.
//

import Foundation

class ProfileViewModel {
    
    var coreDataManager: CoreDataService 
    var userModel: UserModel?

    init(coreDataManager: CoreDataService){
        self.coreDataManager = coreDataManager
    }

}
