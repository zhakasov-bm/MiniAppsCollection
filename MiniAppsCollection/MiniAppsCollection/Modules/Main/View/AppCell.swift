//
//  AppCell.swift
//  MiniAppsCollection
//
//  Created by Bekzhan on 08.09.2024.
//

import UIKit

final class AppCell: UITableViewCell {
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "ic_flags")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        appImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().offset(8)
            make.width.equalTo(appImageView.snp.height)
        }
    }
    
    private func setupViews() {
        backgroundColor = .systemGray6
        contentView.backgroundColor = .systemGray6
        contentView.addSubview(containerView)
        containerView.addSubviews([appImageView, titleLabel])
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
            make.bottom.equalToSuperview().offset(-10)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(appImageView.snp.trailing).offset(32)
        }
    }
    
    func configure(with miniApp: MiniApp?) {
        guard let miniApp else { return }
        appImageView.image = miniApp.image
        titleLabel.text = miniApp.title
    }
}
