//
//  AccelDelegateManager.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 08/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

open class AccelDelegateManager: DelegateManager {
    override init() {
      super.init()
    }
    
    func notifyAccel(_ xAccel: Double,  _ yAccel: Double, _ zAccel: Double){
        for delegate in delegates{
            if let del = delegate as? IAccelerationDelegate{
                del.onAcceleration(xAccel, yAccel, zAccel)
            }
        }
    }
    
}
