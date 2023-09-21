//
//  ProfileEditViewModel.swift
//  ToDoList
//
// Created by t2023-m0048 on 2023/09/20.
//

import Foundation

class ProfileEditViewModel {

    let coreDataManager = CoreDataManager()
    var userModel: UserModel!
    
    var userModelUpdated: ((UserModel) -> Void)?
    
}
