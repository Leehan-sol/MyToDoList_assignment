//
//  DoneViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import UIKit

class DoneViewController: UIViewController {

    @IBOutlet weak var doneTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

   

}

// MARK: -UITableViewDelegate
extension DoneViewController: UITableViewDelegate{
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}


// MARK: -UITableViewDataSource
extension DoneViewController: UITableViewDataSource {
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
            return studyFinishList.count
        }
        return dailyFinishList.count
    }
    
    // Row 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        if indexPath.section == 0 {
            cell.todoLabel.text = studyFinishList[indexPath.row].title
        } else {
            cell.todoLabel.text = dailyFinishList[indexPath.row].title
        }
        
        return cell
    }
    
    
    
}
    
