//
//  ExperienceViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class ExperienceViewController: BaseViewController {
    
    
    @IBOutlet weak var experienceTableView: UITableView!
    @IBOutlet var footerView: UIView!
    var cellCount : Int = 1
    var experienceViewModel : ExperienceViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        // Do any additional setup after loading the view.
    }
    
    func initialSetup(){
        self.navigationItem.title = "Experience details"
        setLeftNavigationItem(title: "Back")

        experienceTableView.delegate = self
        experienceTableView.dataSource = self
        saveDelegate = self
        experienceViewModel = ExperienceViewModel()
    }

    @IBAction func footerAddButtonTapped(_ sender: Any) {
        
        cellCount = cellCount == 4 ? cellCount : cellCount + 1
        reload(tableView: experienceTableView)
    }
    
    func reload(tableView: UITableView) {
        
        let contentOffset = tableView.contentOffset
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(contentOffset, animated: false)
        
    }
    
    func saveExperienceData(){
        experienceTableView?.visibleCells.forEach { cell in
            if let cell = cell as? ExperienceTableViewCell {
                for _ in 0..<cellCount {
                    
                    experienceViewModel?.companyName = cell.companyNameTextField.text
                    experienceViewModel?.projectName = cell.projectNameTextField.text
                    experienceViewModel?.startDate = cell.startDateTextField.text
                    experienceViewModel?.endDate = cell.endDateTextField.text
                    experienceViewModel?.technology = cell.technologyTextField.text
                    
                    experienceViewModel?.saveData()
                    
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }

}

extension ExperienceViewController : saveProtocol{
    func saveObject() {
        saveExperienceData()
    }
    
    func writeToUrl() {
        
    }
    
    
}

extension ExperienceViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footerView
    }
    
}

extension ExperienceViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceTableViewCell") as! ExperienceTableViewCell
        cell.headingProjectLabel.text = "Project " + String(indexPath.row+1)
        return cell
    }
    
    
}

