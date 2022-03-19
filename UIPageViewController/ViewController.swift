//
//  ViewController.swift
//  UIPageViewController
//
//  Created by Tony on 19.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startPresentation()
    }
    
    func startPresentation() {
        
        let userDef = UserDefaults.standard
        let presentWasView = userDef.bool(forKey: "PresentationWasViewed")
        if presentWasView == false {
            if let pageVC = storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? PageViewController {
                present(pageVC, animated: true, completion: nil)
            }
        }
    }
}

