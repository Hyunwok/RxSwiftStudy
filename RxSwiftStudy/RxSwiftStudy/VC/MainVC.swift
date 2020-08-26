import UIKit
import FSCalendar

class MainVC: UIViewController {

    @IBOutlet weak var calendarView: FSCalendar!
    
    @IBOutlet var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myView.layer.cornerRadius = 20
        print(calendarView.currentPage)
        self.calendar()
    }
    
    @IBAction func previousBtn(_ sender: UIButton) {
        print("but tapped")
        let previous = Calendar.current.date(byAdding: .month, value: -1, to: calendarView.currentPage)!
        self.calendarView.setCurrentPage(previous, animated: true)
    }
}

extension MainVC {
    func calendar() {
        let ca = calendarView.appearance
        ca.headerMinimumDissolvedAlpha = 0.0;
        ca.eventOffset = CGPoint(x: 15, y: -35)
        ca.caseOptions = [.headerUsesUpperCase, .weekdayUsesSingleUpperCase]
        ca.headerDateFormat = "yyyy년 M월"
        ca.headerTitleColor = .black
        ca.weekdayTextColor = .black
        
    }
}
