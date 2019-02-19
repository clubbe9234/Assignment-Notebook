//
//  ViewController.swift
//  Assignment Notebook
//
//  Created by Caroline Lubbe on 2/15/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var Assignments: [Assignment] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let assignmentOne = Assignment(name: "Read Chapter 4")
        let assignmentTwo = Assignment(name: "Worksheet 2.4")
        let assignmentThree = Assignment(name: "MEL-CON")
        Assignments = [assignmentOne, assignmentTwo, assignmentThree]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
            let currentAssignmentName = Assignments[indexPath.row].name
            cell.textLabel?.text = currentAssignmentName
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

