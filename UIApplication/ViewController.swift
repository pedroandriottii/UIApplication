//
//  ViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

class TabBarController: UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarController()
    }
    
    private func setupTabBarController(){
        
        let switchScreen = UINavigationController(rootViewController: SwitchViewController())
        let sliderScreen = UINavigationController(rootViewController: SliderViewController())
        let segmentedControlScreen = UINavigationController(rootViewController: SegmentedControlViewController())
        let pageControlScreen = UINavigationController(rootViewController: PageControlViewController())
        let pickerViewScreen = UINavigationController(rootViewController: PickerViewController())
        self.setViewControllers([switchScreen, sliderScreen, segmentedControlScreen, pageControlScreen, pickerViewScreen], animated: false)
        self.tabBar.backgroundColor = .white
        
        guard let items = tabBar.items else{return}
        
        items[0].image = UIImage(systemName: "rays")
        items[1].image = UIImage(systemName: "slider.horizontal.below.rectangle")
        items[2].image = UIImage(systemName: "star")
        items[3].image = UIImage(systemName: "person")
        items[4].image = UIImage(systemName: "trash")
        
    }
}

class SwitchViewController: UIViewController {
    
    var lblTitle = UILabel()
    var lblDescription = UILabel()
    var swToggle = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = "Switch"
        lblTitle.textColor = .red
        swToggle.setOn(false, animated: false)
        swToggle.addTarget(self, action: #selector(updateSwitch), for: .valueChanged)
        updateSwitch()
        
        self.view.addSubview(swToggle)
        swToggle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            swToggle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swToggle.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        self.view.addSubview(lblDescription)
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblDescription.topAnchor.constraint(equalTo: swToggle.bottomAnchor, constant: 20.0)
        ])
        
        self.view.addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lblTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0)
        ])
        
    }
    
    @IBAction func updateSwitch() {
        lblDescription.text = swToggle.isOn ? "Light is ON" : "Light is OFF"
        lblDescription.textColor = swToggle.isOn ? .black : .white
        self.view.backgroundColor = swToggle.isOn ? .white : .black
    }

}

class SliderViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }
}

class SegmentedControlViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
    }
}

class PageControlViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
}

class PickerViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .purple
    }
}
