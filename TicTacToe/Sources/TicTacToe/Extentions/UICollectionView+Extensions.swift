//
//  File.swift
//  
//
//  Created by Bekzhan on 09.09.2024.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: T.self))
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reuseId = String(describing: T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? T else {
            fatalError("Could not dequeue collection cell with identifier: \(reuseId)")
        }
        return cell
    }
}
