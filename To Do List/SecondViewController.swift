//
//  SecondViewController.swift
//  To Do List
//
//  Created by Chibuzor Ejimofor on 11/12/17.
//  Copyright © 2017 Chibuzor Ejimofor. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemField: UITextField!
    
    @IBAction func addButton(_ sender: AnyObject) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items:[String] = []
        if let tempItems = itemsObject as? [String] {
            items = tempItems
            items.append(itemField.text!)
        } else {
            items = [itemField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        itemField.text = ""
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

