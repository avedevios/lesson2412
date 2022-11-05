//
//  Model.swift
//  lesson2412
//
//  Created by ake11a on 2022-11-02.
//

import Foundation

protocol Informative {
    func getTitle() -> String
}

struct Phone: Informative {
    func getTitle() -> String {
        return model
    }
    
    var model: String
}

struct Shoes: Informative {
    func getTitle() -> String {
        return brand
    }
    
    var brand: String
}

struct Car: Informative {
    func getTitle() -> String {
        return mark
    }
    
    var mark: String
}

enum BackgroundTheme: String, Informative {
    case red = "Red"
    case green = "Green"
    
    func getTitle() -> String {
        return self.rawValue
    }
}
