

import UIKit

class ViewController: UIViewController {
    var counter = 0
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        counter = eggTimes[hardness]!
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        if counter > 0 {
            print(counter)
            counter -= 1
        }
    }
}
