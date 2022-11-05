//
//  Model.swift
//  lesson2412
//
//  Created by ake11a on 2022-11-02.
//

import Foundation

protocol Informative {
    func getTitle() -> String
    func getInfo() -> String
}

struct Phone: Informative {
    func getInfo() -> String {
        return "IMEI: \(IMEI). Color: \(color)"
    }
    
    func getTitle() -> String {
        return model
    }
    
    var IMEI: String
    var color: String
    var model: String
}

struct Shoes: Informative {
    func getInfo() -> String {
        return "Type: \(type). Size: \(size)"
    }
    
    func getTitle() -> String {
        return brand
    }
    
    var type: String
    var size: Int
    var brand: String
}

struct Car: Informative {
    func getInfo() -> String {
        return "VIN: \(VIN). Model: \(model)"
    }
    
    func getTitle() -> String {
        return mark
    }
    
    var VIN: String
    var model: String
    var mark: String
}

enum BackgroundTheme: String, Informative {
    func getInfo() -> String {
        return "It`s a color"
    }
    
    case red = "Red"
    case green = "Green"
    case yellow = "Yellow"
    
    func getTitle() -> String {
        return self.rawValue
    }
}
