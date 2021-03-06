//
//  Category.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 20/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import Foundation
import UIKit

class Category {
    
    
    var tag: String = ""
    var count: Int = 0
    var decided: [Pin] = []
    var inspiration: [Pin] = []
    
    
    func addPin (_ pin:Pin) {
        
        if pin.isDecided {
            
            self.decided.append(pin)
            
        }
            
        else {
            self.inspiration.append(pin)
            
        }
        self.count+=1
    }
    
}
