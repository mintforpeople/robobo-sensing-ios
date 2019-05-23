//
//  ITouchModule.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 12/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//


import UIKit
import robobo_framework_ios_pod

public protocol ITouchModule: IModule{
    var delegateManager: TouchDelegateManager! {get}
    
    func feedTouchEvent(_ touches: Set<UITouch>, _ view: UIView)
    func setView(_ view: UIView)

  

}
