//
//  Model.swift
//  Dog Asistant
//
//  Created by Alexander Volkov on 25/06/2019.
//  Copyright © 2019 Alexander Volkov. All rights reserved.
//

import UIKit
import CoreData

struct dog {
	
	static let (nameKey, ageKey, dogPuppyKey, breedKey, genderKey, growthKey, weightKey) = ("name", "age", "DoPu", "breed", "gender", "growth", "weight");
	static let userSessionKey = "com.save.usersession";
	
	struct Model {
		var name:	String;
		var age:	Int;
		var sDP:	Bool;
		var breed:	String;
		var gender:	String;
		var growth:	Int;
		var weight:	Int;
		
		init (_ json: [String : Any]) {
			self.name = (json[nameKey] ?? "") as! String;
			self.age = (json[ageKey] ?? 0) as! Int;
			self.sDP = (json[dogPuppyKey] ?? false) as! Bool;
			self.breed = (json[breedKey] ?? "") as! String;
			self.gender = (json[genderKey] ?? "") as! String;
			self.growth = (json[growthKey] ?? "") as! Int;
			self.weight = (json[weightKey] ?? "") as! Int;
		}
	}
	
	static func save(name: String, age: Int, sDP: Bool, breed: String, gender: String, growth: Int, weight: Int) {
		UserDefaults.standard.set([nameKey: name, ageKey: age, dogPuppyKey: sDP, breedKey: breed, genderKey: gender, growthKey: growth,weightKey : weight], forKey: userSessionKey)
	}
	
	static func getNameAndAddress()-> Model {
		return Model((UserDefaults.standard.value(forKey: userSessionKey) as? [String : Any] ?? ["" : 0]))
	}
	
	static func clearUserData(){
		UserDefaults.standard.removeObject(forKey: userSessionKey)
	}
}

func replaceTextForDog (_ How : UILabel!, _ HowOld: UILabel!, _ Witch : UILabel!) {
		How.text = "Как зовут вашу собаку?";
		HowOld.text = "Сколько лет вашей собаке?";
		Witch.text = "Какая у вашей собаки порода?"
}

func replaceTextForPuppy(_ How : UILabel!, _ HowOld: UILabel!, _ Witch : UILabel!) {
		How.text = "Как зовут вашего щенка?";
		HowOld.text = "Сколько месяцев вашему щенку?";
		Witch.text = "Какая у вашего щенка порода?";
}
