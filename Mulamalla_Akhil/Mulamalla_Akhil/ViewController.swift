//
//  ViewController.swift
//  Mulamalla_Akhil
//
//  Created by Mulamalla,Akhil Kumar Reddy on 2/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var initialsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onClickOfSubmit(_ sender: UIButton) {
        var first = firstNameTextField.text!
        var last = lastNameTextField.text!
        let i1 = first.prefix(1)
        let i2 = last.prefix(1)
        fullNameLabel.text = "FullName: \(first), \(last)"
        initialsLabel.text = "Initials: \(i1)\(i2)"
    }
    
    
    @IBAction func onClickOfReset(_ sender: UIButton) {
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        fullNameLabel.text = ""
        initialsLabel.text = ""
        firstNameTextField.becomeFirstResponder()
        
    }
    

}

