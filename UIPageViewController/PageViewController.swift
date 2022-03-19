//
//  PageViewController.swift
//  UIPageViewController
//
//  Created by Tony on 19.03.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presentScreenCobtent = [
    "Первая страница рассказывает о чем-то",
    "Вторая станица вам покажет функционал",
    "Третья страница покажет что все безопасно",
    "Четвертая страница говорит о том, что вы готовы пользоваться приложением",
    ""
    ]
    
    
    let emojiArray = ["❤️","🍻","🎁","🥩", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentVC = showViewContrillerAtIndex(0) {
            setViewControllers([contentVC], direction: .forward, animated: true)
        }
        dataSource = self
       
    }
    func showViewContrillerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentScreenCobtent.count else {
            let userDef = UserDefaults.standard
            userDef.set(true, forKey: "PresentationWasViewed")
            dismiss(animated: true, completion: nil)
            return nil }
        guard let contentViewContriller = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        contentViewContriller.presentText = presentScreenCobtent[index]
        contentViewContriller.emoji = emojiArray[index]
        contentViewContriller.currentPage = index
        contentViewContriller.numberofPages = presentScreenCobtent.count
        
        
        return contentViewContriller
    }
}


extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNuber = (viewController as! ContentViewController).currentPage
        pageNuber -= 1
        return showViewContrillerAtIndex(pageNuber)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNuber = (viewController as! ContentViewController).currentPage
        pageNuber += 1
        return showViewContrillerAtIndex(pageNuber)
    }
    
    
}
