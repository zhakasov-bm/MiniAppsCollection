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
    
    private lazy var switchView: UISwitch = {
        let switchView = UISwitch()
        switchView.isOn = false
        switchView.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        return switchView
    }()
    
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
        view.addSubviews([switchView, tableView])
    }
    
    private func setupConstraints() {
        switchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(switchView.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func switchChanged() {
        UIView.animate(withDuration: 0.5) {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
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
        let height: CellHeight = switchView.isOn ? .half : .oneEight
        cell.configure(with: miniApp, height: height)
        cell.didStartTap = { [weak self] app in
            self?.navigateToApp(app)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CellHeight = switchView.isOn ? .half : .oneEight
        switch UIDevice.current.orientation {
        case .portrait, .portraitUpsideDown, .unknown:
            if cellHeight == .half {
                return view.frame.height / 2
            } else {
                return (view.frame.height - 10 * 7) / 8
            }
        default:
            if cellHeight == .half {
                return view.frame.height / 2
            } else {
                return (view.frame.width - 10 * 7) / 8
            }
        }
    }
    
    private func navigateToApp(_ app: MiniApp) {
        switch app {
        case .weather:
            break
        case .ticTacToe:
            break
        case .flags:
            break
        }
    }
}
