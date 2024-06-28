//
//  SliderViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

final class SliderViewController: UIViewController{
    
    private var slider: UISlider = {
        let variable = UISlider()
        variable.frame = CGRect()
        variable.minimumValue = 1
        variable.maximumValue = 100
        variable.value = 1
        variable.translatesAutoresizingMaskIntoConstraints = false
        return variable
    }()
    
    private var lblMain: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var lblTitle: UILabel = {
        var label = UILabel()
        label.text = "Slider"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        
        setupView()
        setConstraints()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(lblTitle)
        view.addSubview(slider)
        view.addSubview(lblMain)
        updateScreen(value: slider.value)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.widthAnchor.constraint(equalToConstant: 200),
            
            lblMain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblMain.topAnchor.constraint(equalTo: slider.topAnchor, constant: 60)
        ])
    }
    
    @objc func sliderValueChanged(_ sender: UISlider){
        updateScreen(value: sender.value)
    }
    
    func updateScreen(value: Float){
        lblMain.text = String(format: "%.2f", value)
        
        let grayValue = CGFloat(value/100)
        self.view.backgroundColor = UIColor(white: grayValue, alpha: 1.0)
        
        let oppositeGrayValue = 1.0 - grayValue
        lblMain.textColor = UIColor(white: oppositeGrayValue, alpha: 1.0)
    }
}
