//
//  LoadedCaseHelper.swift
//  ForYouDicodingIOSExpertSub1
//
//  Created by Moh Zinnur Atthufail Addausi on 05/11/20.
//

import Foundation

enum LoadedStateHelper {
    case idle
    case loading
    case error(Error)
    case loaded
    case empty
}
