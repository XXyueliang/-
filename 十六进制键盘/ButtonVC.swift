//
//  ButtonVC.swift
//  十六进制键盘
//
//  Created by macvivi on 2021/1/8.
//

import UIKit

class ButtonVC: UIViewController  {
    
    @IBOutlet var placeholderLabel: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var buttonView: UIView!
    
    typealias StrClosure = (String) -> Void
    var backClosure: StrClosure?
    
    override func viewDidAppear(_ animated: Bool) {
        addBtn()
    }
    
    func addRightBarBtnItem() {
        let item = UIBarButtonItem(title: "完成", style: .plain, target: self, action: #selector(rightBarBtnItemClick));
        self.navigationItem.rightBarButtonItem = item
    }
    
    @objc func rightBarBtnItemClick() {
        backClosure!(textView.text)
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "编辑（button）"
        textView.delegate = self
        textView.becomeFirstResponder()
        textView.inputView = UIView()
        addRightBarBtnItem()
    }
    
    func addBtn() {
        let width = buttonView.width/4
        let height = buttonView.height/4
        let contentStr = "0123456789abcdef"
        for i in 0...15 {
            let row = i % 4
            let list = i / 4
            let btn = UIButton(frame: CGRect.init(x: width*CGFloat(row), y: height*CGFloat(list), width: width, height: height))
            let index: String.Index = contentStr.index(contentStr.startIndex, offsetBy: i)
            btn.tag = i
            btn.setTitle(""+contentStr[index...index], for: .normal)
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
            buttonView.addSubview(btn)
        }
        let btn = UIButton(frame: CGRect(x: view.width - 50, y: buttonView.y - 60, width: 50, height: 50))
        btn.setImage(UIImage(named: "删除"), for: .normal)
        view.addSubview(btn)
        btn.tag = -1
        btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
    }
    
    @objc func btnClick(btn: UIButton) {
        textView.text += btn.titleLabel?.text ?? ""
        if btn.tag == -1 {
            if textView.text.count > 0 {
                textView.text.removeLast()
            }else{
                placeholderLabel.isHidden = false
            }
        }
        if placeholderLabel.isHidden == false && textView.text.count > 0 {
            placeholderLabel.isHidden = true
        }
    }
}

extension ButtonVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.count > 0 {
            placeholderLabel.isHidden = true
        }else {
            placeholderLabel.isHidden = false
        }
    }
}
