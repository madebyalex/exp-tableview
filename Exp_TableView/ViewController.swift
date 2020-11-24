//
//  ViewController.swift
//  Exp_TableView
//
//  Created by Alexander on 22.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var itemsTableView: UITableView!
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
            itemsTableView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.9)
            
        } else {
            view.backgroundColor = UIColor.white
            itemsTableView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        }
    }
    
    var isClearList: Bool = true
    
    @IBAction func resetTasks(_ sender: Any) {
        
        let confirm = UIAlertController(title: "Reset tasks", message: "Do you want to make all of your tasks as not completed? You can't undo this.", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes, reset my list", style: .destructive) { action in
            for i in 0..<self.dailyTasks.count {
                self.dailyTasks[i].completed = false
            }
            
            for i in 0..<self.weeklyTasks.count {
                self.weeklyTasks[i].completed = false
            }
            
            for i in 0..<self.yearlyTasks.count {
                self.yearlyTasks[i].completed = false
            }
            
            self.itemsTableView.reloadData()
        }

        let noAction = UIAlertAction(title: "No", style: .cancel) {
            action in
            print("That was a close one!")
        }
        
        let nothingToClear = UIAlertController(title: "Nothing to clear", message: "Currently you haven't mark any task as done yet", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { action in
            print("Nothing to clear")
        }
        
        // Add actions to the alert controller
        confirm.addAction(yesAction)
        confirm.addAction(noAction)
        
        // Add an action to the alert controller if nothing to clear
        nothingToClear.addAction(okAction)
        
        // Check if there is some task marked as completed
        for i in 0..<dailyTasks.count {
            if dailyTasks[i].completed {
                isClearList = false
            }
        }
        
        for i in 0..<weeklyTasks.count {
            if weeklyTasks[i].completed {
                isClearList = false
            }
        }
        
        for i in 0..<yearlyTasks.count {
            if yearlyTasks[i].completed {
                isClearList = false
            }
        }
        
        
        // Show it
        if !isClearList {
            present(confirm, animated: true, completion: nil)
        } else {
            present(nothingToClear, animated: true, completion: nil)
        }
        
        print("Is the task list is clear? --> \(isClearList)")
    }
    
    // Create tasks array
    
    var dailyTasks = [
        Task(name: "Brush teeth and wash yourself", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Play with my kid", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Learn something new every day", type: .daily, completed: false, lastCompleted: nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Learn web development", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Learn iOS development", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Do full-time and freelance jobs", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Clean the flat", type: .weekly, completed: false, lastCompleted: nil)
    ]
    
    var yearlyTasks = [
        Task(name: "Learn new technologies", type: .yearly, completed: false, lastCompleted: nil),
        Task(name: "Visit new countries", type: .yearly, completed: false, lastCompleted: nil),
        Task(name: "Meet new good people", type: .yearly, completed: false, lastCompleted: nil),
        Task(name: "Learn Spanish", type: .yearly, completed: false, lastCompleted: nil),
        Task(name: "Launch personal project(s)", type: .yearly, completed: false, lastCompleted: nil)
    ]
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1.00)
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return yearlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
            cell.imageView?.image = UIImage(named: "clock2")
        case 1:
            currentTask = weeklyTasks[indexPath.row]
            cell.imageView?.image = UIImage(named: "calendar")
            cell.detailTextLabel?.text = "Some details"
        
        case 2:
            currentTask = yearlyTasks[indexPath.row]
            cell.imageView?.image = UIImage(named: "globe-alt")
        default :
            cell.textLabel?.text = "This shouldn't happen ;)"
        }
        
        cell.textLabel?.text = currentTask.name
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8045747264)
        
        
        if currentTask.completed {
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = UIColor.gray
            
        } else {
            cell.accessoryType = .none
            cell.textLabel?.textColor = UIColor.black
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily tasks"
        case 1:
            return "Weekly tasks"
        case 2:
            return "Yearly tasks"
        default :
            return nil
        }
    }
    
    
    // Table View Delegate Methods
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You selected row #\(indexPath.row) in section \(indexPath.section)")
//    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeActionLeading = UIContextualAction(style: .destructive, title: "Delete") { (action: UIContextualAction, sourceView: UIView, actionPerformed: (Bool) -> Void) in
            print("Remove task")
            
            switch indexPath.section {
            case 0:
                self.dailyTasks.remove(at: indexPath.row)
            case 1:
                self.weeklyTasks.remove(at: indexPath.row)
            case 2:
                self.yearlyTasks.remove(at: indexPath.row)
            default:
                break
            }
            
            tableView.reloadData()
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeActionLeading])
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let completeAction = UIContextualAction(style: .normal, title: "Complete") { (action:UIContextualAction, sourceView:UIView, actionPerformed:(Bool) -> Void) in
            
            // Find the right object and set it to completed
            switch indexPath.section {
            case 0:
                self.dailyTasks[indexPath.row].completed = !self.dailyTasks[indexPath.row].completed
            case 1:
                self.weeklyTasks[indexPath.row].completed = !self.weeklyTasks[indexPath.row].completed
            case 2:
                self.yearlyTasks[indexPath.row].completed = !self.yearlyTasks[indexPath.row].completed
            default:
                break
            
            }
            
            tableView.reloadData()
            
            actionPerformed(true)
        }
        
        return UISwipeActionsConfiguration(actions: [completeAction])

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

