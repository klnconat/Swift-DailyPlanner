import UIKit

class PrimaryActionButton: UIButton {
    // Frame ile başlatma
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    // Storyboard veya XIB ile başlatma
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    // Butonun tasarımını ayarlayan yardımcı metod
    private func setupButton() {
        backgroundColor = UIColor(named: "ButtonPrimaryColor")
        layer.cornerRadius = 8
        setTitle("Get Started", for: .normal)
        setTitleColor(UIColor(named: "TitleColor"), for: .normal)
    }
    func configure(title: String) {
        setTitle(title, for: .normal)
    }
}
