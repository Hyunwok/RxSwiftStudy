//
//  MainVC.swift
//  RxSwiftStudy
//
//  Created by 이현욱 on 2020/08/03.
//  Copyright © 2020 이현욱. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    @IBOutlet var myView: UIView!
    @IBOutlet var MondayLblArr: [UILabel]!
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        self.myView.layer.cornerRadius = 20
    }
    
    func reloadData() {
        for idx in 0..<MondayLblArr.count {
            MondayLblArr[idx].text = String(idx)
        }
    }
}
