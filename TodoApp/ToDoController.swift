//
//  ViewController.swift
//  TodoApp
//
//  Created by Vanni Galli on 02.04.17.
//  Copyright © 2017 Vanni Galli. All rights reserved.
//

import UIKit

class ToDoController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var doneSwitch: UISwitch!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var todo : Todo?
    
    var stringa : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        descriptionTextView.delegate = self

    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        titleLabel.text = titleTextField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if titleTextField.text == "New TODO" {
            titleTextField.text = ""
        }
    }
    
    

    // MARK: UITextViewDelegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // mi assicuro che se l'utente clicca la foto mentre è in editing, la tastiera viene nascosta
        titleTextField.resignFirstResponder()
        descriptionTextView.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // mostro l'immagine
        photoView.image = selectedImage
        
        // faccio il dismiss del picker
        dismiss(animated: true, completion: nil)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // eseguiamo il codice seguente solo se abbiamo cliccato Salva
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            return
        }
        
        let title = titleLabel.text ?? ""
        let description = descriptionTextView.text ?? ""
        let photo = photoView.image
        
        // creiamo il todo che dovrà essere passato al TodoTableViewController
        todo = Todo(title: title)
        todo?.description = description
        todo?.photo = photo!
        todo?.completed = doneSwitch.isOn
    }

}

