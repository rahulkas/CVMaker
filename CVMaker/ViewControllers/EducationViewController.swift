//
//  EducationViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class EducationViewController: BaseViewController {

    @IBOutlet weak var educationTableView: UITableView!
    @IBOutlet var footerView: UIView!
    var educationStackArray : [Int]?
    var cellCount : Int = 1
    var educationViewModel : EducationInfoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func initialSetup() {
        saveDelegate = self
        self.navigationItem.title = "Education Details"
        setLeftNavigationItem(title: "Back")
        educationTableView.delegate = self
        educationTableView.dataSource = self
        educationViewModel = EducationInfoViewModel()
    }
    
    @IBAction func footerAddButtonTapped(_ sender: Any) {
        
        cellCount = cellCount == 4 ? cellCount : cellCount + 1
        reload(tableView: educationTableView)
    }
    
    func reload(tableView: UITableView) {
        
        let contentOffset = tableView.contentOffset
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(contentOffset, animated: false)
        
    }
    
    func saveEducationData() {
        educationTableView?.visibleCells.forEach { cell in
            if let cell = cell as? EducationTableViewCell {
                for _ in 0..<cellCount {
                    
                    educationViewModel?.universsityName = cell.schoolUniversityTextField.text
                    educationViewModel?.courseName = cell.courseDegreeTextField.text
                    educationViewModel?.toDate = cell.endDateTextField.text
                    educationViewModel?.fromDate=cell.startDateTextField.text
                    
                    educationViewModel?.saveData()
                    
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }

}

extension EducationViewController : saveProtocol{
    func saveObject() {
        saveEducationData()
    }
    
    func writeToUrl() {
        
    }
    
    
}

extension EducationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Education Detail"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
}

extension EducationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EducationTableViewCell") as? EducationTableViewCell
        cell?.headingLabel.text = "Education " + String(indexPath.row+1)
        return cell!
    }
    
}
