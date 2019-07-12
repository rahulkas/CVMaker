//
//  PersonalInfoViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class PersonalInfoViewController: BaseViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var dobTextField: UITextField!

    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!

    var personalInfoViewModel : PersonalInfoViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        
        saveDelegate = self
        setupTextFieldUI()
        mobileTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadViewData()
    }
    
    private func initialSetup(){
        personalInfoViewModel = PersonalInfoViewModel()
        self.navigationItem.title = "Personal Information"
        setLeftNavigationItem(title: "Back")
    }
    
    private func setupTextFieldUI(){
        Utility.sharedInstance.customizeTextField(textField: firstNameTextField)
        Utility.sharedInstance.customizeTextField(textField: lastNameTextField)
        Utility.sharedInstance.customizeTextField(textField: dobTextField)
        Utility.sharedInstance.customizeTextField(textField: mobileTextField)
        Utility.sharedInstance.customizeTextField(textField: emailTextField)
        Utility.sharedInstance.customizeTextField(textField: address1TextField)
        Utility.sharedInstance.customizeTextField(textField: address2TextField)
    }

    private func saveData() {
        
        personalInfoViewModel?.firstName = firstNameTextField.text
        personalInfoViewModel?.lastName = lastNameTextField.text
        personalInfoViewModel?.mobileNumber = mobileTextField.text
        personalInfoViewModel?.address1 = address1TextField.text
        personalInfoViewModel?.address2 = address2TextField.text
        personalInfoViewModel?.emailID = emailTextField.text
        personalInfoViewModel?.dob = dobTextField.text
        
        personalInfoViewModel?.saveData()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func loadViewData(){
        if var personalInfoViewModel = personalInfoViewModel{
            personalInfoViewModel.loadData()
            updateTextFields(personalInfoViewModel: personalInfoViewModel)
        }
    }
    
    private func updateTextFields(personalInfoViewModel : PersonalInfoViewModel){
        firstNameTextField.text = personalInfoViewModel.firstName
        lastNameTextField.text = personalInfoViewModel.lastName
        mobileTextField.text = personalInfoViewModel.mobileNumber
        address1TextField.text = personalInfoViewModel.address1
        address2TextField.text = personalInfoViewModel.address2
        emailTextField.text = personalInfoViewModel.emailID
        dobTextField.text = personalInfoViewModel.dob
    }

}

extension PersonalInfoViewController : saveProtocol{
    func saveObject() {
        saveData()
        print("Save Called")
    }
    
    func writeToUrl() {
        
    }
    
    
}
extension PersonalInfoViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,replacementString string: String)-> Bool{
        if(textField == mobileTextField)
        {
            if(string.isNumber){
                
                //To restrict only to enter 10 numberss
                let maxLength = 10
                let currentString: NSString = textField.text! as NSString
                let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
                return newString.length <= maxLength
            }
            else
            {
                return false
            }
        }
        return true
    }
}
