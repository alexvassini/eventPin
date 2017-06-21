//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func matches(for regex: String, in text: String) -> [String] {
    
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

let string = "#mimimi #mimi #lala aaa#a #TESTE #"

var strings = matches(for: "(\\s|^)#[^\\s]+", in: string)

var strings2 : [String] = []


strings.first

strings.removeFirst()

strings2.first


