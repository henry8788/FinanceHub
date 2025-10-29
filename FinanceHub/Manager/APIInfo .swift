//
//  APIInfo .swift
//  FinanceHub
//
//  Created by Henry Lin on 2025/10/29.
//

enum API {
    case getEmptyNotificationList
    case getNotificationList
    case getUsdSavings1
    case getUsdFixed1
    case getUsdDigital1
    case getKhrSavings1
    case getKhrFixed1
    case getKhrDigital1
    case getUsdSavings2
    case getUsdFixed2
    case getUsdDigital2
    case getKhrSavings2
    case getKhrFixed2
    case getKhrDigital2
    case getEmptyFavoriteList
    case getFavoriteList
    case getBanner
}

extension API {
    
    var baseUrl:String {
        return "https://willywu0201.github.io/data/"
    }
    
    var path:String {
        switch self {
        case .getEmptyNotificationList:
            return "emptyNotificationList.json"
        case .getNotificationList:
            return "notificationList.json"
        case .getUsdSavings1:
            return "usdSavings1.json"
        case .getUsdFixed1:
            return "usdFixed1.json"
        case .getUsdDigital1:
            return "usdDigital1.json"
        case .getKhrSavings1:
            return "khrSavings1.json"
        case .getKhrFixed1:
            return "khrFixed1.json"
        case .getKhrDigital1:
            return "khrDigital1.json"
        case .getUsdSavings2:
            return "usdSavings2.json"
        case .getUsdFixed2:
            return "usdFixed2.json"
        case .getUsdDigital2:
            return "usdDigital2.json"
        case .getKhrSavings2:
            return "khrSavings2.json"
        case .getKhrFixed2:
            return "khrFixed2.json"
        case .getKhrDigital2:
            return "khrDigital2.json"
        case .getEmptyFavoriteList:
           return "emptyFavoriteList.json"
        case .getFavoriteList:
            return "favoriteList.json"
        case .getBanner:
            return "banner.json"
        }
        
    }
    
    var fullUrl:String {
        return baseUrl + path
    }

}

