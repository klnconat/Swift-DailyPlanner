import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    // FSCalendar tanımı
    var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar arka planı
        addStatusBarBackground()
        
        // Takvim bileşeni oluşturma
        setupCalendar()
        
        // Floating Button bileşeni oluşturma
        setupFloatingButton()
    }
    
    // MARK: - Status Bar Background
    private func addStatusBarBackground() {
        let statusBarBackground = UIView()
        statusBarBackground.backgroundColor = UIColor(named: "NavBarColor")
        statusBarBackground.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statusBarBackground)
        
        NSLayoutConstraint.activate([
            statusBarBackground.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statusBarBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statusBarBackground.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    // MARK: - FSCalendar Ayarları
    private func setupCalendar() {
        calendar = FSCalendar()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        calendar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendar)
        
        // Takvim renk ve stil ayarları
        calendar.appearance.headerTitleColor = UIColor.systemPink
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.selectionColor = UIColor.black
        calendar.appearance.todayColor = UIColor.systemPink
        calendar.appearance.eventDefaultColor = UIColor.blue
        calendar.appearance.eventSelectionColor = UIColor.red
        calendar.backgroundColor = UIColor(named: "NavBarColor")
        
        // Haftaların sayısını hesaplayarak dinamik yükseklik belirleme
        let currentDate = Date()
        let weeks = weeksInMonth(for: currentDate)
        let rowHeight: CGFloat = calendar.rowHeight
        let calendarHeight = rowHeight * CGFloat(weeks) + calendar.headerHeight + calendar.weekdayHeight
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calendar.heightAnchor.constraint(equalToConstant: calendarHeight)
        ])
    }
    
    private func weeksInMonth(for date: Date) -> Int {
        let calendar = Calendar.current
        let range = calendar.range(of: .weekOfMonth, in: .month, for: date)
        return range?.count ?? 0
    }
    
    // MARK: - Floating Button Ayarları
    private func setupFloatingButton() {
        let floatingButton = FloatingButton()
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Özelleştirme
        floatingButton.configure(icon: UIImage(systemName: "plus")!,
                                 backgroundColor: .buttonPrimary,
                                 tintColor: .white)
        
        view.addSubview(floatingButton)
        
        // Floating button konumlandırma
        NSLayoutConstraint.activate([
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            floatingButton.widthAnchor.constraint(equalToConstant: 60),
            floatingButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Tıklama işlemi
        floatingButton.addTarget(self, action: #selector(openNewTaskViewController), for: .touchUpInside)
    }
    
    @objc private func openNewTaskViewController() {
        performSegue(withIdentifier: "NewTask", sender: self)
    }
    
    // MARK: - FSCalendar Delegate
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.calendar.frame.size.height = bounds.height
        }
        self.view.layoutIfNeeded()
    }
}
