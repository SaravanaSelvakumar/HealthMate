//
//  ScheduleModel.swift
//  OpenTurfTask
//
//  Created by Manikandan Arumugam on 10/06/25.
//

import SwiftUI

struct ScheduleItem: Identifiable {
    let id = UUID()
    let time: String
    let title: String
    let backgroundColor: Color
}


struct ScheduleModelData {
    static  let schedule: [ScheduleItem] = [
            ScheduleItem(time: "09:00 AM", title: "Consultation", backgroundColor: Color(hex: "FCF1D6")),
            ScheduleItem(time: "10:00 AM", title: "Control", backgroundColor: Color(hex: "D2E6FF")),
            ScheduleItem(time: "10:30 AM", title: "Blood analysis", backgroundColor: Color(hex: "FBE8EA")),
            ScheduleItem(time: "11:00 AM", title: "General Consultation", backgroundColor: Color(hex: "E6FFE6")),
            ScheduleItem(time: "13:00 PM", title: "Control", backgroundColor: Color(hex: "EDE6FF")),
            ScheduleItem(time: "14:00 PM", title: "Physical Consultation", backgroundColor: Color(hex: "FBE8EA"))
        ]
}
