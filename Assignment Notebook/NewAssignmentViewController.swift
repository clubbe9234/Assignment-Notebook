//
//  NewAssignmentViewController.swift
//  Assignment Notebook
//
//  Created by Caroline Lubbe on 2/27/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class NewAssignmentViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var assignmentNameTextField: UITextField!
    @IBOutlet weak var classNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    
    var Assignments: [Assignment]!
    var newAssignment = Assignment(name: "", classFor: "", dueDate: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let assignmentName = assignmentNameTextField.text {
            newAssignment.name = assignmentName
            if let assignmentClassFor = classNameTextField.text {
                newAssignment.classFor = assignmentClassFor
                if let assignmentDueDate = dueDateTextField.text {
                    newAssignment.dueDate = assignmentDueDate
                    Assignments.append(newAssignment)
                    let vc = segue.destination as! ViewController
                    vc.newAssignment = newAssignment
                    vc.Assignments = Assignments
                }
            }
            
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let encoded = try? JSONEncoder().encode(Assignments) {
                UserDefaults.standard.set(encoded, forKey: "Assignments")
            } else {
                print("Encoding failed")
            }
        }
        
    }
    
