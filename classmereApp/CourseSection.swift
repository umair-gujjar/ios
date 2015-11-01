//
//  CourseSection.swift
//  classmereApp
//
//  Created by Brandon Lee on 8/30/15.
//  Copyright (c) 2015 Brandon Lee. All rights reserved.
//

import Foundation
import SwiftyJSON

struct CourseSection {
    let term: String?
    let crn: Int?
    let instructor: String?
    
    // Within the meetingTimes array
    let buildingCode: String?
    let days: String?
    let startTime: String?//NSDate?
    let endTime: String?
    let roomNumber: String?
    
    let type: String?
    let status: String?
    let capacity: Int?
    let currentEnrollment: Int?
    let waitlistCurrent: Int?
    let fees: String?
    let restrictions: String?
    
    // Missing from API...
    /*
    let sectionNumber: Int?
    let enrolled: Int?
    let comments: String?
    let waitlistCapacity: Int?
    */
    
    init(sectionJSON: JSON) {
        term = sectionJSON["term"].string as String?
        crn = sectionJSON["crn"].intValue as Int?
        instructor = sectionJSON["instructor"].string as String?
        
        if let meetingTimes = sectionJSON["meetingTimes"].array {
            buildingCode = meetingTimes[0]["buildingCode"].string
            days = meetingTimes[0]["days"].string
            startTime = meetingTimes[0]["startTime"].string //object as? NSDate
            endTime = meetingTimes[0]["endTime"].string
            roomNumber = meetingTimes[0]["roomNumber"].string
            
            print(startTime!)
            print("time: ")
            if let startTime = startTime {
                
                let timeFormatter = NSDateFormatter()
//                timeFormatter.timeStyle = .ShortStyle
//                timeFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
                timeFormatter.dateFormat = "YYYY-MM-DDTHH:mm:ss+HH:mm"
                
                if let mydate = timeFormatter.dateFromString(startTime) {
                    print(mydate)
                }
                //print(timeFormatter.dateFromString(startTime))
                //print("time: ")
                //print(timeFormatter.stringFromDate(startTime))
            }

        } else {
            buildingCode = nil
            days = nil
            startTime = nil
            endTime = nil
            roomNumber = nil
        }
        
        type = sectionJSON["type"].string as String?
        status = sectionJSON["status"].string as String?
        fees = sectionJSON["fees"].string as String?
        restrictions = sectionJSON["restrictions"].string as String?
        waitlistCurrent = sectionJSON["waitlistcurrent"].intValue as Int?
        currentEnrollment = sectionJSON["currentEnrollment"].intValue as Int?
        capacity = sectionJSON["capacity"].intValue as Int?
        
        // Missing from API...
        //sectionNumber = sectionJSON["section"].intValue as Int?
        //enrolled = sectionJSON["enrolled"].intValue as Int?
        //comments = sectionJSON["comments"].string as String?
        //waitlistCapacity = sectionJSON["waitlistCapacity"].intValue as Int?
    }
}