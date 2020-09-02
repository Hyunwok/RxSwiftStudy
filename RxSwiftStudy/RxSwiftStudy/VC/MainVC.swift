import UIKit
import FSCalendar

class MainVC: UIViewController {
    
    let holidayArr = [Date]()
    let academicArr = [Date]()
    let performanceArr = [Date]()

    @IBOutlet weak var vview: UIView!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var asd: TimeScheduleXib!
    @IBOutlet weak var AcademicShedule: UIView!
    @IBOutlet var myView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar()
        let button = UIButton(frame: CGRect(x: 40, y: 133, width: 30, height: 30))
        //button.setBackgroundImage(UIImage(contentsOfFile: "backward.end"), for: .normal)
        button.addTarget(self, action: #selector(previousBtn(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        asd.isHidden = true

        self.vview.clipsToBounds = true
        self.vview.layer.cornerRadius = 30
        self.vview.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    @IBAction func changeScheduleAndAcademicSchedule(_ sender: UIButton) {
        print("btn tap" )
        if sender.isSelected {
            AcademicShedule.isHidden = true
            asd.isHidden = false
        } else {
            AcademicShedule.isHidden = false
            asd.isHidden = true
        }
        sender.isSelected = !sender.isSelected
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let dateString = self.dateFormatter.string(from: date)
        if self.list.contains(dateString) {
            return 1
        }
        return 0
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
        calendarView.today = nil
        calendarView.placeholderType = .none
    }
    
    @objc func previousBtn(_ sender: UIButton) {
        let previous = Calendar.current.date(byAdding: .month, value: -1, to: calendarView.currentPage)!
        self.calendarView.setCurrentPage(previous, animated: true)
    }
    
    @objc func nextBtn(_ sender: UIButton) {
        let next = Calendar.current.date(byAdding: .month, value: +1, to: calendarView.currentPage)!
        self.calendarView.setCurrentPage(next, animated: true)
    }
}
