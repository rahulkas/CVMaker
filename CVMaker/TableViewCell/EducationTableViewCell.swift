//
//  EducationTableViewCell.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class EducationTableViewCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var courseDegreeTextField: UITextField!
    @IBOutlet weak var schoolUniversityTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
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
        Utility.sharedInstance.customizeTextField(textField: courseDegreeTextField)
        Utility.sharedInstance.customizeTextField(textField: schoolUniversityTextField)
        Utility.sharedInstance.customizeTextField(textField: startDateTextField)
        Utility.sharedInstance.customizeTextField(textField: endDateTextField)
    }

}
