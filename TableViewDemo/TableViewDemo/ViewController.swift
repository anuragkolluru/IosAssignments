//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Kolluru,Anurag on 3/29/22.
//

import UIKit

class product{
    var productName : String?
    var productCategory : String?
    
    init(productName: String, productCategory: String){
        self.productName = productName
        self.productCategory = productCategory
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        
        cell.textLabel?.text = productsArray[indexPath.row].productName
        
        return cell;
    }
    
    var productsArray = [product]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
        let product1 = product(productName: "MacBookAir", productCategory: "Laptop")
        productsArray.append(product1)
        
        let product2 = product(productName: "iPhone", productCategory: "Mobile Phone")
        productsArray.append(product2)
        
        let product3 = product(productName: "Airpods", productCategory: "Acessories")
        productsArray.append(product3)
        
        let product4 = product(productName: "iWatch", productCategory: "Acessories")
        productsArray.append(product4)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transistion = segue.identifier
        if transistion == "detailsSegue"{
            let destination = segue.destination as!
            DetailsViewController
            
            destination.product = productsArray[(tableViewOutlet.indexPathForSelectedRow?.row)!]
    
        }
    }


}


