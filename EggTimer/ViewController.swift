

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer?
    var timePassed = 0
    var totalTime = 0
    var timer = Timer()
    let eggTimes = ["Soft": 10, "Medium": 420, "Hard": 720]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        if timePassed < totalTime {
            timePassed += 1
            let progress = Float(timePassed) / Float(totalTime)
            progressBar.progress = progress
        } else {
            textField.text = "HAZIR"
            playSound()
            timer.invalidate()
        }
    }
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
