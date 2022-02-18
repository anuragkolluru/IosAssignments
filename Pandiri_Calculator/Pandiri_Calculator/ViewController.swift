//
//  ViewController.swift
//  Pandiri_Calculator
//
//  Created by Pandiri,Govinda R on 2/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var x = ""
    var y = ""
    var result = ""
    var operation = ""
    var currentNumber = ""
    var operationChange = false
    var mode = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func allClear(_ sender: UIButton) {
        allC()
    }
    func allC(){
        x = ""
        y = ""
        operationChange = false
        operation = ""
        currentNumber = ""
        display.text = ""
        mode = false
    }
    func data(_ number: String){
        if display.text == "0"{
            display.text = ""
        }
        else{
            if !operationChange{
                display.text! += number
                x += number
            }
            else{
                if !mode{
                    display.text! += number
                    y += number
                }
                else{
                    display.text = ""
                    display.text! += number
                    y += number
                }
            }
        }
    }
    
    func temp(_ operation:String)->String {
        if x != "" && y != ""{
            if operation == "+"{
                x = String(Double(x)! + Double(y)!)
                currentNumber = y
                y = ""
                return String(x)
            }
            if operation == "-"{
                x = String(Double(x)! - Double(y)!)
                currentNumber = y
                y = ""
                
                return String(x)
            }
            if operation == "*"{
                x = String(Double(x)! * Double(y)!)
                currentNumber = y
                y = ""
                return String(x)
            }
            if operation == "/"{
                x = String(Double(x)! / Double(y)!)
                currentNumber = y
                y = ""
                return String(x)
            }
            if operation == "%" {
                let s1 = Double(x)!
                let s2 = Double(y)!
                var r = s1.remainder(dividingBy: s2)
                x = String(r)
                currentNumber = y
                y = ""
                return String(x)
            }
        }
        return ""
    }
    func formatter(_ result:String)->String {
        let value = Double(result)!
        var resultStr = String(round(value * 100000) / 100000.0)
        
        if resultStr.contains(".0"){
            resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
        }
        
        return resultStr
}
    
    @IBAction func clear(_ sender: UIButton) {
        y = ""
        display.text = ""
    }
    @IBAction func pms(_ sender: UIButton) {
        if x == ""{
            display.text = "-" + display.text!
            x = "\(display.text!)"
        }
        else{
            display.text = "-" + display.text!
            y = "\(display.text!)"
        }
    }
    @IBAction func div(_ sender: UIButton) {
        let temp = temp(operation)
        operation = "/"
        display.text = (temp != "") ? formatter(temp) : ""
          if temp != "" {
              //            inChainmode = true
              if y != ""{
                  mode = true
                  
                  if operationChange {
                      result = String(Double(temp)! / Double(y)!)
                      print(result)
                      if result == "inf"{
                        display.text! = "Error"
                      }else{
                        display.text! = formatter(result)
                      }
                  }
              }
          }
          operationChange = true
        
    }
    
    @IBAction func mul(_ sender: UIButton) {
        let temp = temp(operation)
        print("temp is \(temp)")
        operation = "*"
        currentNumber=""
        display.text = (temp != "") ? formatter(temp) : ""
         
        operationChange = true
    }
    @IBAction func min(_ sender: UIButton) {
        let temp = temp(operation)
        operation = "-"
       display.text = (temp != "") ? formatter(temp) : ""
        if temp != "" {
            if y != ""{
                mode = true
                currentNumber = y;
                if operationChange {
                    result = String(Double(temp)! - Double(y)!)
                   display.text! = formatter(result)
                }
            }
        }
        operationChange = true
    }
    @IBAction func add(_ sender: UIButton) {
        let temp = temp(operation)
        print("temp is \(temp)")
        operation = "+"
        currentNumber=""
        display.text = (temp != "") ? formatter(temp) : ""
        operationChange = true
    }
    
    @IBAction func equ(_ sender: UIButton) {
        var res = ""
        switch operation {
        case "+":
            
            if currentNumber != "" {
                res = String(Double(x)! + Double(currentNumber)!)
                display.text = formatter(res)
                 y = currentNumber
            }else{
                res = String(Double(x)! + Double(y)!)
                display.text = formatter(res)
            }
            x = res
            
            break
        case "*":
            if currentNumber != "" {
                res = String(Double(x)! * Double(currentNumber)!)
                display.text = formatter(res)
            }else{
                res = String(Double(x)! * Double(y)!)
                display.text = formatter(res)
            }
            x = res
            
            break
        case "-":
            if currentNumber != "" {
                res = String(Double(x)! - Double(currentNumber)!)
                display.text = formatter(res)
                
            }else{
                res = String(Double(x)! - Double(y)!)
                display.text = formatter(res)
               
            }
            x = res
            break
        case "/":
            if display.text == "Error"{
                allC()
            }else{
                if currentNumber != "" {
                    res = String(Double(x)! / Double(currentNumber)!)
                    if res == "inf"{
                        display.text! = "Error"
                        return
                    }else{
                        display.text = formatter(res)
                    }
                }else{
                    res = String(Double(x)! / Double(y)!)
                    if res == "inf"{
                        display.text! = "Error"
                        return
                    }else{
                        display.text = formatter(res)
                    }
                }
                x = res
            }
            break
        case "%":
            if currentNumber != "" {
                display.text = formatter(res)
                let n1 = Double(x)!
                let n2 = Double(currentNumber)!
                var r = n1.remainder(dividingBy: n2)
                res = String(r)
                 y = currentNumber
            }else{
                let n1 = Double(x)!
                let n2 = Double(y)!
                var r = n1.remainder(dividingBy: n2)
                res = String(r)
                display.text = formatter(res)
            }
            x = res
            
            break
            
        default:
            print("IOS")
        }
    
    }
    
    @IBAction func remd(_ sender: UIButton) {
        let temp = temp(operation)
        print("temp is \(temp)")
        operation = "%"
        currentNumber=""
        display.text = (temp != "") ? formatter(temp) : ""
         
        operationChange = true
    }
    @IBAction func dot(_ sender: UIButton) {
        data(".")
    }
    
    @IBAction func but7(_ sender: UIButton) {
        data("7")
    }
    @IBAction func but8(_ sender: UIButton) {
        data("8")
    }
    
    @IBAction func but9(_ sender: UIButton) {
        data("9")
    }
    @IBAction func but4(_ sender: UIButton) {
        data("4")
    }
    
    @IBAction func but5(_ sender: UIButton) {
        data("5")
    }
    @IBAction func but6(_ sender: UIButton) {
        data("6")
    }
    
    @IBAction func but1(_ sender: UIButton) {
        data("1")
    }
    @IBAction func but2(_ sender: UIButton) {
        data("2")
    }
    @IBAction func but3(_ sender: UIButton) {
        data("3")
    }
    @IBAction func but0(_ sender: UIButton) {
        data("0")
    }
    
    
}

