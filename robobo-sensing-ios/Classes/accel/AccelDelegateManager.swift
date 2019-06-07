//
//  AccelDelegateManager.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 08/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod
import robobo_remote_control_ios

open class AccelDelegateManager: DelegateManager {
    var remote:IRemoteControlModule!
    
    init(_ rem: IRemoteControlModule) {
      super.init()
      remote = rem
    }
    
    func notifyAccel(_ xAccel: Double,  _ yAccel: Double, _ zAccel: Double){
        for delegate in delegates{
            if let del = delegate as? IAccelerationDelegate{
                del.onAcceleration(xAccel, yAccel, zAccel)
            }
        }
        
        let s:Status = Status("ACCELERATION")
        s.putContents("x", String(format:"%i", xAccel))
        s.putContents("y", String(format:"%i", yAccel))
        s.putContents("z", String(format:"%i", zAccel))
        
        remote.postStatus(s)

    }
    
}
