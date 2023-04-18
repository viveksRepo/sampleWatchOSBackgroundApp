//
//  ExtendedRuntimeSessionManager.swift
//  sampleBackgroundApp Watch App
//
//  Created by Vivek Agarwal on 4/17/23.
//

import Foundation
import WatchKit

class ExtendedRuntimeSessionManager: NSObject, ObservableObject {
    private var timer: Timer?
    private var session = WKExtendedRuntimeSession()
    private var delegate = WKDelegate()
    private var isPlaying: Bool { timer != nil }

    private func startSession() {
        guard !isPlaying, session.state != .running else { return }
        // session.delegate = delegate // Use delegte when necessary to manage WKExtendedRuntimeSession lifecycles
        session = WKExtendedRuntimeSession()
        session.start()
    }

    private func stopSession() {
        session.invalidate()
    }

    private func tick() {
        WKInterfaceDevice.current().play(.start)
        print("ticked...")

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: { [weak self] (_) in
            self?.tick()
        })
    }

    func startTicks() {
        timer?.invalidate()
        timer = nil
        startSession()
        tick()
    }

    func stopTicks() {
        timer?.invalidate()
        timer = nil

        stopSession()
    }
}

// define the delegate and its methods
class WKDelegate: NSObject, WKExtendedRuntimeSessionDelegate{
    
    func extendedRuntimeSession(_ extendedRuntimeSession: WKExtendedRuntimeSession, didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason, error: Error?) {
        print(reason.rawValue)
    }
    
    func extendedRuntimeSessionDidStart(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        print("did start")
    }
    
    func extendedRuntimeSessionWillExpire(_ extendedRuntimeSession: WKExtendedRuntimeSession) {
        print("will expire")
    }
}
