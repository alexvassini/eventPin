//
//  Settings.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 26/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import Foundation
import UIKit

class Settings {
    
    var primaryColor: UIColor!
    var secondaryColor: UIColor!
    var cellSelectedColor: UIColor!
    var generalBackgroundColor: UIColor!
    
    init() {
        
        primaryColor = Constants.primaryColor
        secondaryColor = Constants.secondaryColor
        
        cellSelectedColor = Constants.cellSelectedColor
        generalBackgroundColor = Constants.generalBackgroundColor
        
    }
    
    
    
}
