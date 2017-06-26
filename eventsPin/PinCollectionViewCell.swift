//
//  PinCollectionViewCell.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 23/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import UIKit

class PinCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pinImage: UIImageView!
    
    @IBOutlet weak var pinDescription: UILabel!
    
    @IBOutlet weak var view: UIView!
    
    
    override func awakeFromNib() {
        
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.30
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 2
        view.layer.shouldRasterize = false
        view.layer.cornerRadius = 4
        
    }
    
    
}
