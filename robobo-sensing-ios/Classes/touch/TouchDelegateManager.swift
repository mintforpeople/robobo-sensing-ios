//
//  TouchDelegateManager.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 12/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//

import robobo_framework_ios_pod
import robobo_remote_control_ios

open class TouchDelegateManager: DelegateManager {
    var remote:IRemoteControlModule!
    
    init(_ remote:IRemoteControlModule) {
        self.remote = remote
    }
    
    func notifyTap (_ tapX: Double, _ tapY:Double ){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onTap(tapX, tapY)
            }
        }
        
        let s:Status = Status("TAP")
        s.putContents("x", String(format:"%i", tapX))
        s.putContents("y", String(format:"%i", tapY))
        
        
        remote.postStatus(s)
    }
    func notifyTouch(_ tapX: Double, _ tapY:Double ){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onTouch(tapX, tapY)
            }
        }
        
        let s:Status = Status("TAP")
        s.putContents("x", String(format:"%i", tapX))
        s.putContents("y", String(format:"%i", tapY))
        
        
        remote.postStatus(s)
    }
    func notifyFling (_ direction: TouchGestureDirection, _ angle:Double, _ time: Double, _ distance: Double ){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onFling(direction, angle,  time, distance)
            }
        }
        let s:Status = Status("FLING")
        s.putContents("angle", String(format:"%i", angle))
        s.putContents("time", String(format:"%i", time))
        s.putContents("distance", String(format:"%i",distance))
        
        remote.postStatus(s)
    }
    func notifyCaress (_ direction: TouchGestureDirection){
        for delegate in delegates{
            if let del = delegate as? ITouchDelegate{
                del.onCaress(direction)
            }
        }
    }
}
