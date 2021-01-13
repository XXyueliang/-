//
//  XYHelper.swift
//  XYCBCentralManager
//
//  Created by macvivi on 2021/1/4.
//

import UIKit

class XYHelper: NSObject {
    
    static func getViewController(storyboardStr: String?, viewController: String) -> UIViewController {
        var storyboard = UIStoryboard()
        if let storyboardStr = storyboardStr {
            storyboard =  UIStoryboard.init(name: storyboardStr, bundle: nil)
        }else {
            storyboard =  UIStoryboard.init(name: "Main", bundle: nil)
        }
        let vc = storyboard.instantiateViewController(withIdentifier: viewController)
        return vc
    }
}

extension UIView {
    var width: CGFloat {
        self.frame.size.width
    }
    var height: CGFloat {
        self.frame.size.height
    }
    var x: CGFloat {
        self.frame.origin.x
    }
    var y: CGFloat {
        self.frame.origin.y
    }
}

func printXY(_ any:Any,obj:Any,line:Int) {
    let date = Date()
     let timeFormatter = DateFormatter()
     //日期显示格式，可按自己需求显示
     timeFormatter.dateFormat = "HH:mm:ss.SSS"
     let strNowTime = timeFormatter.string(from: date) as String
     print("\(strNowTime) \(type(of: obj)) \(line) \(any)")
}
