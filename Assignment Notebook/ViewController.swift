//
//  ViewController.swift
//  Assignment Notebook
//
//  Created by Caroline Lubbe on 2/15/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var Assignments: [Assignment] = []
    
    var newAssignment: Assignment!
    
    var retrievedAssignment: Assignment!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
//        let assignmentOne = Assignment(name: "Read Chapter 7", classFor: "English", dueDate: "March 8")
//        let assignmentTwo = Assignment(name: "Math Page 2", classFor: "Math", dueDate: "March 7")
//        let assignmentThree = Assignment(name: "MEL-CON", classFor: "English", dueDate: "March 7")
//        Assignments.append(assignmentOne)
//        Assignments.append(assignmentTwo)
//        Assignments.append(assignmentThree)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
            let currentAssignmentName = Assignments[indexPath.row].name
            let currentAssignmentClass = Assignments[indexPath.row].classFor
            let currentAssignmentDueDate = Assignments[indexPath.row].dueDate
            cell.textLabel?.text = currentAssignmentName
            cell.detailTextLabel?.text = "Class: \(currentAssignmentClass), Due Date: \(currentAssignmentDueDate)"
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.Assignments.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navc = segue.destination as! NewAssignmentViewController
        navc.Assignments = Assignments
    }
    
    @IBAction func whenAddButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func whenReloadButtonPressed(_ sender: Any) {
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let object = UserDefaults.standard.data(forKey: "Assignments") {
                if let objectDecoded = try? JSONDecoder().decode(Array.self, from: object) as [Assignment] {
                    Assignments = objectDecoded
                }
            } else {
                print("Decoding failed")
            }
        tableView.reloadData()
    }
    
}
