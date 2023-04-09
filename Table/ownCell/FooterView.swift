//
//  Footer.swift
//  Table
//
//  Created by Артем Парфенов on 15.04.2023.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {

    var footer: String? {
        didSet {
            footerLabel.text = footer
        }
    }

    private let footerLabel: UILabel = {
        let footer = UILabel()
        footer.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        footer.textColor = .black
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupViews() {
        contentView.backgroundColor = .yellow

        contentView.addSubview(footerLabel)

        let constraints = [
            footerLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            footerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            footerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6),
            footerLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ]

        NSLayoutConstraint.activate(constraints)
    }



}
