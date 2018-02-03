//
//  ViewController.swift
//  DutyTimeCheck
//
//  Created by Sahidul Islam on 06/12/17.
//  Copyright © 2017 Sahidul Islam. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnOutlet: UIButton!
    var timer = Timer()
    var startTimes = TimeInterval()
    var totalTime = Int()
    
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnOutlet.layer.cornerRadius = btnOutlet.frame.size.height/2
        btnOutlet.layer.borderWidth = 2
        btnOutlet.layer.borderColor = UIColor .white.cgColor
        btnOutlet.clipsToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(named: "silllyBlue")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnAction(_ sender: Any) {
        if btnOutlet .currentTitle == "Stop"{
            player?.stop()
            btnOutlet .setTitle("Start", for: .normal)
            return
        }
        totalTime = 10
        self .startTime()
        btnOutlet .isEnabled = false
    }
    func startTime() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
    }
    func counter() {
        lblTime.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        }
        else {
            endTimer()
        }
    }
    
    func endTimer() {
        timer.invalidate()
        self.playSound()
        btnOutlet.isEnabled = true
        btnOutlet .setTitle("Stop", for: .normal)
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        let hours: Int = totalSeconds / 3600
        return String(format: "%02d : %02d : %02d",hours, minutes, seconds)
    }
    
    func playSound(){
        let sound = Bundle.main.url(forResource: "ringtone", withExtension: "mp3")
        do {
            player = try AVAudioPlayer(contentsOf: sound!)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

