//
//  Teams.swift
//  UIKitMVVM
//
//  Created by Swayam Rustagi on 29/07/24.
//

import UIKit

enum TeamType {
    case dog
    case giraffe
    case monkey
    case lion
    case panda
    case peacock
    case squirrel

}

extension TeamType {
    
    var image: UIImage {
        switch self {
        case .dog:
            return UIImage(named: "dog")!
        case .giraffe:
            return UIImage(named: "giraffe")!
        case .monkey:
            return UIImage(named: "monkey")!
        case .lion:
            return UIImage(named: "lion")!
        case .panda:
            return UIImage(named: "panda")!
        case .peacock:
            return UIImage(named: "peacock")!
        case .squirrel:
            return UIImage(named: "squirrel")!
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .dog:
            return UIColor(named: "indigo")!
        case .giraffe:
            return UIColor(named: "yellow")!
        case .monkey:
            return UIColor(named: "orange")!
        case .lion:
            return UIColor(named: "blue")!
        case .panda:
            return UIColor(named: "black")!
        case .peacock:
            return UIColor(named: "green")!
        case .squirrel:
            return UIColor(named: "gray")!
        }
    }
    
    var name: String {
        switch self {

        case .lion:
            return "Lion"
        case .dog:
            return "dog"
        case .giraffe:
            return "giraffe"
        case .monkey:
            return "monkey"
        case .panda:
            return "panda"
        case .peacock:
            return "peacock"
        case .squirrel:
            return "squirrel"
        }
    }
}
