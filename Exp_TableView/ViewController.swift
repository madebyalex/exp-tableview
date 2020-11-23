//
//  ViewController.swift
//  Exp_TableView
//
//  Created by Alexander on 22.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
        
//        let cell = UITableViewCell()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dailyTasks[indexPath.row]
            cell.imageView?.image = UIImage(named: "clock2")
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
            cell.imageView?.image = UIImage(named: "calendar")
//            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.text = "Some details"
        
        case 2:
            cell.textLabel?.text = yearlyTasks[indexPath.row]
            cell.imageView?.image = UIImage(named: "globe-alt")
        default :
            cell.textLabel?.text = "This shouldn't happen ;)"
        }
        
//        cell.detailTextLabel?.textColor = .darkGray
        cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8045747264)
        
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
    
    let dailyTasks = [
        "Brush teeth and wash yourself",
        "Play with my kid",
        "Learn something new every day"
    ]
    
    let weeklyTasks = [
        "Learn web development",
        "Learn iOS development",
        "Do full-time and freelance jobs",
        "Clean the flat"
    ]
    
    let yearlyTasks = [
        "Learn new technologies",
        "Visit new countries",
        "Meet new good people",
        "Learn Spanish",
        "Launch personal project(s)"
    ]
    
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

