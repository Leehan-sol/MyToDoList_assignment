//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import UIKit

class ToDoViewController: UIViewController {
    @IBOutlet weak var todoTableView: UITableView!
    var selectedSection: Int = 0
    let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: 250, height: 140))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        pickerFrame.delegate = self
        pickerFrame.dataSource = self
    }
    
    // addButton 클릭시 Section 선택
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        // 1) Picker View Alert
        let alert = UIAlertController(title: "Select a Section", message: "\n\n\n\n\n", preferredStyle: .alert)
        
        // 2) Select Action
        let selectAction = UIAlertAction(title: "Select", style: .default) { action in
            self.showMainAlert()
        }
        
        // 3) Add Action
        let addAction = UIAlertAction(title: "Add", style: .default) { action in
            
            // 3-1) Section Alert
            let sectionAlert = UIAlertController(title: "Add New Section", message: "", preferredStyle: .alert)
            
            // 3-2) Section Alert에 TextField 추가
            sectionAlert.addTextField { alertTextField in
                alertTextField.placeholder = "Write here"
                textField = alertTextField
            }
            
            // 3-3) Section Add Action
            let sectionAddAction = UIAlertAction(title: "Add", style: .default) { action in
                if let sectionName = textField.text {
                    let newEmptyList: [List] = []
                    sections.append(sectionName)
                    list.append(newEmptyList)
                    self.pickerFrame.reloadAllComponents()
                }
            }
            
            // 3-4) Section Cancel Action
            let sectionCancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            // 3-5) Alert add action
            sectionAlert.addAction(sectionAddAction)
            sectionAlert.addAction(sectionCancelAction)
            self.present(sectionAlert, animated: true)
        }
        
        // 4) Alert add pickerView, action
        alert.view.addSubview(pickerFrame)
        alert.addAction(selectAction)
        alert.addAction(addAction)
        present(alert, animated: true)
    }
    
    
    // Section 선택 후 ToDoList 추가
    func showMainAlert() {
        var textField = UITextField()
        
        // 1) Add TodoList Alert
        let mainAlert = UIAlertController(title: "Add ToDoList", message: "", preferredStyle: .alert)
        
        // 2) Main Add Action
        let mainAddAction = UIAlertAction(title: "Add", style: .default) { action in
            let newItem = List(title: textField.text!, done: false)
            list[self.selectedSection].append(newItem)
            self.todoTableView.reloadData()
        }
        
        // 3) Main Calcel Action
        let mainCancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        // 4) Alert에 TextField 추가
        mainAlert.addTextField { alertTextField in
            alertTextField.placeholder = "Write here"
            textField = alertTextField
        }
        
        // 5) Alert add action
        mainAlert.addAction(mainAddAction)
        mainAlert.addAction(mainCancelAction)
        present(mainAlert, animated: true)
    }
    
    
    // Switch OnOff시 Action
    @IBAction func switchOnOff(_ sender: UISwitch) {
        if let cell = sender.superview?.superview as? ToDoTableViewCell, let indexPath = todoTableView.indexPath(for: cell) {
            let item = list[indexPath.section][indexPath.row]
            let newItem = List(title: item.title, done: sender.isOn)
            if newItem.done == true {
                doneList.append(newItem)
                print("doneList: \(doneList)")
            } else {
                doneList.removeAll {$0.title == newItem.title}
                print("remove: \(doneList)")
            }
            // 스위치 상태 저장
            let switchKey = "SwitchState \(indexPath.section) \(indexPath.row)"
            UserDefaults.standard.set(sender.isOn, forKey: switchKey)
        }
    }
    
}




// MARK: -UITableViewDelegate
extension ToDoViewController: UITableViewDelegate{
    // 테이블뷰 row 선택시 애니메이션
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
        return list[section].count
    }
    
    // Row 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        cell.todoLabel.text = list[indexPath.section][indexPath.row].title
        cell.todoSwitch.isOn = list[indexPath.section][indexPath.row].done
        
        // 스위치 상태 불러옴
        let switchKey = "SwitchState \(indexPath.section) \(indexPath.row)"
        let switchState = UserDefaults.standard.bool(forKey: switchKey)
        cell.todoSwitch.isOn = switchState
        
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
        selectedSection = row
    }
    
}
