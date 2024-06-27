//
//  SliderViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

class SliderViewController: UIViewController{
    
    var slider = UISlider()
    var label = UILabel()
    var lblTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        lblTitle.text = "Slider"
        lblTitle.textColor = .red
        self.view.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
        
        slider.frame = CGRect()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = 1
        self.view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        label.frame = CGRect()
        label.textColor = .black
        label.textAlignment = .center
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: slider.topAnchor, constant: 60)
        ])
        
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        updateScreen(with: slider.value)
        
    }
    
    @objc func sliderValueChanged(_ sender: UISlider){
        updateScreen(with: sender.value)
    }
    
    func updateScreen(with value: Float){
        label.text = String(format: "%.2f", value)
        
        let grayValue = CGFloat(value/100)
        self.view.backgroundColor = UIColor(white: grayValue, alpha: 1.0)
        
        let oppositeGrayValue = 1.0 - grayValue
        label.textColor = UIColor(white: oppositeGrayValue, alpha: 1.0)
        
    }
}
