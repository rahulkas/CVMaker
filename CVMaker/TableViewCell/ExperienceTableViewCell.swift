//
//  ExperienceTableViewCell.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class ExperienceTableViewCell: UITableViewCell {
@IBOutlet weak var projectDescriptionTextView: UITextView!
    @IBOutlet weak var headingProjectLabel: UILabel!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var projectNameTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var technologyTextField: UITextField!
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
        Utility.sharedInstance.customizeTextField(textField: projectNameTextField)
        Utility.sharedInstance.customizeTextField(textField: startDateTextField)
        Utility.sharedInstance.customizeTextField(textField: endDateTextField)
        Utility.sharedInstance.customizeTextField(textField: technologyTextField)
    }

}

