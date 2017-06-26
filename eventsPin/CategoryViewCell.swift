//
//  CategoryViewCell.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 21/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {
    
    

    @IBOutlet weak var tagLabel: UILabel!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
