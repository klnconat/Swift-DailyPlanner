//
//  AddNewTaskViewController.swift
//  DailyPlanner
//
//  Created by Farmlabs Agriculture Tech on 25.11.2024.
//

import UIKit

class AddNewTaskViewController: UIViewController, UINavigationBarDelegate {
    
    
    @IBOutlet weak var taskTitle: UILabel!
    var customTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTitle.text = customTitle
        
        let statusBarBackground = UIView()
        statusBarBackground.backgroundColor = UIColor(named: "NavBarColor") // Status bar arka plan rengi
        statusBarBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusBarBackground)
        
        // Auto Layout ile hizala
        NSLayoutConstraint.activate([
            statusBarBackground.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
        
        // UINavigationBar oluştur
        let navbar = UINavigationBar()
        navbar.barTintColor = UIColor(named: "NavBarColor")
        navbar.isTranslucent = false
        navbar.delegate = self
        
        // UINavigationItem ekle
        let navItem = UINavigationItem()
        
        // Sol Bar Button (Close Image)
        let closeImage = UIImage(systemName: "xmark")
        let closeButton = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(closeButtonTapped))
        closeButton.tintColor = .black
        
        // Başlık
        let titleText = NSMutableAttributedString(
            string: "New Task",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 18),
                .foregroundColor: UIColor.black // "New" kısmı siyah
            ]
        )
        titleText.addAttributes(
            [
                .foregroundColor: UIColor.systemPink // "Task" kısmı pembe
            ],
            range: NSRange(location: 4, length: 4) // "Task" kelimesinin konumu
        )
        let titleLabel = UILabel()
        titleLabel.attributedText = titleText
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()
        let titleBarButton = UIBarButtonItem(customView: titleLabel)
        
        // Sol bar öğelerine hem kapatma butonunu hem başlığı ekle
        navItem.leftBarButtonItems = [closeButton, titleBarButton]
        
        // UINavigationBar'a NavigationItem ekle
        navbar.items = [navItem]
        
        // Safe Area'ya ekle
        view.addSubview(navbar)
        navbar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navbar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor), // Safe Area'ya göre hizalanıyor
            navbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navbar.heightAnchor.constraint(equalToConstant: 44) // Standart UINavigationBar yüksekliği
        ])
    }
    
    // Sol buton için işlem
    @objc func closeButtonTapped() {
        print("Close button tapped")
        dismiss(animated: true, completion: nil)
    }
}
