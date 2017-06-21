//
//  DataModel.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 20/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import Foundation
import UIKit


class DataModel {
    
    static let shared = DataModel()
    
    var categories: [Category] = []
    
    fileprivate init() {
        
        
        
        
    }
    
    func fakeDataGeneration () -> [Category] {
        
        var categories: [Category] = []
        
        return categories
        
    }
    
    func addPin(_ pin: Pin) {
        
        for category in categories {
            
            if category.tag == pin.tag{
                
               category.addPin(pin)
                return
            }
            
        }
        
        var category = Category()
        
        category.tag = pin.tag!
        category.addPin(pin)
        
        self.categories.append(category)

        
    }
    
}
