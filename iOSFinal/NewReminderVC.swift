//
//  NewReminderVC.swift
//  iOSFinal
//
//  Created by Ankit Gusai on 15/12/22.
//

import UIKit

class NewReminderVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 2
    var selectedRow = 0
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var categoryBG: UIView!
    @IBOutlet weak var amountNameTF: UITextField!
    
    @IBOutlet weak var pickerViewButton: UIButton!
    
    
    @IBOutlet weak var noteTF: UITextView!
    @IBOutlet weak var timeTF: UITextField!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var dateBG: UIView!
    @IBOutlet weak var timeBG: UIView!
    @IBOutlet weak var amount: UILabel!
    var pickerData: [String] = ["Outgoing Pyyment", "Office Bills", "Consultant fees", "Booze", "Vacation", "Travel for Inspection"]
    
    
    @IBAction func selectCategory(_ sender: Any) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height:screenHeight))
        pickerView.dataSource = self
        pickerView.delegate = self
        
        pickerView.selectRow(selectedRow, inComponent: 0, animated: false)
        //pickerView.selectRow(selectedRowTextColor, inComponent: 1, animated: false)
        
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Select Background Colour", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = pickerViewButton
        alert.popoverPresentationController?.sourceRect = pickerViewButton.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (UIAlertAction) in
        }))
        
        alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { (UIAlertAction) in
            self.selectedRow = pickerView.selectedRow(inComponent: 0)
            
            self.pickerViewButton.setTitle(self.pickerData[self.selectedRow], for: .normal)
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        return pickerData[row]
    //    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        
        var label:UILabel
        
        if let v = view as? UILabel{
            label = v
        }
        else{
            label = UILabel()
        }
        label.backgroundColor = .white
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.font = UIFont(name: "Helvetica", size: 16)
        
        label.text = pickerData[row]
        
        return label
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Connect data:
        dateBG.layer.cornerRadius = 6
        timeBG.layer.cornerRadius = 6
        
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.maximumDate = Date()
        
        dateTF.inputView = datePicker
        //dateTF.text = formatDate(date: Date()) // todays Date
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        dateTF.inputAccessoryView = toolBar
        
        
        
        let timePicker = UIDatePicker()
        timePicker.datePickerMode = .time
        timePicker.addTarget(self, action: #selector(timeChange(datePicker:)), for: UIControl.Event.valueChanged)
        timePicker.frame.size = CGSize(width: 0, height: 300)
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.maximumDate = Date()
        
        timeTF.inputView = timePicker
        //timeTF.text = formatTime(date: Date()) // todays Date
        
        let toolBarForTime = UIToolbar()
        toolBarForTime.barStyle = .default
        toolBarForTime.isTranslucent = true
        let spaceForTime = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButtonForTime = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onClickDoneButton))
        toolBarForTime.setItems([spaceForTime, doneButtonForTime], animated: false)
        toolBarForTime.isUserInteractionEnabled = true
        toolBarForTime.sizeToFit()
        
        
        timeTF.inputAccessoryView = toolBarForTime
    }
    
    
    @objc func dateChange(datePicker: UIDatePicker)
    {
        dateTF.text = formatDate(date: datePicker.date)
    }
    
    
    @objc func timeChange(datePicker: UIDatePicker)
    {
        timeTF.text = formatTime(date: datePicker.date)
    }
    
    func formatDate(date: Date) -> String
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd yy"
        return formatter.string(from: date)
    }
    
    func formatTime(date: Date) -> String
    {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    //Toolbar done button function
    @objc func onClickDoneButton() {
        self.view.endEditing(true)
    }
    
    
        
    func prepareDataForUnwindSegue(){
        let reminderName = amountNameTF.text
        let category = pickerData[selectedRow]
        let dateSeletced = dateTF.text
        let timeSelected = timeTF.text
        let note = noteTF.text
    }
    
}
