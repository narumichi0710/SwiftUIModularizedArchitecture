//
//  File.swift
//  
//
//  Created by Narumichi Kubo on 2022/12/22.
//

import Foundation

enum TutorialType {
    enum Step: Int {
        case one
        case two
        case three
        
        var toProgress: Double {
            switch self {
            case .one: return 0.33
            case .two: return 0.66
            case .three: return 1.0
            }
        }
    }
}
