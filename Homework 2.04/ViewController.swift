//
//  ViewController.swift
//  Homework 2.04
//
//  Created by Мария Гетманская on 15.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var sliderControlledView: UIView!
    
    @IBOutlet var redColorTextField: UITextField!
    @IBOutlet var greenColorTextField: UITextField!
    @IBOutlet var blueColorTextField: UITextField!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sliderControlledView.layer.cornerRadius = 8
    }
    
    
    
    @IBAction func redColorSliderAction() {
        redColorTextField.text = String(format: "%.2f", redColorSlider.value)
    }
    
    @IBAction func greenColorSliderAction() {
        greenColorTextField.text = String(format: "%.2f", greenColorSlider.value)
    }
    
    @IBAction func blueColorSliderAction() {
        blueColorTextField.text = String(format: "%.2f", blueColorSlider.value)
    }
}

