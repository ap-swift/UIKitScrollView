//
//  TableViewCell.swift
//  Table
//
//  Created by Артем Парфенов on 05.04.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    var device: ContentCell? {
        didSet {
            deviceImageView.image = device?.image
            titleLabel.text = device?.name
            elementDescription.text = device?.description
        }
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.backgroundColor = .white
        label.textColor = .black
        label.numberOfLines = 0 // 0 бесконечноть
//        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let elementDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.backgroundColor = .white
        label.textColor = .black
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.backgroundColor = .white
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let deviceImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubviews(deviceImageView, priceLabel, elementDescription, titleLabel)

        let constraints = [
            deviceImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            deviceImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12), // правый и нижний отступы с минусом
            deviceImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            deviceImageView.widthAnchor.constraint(equalToConstant: 100),
            deviceImageView.heightAnchor.constraint(equalToConstant: 160),

            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: deviceImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            elementDescription.topAnchor.constraint(equalTo: deviceImageView.topAnchor, constant: 35),
            elementDescription.leadingAnchor.constraint(equalTo: deviceImageView.trailingAnchor, constant: 10),
            elementDescription.widthAnchor.constraint(equalToConstant: 200),

            priceLabel.bottomAnchor.constraint(equalTo: deviceImageView.bottomAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2)
        ]

        NSLayoutConstraint.activate(constraints)
    }

}

extension UIView {
    func addSubviews (_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
