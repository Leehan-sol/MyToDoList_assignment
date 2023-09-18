//
//  UserModel.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/18.
//

import Foundation


struct UserModel {
    static let shared = UserModel()
    
    var id: String?
    var name: String?
    var introduction: String?
    var address: String?

}
