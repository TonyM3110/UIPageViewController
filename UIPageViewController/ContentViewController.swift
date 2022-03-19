//
//  ContentViewController.swift
//  UIPageViewController
//
//  Created by Tony on 19.03.2022.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var presentTextLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var presentText = ""
    var emoji = ""
    var currentPage = 0
    var numberofPages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presentTextLabel.text = presentText
        emojiLabel.text = emoji
        pageControl.numberOfPages = numberofPages
        pageControl.currentPage = currentPage
    }

}
