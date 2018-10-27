//
//  ViewController.swift
//  Todoey
//
//  Created by Sanad Amin on 10/22/18.
//  Copyright © 2018 JoProg. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    
//    var itemArray = ["find Mike","Buy Eggos","Go To Yasser"]
    var itemArray = [Item]()
    
  
    let dataFilePath =     FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    
    
    
    let defautls = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        print(dataFilePath)
        
        let newItem = Item()
        newItem.title = "Go To Market"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Go To Pharmacy"
        newItem1.done = true
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Go To Yasser"
        itemArray.append(newItem2)
        
        
        
        loadItems()
        
        
       
//        if let  items = defautls.array(forKey: "ToDoListArray1") as? [Item]{
//                print(items)
//
////         itemArray = items
//
//        }
        
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil) ,forCellReuseIdentifier: "CuctomXib")
        configureTableView()
        tableView.separatorStyle = .none
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - Table View Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CuctomXib", for: indexPath) as! TableViewCell
        let item = itemArray[indexPath.row]
        
        
        
        cell.labeltext.text = itemArray[indexPath.row].title
        cell.imageViewLabel.image = UIImage(named: "umniah")
        
        
        cell.accessoryType = item.done == true ? .checkmark : .none
//
//        if item.done == true{
//            cell.accessoryType = .checkmark
//        }else{
//            cell.accessoryType = .none
//        }
//        tableView.separatorStyle = .none
        return cell
    }
    
    func configureTableView(){
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120.0
        
        
        
        
    }
    
    
    //MARK: TableView Delegate Methods "Do Something When Clicked"
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        let item = itemArray[indexPath.row]
        
        item.done = !item.done
        
        saveItems()
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: Add  new Item Method
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        
        let alert = UIAlertController(title: "Add New Todoey Item ", message: "please enter a new Item", preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //TODO: What will happen
            print("This is where everything is done!! \(textField.text!)")
            
            
            
            
            let newItem22 = Item()
            newItem22.title = textField.text!
            self.itemArray.append(newItem22)
//            self.defautls.set(self.itemArray, forKey: "ToDoListArray1")
            // Reloads the Tables Data
            self.saveItems()
            
            
            
            
            self.configureTableView()
            self.tableView.reloadData()
            
            
        }
        
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
            
            
        }
        
        present(alert,animated: true,completion: nil)
        
        
        
    }
    func saveItems(){
        
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        }catch{
            print("error happended with the follwoing: \(error)")
        }
        
    }
    
    
    
    func loadItems(){
        
        
        
       if let data = try? Data(contentsOf: dataFilePath!)
        {
            
            let decoder = PropertyListDecoder()
            do{
            itemArray = try decoder.decode([Item].self, from: data)
                
            }catch{
                
            }
        }
        
    }
    
}

