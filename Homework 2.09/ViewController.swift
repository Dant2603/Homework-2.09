//
//  ViewController.swift
//  Homework 2.04
//
//  Created by Мария Гетманская on 15.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 8
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
    
    private func setColorView() {
        colorView.backgroundColor = UIColor(red: CGFloat(redColorSlider.value), green: CGFloat(greenColorSlider.value), blue: CGFloat(blueColorSlider.value), alpha: 1)
    }
}

