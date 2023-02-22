//
//  ApiURL.swift
//  Coordinator-iOS
//
//  Created by Herock Hasan on 2/2/23.
//

import Foundation



 enum Endpoint {
    case cardList
    case imageArchetype
    case imageLevel
    case imageType
    case imageSpellType
    case imageMonster

    var path: String {
        switch self {
        case .cardList: return "/cardinfo.php"
        case .imageArchetype: return "/pics/icons/archetype.png"
        case .imageLevel: return "wp-content/uploads/2017/01/level.png"
        case .imageType: return ""
        case .imageSpellType: return ""
        case .imageMonster: return ""
        }
    }

    var url: String {
        switch self {
        case .cardList: return "\(ApiURL.db.baseURL)\(path)"
        default: return ":"
        }
    }

}

private enum ApiURL {
    case db
    case base

    var baseURL: String {
        switch self {
        case .db: return "https://db.ygoprodeck.com/api/v7"
        case .base: return "https://ygoprodeck.com"
        }
    }
}
