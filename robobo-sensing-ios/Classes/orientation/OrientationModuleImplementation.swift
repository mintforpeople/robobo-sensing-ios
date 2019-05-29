//
//  OrieontationModuleImplementation.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 11/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//
import CoreMotion
import robobo_framework_ios_pod
import robobo_remote_control_ios

class OrientationModuleImplementation:NSObject, IOrientationModule {
    var delegateManager: OrientationDelegateManager!
    
    
    var motionManager : CMMotionManager!
    var timer: Timer!
    var yaw, pitch, roll: Double!
    var threshold : Double = 0.08
    var manager : RoboboManager!
    var remote : IRemoteControlModule!
    
    
    
    
    
    override init() {
        
        yaw = 0
        pitch = 0
        roll = 0
    }
    
    @objc func processOrientation(){
        
        if let orientationData = motionManager.deviceMotion {
            
            let currentYaw = orientationData.attitude.yaw * (180.0 / .pi) + 180
            let currentPitch = orientationData.attitude.pitch  * (180.0 / .pi) + 180
            let currentRoll = orientationData.attitude.roll  * (180.0 / .pi) + 180
            
            if ((abs( currentYaw-yaw)>threshold)||(abs(currentPitch-pitch)>threshold)||(abs(currentRoll-roll)>threshold)){

                yaw = orientationData.attitude.yaw * (180.0 / .pi) + 180
                pitch = orientationData.attitude.pitch  * (180.0 / .pi) + 180
                roll = orientationData.attitude.roll  * (180.0 / .pi) + 180
                
                delegateManager.notifyOrientation(yaw, pitch, roll)
            }
        }
    }
    
    
    
    public func setDetectionThreshold(_ threshold: Double) {
        self.threshold = threshold
    }
    
    public func startup(_ manager: RoboboManager) throws {
        self.manager = manager
        
        
        do {
            var module = try manager.getModuleInstance("IRemoteControlModule")
            remote = module as? IRemoteControlModule
        } catch  {
            print(error)
        }
        delegateManager = OrientationDelegateManager(remote)

        
        DispatchQueue.main.async {
            self.motionManager = CMMotionManager()
            self.motionManager.startDeviceMotionUpdates()
        }
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(OrientationModuleImplementation.processOrientation), userInfo: nil, repeats: true)
        
    }
    
    public func shutdown() throws {
        timer.invalidate()
        timer = nil
    }
    
    public func getModuleInfo() -> String {
        return "iOS Orientation module"
    }
    
    public func getModuleVersion() -> String {
        return "v0.1"
    }
    
}
