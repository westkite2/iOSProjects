//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName : sender.currentTitle!)
        //print(sender.title(for: .normal))
    }
    
    func playSound(soundName : String) {
        // Get C.wav file in the resources
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")

        /* Play the audio even if the device is on silent mode
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true) */

        // Tell AVAudioPlayer the file to play
        player = try! AVAudioPlayer(contentsOf: url!)
        
        // Play the audio
        player.play()
    }
}

