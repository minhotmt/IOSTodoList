//
//  SecondViewController.swift
//  BasicAutoLayout
//
//  Created by Hoannv on 5/17/19.
//  Copyright © 2019 Timothy Lee. All rights reserved.
//

import UIKit
class SecondViewController : UIViewController {
    
    var grayView: UIView?
    var blueView: UIView?
    var redView: UIView?
    var testView: UIView?
    var textLabel: UILabel?
    
    override func loadView() {
        super.loadView()
        
        //View
        self.view = UIView()
        self.view?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        self.view?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.view?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.view?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.view.backgroundColor = UIColor.white

        
        self.grayView = UIView()
        self.grayView!.translatesAutoresizingMaskIntoConstraints = false
        self.grayView!.backgroundColor = UIColor.lightGray
        self.grayView?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.grayView?.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.view.addSubview(self.grayView!)
        self.grayView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.grayView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.grayView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        
        self.blueView = UIView()
        self.blueView!.backgroundColor = UIColor.blue
        self.blueView!.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.blueView!)
        self.blueView?.heightAnchor.constraint(equalToConstant: 70).isActive = true
        self.blueView?.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.blueView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.blueView?.topAnchor.constraint(equalTo: self.grayView!.bottomAnchor, constant: 30).isActive = true
        
        self.textLabel = UILabel()
        self.view.addSubview(textLabel!)
        self.textLabel!.text = "I have some longer text here that I want to wrap onto multiple lines."
        self.textLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.textLabel?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor
            , constant: 20).isActive = true
        self.textLabel?.topAnchor.constraint(equalTo: grayView!.bottomAnchor, constant: 30).isActive = true
        self.textLabel?.trailingAnchor.constraint(equalTo: blueView!.leadingAnchor, constant: -20).isActive = true
        self.textLabel!.numberOfLines = 5
   
        
        self.redView = UIView()
        self.view.addSubview(redView!)
        self.redView!.translatesAutoresizingMaskIntoConstraints = false
        self.redView?.heightAnchor.constraint(equalToConstant: 69).isActive = true
        self.redView?.widthAnchor.constraint(equalToConstant: 71).isActive = true
        self.redView!.backgroundColor = UIColor.red
        self.redView!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second"
    }
}

