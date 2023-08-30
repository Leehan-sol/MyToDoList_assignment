//
//  ListModel.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import Foundation

struct List: Codable {
    var title : String
    var done : Bool
}

var dailyList = [List]()
var doneList = [List]()

var list = [dailyList]

var sections = ["daily"]


