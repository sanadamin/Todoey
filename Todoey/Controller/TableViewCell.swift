//
//  TableViewCell.swift
//  Todoey
//
//  Created by Sanad Amin on 10/22/18.
//  Copyright © 2018 JoProg. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewLabel: UIImageView!
    @IBOutlet weak var labeltext: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
