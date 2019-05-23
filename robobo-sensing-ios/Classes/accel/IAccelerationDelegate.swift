//
//  IAccelerationDelegate.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 06/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

public protocol IAccelerationDelegate: IModuleDelegate  {
    func onAccelerationChange()
    func onAcceleration(_ xAccel:Double, _ yAccel:Double, _ zAccel:Double)
}
