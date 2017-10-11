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
    var player: AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            //Set the path to the audio file (comes from the bundle)
            let pathToSong = Bundle.main.path(forResource: "song", ofType: "mp3")
            

            //Try instantiating the audio player using the path to the song
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: pathToSong!) as URL)

        } catch {

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func PressPlay(_ sender: Any) {
        player.play()
    }

}

