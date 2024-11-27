//
//  WelcomeViewController.swift
//  DailyPlanner
//
//  Created by Farmlabs Agriculture Tech on 31.10.2024.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var sloganText: UILabel!
    @IBOutlet weak var getStartedText: UILabel!
    @IBOutlet weak var closeButtonImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Header Text Style Arrangement
        headerText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            headerText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])

        //Çok satırlı kullanım
        headerText.numberOfLines = 0
                
        // Birinci satır (Structured) için özellikler
        let firstPartAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "TextPrimaryColor")!,
            .font: UIFont.boldSystemFont(ofSize: 24),
        ]
        let firstPart = NSAttributedString(string: "Structured\n", attributes: firstPartAttributes)
        
        // İkinci satır (Structured) için özellikler
        let secondPartAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "TextPrimaryColor")!,
            .font: UIFont.boldSystemFont(ofSize: 24),
        ]
        let secondPart = NSAttributedString(string: "is a ", attributes: secondPartAttributes)
        
        // İkinci satır (Structured) için özellikler
        let thirdPartAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "ButtonPrimaryColor")!,
            .font: UIFont.boldSystemFont(ofSize: 24),
        ]
        let thirdPart = NSAttributedString(string: "Day Planner", attributes: thirdPartAttributes)
        
        let comptleteText = NSMutableAttributedString()
        comptleteText.append(firstPart)
        comptleteText.append(secondPart)
        comptleteText.append(thirdPart)
        
        headerText.attributedText = comptleteText
        
        // MARK: Slogan Text Arrangement
        sloganText.text = "Bring structure into our everyday life"
        sloganText.textColor = UIColor(named: "TextSecondaryColor")
        sloganText.font = .systemFont(ofSize: 15)
        
        // MARK: Get Started Text Arrangement
        getStartedText.text = "Get Started in just one minute - no account needed"
        getStartedText.textColor = UIColor(named: "TextSecondaryColor")
        getStartedText.font = .systemFont(ofSize: 15)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.closeButtonImageTapped))
        closeButtonImage.addGestureRecognizer(tapGesture)
        closeButtonImage.isUserInteractionEnabled = true
    }
    
    @objc func closeButtonImageTapped() {
        UserDefaults.standard.setValue(true, forKey: "hasLaunchBefore")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func getStartedButtonTapped(_ sender: PrimaryActionButton) {
        UserDefaults.standard.setValue(true, forKey: "hasLaunchBefore")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            mainVC.modalPresentationStyle = .fullScreen
            present(mainVC, animated: true, completion: nil)
        }
    }
    
}
