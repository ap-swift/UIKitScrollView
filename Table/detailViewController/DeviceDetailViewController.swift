//
//  DeviceDetailViewController.swift
//  Table
//
//  Created by Артем Парфенов on 15.04.2023.
//
// Здесь будем создавать scroll для каждой ячейки таблицы

import UIKit

class DeviceDetailViewController: UIViewController {

    private let scrollView = UIScrollView()


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
//        label.backgroundColor = .white
        label.textColor = .black
//        label.numberOfLines = 3
        label.numberOfLines = 0
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

    private lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("BUY", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.yellow, for: .selected)
        button.setTitleColor(.yellow, for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.alfa(0.8), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pixel")?.alfa(0.8), for: .highlighted)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true // я хочу маскировать все слои которые выходят за основной слой (setBackgroundImage)
        // обработчик нажатий; self - это значит что мы смотрим в наш класс и ищем функцию обработки нажатия в нем же
        button.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let wrapperView = UIView()

    private let device: ContentCell

    init(device: ContentCell) {
        self.device = device
        super.init(nibName: nil, bundle: nil)

        configure() // чтобы отображать картинку
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = device.name
        view.backgroundColor = .white // без этого не видно загаловок
        setupViews()
    }

    // Клавиатура
    // Keyboard observers - для отслеживания методов keyBoardWillShow и keyBoardWillHide
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    override func viewDidDisappear(_ animated: Bool) { // удаляет observers когда исчезает экран
//        super.viewDidDisappear(animated)
//
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//    @objc fileprivate func keyBoardWillShow(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            scrollView.contentInset.bottom = keyboardSize.height
//            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
//        }
//    }
//
//    @objc fileprivate func keyBoardWillHide(notification: NSNotification) {
//        scrollView.contentInset.bottom = .zero
//        scrollView.verticalScrollIndicatorInsets = .zero
//    }


    override func viewWillLayoutSubviews() { // для проверки размера
        print("размер конента", scrollView.contentSize)
    }

    // обработчик нажатий для кнопки
    @objc private func buyButtonPressed() {
        print("Pressed")
    }

    private func configure() {
        deviceImageView.image = device.image
        titleLabel.text = device.name
        elementDescription.text = device.description
    }

    private func setupViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(wrapperView) // добавляем view на scrollview
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubviews(deviceImageView, titleLabel, elementDescription, priceLabel, buyButton)
        scrollView.delegate = self
//        scrollView.contentInsetAdjustmentBehavior = .automatic  в некоторых проектах может использоваться это свойства для отступа
       //  scrollView.showsVerticalScrollIndicator = false

        let constraints = [
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            wrapperView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            // так как scrollview тянется во все стороны, то нужно ее ограничить по ширине через wrapperView
            wrapperView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            deviceImageView.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 24),
            deviceImageView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 24),
            deviceImageView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -24),
            deviceImageView.heightAnchor.constraint(equalTo: deviceImageView.widthAnchor),

            titleLabel.topAnchor.constraint(equalTo: deviceImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -24),
            // так как мы ограничили titleLabel по ширине он будет тянуться по высоте, поэтому не нужно задавать bottomAnchor

            elementDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            elementDescription.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 24),
            elementDescription.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -24),

            buyButton.topAnchor.constraint(equalTo: elementDescription.bottomAnchor, constant: 16),
            buyButton.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 24),
            buyButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -24),
            buyButton.heightAnchor.constraint(equalToConstant: 44),
            buyButton.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -16)
        ]
        NSLayoutConstraint.activate(constraints)
    }

}

extension DeviceDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("content offset \(scrollView.contentOffset.y)") // расстояние на которое проскролили контент
    }
}

// чтобы менять прозрачность у картинки, которая используется для фона кнопки при нажатии
extension UIImage {
    func alfa(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
