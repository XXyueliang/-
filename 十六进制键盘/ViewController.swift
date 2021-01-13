//
//  ViewController.swift
//  十六进制键盘
//
//  Created by macvivi on 2021/1/8.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var contentLabel: UILabel!
    
    
    @IBAction func buttonClick(_ sender: Any) {
        let vc: ButtonVC = XYHelper.getViewController(storyboardStr: nil, viewController: "ButtonVC") as! ButtonVC
        vc.backClosure = { backStr in
            print(backStr)
            self.contentLabel.text = backStr
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func collectionViewClick(_ sender: Any) {
        let vc: CollectionViewVC = XYHelper.getViewController(storyboardStr: nil, viewController: "CollectionViewVC") as! CollectionViewVC
        vc.backClosure = { backStr in
            print(backStr)
            self.contentLabel.text = backStr
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "十六进制字符串键盘"
        
    }


}

