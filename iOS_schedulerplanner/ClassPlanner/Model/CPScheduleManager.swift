//
//  CPScheduleManager.swift
//  ClassPlanner
//
//  Created by Justin Wong on 2/23/24.
//

import SwiftUI

// TODO: - 4B. Implement CPScheduleManager
class CPScheduleManager: ObservableObject {
    @Published var yearPlans: [CPYearPlan]
    @Published var themeColor: Color = .blue
    var allClasses: [CPClass] {
        yearPlans.flatMap { $0.semesters.flatMap { $0.classes } }
    }

    var sortedYearPlans: [CPYearPlan] {
        yearPlans.sorted { $0.year < $1.year }
    }

    init(yearPlans: [CPYearPlan] = CPSampleData.yearPlans, themeColor: Color = Color.blue) {
        self.yearPlans = yearPlans
        self.themeColor = themeColor
    }
}
