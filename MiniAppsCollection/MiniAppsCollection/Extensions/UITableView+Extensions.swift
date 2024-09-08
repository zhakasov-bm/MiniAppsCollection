//
//  UITableView+Extensions.swift
//  MiniAppsCollection
//
//  Created by Bekzhan on 08.09.2024.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue table cell with identifier: \(reuseId)")
        }
        return cell
    }
}
