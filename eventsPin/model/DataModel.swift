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
        
        
        fakeDataGeneration()
        
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
    
    
    func fakeDataGeneration () {
        
      
        let pin1 = Pin()
        pin1.image = #imageLiteral(resourceName: "cake1.jpg")
        pin1.isDecided = true
        pin1.description = "Naked #cake"
    
        addPin(pin1)
        
        let pin2 = Pin()
        pin2.image = #imageLiteral(resourceName: "cake2.jpg")
        pin2.isDecided = true
        pin2.description = "Almost Naked #cake"
        
        addPin(pin2)

        let pin3 = Pin()
        pin3.image = #imageLiteral(resourceName: "cake3.jpg")
        pin3.isDecided = true
        pin3.description = "NOT Naked #cake #topper #corDeAline"
        
        addPin(pin3)
        
        let pin13 = Pin()
        pin13.image = #imageLiteral(resourceName: "cake2.jpg")
        pin13.isDecided = true
        pin13.description = "Almost Diferent Naked #cake"
        
        addPin(pin13)
        
        let pin12 = Pin()
        pin12.image = #imageLiteral(resourceName: "cake3.jpg")
        pin12.isDecided = true
        pin12.description = "More NOT Naked #cake #topper #corDeAline"
        
        addPin(pin12)

        
        let pin4 = Pin()
        pin4.image = #imageLiteral(resourceName: "colorPallette1.jpg")
        pin4.isDecided = true
        pin4.description = "Beach #colorPallette #orange #corDeAline"
        
        addPin(pin4)
        
        let pin5 = Pin()
        pin5.image = #imageLiteral(resourceName: "colorPallette2.jpg")
        pin5.isDecided = false
        pin5.description = "Ocean #colorPallette #blue"
        
        addPin(pin5)
        
        let pin6 = Pin()
        pin6.image = #imageLiteral(resourceName: "convite1.jpg")
        pin6.isDecided = false
        pin6.description = "#convite #Rustico"
        
        addPin(pin6)
        
        let pin7 = Pin()
        pin7.image = #imageLiteral(resourceName: "convite2.jpg")
        pin7.isDecided = true
        pin7.description = "#convite #classic #blue"
        
        addPin(pin7)
        
        let pin8 = Pin()
        pin8.image = #imageLiteral(resourceName: "convite3.jpg")
        pin8.isDecided = false
        pin8.description = "#convite #Rustico"
        addPin(pin8)
        
        let pin9 = Pin()
        pin9.image = #imageLiteral(resourceName: "portaGuardanapo.jpg")
        pin9.isDecided = true
        pin9.description = "#portaGuardanapo #Rustico  "
        
        addPin(pin9)

        let pin10 = Pin()
        pin10.image = #imageLiteral(resourceName: "portaGuardanapo2.jpg")
        pin10.isDecided = false
        pin10.description = "#portaGuardanapo #Classico #rosa #perolas"
        addPin(pin10)
        
        let pin11 = Pin()
        pin11.image = #imageLiteral(resourceName: "portaGuardanapo3.jpg")
        pin11.isDecided = false
        pin11.description = "um modelo de #portaGuardanapo #Rustico que minha mae odiou"
        
        addPin(pin11)

        
    }

}
