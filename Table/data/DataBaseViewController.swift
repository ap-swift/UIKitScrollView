//
//  DataBaseViewController.swift
//  Table
//
//  Created by Артем Парфенов on 14.04.2023.
//

import UIKit


struct ContentCell {
    let name: String
    let image: UIImage
    let description: String
}

struct ContentSection {
    let title: String
    let cellContent: [ContentCell]
    let footer: String?
}

struct Storage {

    static let sectionContent: [ContentSection] = [
        ContentSection(
            title: "Macs",
            cellContent: [ContentCell(name: "Macbook Pro 16", image: UIImage(imageLiteralResourceName: "macBookPro16"), description: "For designers"),
                      ContentCell(name: "Macbook Pro 14", image: UIImage(imageLiteralResourceName: "macBookPro14"), description: "For developers")],
            footer: "macs"),
        ContentSection(
            title: "Iphones",
            cellContent: [ContentCell(name: "Iphone 14", image: UIImage(imageLiteralResourceName: "iPhone14"), description: "For rich"),
                      ContentCell(name: "iPhone 13", image: UIImage(imageLiteralResourceName: "iPhone13"), description: "For rich and clever")],
            footer: "iphones"),
        ContentSection(
            title: "Pods",
            cellContent: [ContentCell(name: "Airpods", image: UIImage(imageLiteralResourceName: "airpods"), description: "Gym"),
                      ContentCell(name: "MaxPods", image: UIImage(imageLiteralResourceName: "podMax"), description: "Relax")],
            footer: "pods")
    ]

}


