//
//  ViewController.swift
//  Audio Player
//
//  Created by ITP on 10/11/17.
//  Copyright © 2017 Or Fleisher. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //Instantiate the AVFoundation audio player class
    var player: AVAudioPlayer? = nil
    
    //Timer for tracking the progress
    var timer: Timer? = nil
    
    //References to the UI elements
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var ProgressLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    let volume = AVAudioSession.sharedInstance().outputVolume
    
    override func viewDidLoad() {
        super.viewDidLoad()

        volumeSlider.value = volume
        
        
        do {
            //Set the path to the audio file (comes from the bundle)
            let path = Bundle.main.url(forResource: "song", withExtension: "mp3")
            
            //Unpacking the path string optional
            if let unpackedPath = path {
                
                try player = AVAudioPlayer(contentsOf: unpackedPath)
                timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                    
                    self.ProgressBar.progress = Float(self.player!.currentTime / self.player!.duration)
                    self.ProgressLabel.text = String(format: "%d:%02d", Int(self.player!.currentTime) / 60, Int(self.player!.currentTime) % 60)
                }
                player!.play()
                timer!.fire()
                
            }
            
        } catch {
            print(error)
        }
        
        print("[Setup] Audio Player created")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PressPlay(_ sender: Any) {
        player!.play()
    }
    
    @IBAction func PressStop(_ sender: Any) {
        player!.stop()
        player!.currentTime = 0
    }
    
    @IBAction func PressPause(_ sender: Any) {
        player!.pause()
    }
    
    @IBAction func VolumeChange(_ sender: Any) {
        player!.volume = volumeSlider.value
    }
}

