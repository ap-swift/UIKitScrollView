//
//  ViewController.swift
//  Table
//
//  Created by Артем Парфенов on 05.04.2023.
//

import UIKit



class TableViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .plain)


    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        setupViews()
    }

    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self // для расширения
//         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTypeIdentifier")
        tableView.register(TableViewCell.self, forCellReuseIdentifier: String(describing: TableViewCell.self))
        tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: HeaderView.self))
        tableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: String(describing: FooterView.self))
    }

    func setupViews() {
        view.addSubview(tableView)

        let massiveOfConstraints = [
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ]
        NSLayoutConstraint.activate(massiveOfConstraints)
    }
}

extension TableViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Storage.sectionContent.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Storage.sectionContent[section].cellContent.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as! TableViewCell

        cell.device = Storage.sectionContent[indexPath.section].cellContent[indexPath.row]

       return cell
    }

    // используется кастомный title
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return Storage.sectionContent[section].title
//    }

//    // скрыто ниже в extension TableViewController: UITableViewDelegate
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        return Storage.sectionContent[section].footer
//    }
}

// если мы хотим скрыть футр или другие элементы то нужно воспользоваться UITableViewDelegate;
// чтобы сработало нужно указать делегата в viewDidLoad: tableView.delegate = self
extension TableViewController: UITableViewDelegate {

//    // высота футера
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return CGFloat.zero
//    }

    // убираем первый header
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        guard section != 0 else {  return .zero }
//        return UITableView.automaticDimension
//    }


    // кастомный title
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: HeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: HeaderView.self)) as! HeaderView

        headerView.title = Storage.sectionContent[section].title

        return headerView
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView: FooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: FooterView.self)) as! FooterView

        footerView.footer = Storage.sectionContent[section].footer

        return footerView
    }

    // обработка нажатия по ячейке
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print( "Click at \(indexPath)")
        let device = Storage.sectionContent[indexPath.section].cellContent[indexPath.row]

        let deviceDetailViewController = DeviceDetailViewController(device: device)
        navigationController?.pushViewController(deviceDetailViewController, animated: false)
//        present(deviceDetailViewController, animated: true)

    }
    
}
