//
//  ViewController.swift
//  Birthday Note Taker
//
//  Created by Atıl Samancıoğlu on 28/01/2017.
//  Copyright © 2017 Atıl Samancıoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var birthdayText: UITextField!
    @IBOutlet weak var storedNameLabel: UILabel!
    @IBOutlet weak var storedDateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            storedNameLabel.text = "Stored Name: \(newName)"
        }
        
        if let newDate = storedDate as? String {
            storedDateLabel.text = "Stored Date: \(newDate)"
        }
        
        
        
    }

    @IBAction func saveButtonClicked(_ sender: Any) {
        
        UserDefaults.standard.set(nameText.text, forKey: "name")
        UserDefaults.standard.set(birthdayText.text, forKey: "birthday")
        UserDefaults.standard.synchronize()
        
        storedNameLabel.text = "Stored Name: \(nameText.text!)"
        storedDateLabel.text = "Stored Date: \(birthdayText.text!)"
        
    }


    @IBAction func deleteButtonClicked(_ sender: Any) {
        
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "birthday")
        
        if let _ = storedName as? String {

            UserDefaults.standard.removeObject(forKey: "name")
            UserDefaults.standard.synchronize()
            storedNameLabel.text = "Stored Name: "
        
        }
        
        if let _ = storedDate as? String {
           
            UserDefaults.standard.removeObject(forKey: "birthday")
            UserDefaults.standard.synchronize()
            storedDateLabel.text = "Stored Date: "
            
        }
        
    }

}

