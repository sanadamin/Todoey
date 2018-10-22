//
//  ViewController.swift
//  Todoey
//
//  Created by Sanad Amin on 10/22/18.
//  Copyright © 2018 JoProg. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    
    let itemArray = ["find Mike","Buy Eggos","Go To Yasser"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        cell.labeltext.text = itemArray[indexPath.row]
        cell.imageViewLabel.image = UIImage(named: "umniah")
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
        
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    

}

