//
//  AccelerationModuleImplementation.swift
//  robobo-sensing
//
//  Created by Luis Felipe Llamas Luaces on 06/03/2019.
//  Copyright © 2019 mintforpeople. All rights reserved.
//
import robobo_framework_ios_pod
import CoreMotion

class AccelerationModuleImplementation: NSObject, IAccelerationModule {
    var delegateManager: AccelDelegateManager
    
    
    var motionManager : CMMotionManager!
    var timer: Timer!
    var xAccel, yAccel, zAccel: Double!
    var threshold : Double = 0.08
    var manager : RoboboManager!
   

    
    
    
    override init() {
        delegateManager = AccelDelegateManager()
        xAccel = 0
        yAccel = 0
        zAccel = 0
    }
    
    @objc func processAccelerometer(){
        if let accelerometerData = motionManager.accelerometerData {
            let xAccelCurrent = accelerometerData.acceleration.x
            let yAccelCurrent = accelerometerData.acceleration.y
            let zAccelCurrent = accelerometerData.acceleration.z
            
            if ((abs(xAccelCurrent-xAccel)>threshold)||(abs(yAccelCurrent-yAccel)>threshold)||(abs(zAccelCurrent-zAccel)>threshold)){
                xAccel = accelerometerData.acceleration.x
                yAccel = accelerometerData.acceleration.y
                zAccel = accelerometerData.acceleration.z
                delegateManager.notifyAccel(xAccel, yAccel, zAccel)

            }
            
            
        }
    }
    
    
    
    public func setDetectionThreshold(_ threshold: Double) {
        self.threshold = threshold
    }
    
    public func startup(_ manager: RoboboManager) throws {
        self.manager = manager
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AccelerationModuleImplementation.processAccelerometer), userInfo: nil, repeats: true)
    }
    
    public func shutdown() throws {
        timer.invalidate()
        timer = nil
    }
    
    public func getModuleInfo() -> String {
        return "iOS Acceleration module"
    }
    
    public func getModuleVersion() -> String {
        return "v0.1"
    }
    

    
    
    
    
    

}
