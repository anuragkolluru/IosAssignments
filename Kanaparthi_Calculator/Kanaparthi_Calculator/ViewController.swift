//
//  ViewController.swift
//  Kanaparthi_Calculator
//
//  Created by Kanaparthi,Naveen Kumar on 2/17/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLbl: UILabel!
    
    var n1 = ""
    var n2 = ""
    var res = ""
    var opr = ""
    var cNumber = ""
    var oprChange = false
    var inCMode = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ACL(_ sender: UIButton) {
        cAll()
    }
    func cAll(){
        n1 = ""
        n2 = ""
        oprChange = false
        opr = ""
        cNumber = ""
        displayLbl.text = ""
        inCMode = false
    }
    func sData(_ number: String){
        if displayLbl.text == "0"{
            displayLbl.text = ""
        }
        else{
            if !oprChange{
                displayLbl.text! += number
                n1 += number
            }
            else{
                if !inCMode{
                    displayLbl.text! += number
                    n2 += number
                }
                else{
                    displayLbl.text = ""
                    displayLbl.text! += number
                    n2 += number
                }
            }
        }
    }
    
    func cTemp(_ operation:String)->String {
        if n1 != "" && n2 != ""{
            if operation == "+"{
                n1 = String(Double(n1)! + Double(n2)!)
                cNumber = n2
                n2 = ""
                return String(n1)
            }
            if operation == "-"{
                n1 = String(Double(n1)! - Double(n2)!)
                cNumber = n2
                n2 = ""
                
                return String(n1)
            }
            if operation == "*"{
                n1 = String(Double(n1)! * Double(n2)!)
                cNumber = n2
                n2 = ""
                return String(n1)
            }
            if operation == "/"{
                n1 = String(Double(n1)! / Double(n2)!)
                cNumber = n2
                n2 = ""
                return String(n1)
            }
            if operation == "%" {
                let a1 = Double(n1)!
                let a2 = Double(n2)!
                var r = a1.remainder(dividingBy: a2)
                n1 = String(r)
                cNumber = n2
                n2 = ""
                return String(n1)
            }
        }
        return ""
    }
    func resFrmt(_ result:String)->String {
        let value = Double(result)!
        var resultStr = String(round(value * 100000) / 100000.0)
        
        if resultStr.contains(".0"){
            resultStr.removeSubrange(resultStr.index(resultStr.endIndex, offsetBy: -2)..<resultStr.endIndex)
        }
        
        return resultStr
}
    
    @IBAction func clr(_ sender: UIButton) {
        n2 = ""
        displayLbl.text = ""
    }
    @IBAction func plusOrMinus(_ sender: UIButton) {
        if n1 == ""{
            displayLbl.text = "-" + displayLbl.text!
            n1 = "\(displayLbl.text!)"
        }
        else{
            displayLbl.text = "-" + displayLbl.text!
            n2 = "\(displayLbl.text!)"
        }
    }
    @IBAction func divd(_ sender: UIButton) {
        let temp = cTemp(opr)
        opr = "/"
        displayLbl.text = (temp != "") ? resFrmt(temp) : ""
          if temp != "" {
              //            inChainmode = true
              if n2 != ""{
                  inCMode = true
                  
                  if oprChange {
                      res = String(Double(temp)! / Double(n2)!)
                      print(res)
                      if res == "inf"{
                        displayLbl.text! = "Error"
                      }else{
                        displayLbl.text! = resFrmt(res)
                      }
                  }
              }
          }
          oprChange = true
        
    }
    
    @IBAction func multy(_ sender: UIButton) {
        let temp = cTemp(opr)
        print("temp is \(temp)")
        opr = "*"
        cNumber=""
        displayLbl.text = (temp != "") ? resFrmt(temp) : ""
         
        oprChange = true
    }
    @IBAction func sub(_ sender: UIButton) {
        let temp = cTemp(opr)
        opr = "-"
       displayLbl.text = (temp != "") ? resFrmt(temp) : ""
        if temp != "" {
            if n2 != ""{
                inCMode = true
                cNumber = n2;
                if oprChange {
                    res = String(Double(temp)! - Double(n2)!)
                   displayLbl.text! = resFrmt(res)
                }
            }
        }
        oprChange = true
    }
    @IBAction func add(_ sender: UIButton) {
        let temp = cTemp(opr)
        print("temp is \(temp)")
        opr = "+"
        cNumber=""
        displayLbl.text = (temp != "") ? resFrmt(temp) : ""
        oprChange = true
    }
    
    @IBAction func eqls(_ sender: UIButton) {
        var res = ""
        switch opr {
        case "+":
            
            if cNumber != "" {
                res = String(Double(n1)! + Double(cNumber)!)
                displayLbl.text = resFrmt(res)
                 n2 = cNumber
            }else{
                res = String(Double(n1)! + Double(n2)!)
                displayLbl.text = resFrmt(res)
            }
            n1 = res
            
            break
        case "*":
            if cNumber != "" {
                res = String(Double(n1)! * Double(cNumber)!)
                displayLbl.text = resFrmt(res)
            }else{
                res = String(Double(n1)! * Double(n2)!)
                displayLbl.text = resFrmt(res)
            }
            n1 = res
            
            break
        case "-":
            if cNumber != "" {
                res = String(Double(n1)! - Double(cNumber)!)
                displayLbl.text = resFrmt(res)
                
            }else{
                res = String(Double(n1)! - Double(n2)!)
                displayLbl.text = resFrmt(res)
               
            }
            n1 = res
            break
        case "/":
            if displayLbl.text == "Error"{
                cAll()
            }else{
                if cNumber != "" {
                    res = String(Double(n1)! / Double(cNumber)!)
                    if res == "inf"{
                        displayLbl.text! = "Error"
                        return
                    }else{
                        displayLbl.text = resFrmt(res)
                    }
                }else{
                    res = String(Double(n1)! / Double(n2)!)
                    if res == "inf"{
                        displayLbl.text! = "Error"
                        return
                    }else{
                        displayLbl.text = resFrmt(res)
                    }
                }
                n1 = res
            }
            break
        case "%":
            if cNumber != "" {
                displayLbl.text = resFrmt(res)
                let s1 = Double(n1)!
                let s2 = Double(cNumber)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                 n2 = cNumber
            }else{
                let s1 = Double(n1)!
                let s2 = Double(n2)!
                var r = s1.remainder(dividingBy: s2)
                res = String(r)
                displayLbl.text = resFrmt(res)
            }
            n1 = res
            
            break
            
        default:
            print("IOS")
        }
    
    }
    
    @IBAction func rmdr(_ sender: UIButton) {
        let temp = cTemp(opr)
        print("temp is \(temp)")
        opr = "%"
        cNumber=""
        displayLbl.text = (temp != "") ? resFrmt(temp) : ""
         
        oprChange = true
    }
    @IBAction func dot(_ sender: UIButton) {
        sData(".")
    }
    
    @IBAction func button07(_ sender: UIButton) {
        sData("7")
    }
    @IBAction func button08(_ sender: UIButton) {
        sData("8")
    }
    
    @IBAction func button09(_ sender: UIButton) {
        sData("9")
    }
    @IBAction func button04(_ sender: UIButton) {
        sData("4")
    }
    
    @IBAction func button05(_ sender: UIButton) {
        sData("5")
    }
    @IBAction func button06(_ sender: UIButton) {
        sData("6")
    }
    
    @IBAction func button01(_ sender: UIButton) {
        sData("1")
    }
    @IBAction func button02(_ sender: UIButton) {
        sData("2")
    }
    @IBAction func button03(_ sender: UIButton) {
        sData("3")
    }
    @IBAction func button0(_ sender: UIButton) {
        sData("0")
    }
    
    
}


