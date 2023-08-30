//
//  DoneViewController.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/08/27.
//

import UIKit

class DoneViewController: UIViewController {

    @IBOutlet weak var doneTableView: UITableView!
    var f = F()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneTableView.delegate = self
        doneTableView.dataSource = self
        
        f.findDoneList()
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doneList.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoneCell", for: indexPath) as! DoneTableViewCell
        cell.doneLabel.text = doneList[indexPath.row].title
        cell.doneSwitch.isOn = doneList[indexPath.row].done
        return cell
    }
    
}
    

