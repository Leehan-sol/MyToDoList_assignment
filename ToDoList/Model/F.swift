//
//  F.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/30.
//

import Foundation
import UIKit

struct F {
    let saveData = UserDefaults.standard
    
    func findSwitch(_ switchControl: UISwitch, indexPath: IndexPath) {
        let switchKey = "SwitchState \(indexPath.section) \(indexPath.row)"
        let switchState = saveData.bool(forKey: switchKey)
        switchControl.isOn = switchState
    }
    
    func setSwitch(sender: UISwitch, indexPath: IndexPath){
        let switchKey = "SwitchState \(indexPath.section) \(indexPath.row)"
        saveData.set(sender.isOn, forKey: switchKey)
    }
    
    func setList(_ list: [[List]]){
        DispatchQueue.global().async {
            let propertyListEncoder = try? PropertyListEncoder().encode(list)
            self.saveData.set(propertyListEncoder, forKey: "ToDoList")
        }
    }
    
    func setDoneList(_ doneList: [List]){
        DispatchQueue.global().async {
            let propertyListEncoder = try? PropertyListEncoder().encode(doneList)
            self.saveData.set(propertyListEncoder, forKey: "DoneList")
        }
    }
    
    func setSection(_ sections: [String]){
        DispatchQueue.global().async {
            let propertyListEncoder = try? PropertyListEncoder().encode(sections)
            self.saveData.set(propertyListEncoder, forKey: "Sections")
        }
    }
    
    func findList() {
        if let data = saveData.data(forKey: "ToDoList") {
            if let decodedList = try? PropertyListDecoder().decode([[List]].self, from: data) {
                list = decodedList
            }
        }
    }
    
    func findDoneList() {
        if let data = saveData.data(forKey: "DoneList") {
            if let decodedList = try? PropertyListDecoder().decode([List].self, from: data) {
                doneList = decodedList
            }
        }
    }
    
    func findSection() {
        if let data = saveData.data(forKey: "Sections") {
            if let decodedSections = try? PropertyListDecoder().decode([String].self, from: data) {
                sections = decodedSections
            }
        }
    }
}
