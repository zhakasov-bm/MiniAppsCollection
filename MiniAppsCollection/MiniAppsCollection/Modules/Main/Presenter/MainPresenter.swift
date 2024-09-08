//
//  MainPresenter.swift
//  MiniAppsCollection
//
//  Created by Bekzhan on 08.09.2024.
//

import Foundation

protocol IMainPresenter: AnyObject {
    func numberOfRows() -> Int
    func miniAppForIndexPath(_ indexPath: IndexPath) -> MiniApp
}

final class MainPresenter: IMainPresenter {
    weak var view: IMainView?
    private let miniApps: [MiniApp] = [.weather, .ticTacToe, .flags, .weather, .ticTacToe, .flags, .weather, .ticTacToe, .flags, .flags]
    
    init(view: IMainView) {
        self.view = view
    }
    
    func numberOfRows() -> Int {
        return miniApps.count
    }
    
    func miniAppForIndexPath(_ indexPath: IndexPath) -> MiniApp {
        return miniApps[indexPath.row]
    }
}
