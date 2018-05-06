//
//  ArrayExtension.swift
//  PlayShare
//
//  Created by Victoria Grönqvist on 2018-05-03.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    //extension to let us use TournamentViewController as topViewController
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigation = base as? UINavigationController {
            return topViewController(base: navigation.visibleViewController)
        }
        if let tabBarController = base as? UITabBarController {
            if let selected = tabBarController.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}

extension Array {
    mutating func shuffle() {
        for i in 0 ..< (count - 1) {
            let p = Int(arc4random_uniform(UInt32(count - i))) + i
            swapAt(i, p)
        }
    }
    
}
