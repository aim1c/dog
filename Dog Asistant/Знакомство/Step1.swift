//
//  ViewController.swift
//  Dog Asistant
//
//  Created by Alexander Volkov on 24/06/2019.
//  Copyright © 2019 Alexander Volkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

	// Вопросы
	@IBOutlet weak var HowYourDogName: UILabel!
	@IBOutlet weak var HowOldDog: UILabel!
	@IBOutlet weak var WitchtypeDog: UILabel!
	// Поля для ответов
	@IBOutlet weak var Sdp: UISwitch!
	@IBOutlet weak var TextFieldNameDog: UITextField!
	@IBOutlet weak var TextFieldOldDog: UITextField!
	// Поле для ответов с выбором вариантов
	@IBOutlet weak var ChooseTypeDog: UITextField!
	// Switch для выбора собаки или щенка
	@IBOutlet weak var Go: UIButton!
	
	@IBAction func SaveStep1(_ sender: UIButton) {
		let mdp : [[String : Any]] = [["name" : TextFieldNameDog.text!], ["old" : Int(TextFieldOldDog.text!)!], ["sdp" : Sdp.isOn], ["breed" : ChooseTypeDog.text!]];
		UserDefaults.standard.set(mdp, forKey: "step1data");
		UserDefaults.standard.synchronize();
		print("\(mdp)");
	}
	
	
	@IBAction func Sw(_ sender: UISwitch) {
		if sender.isOn {
			replaceTextForPuppy(HowYourDogName, HowOldDog, WitchtypeDog);
		} else {
			replaceTextForDog(HowYourDogName, HowOldDog, WitchtypeDog);
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	
		let thePicker = UIPickerView();
		let toolbar = UIToolbar();
		let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donedatePicker));
		
		thePicker.delegate = self;
		toolbar.sizeToFit();
		toolbar.setItems([doneButton], animated: false);
		ChooseTypeDog.inputAccessoryView = toolbar;
		ChooseTypeDog.inputView = thePicker;
		
		//let theTextFiledsArr : [UITextField?] = [self.TextFieldNameDog, self.TextFieldOldDog, self.ChooseTypeDog];
		
		self.TextFieldNameDog.delegate = self;
		self.TextFieldOldDog.delegate = self;
		self.ChooseTypeDog.delegate = self;
		// Do any additional setup after loading the view.
	}
	
	@objc func donedatePicker() {
		self.Go.layer.opacity = 1;
		self.view.endEditing(true)
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1;
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return breeds.count;
	}
	
	func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return breeds[row];
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		ChooseTypeDog.text = breeds[row];
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
			UIView.animate(withDuration: 0.5) {
				switch self.TextFieldNameDog.text?.isEmpty {
				case false :
					self.TextFieldOldDog.layer.opacity = 1;
					self.HowOldDog.layer.opacity = 1;
				default :
					self.TextFieldOldDog.layer.opacity = 0;
					self.HowOldDog.layer.opacity = 0;
					self.Go.layer.opacity = 0;
				}
				switch self.TextFieldOldDog.text?.isEmpty {
				case false :
					self.WitchtypeDog.layer.opacity = 1;
					self.ChooseTypeDog.layer.opacity = 1;
				default :
					self.ChooseTypeDog.layer.opacity = 0;
					self.WitchtypeDog.layer.opacity = 0;
					self.Go.layer.opacity = 0;
				}
		}
		self.view.endEditing(true);
		return false
	}
}

