//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by Andrew R Madsen on 8/11/18.
//  Copyright © 2018 Andrew R Madsen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
        setAppearances()
    }
    
    private func setAppearances() {
        view.backgroundColor = AppearanceHelper.backgroundBlue
        AppearanceHelper.style(label: nameLabel)
        AppearanceHelper.style(label: priorityLabel)
        AppearanceHelper.style(label: notesLabel)
        
        nameTextField.backgroundColor = AppearanceHelper.backgroundBlue
        nameTextField.textColor = .white
        nameTextField.layer.borderColor = UIColor.white.cgColor
        nameTextField.layer.borderWidth = 0.7
        nameTextField.layer.cornerRadius = 8.0
        nameTextField.font = AppearanceHelper.setUpFontAndSize(with: .caption1, size: 13, font: .fakeReceipt)
        
        notesTextView.backgroundColor = AppearanceHelper.backgroundBlue
        notesTextView.textColor = .white
        notesTextView.layer.borderColor = UIColor.white.cgColor
        notesTextView.layer.borderWidth = 0.7
        notesTextView.layer.cornerRadius = 8.0
        notesTextView.font = AppearanceHelper.setUpFontAndSize(with: .caption2, size: 12, font: .fakeReceipt)
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        
        let priorityIndex = priorityControl.selectedSegmentIndex
        let priority = TaskPriority.allPriorities[priorityIndex]
        let notes = notesTextView.text
        
        if let task = task {
            // Editing existing task
            taskController.update(task: task, with: name, notes: notes, priority: priority)
        } else {
            taskController.createTask(with: name, notes: notes, priority: priority)
        }

        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
                
        title = task?.name ?? "Create Task"
        nameTextField.text = task?.name
        let priority: TaskPriority
        if let taskPriority = task?.priority {
            priority = TaskPriority(rawValue: taskPriority)!
        } else {
            priority = .normal
        }
        priorityControl.selectedSegmentIndex = TaskPriority.allPriorities.firstIndex(of: priority)!
        notesTextView.text = task?.notes
    }
    
    // MARK: Properties
    
    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    var taskController: TaskController!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var priorityControl: UISegmentedControl!
    @IBOutlet var notesTextView: UITextView!
}
