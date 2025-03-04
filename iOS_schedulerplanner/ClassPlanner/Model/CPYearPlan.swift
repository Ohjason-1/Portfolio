//
//  CPYearPlan.swift
//  ClassPlannerFinished
//
//  Created by Justin Wong on 2/23/24.
//

import Foundation

class CPYearPlan: Identifiable {
    var year: Int
    @Published var semesters: [CPSemester]
    
    init(year: Int, semesters: [CPSemester]) {
        self.year = year
        self.semesters = semesters
    }
    
    func hasSemester(for semesterType: CPSemester.CPSemesterType) -> Bool {
        // TODO: 3A. IMPLEMENT USING A CLOSURE
        return semesters.contains{$0.type == semesterType}
    }
    
    func getSemester(for semesterType: CPSemester.CPSemesterType) -> CPSemester? {
        // TODO: 3B. IMPLEMENT USING A CLOSURE
        return semesters.first(where: {$0.type == semesterType})
    }
}

class CPSemester: Identifiable, Equatable {
    static func == (lhs: CPSemester, rhs: CPSemester) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    
    enum CPSemesterType {
        case fall
        case spring
    }
    var type: CPSemesterType
    @Published var classes: [CPClass]
    
    init(id: UUID = UUID(), type: CPSemesterType, classes: [CPClass]) {
        self.id = id
        self.type = type
        self.classes = classes
    }
}

class CPClass: Identifiable {
    var id = UUID()
    @Published var name: String
    @Published var instructors: [String]
    @Published var domain: String
    @Published var alreadyTaken: Bool
    
    var getInstructorsString: String {
        return instructors.map{String($0)}.joined(separator: ",")
    }
    
    init(id: UUID = UUID(), name: String, instructors: [String], domain: String, alreadyTaken: Bool) {
        self.id = id
        self.name = name
        self.instructors = instructors
        self.domain = domain
        self.alreadyTaken = alreadyTaken
    }
}
