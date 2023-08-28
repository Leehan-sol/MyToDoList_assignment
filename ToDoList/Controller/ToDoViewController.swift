//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var todoTableView: UITableView!
    var selectedSection: String = ""
    let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        pickerFrame.delegate = self
        pickerFrame.dataSource = self
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        // 1) Alert
        let alert = UIAlertController(title: "Add ToDoList", message: "", preferredStyle: .alert)
        alert.view.addSubview(pickerFrame)
        
        // 2-1) Alert 액션
        let action = UIAlertAction(title: "Add", style: .default) { action in
             let newItem = List(title: textField.text!, done: false)
             if self.selectedSection == "Study" {
                 studyList.append(newItem)
             } else if self.selectedSection == "Daily" {
                 dailyList.append(newItem)
             }
             self.todoTableView.reloadData()
         }
        
        // 2-2) Alert 액션
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // 3) Alert에 TextField 추가
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Write here"
            textField = alertTextField
        }
        
        // 4) Alert에 Action 추가
        alert.addAction(action)
        alert.addAction(cancelAction)
        // 5) Alert present
        present(alert, animated: true)
    }
    
}



// MARK: -UITableViewDelegate
extension ToDoViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


// MARK: -UITableViewDataSource
extension ToDoViewController: UITableViewDataSource {
    
    // 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    // 섹션의 헤더 내용
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    // 섹션마다 Row개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return studyList.count
        }
        return dailyList.count
    }
    
    // Row 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        if indexPath.section == 0 {
            cell.todoLabel.text = studyList[indexPath.row].title
        } else {
            cell.todoLabel.text = dailyList[indexPath.row].title
        }
        
        return cell
    }
    
    

}


// MARK: -UIPickerViewDelegate, UIPickerViewDataSource
extension ToDoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sections.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sections[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedSection = sections[row]
    }

}
