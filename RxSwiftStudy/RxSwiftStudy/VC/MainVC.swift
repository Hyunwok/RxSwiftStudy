import UIKit
import FSCalendar

class MainVC: UIViewController {
    
    var dateArr = [String]()
    let holidayArr = ["2020-09-20"]
    let academicArr = ["2020-09-21"]
    let performanceArr = ["2020-09-22"]
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var asd: TimeScheduleXib!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendar()
        let button = UIButton(frame: CGRect(x: 40, y: 133, width: 30, height: 30))
        //button.setBackgroundImage(UIImage(contentsOfFile: "backward.end"), for: .normal)
        button.addTarget(self, action: #selector(previousBtn(_:)), for: .touchUpInside)
        self.view.addSubview(button)
        asd.isHidden = true

        self.tableView.tableFooterView = UIView.init(frame: .infinite)
        self.tableView.backgroundColor = UIColor(displayP3Red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        self.tableView.clipsToBounds = true
        self.tableView.layer.cornerRadius = 30
        self.tableView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    @IBAction func changeScheduleAndAcademicSchedule(_ sender: UIButton) {
        print("btn tap" )
        if sender.isSelected {
            calendarView.isHidden = true
            tableView.isHidden = true
            asd.isHidden = false
        } else {
            calendarView.isHidden = false
            tableView.isHidden = false
            asd.isHidden = true
        }
        sender.isSelected = !sender.isSelected
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        let key = self.dateFormatter.string(from: date)
        if self.holidayArr.contains(key) || self.academicArr.contains(key) || self.performanceArr.contains(key) {
//
        
            return UIColor.init(displayP3Red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        }
        return nil
    }
//
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        let dateString = self.dateFormatter.string(from: date)
//        if self.list.contains(dateString) {
//            return 1
//        }
//        return 0
//    }
//
//    func calendar(calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorForDate date: NSDate) -> UIColor? {
//        let dateString = self.
//        return
//    }
}

extension MainVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var height:CGFloat = self.tableView.rowHeight
        height = CGFloat(dateArr.count) * 44.5
        self.tableView.rowHeight = height
        return dateArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
    
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
        ca.headerMinimumDissolvedAlpha = CGFloat(200)
        calendarView.headerHeight = 70
        calendarView.weekdayHeight = 30
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


// 두번 터치하면 선택한 날짜 삭제
// 헤더 컬러 진하게
// 헤더랑 달력 날짜랑 거리 두게
//
