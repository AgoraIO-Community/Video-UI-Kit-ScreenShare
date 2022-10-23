//
//  ViewController.swift
//  Video-UI-Kit-ScreenShare
//
//  Created by Max Cobb on 19/10/2022.
//

import UIKit
import AgoraRtcKit
import AgoraUIKit
import AgoraAppGroupDataHelper
import ReplayKit

class ViewController: UIViewController {

    var agoraView: AgoraVideoViewer! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        let agoraView = AgoraVideoViewer(
            connectionData: AgoraConnectionData(
                appId: "<#App ID#>",
                rtcToken: <#App Token or nil#>
            )
        )

        agoraView.fills(view: self.view)

        agoraView.join(channel: "<#Channel Name#>", as: .broadcaster)
        self.agoraView = agoraView

        // Enable your app to share the local screen to a channel
        prepareScreenSharing()
    }

    func prepareScreenSharing() {
        // Uncomment this section if using app groups
        /*
        AgoraAppGroupDataHelper.appGroup = "<#App Group String#>"
        AgoraAppGroupDataHelper.set("<#App ID#>", forKey: .appId)
        AgoraAppGroupDataHelper.set("<#Channel Name#>", forKey: .channel)
        AgoraAppGroupDataHelper.set(<#App Token or nil#>, forKey: .token)
        AgoraAppGroupDataHelper.set(<#User ID or 0#>, forKey: .uid)
        */
        let frame = CGRect(x: 50, y: self.view.bounds.height - 200, width: 60, height: 60)
        let systemBroadcastPicker = RPSystemBroadcastPickerView(frame: frame)
        systemBroadcastPicker.showsMicrophoneButton = false
        systemBroadcastPicker.autoresizingMask = [.flexibleTopMargin, .flexibleRightMargin]
        if let url = Bundle.main.url(
            forResource: "screenSharer", withExtension: "appex",
            subdirectory: "PlugIns"
        ), let bundle = Bundle(url: url) {
            systemBroadcastPicker.preferredExtension = bundle.bundleIdentifier
        }
        self.view.addSubview(systemBroadcastPicker)
    }
}
