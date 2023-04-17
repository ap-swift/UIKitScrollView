//
//  HeaderFooterView.swift
//  Table
//
//  Created by Артем Парфенов on 14.04.2023.
//

import UIKit

// кастомный title
class HeaderView: UITableViewHeaderFooterView {

    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()


    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        contentView.backgroundColor = .white

        contentView.addSubview(titleLabel)

        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ]

        NSLayoutConstraint.activate(constraints)
    }

}
