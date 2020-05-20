//
//  AddMovieViewController.swift
//  Movie app
//
//  Created by Abdalah Omar on 5/17/20.
//  Copyright © 2020 Hello Tomorrow. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController ,UITextFieldDelegate,UITextViewDelegate{
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var titelTextField: UITextField!
    @IBOutlet weak var overViewTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var dateString = ""
    var movies = [AddMovieModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        titelTextField.delegate = self
        overViewTextView.delegate = self
        self.view.HandelKeyboard()
        self.hideKeyboardWhenTappedAround()
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.setDate(NSDate() as Date, animated: false)

    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let somedateString = dateFormatter.string(from: sender.date)
        self.dateString = somedateString
      //  print(somedateString)
    }
    @IBAction func AddPosterAction(_ sender: Any) {
        
        handelPosterImage()
        
    }


    
    @IBAction func AddMovieAction(_ sender: Any) {
        
        if titelTextField.text!.isEmpty || overViewTextView.text!.isEmpty{
            showNotificationAlert(title: "Erorr", message: "Some text isEmpty check that")
        }else{
            
            let movie = AddMovieModel(title: titelTextField.text ?? "", overView: overViewTextView.text ?? "", date: dateString)
            self.movies.append(movie)
           let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(movie) {
                let defaults = UserDefaults.standard
                defaults.set(encoded, forKey: "SavedDataMovie")
               
            }
            let image = selectImageButton.imageView?.image

            // Convert to Data
            if let data = image?.pngData() {
                // Create URL
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let url = documents.appendingPathComponent("landscape.png")

                do {
                    // Write to Disk
                    try data.write(to: url)

                    // Store URL in User Defaults
                    UserDefaults.standard.set(url, forKey: "background")

                } catch {
                    print("Unable to Write Data to Disk (\(error))")
                }
            
            }

            dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - TextFieldDelegate
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        //delegate method
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //delegate method
        titelTextField.resignFirstResponder()
        
        return true
    }
    
    
    
    //MARK: - TextViewDelegate
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            overViewTextView.resignFirstResponder()
        }
        return true
    }
    
    
    
    //MARK: - AlertController
    func showNotificationAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
}



//MARK: - extension PikerImageController
extension AddMovieViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func handelPosterImage()  {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editImage = info[.originalImage] as? UIImage{
            selectImageButton.setImage(editImage.withRenderingMode(.alwaysOriginal), for: .normal)
        } else if let originalImage = info[.originalImage] as? UIImage{
            selectImageButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
}

