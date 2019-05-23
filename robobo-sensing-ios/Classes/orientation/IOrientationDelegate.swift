//
//  IOrientationDelegate.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 11/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

public protocol IOrientationDelegate: IModuleDelegate {
    func onOrientation(_ yaw:Double, _ pitch:Double, _ roll:Double)
}
