//
//  ViewController.swift
//  SwiftAudioRecord
//
//  Created by li on 14-10-5.
//  Copyright (c) 2014年 li. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {
    
    var recorder: AVAudioRecorder!
    var player: AVAudioPlayer!
    var session: AVAudioSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
//====== 方法1
//        var fullPath = String(paths[0] as NSString) + "/sound.m4a"
//
//        var settings: Dictionary<String, Int> = [:]
//        settings["AVFormatIDKey"] = kAudioFormatMPEG4AAC
//        settings["AVSampleRateKey"] = 44100
//        settings["AVNumberOfChannelsKey"] = 2
//
//        recorder = AVAudioRecorder(URL: NSURL(fileURLWithPath: fullPath), settings: settings, error: nil)
//====== 方法1
        
//====== 方法2
        var fullPath = String(paths[0] as NSString) + "/sound.wav"
        recorder = AVAudioRecorder(URL: NSURL(fileURLWithPath: fullPath), settings: nil, error: nil)
//====== 方法2
        
        session = AVAudioSession.sharedInstance()
        session.setCategory("AVAudioSessionCategoryPlayAndRecord", error: nil)
        
        recorder.delegate = self
        recorder.meteringEnabled = true
        println("\(recorder.prepareToRecord())")
    }
    
    @IBAction func startRecord(sender: AnyObject) {
        var session: AVAudioSession = AVAudioSession.sharedInstance()
        session.setActive(true, error: nil)
        println("\(recorder.record())");
    }
    
    @IBAction func stopRecord(sender: AnyObject) {
        recorder.stop()
        println("stop")
    }
    
    @IBAction func play(sender: AnyObject) {
        player = AVAudioPlayer(contentsOfURL: recorder.url, error: nil)
        player.prepareToPlay()
        player.play()
        println("play")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

