//
//  OrientationDelegateManager.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 11/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod

open class OrientationDelegateManager: DelegateManager {
    override init() {
        super.init()
    }
    
    func notifyOrientation(_ yaw: Double,  _ pitch: Double, _ roll: Double){
        for delegate in delegates{
            if let del = delegate as? IOrientationDelegate{
                del.onOrientation(yaw, pitch, roll)
            }
        }
    }
}
