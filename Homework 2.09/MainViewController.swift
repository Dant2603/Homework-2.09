//
//  ViewController.swift
//  Homework 2.04
//
//  Created by Мария Гетманская on 15.05.2024.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    weak var delegate: ColorDelegate?
    
    var passedColor: UIColor?
    
    var redValue: Float?
    var greenValue: Float?
    var blueValue: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 8
        colorView.backgroundColor = passedColor
        
        redColorSlider.value = redValue!
        greenColorSlider.value = greenValue!
        blueColorSlider.value = blueValue!
        
        redColorTextField.text = String(format: "%.2f", redValue!)
        greenColorTextField.text = String(format: "%.2f", greenValue!)
        blueColorTextField.text = String(format: "%.2f", blueValue!)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: false)
        
        redColorTextField.inputAccessoryView = toolbar
        greenColorTextField.inputAccessoryView = toolbar
        blueColorTextField.inputAccessoryView = toolbar
        
        redColorTextField.delegate = self
        greenColorTextField.delegate = self
        blueColorTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text, let value = Float(text.replacingOccurrences(of: ",", with: ".")) else {
                showAlert(title: "Invalid Input", message: "Please enter a valid number between 0 and 1.")
                textField.text = ""
                
                return
            }
            
            if value < 0.0 || value > 1.0 {
                showAlert(title: "Out of Range", message: "Please enter a number between 0 and 1.")
                textField.text = ""
                return
            }
        
        if textField == redColorTextField {
            redColorSlider.value = Float(redColorTextField.text ?? "") ?? 0.0
        } else if textField == greenColorTextField {
            greenColorSlider.value = Float(greenColorTextField.text ?? "") ?? 0.0
        } else if textField == blueColorTextField {
            blueColorSlider.value = Float(blueColorTextField.text ?? "") ?? 0.0
        }
        
        setColorView()
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func redColorSliderAction() {
        redColorTextField.text = String(format: "%.2f", redColorSlider.value)
        setColorView()
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorTextField.text = String(format: "%.2f", greenColorSlider.value)
        setColorView()
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorTextField.text = String(format: "%.2f", blueColorSlider.value)
        setColorView()
    }
        
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        if let color = colorView.backgroundColor {
                delegate?.didChooseColor(color)
            }
        dismiss(animated: true, completion: nil)
    }
    
    private func setColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "," {
            textField.text = (textField.text ?? "") + "."
            return false
        }
        return true
    }
    
    

}

// MARK: - Protocols
protocol ColorDelegate: AnyObject {
    func didChooseColor(_ color: UIColor)
}
