//
//  MainPresenter.swift
//  MiniAppsCollection
//
//  Created by Bekzhan on 08.09.2024.
//

import Foundation

protocol IMainPresenter: AnyObject {
    
}

final class MainPresenter: IMainPresenter {
    weak var view: IMainView?
    
    init(view: IMainView) {
        self.view = view
    }
}
