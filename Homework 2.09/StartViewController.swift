//
//  StartViewController.swift
//  Homework 2.09
//
//  Created by Мария Гетманская on 10.09.2024.
//

import UIKit

class StartViewController: UIViewController, ColorDelegate {
    
    @IBOutlet var startView: UIView!
    
    var backgroungColor: UIColor?
    
    func didChooseColor(_ color: UIColor) {
        startView.backgroundColor = color
    }
    
    func getRGBComponents(from color: UIColor) -> (red: Float, green: Float, blue: Float)? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        if color.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (Float(red), Float(green), Float(blue))
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startView.backgroundColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? MainViewController {
            backgroungColor = startView.backgroundColor
            secondVC.passedColor = backgroungColor
            secondVC.delegate = self
            if let rgbComponents = getRGBComponents(from: backgroungColor!) {
                        secondVC.redValue = rgbComponents.red
                        secondVC.greenValue = rgbComponents.green
                        secondVC.blueValue = rgbComponents.blue
                    }
        }
    }
        
}
