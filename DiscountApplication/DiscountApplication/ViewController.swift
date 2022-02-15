//
//  ViewController.swift
//  DiscountApplication
//
//  Created by Kolluru,Anurag on 2/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PriceField: UITextField!
    
    @IBOutlet weak var DiscountField: UITextField!
    
    @IBOutlet weak var DisplayLable: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func CalculateOnClick(_ sender: Any) {
        let value = Int(PriceField.text!)!*Int(DiscountField.text!)!
        let value2 = Double(exactly: value)!/100
        let value3 = Int(PriceField.text!)! - Int(value2)
        DisplayLable.text = "Discounted price is: \(value3)$"
        
    }
    

}

