//
//  CompanyViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class CompanyViewController: BaseViewController {

    @IBOutlet var footerView: UIView!
    @IBOutlet weak var companyTableView: UITableView!
    var cellCount : Int = 1
    var companyViewModel : CompanyInfoViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
    }
    
    func initialSetup(){
        self.navigationItem.title = "Company Details"
        saveDelegate = self
        companyTableView.delegate = self
        companyTableView.dataSource = self
        setLeftNavigationItem(title: "Back")
        companyViewModel = CompanyInfoViewModel()
    }

    @IBAction func footerAddButtonTapped(_ sender: Any) {
        
        cellCount = cellCount == 4 ? cellCount : cellCount + 1
        reload(tableView: companyTableView)
    }
    
    func reload(tableView: UITableView) {
        
        let contentOffset = tableView.contentOffset
        tableView.reloadData()
        tableView.layoutIfNeeded()
        tableView.setContentOffset(contentOffset, animated: false)
        
    }
    
    func saveCompanyData(){
        companyTableView?.visibleCells.forEach { cell in
            if let cell = cell as? CompanyTableViewCell {
                for _ in 0..<cellCount {
                    
                    companyViewModel?.companyName = cell.companyNameTextField.text
                    companyViewModel?.experience = cell.experienceTextField.text
                    companyViewModel?.designation = cell.designationTextField.text
                    companyViewModel?.saveData()
                    
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }

}

extension CompanyViewController : saveProtocol{
    func saveObject() {
        saveCompanyData()
    }
    
    func writeToUrl() {
        
    }
    
    
}

extension CompanyViewController : UITableViewDelegate{
    
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

extension CompanyViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell") as! CompanyTableViewCell
        cell.headingCompanyLabel.text = "Company " + String(indexPath.row+1)
        return cell
    }
    
    
}
