//
//  ViewController.swift
//  Exp_TableView
//
//  Created by Alexander on 22.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // Create tasks array
    
    let dailyTasks = [
        Task(name: "Brush teeth and wash yourself", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Play with my kid", type: .daily, completed: true, lastCompleted: nil),
        Task(name: "Learn something new every day", type: .daily, completed: false, lastCompleted: nil)
    ]
    
    let weeklyTasks = [
        Task(name: "Learn web development", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Learn iOS development", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Do full-time and freelance jobs", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Clean the flat", type: .weekly, completed: false, lastCompleted: nil)
    ]
    
    let yearlyTasks = [
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row #\(indexPath.row) in section \(indexPath.section)")
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

