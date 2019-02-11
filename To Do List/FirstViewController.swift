//
//  FirstViewController.swift
//  To Do List
//
//  Created by Chibuzor Ejimofor on 11/12/17.
//  Copyright © 2017 Chibuzor Ejimofor. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    var items:[String] = []
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewEditingStyle.Delete {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRows(at: [IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
     */
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items, forKey: "items")
        }
        
    }
    // Number of items in array
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    //Table content
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        //cell.textLabel?.text = items[indexPath.row] as! String
        var cellLabel = ""
        if let tempLabel = items[indexPath.row] as? String {
            cellLabel = tempLabel
        }
        cell.textLabel?.text = cellLabel
        return cell
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempItems = itemsObject as? [String] {
            items = tempItems
        }
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        }
}

