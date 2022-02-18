//
//  SceneDelegate.swift
//  Kolluru_Calculator
//
//  Created by Kolluru,Anurag on 2/13/22.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLable: UILabel!
    
    var a = ""
    var b = ""
    var result = ""
    var op = ""
    var curnumber = ""
    var oChange = false
    var inCm = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func allC(_ sender: UIButton) {
        allClear()
    }
    func allClear(){
        a = ""
        b = ""
        oChange = false
        op = ""
        curnumber = ""
        displayLable.text = ""
        inCm = false
    }
    func set(_ number: String){
        if displayLable.text == "0"{
            displayLable.text = ""
        }
        else{
            if !oChange{
                displayLable.text! += number
                a += number
            }
            else{
                if !inCm{
                    displayLable.text! += number
                    b += number
                }
                else{
                    displayLable.text = ""
                    displayLable.text! += number
                    b += number
                }
            }
        }
    }
    
    func operations(_ operation:String)->String {
        if a != "" && b != ""{
            if operation == "+"{
                a = String(Double(a)! + Double(b)!)
                curnumber = b
                b = ""
                return String(a)
            }
            if operation == "-"{
                a = String((Double(a) ?? 0)! - Double(b)!)
                curnumber = b
                b = ""
                
                return String(a)
            }
            if operation == "*"{
                a = String(Double(a)! * Double(b)!)
                curnumber = b
                b = ""
                return String(a)
            }
            if operation == "/"{
                a = String(Double(a)! / Double(b)!)
                curnumber = b
                b = ""
                return String(a)
            }
            if operation == "%" {
                let x = Double(a)!
                let y = Double(b)!
                var z = x.remainder(dividingBy: y)
                a = String(z)
                curnumber = b
                b = ""
                return String(a)
            }
        }
        return ""
    }
    func formatResult(_ result:String)->String {
        let value = Double(result)!
        var resultStr = String(round(value * 100000) / 100000.0)
        
        if resultStr.contains(".0"){
            resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
        }
        
        return resultStr
}
    
    @IBAction func clear(_ sender: UIButton) {
        b = ""
        displayLable.text = ""
    }
    @IBAction func addOrSub(_ sender: UIButton) {
        if a == ""{
            displayLable.text = "-" + displayLable.text!
            a = "\(displayLable.text!)"
        }
        else{
            displayLable.text = "-" + displayLable.text!
            b = "\(displayLable.text!)"
        }
    }
    @IBAction func division(_ sender: UIButton) {
        let temp = operations(op)
        op = "/"
        displayLable.text = (temp != "") ? formatResult(temp) : ""
          if temp != "" {
              //            inChainmode = true
              if b != ""{
                  inCm = true
                  
                  if oChange {
                      result = String(Double(temp)! / Double(b)!)
                      print(result)
                      if result == "inf"{
                        displayLable.text! = "Error"
                      }else{
                        displayLable.text! = formatResult(result)
                      }
                  }
              }
          }
          oChange = true
        
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        let temp = operations(op)
        print("temp is \(temp)")
        op = "*"
        curnumber=""
        displayLable.text = (temp != "") ? formatResult(temp) : ""
         
        oChange = true
    }
    @IBAction func substraction(_ sender: UIButton) {
        let temp = operations(op)
        op = "-"
       displayLable.text = (temp != "") ? formatResult(temp) : ""
        if temp != "" {
            if b != ""{
                inCm = true
                curnumber = b;
                if oChange {
                    result = String(Double(temp)! - Double(b)!)
                   displayLable.text! = formatResult(result)
                }
            }
        }
        oChange = true
    }
    @IBAction func addition(_ sender: UIButton) {
        let temp = operations(op)
        print("temp is \(temp)")
        op = "+"
        curnumber=""
        displayLable.text = (temp != "") ? formatResult(temp) : ""
        oChange = true
    }
    
    @IBAction func equals(_ sender: UIButton) {
        var res = ""
        switch op {
        case "+":
            
            if curnumber != "" {
                res = String(Double(a)! + Double(curnumber)!)
                displayLable.text = formatResult(res)
                 b = curnumber
            }else{
                res = String(Double(a)! + Double(b)!)
                displayLable.text = formatResult(res)
            }
            a = res
            
            break
        case "*":
            if curnumber != "" {
                res = String(Double(a)! * Double(curnumber)!)
                displayLable.text = formatResult(res)
            }else{
                res = String(Double(a)! * Double(b)!)
                displayLable.text = formatResult(res)
            }
            a = res
            
            break
        case "-":
            if curnumber != "" {
                res = String(Double(a)! - Double(curnumber)!)
                displayLable.text = formatResult(res)
                
            }else{
                res = String(Double(a)! - Double(b)!)
                displayLable.text = formatResult(res)
               
            }
            a = res
            break
        case "/":
            if displayLable.text == "Error"{
                allClear()
            }else{
                if curnumber != "" {
                    res = String(Double(a)! / Double(curnumber)!)
                    if res == "inf"{
                        displayLable.text! = "Error"
                        return
                    }else{
                        displayLable.text = formatResult(res)
                    }
                }else{
                    res = String(Double(a)! / Double(b)!)
                    if res == "inf"{
                        displayLable.text! = "Error"
                        return
                    }else{
                        displayLable.text = formatResult(res)
                    }
                }
                a = res
            }
            break
        case "%":
            if curnumber != "" {
                displayLable.text = formatResult(res)
                let s1 = Double(a)!
                let s2 = Double(curnumber)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                 b = curnumber
            }else{
                let s1 = Double(a)!
                let s2 = Double(b)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                displayLable.text = formatResult(res)
            }
            a = res
            
            break
            
        default:
            print("IOS")
        }
    
    }
    
    @IBAction func remainder(_ sender: UIButton) {
        let temp = operations(op)
        print("temp is \(temp)")
        op = "%"
        curnumber=""
        displayLable.text = (temp != "") ? formatResult(temp) : ""
         
        oChange = true
    }
    @IBAction func dot(_ sender: UIButton) {
        set(".")
    }
    
    @IBAction func buttonSeven(_ sender: UIButton) {
        set("7")
    }
    @IBAction func buttonEight(_ sender: UIButton) {
        set("8")
    }
    
    @IBAction func buttonNine(_ sender: UIButton) {
        set("9")
    }
    @IBAction func buttonFour(_ sender: UIButton) {
        set("4")
    }
    
    @IBAction func buttonFive(_ sender: UIButton) {
        set("5")
    }
    @IBAction func buttonSix(_ sender: UIButton) {
        set("6")
    }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        set("1")
    }
    @IBAction func buttonTwo(_ sender: UIButton) {
        set("2")
    }
    @IBAction func buttonThree(_ sender: UIButton) {
        set("3")
    }
    @IBAction func buttonZero(_ sender: UIButton) {
        set("0")
    }
    
    
}


