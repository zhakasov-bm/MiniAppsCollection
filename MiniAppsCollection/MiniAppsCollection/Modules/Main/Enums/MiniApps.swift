//
//  MiniApps.swift
//  MiniAppsCollection
//
//  Created by Bekzhan on 08.09.2024.
//

import UIKit

enum MiniApps {
    case weather
    case ticTacToe
    case flags
    
    var image: UIImage? {
        switch self {
        case .weather:
            return UIImage(named: "ic_weather")
        case .ticTacToe:
            return UIImage(named: "ic_tic_tac_toe")
        case .flags:
            return UIImage(named: "ic_flags")
        }
    }
    
    var title: String {
        switch self {
        case .weather:
            return "Weather App"
        case .ticTacToe:
            return "Tic Tac Toe"
        case .flags:
            return "World: Flags"
        }
    }
}
