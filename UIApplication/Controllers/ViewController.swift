//
//  ViewController.swift
//  UIApplication
//
//  Created by Pedro Andriotti on 26/06/24.
//

import UIKit

final class TabBarController: UITabBarController{
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
        items[2].image = UIImage(systemName: "rectangle.split.3x1.fill")
        items[3].image = UIImage(systemName: "person")
        items[4].image = UIImage(systemName: "trash")
        
    }
}
