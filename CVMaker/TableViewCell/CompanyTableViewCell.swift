//
//  CompanyTableViewCell.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {

    @IBOutlet weak var headingCompanyLabel: UILabel!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var designationTextField: UITextField!
    @IBOutlet weak var experienceTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupTextFieldUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupTextFieldUI(){
        Utility.sharedInstance.customizeTextField(textField: companyNameTextField)
        Utility.sharedInstance.customizeTextField(textField: designationTextField)
        Utility.sharedInstance.customizeTextField(textField: experienceTextField)
    }
}
