//
//  WorkFlow.swift
//  Echo
//
//  Created by Ethan Gale on 12/8/24.
//

import SwiftUI

enum WorkflowStep {
    case record
    case chooseDate
    case upload
}

struct RecordEchoWorkflowView: View {
    @State private var currentStep: WorkflowStep = .record
    @State private var echoMessage: String = ""
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            switch currentStep {
            case .record:
                RecordEchoView(
                    echoMessage: $echoMessage,
                    onNext: { currentStep = .chooseDate }
                )
            case .chooseDate:
                DateView(
                    onNext: { currentStep = .upload },
                    onBack: { currentStep = .record }
                )
            case .upload:
                UploadEchoView(
                    onNext: { dismiss() }, 
                    onBack: { currentStep = .chooseDate }
                )
            }
        }
    }
}

#Preview {
    RecordEchoWorkflowView()
}
