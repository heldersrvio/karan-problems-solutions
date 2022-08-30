import Foundation
import AVFoundation

var player: AVAudioPlayer?

func playSound() {
    let path = Bundle.main.path(forResource: "45min_april_rainstorm-mike-koenig.mp3", ofType: nil)!
    let url = URL(fileURLWithPath: path)

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try AVAudioSession.sharedInstance().setActive(true)
        player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
        guard let player = player else { return }

        player.play()

    } catch let error {
        print(error.localizedDescription)
    }
}

func myAlarm(_ timeInSeconds: Double){
    let currentDateTime = Date()
    
    while Date().timeIntervalSince(currentDateTime) < timeInSeconds{
        //
    }
    playSound()
    
}

//playSound()
myAlarm(30)
