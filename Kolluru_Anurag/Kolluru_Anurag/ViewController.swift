//
//  ViewController.swift
//  Kolluru_Anurag
//
//  Created by Kolluru,Anurag on 2/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var detailsLable: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var initialsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onClickOfSubmit(_ sender: UIButton) {
        
        var firstName = firstNameTextField.text!
        var lastName = lastNameTextField.text!
        let a1 = firstName.prefix(1)
        let a2 = lastName.prefix(1)
        fullNameLabel.text = "Full Name: \(firstName), \(lastName)"
        initialsLabel.text = "Initials: \(a1)\(a2)"
        detailsLable.text = "Details"
    }
    
    
    @IBAction func onClickOfReset(_ sender: UIButton) {
        firstNameTextField.text = " "
        lastNameTextField.text = " "
        detailsLable.text = " "
        fullNameLabel.text = " "
        initialsLabel.text = " "
        firstNameTextField.becomeFirstResponder()
        
    }
    

}

