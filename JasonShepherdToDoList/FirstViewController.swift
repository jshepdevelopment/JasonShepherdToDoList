//
//  FirstViewController.swift
//  JasonShepherdToDoList
//
//  Created by Jason Shepherd on 3/4/16.
//  Copyright © 2016 Salt Lake Community College. All rights reserved.
//
// Final Test

import UIKit

var toDoList = [String]()
var importanceFlag = [Int]()


class FirstViewController: UIViewController, UITableViewDelegate {

   var redImage : UIImage = UIImage(named: "red")!
    
    @IBOutlet weak var toDoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Synchs with permanent storage
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        if importanceFlag[indexPath.row] == 3 {
            cell.imageView!.image = redImage
        }
        
        //cell.textLabel?.text = toDoList[indexPath.row]
        cell.textLabel?.text = toDoList[indexPath.row] + "\(importanceFlag[indexPath.row])"
        

        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            // Remove from array
            toDoList.removeAtIndex(indexPath.row)
            
            // Update storage and reload
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
            toDoListTable.reloadData()
            
        }

    }

}

