import UIKit

class FloatingButton: UIButton {

    // Başlatıcılar
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    // Butonun tasarımını ayarlayan metod
    private func setupButton() {
        // Genel tasarım
        backgroundColor = .systemBlue
        tintColor = .white
        layer.cornerRadius = 30 // Butonu yuvarlak yapar
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4

        // Varsayılan ikon
        setImage(UIImage(systemName: "plus"), for: .normal)
    }

    // Dinamik yapılandırma için metod
    func configure(icon: UIImage, backgroundColor: UIColor, tintColor: UIColor) {
        setImage(icon, for: .normal)
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
    }
}
