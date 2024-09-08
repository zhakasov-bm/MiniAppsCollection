//
//  File.swift
//  
//
//  Created by Bekzhan on 09.09.2024.
//

import UIKit

public class TicTacToe {
    
    private let ticTacToeViewController = TicTacToeViewController()
    
    public init() {
        
    }
    
    public func launchGame(navVc: UINavigationController) {
        navVc.pushViewController(ticTacToeViewController, animated: true)
    }
    
    public func dismissGame() {
       
    }
}
