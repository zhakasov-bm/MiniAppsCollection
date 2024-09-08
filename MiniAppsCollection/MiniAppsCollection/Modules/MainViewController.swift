//
//  MainViewController.swift
//  MiniAppsCollection
//
//  Created by Bekzhan on 08.09.2024.
//

import UIKit

protocol IMainView: AnyObject {
    var presenter: IMainPresenter? { get set }
}

final class MainViewController: UIViewController {
    var presenter: IMainPresenter?
}

extension MainViewController: IMainView {
    
}
