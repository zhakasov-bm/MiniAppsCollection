//
//  MainViewController.swift
//  MiniAppsCollection
//
//  Created by Bekzhan on 08.09.2024.
//

import UIKit
import SnapKit

protocol IMainView: AnyObject {
    var presenter: IMainPresenter? { get set }
}

final class MainViewController: UIViewController {
    var presenter: IMainPresenter?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AppCell.self)
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemGray6
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension MainViewController: IMainView {
    
}

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AppCell = tableView.dequeueReusableCell(for: indexPath)
        let miniApp = presenter?.miniAppForIndexPath(indexPath)
        cell.configure(with: miniApp)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // For rotation state
        let screenHeight = max(view.frame.height, view.frame.width)
        return (screenHeight - 10 * 7) / 8
    }
}
