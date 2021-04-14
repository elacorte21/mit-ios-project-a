//
//  FormViewController.swift
//  UserDefaultDemo
//
//  Created by Eddril Lacorte on 8/11/20.
//  Copyright © 2020 EL. All rights reserved.
//

import UIKit

func readData() -> [Photo] {
    if UserDefaults.standard.value(forKey: "photos") != nil {
        let data = UserDefaults.standard.value(forKey: "photos") as! Data
        let photos = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Photo]
        return photos
    } else {
        return [Photo]()
    }
}

class FormViewController: UIViewController, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var descTxt: UITextField!
    @IBOutlet weak var picView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigation title
        title = "Add a Toy"
    }
    
    @IBAction func selectImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        picView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        let title = titleTxt.text!
        let desc = descTxt.text!
        let pic = picView.image
        
        //add the date
        let currentDate = Date()
        let date = currentDate.dateAndTimetoString()
        print(date)
        
        let photo = Photo(title: title, desc: desc, pic: pic!, date: date)
        
        var photos = readData()
        photos.append(photo)
        
        //Compress
        let data = try! NSKeyedArchiver.archivedData(withRootObject: photos, requiringSecureCoding: false)
        //Save
        UserDefaults.standard.set(data, forKey: "photos")
        performSegue(withIdentifier: "showPhotoTableView", sender: self)
    }
}

//add the date
extension Date {
    func dateAndTimetoString(format: String = "dd MMM yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
