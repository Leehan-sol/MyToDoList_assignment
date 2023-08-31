//
//  ListModel.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import Foundation

struct ListModel: Codable, Equatable {
    var title : String
    var done : Bool
}

var dailyList = [ListModel]()
var doneList = [ListModel]()

var list = [dailyList]

var sections = ["daily"]


