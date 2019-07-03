//
//  Step2.swift
//  Dog Asistant
//
//  Created by Alexander Volkov on 25/06/2019.
//  Copyright © 2019 Alexander Volkov. All rights reserved.
//

import UIKit

class Step2: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var KiloQ: UILabel!
	@IBOutlet weak var NameF: UITextField!
	@IBOutlet weak var KiloF: UITextField!
	@IBOutlet weak var GenderQ: UILabel!
	@IBOutlet weak var Go: UIButton!
	@IBOutlet weak var GenderF: UISegmentedControl!
	@IBAction func CheckGender(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0...1 :
			UIView.animate(withDuration: 0.5) {
				self.Go.layer.opacity = 1;
				self.Go.isEnabled = true;
			}
		default:
			UIView.animate(withDuration: 0.5) {
				self.Go.layer.opacity = 0;
				self.Go.isEnabled = false;
			}
		}
	}
	
	@IBAction func SaveButton(_ sender: UIButton) {
		let mdp = UserDefaults.standard.array(forKey: "step1data") as! [[String : Any]];
		var gen : String {
			get {
				if GenderF.selectedSegmentIndex == 0 {
					return "boy";
				} else {
					return "girl";
				}
			}
		}
		dog.save(name: mdp[0]["name"] as! String, age: mdp[1]["old"] as! Int, sDP: mdp[2]["sdp"] as! Bool, breed: mdp[3]["breed"] as! String, gender: gen, growth: Int(KiloF.text!)!, weight: Int(NameF.text!)!);
		print("\(dog.getNameAndAddress())");
	}
	

	override func viewDidLoad() {
        super.viewDidLoad()

		self.NameF.delegate = self;
		self.KiloF.delegate = self;
		
        // Do any additional setup after loading the view.
    }

	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		UIView.animate(withDuration: 0.5) {
			switch self.NameF.text?.isEmpty {
				case false :
					self.KiloQ.layer.opacity = 1;
					self.KiloQ.isEnabled = true;
					self.KiloF.layer.opacity = 1;
					self.KiloF.isEnabled = true;
				default :
					self.KiloQ.layer.opacity = 0;
					self.KiloQ.isEnabled = false;
					self.KiloF.layer.opacity = 0;
					self.KiloF.isEnabled = false;
					self.Go.layer.opacity = 0;
					self.Go.isEnabled = false;
			}
			switch self.KiloF.text?.isEmpty {
				case false :
					self.GenderQ.layer.opacity = 1;
					self.GenderQ.isEnabled = true;
					self.GenderF.layer.opacity = 1;
					self.GenderF.isEnabled = true;
				default :
					self.GenderQ.layer.opacity = 0;
					self.GenderQ.isEnabled = true;
					self.GenderF.layer.opacity = 0;
					self.GenderF.isEnabled = true;
					self.Go.layer.opacity = 0;
			}
		}
		self.view.endEditing(true);
		return false;
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
