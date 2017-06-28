//
//  Pin.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 20/06/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import Foundation
import UIKit

class Pin {
    
    var image : UIImage?
    
    var isDecided: Bool = false
    //var tag : String?
    var tags : [String] = []
    
    var description : String? {
        didSet{
            //Funçao magica que separa TAG e Subtag do description
            
            tagExtractor(description: description!)
            
        }
    }
    
    
    private func tagExtractor(description: String) {
        
        // Localizar todas as sub strings que começam com '#'
        // A primeira sera a TAG
        // As demais SubTags
        // Usar REGEX 
        self.tags.removeAll()
        
        self.tags = matches(for: "(\\s|^)#[^\\s]+", in: description)
        
        if self.tags.first == nil {
            
            let fillTag = "#other"
            
            self.tags.append(fillTag)
            
        }
            
        
        else {
            for i in 0..<self.tags.count {
                
                var tag = self.tags[i]
                
                if tag.characters.first == " " {
                    
                    tag.characters.removeFirst()
                    
                    self.tags[i] = tag
                }
            }

        }
        
        
        
        
    }
    
    private func matches(for regex: String, in text: String) -> [String] {
        
        
        
        do {
            
            let regex = try NSRegularExpression(pattern: regex)
            let nsString = text as NSString
            let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
            
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
    
    
}
