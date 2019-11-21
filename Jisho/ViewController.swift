//
//  ViewController.swift
//  JSON
//
//  Created by Rei Sturm on 8/26/19.
//  Copyright © 2019 Rei Sturm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var userInquiry = ""
    
    @IBOutlet weak var field: UITextField!
    
    @IBAction func info(_ sender: UIButton) {
        performSegue(withIdentifier: "info", sender: self)
    }
    
    @IBAction func submitButton(_ sender: Any) {
//        viewTapped()
        self.userInquiry = field.text!
        performSegue(withIdentifier: "name", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "name" {
            print("loading details")
            let vc = segue.destination as! KanjiViewController
            vc.userInput = self.userInquiry
        } else if segue.identifier == "info" {
            print("info")
        }
    }
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        field.delegate = self
        
        let tapRecogniser = UITapGestureRecognizer()
        tapRecogniser.addTarget(self, action: #selector(self.viewTapped))
        self.view.addGestureRecognizer(tapRecogniser)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == field {
            textField.resignFirstResponder()
        }
        return true
    }
    
    @objc func viewTapped() {
        self.view.endEditing(true)
    }

}

