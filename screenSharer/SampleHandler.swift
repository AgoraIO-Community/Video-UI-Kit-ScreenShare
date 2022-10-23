//
//  SampleHandler.swift
//  screenSharer
//
//  Created by Max Cobb on 20/10/2022.
//

import ReplayKit
import AgoraBroadcastExtensionHelper

class SampleHandler: AgoraBroadcastSampleHandler {
    // Uncomment this method and comment getBroadcastData to use App Groups.
    // Also uncomment parts of the function prepareScreenSharing() if using getAppGroup.
    /*
    override public func getAppGroup() -> String? {
        "<#App Group String#>"
    }
     */
    override func getBroadcastData() -> AgoraBroadcastExtData? {
        return AgoraBroadcastExtData(
            appId: "<#App ID#>", channel: "<#Channel Name#>",
            token: <#App Token or nil#>, uid: <#User ID or 0#>
        )
    }
}
