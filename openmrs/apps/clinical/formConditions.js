Bahmni.ConceptSet.FormConditions.rules = {
    "Current Medical conditions, Lifestyle modification": function(formName, formFieldValues) {
        var currentMedicalConditions = formFieldValues['Current Medical conditions, Lifestyle modification'];
        if (currentMedicalConditions === "Other") {
            return {
                show: ["Other Medical condition, Specify"]
            }
        } else {
            return {
                hide: ["Other Medical condition, Specify"]
            }
        }
    },
    "Current Medications, Lifestyle modification": function(formName, formFieldValues) {
        var currentMedications = formFieldValues['Current Medications, Lifestyle modification'];
        if (currentMedications === "Other") {
            return {
                show: ["Current Medications, Specify"]
            }
        } else {
            return {
                hide: ["Current Medications, Specify"]
            }
        }
    },
    "Past Medical history, Lifestyle modification": function(formName, formFieldValues) {
        var pastMedicalHistory = formFieldValues['Past Medical history, Lifestyle modification'];
        if (pastMedicalHistory === "Other") {
            return {
                show: ["Past Medical history, Specify"]
            }
        } else {
            return {
                hide: ["Past Medical history, Specify"]
            }
        }
    },
    "Family history, Lifestyle modification": function(formName, formFieldValues) {
        var familyHistory = formFieldValues['Family history, Lifestyle modification'];
        if (familyHistory === "Other") {
            return {
                show: ["Family history, Specify"]
            }
        } else {
            return {
                hide: ["Family history, Specify"]
            }
        }
    },
    "Past Surgical History, Lifestyle modification": function(formName, formFieldValues) {
        var pastSurgicalHistory = formFieldValues['Past Surgical History, Lifestyle modification'];
        if (pastSurgicalHistory === "Other") {
            return {
                show: ["Past Surgical History, Specify"]
            }
        } else {
            return {
                hide: ["Past Surgical History, Specify"]
            }
        }
    },
    "Investigations, Lifestyle modification": function(formName, formFieldValues) {
        var investigations = formFieldValues['Investigations, Lifestyle modification'];
        if (investigations === "Other") {
            return {
                show: ["Investigations, Specify"]
            }
        } else {
            return {
                hide: ["Investigations, Specify"]
            }
        }
    },
    "Hormonal findings, Lifestyle modification": function(formName, formFieldValues) {
        var hormonalFindings = formFieldValues['Hormonal findings, Lifestyle modification'];
        if (hormonalFindings === "Other") {
            return {
                show: ["Hormonal findings, Specify"]
            }
        } else {
            return {
                hide: ["Hormonal findings, Specify"]
            }
        }
    },
    "Hormonal treatment plan, Lifestyle modification": function(formName, formFieldValues) {
        var hormonalTreatmentPlan = formFieldValues['Hormonal treatment plan, Lifestyle modification'];
        if (hormonalTreatmentPlan === "Other") {
            return {
                show: ["Hormonal treatment plan, Specify"]
            }
        } else {
            return {
                hide: ["Hormonal treatment plan, Specify"]
            }
        }
    },
    "Exercise treatment plans, Lifestyle modification": function(formName, formFieldValues) {
        var exerciseTreatmentPlan = formFieldValues['Exercise treatment plans, Lifestyle modification'];
        if (exerciseTreatmentPlan === "Other") {
            return {
                show: ["Exercise treatment plans, Specify"]
            }
        } else {
            return {
                hide: ["Exercise treatment plans, Specify"]
            }
        }
    },
    "Exercise findings, Lifestyle modification": function(formName, formFieldValues) {
        var exerciseFindings = formFieldValues['Exercise findings, Lifestyle modification'];
        if (exerciseFindings === "Other") {
            return {
                show: ["Exercise findings, Specify"]
            }
        } else {
            return {
                hide: ["Exercise findings, Specify"]
            }
        }
    },
    "Nutritional findings, Lifestyle modification": function(formName, formFieldValues) {
        var nutritionalFindings = formFieldValues['Nutritional findings, Lifestyle modification'];
        if (nutritionalFindings === "Other") {
            return {
                show: ["Nutritional findings, Specify"]
            }
        } else {
            return {
                hide: ["Nutritional findings, Specify"]
            }
        }
    },
    "Nutritional treatment plan, Lifestyle modification": function(formName, formFieldValues) {
        var nutritionalTreatmentPlan = formFieldValues['Nutritional treatment plan, Lifestyle modification'];
        if (nutritionalTreatmentPlan === "Other") {
            return {
                show: ["Nutritional treatment plan, Specify"]
            }
        } else {
            return {
                hide: ["Nutritional treatment plan, Specify"]
            }
        }
    },
    "Injury findings, Lifestyle modification": function(formName, formFieldValues) {
        var injuryFindings = formFieldValues['Injury findings, Lifestyle modification'];
        if (injuryFindings === "Other") {
            return {
                show: ["Injury findings, Specify"]
            }
        } else {
            return {
                hide: ["Injury findings, Specify"]
            }
        }
    },
    "Injury treatment plans, Lifestyle modification": function(formName, formFieldValues) {
        var injuryTreatmentPlans = formFieldValues['Injury treatment plans, Lifestyle modification'];
        if (injuryTreatmentPlans === "Other") {
            return {
                show: ["Injury treatment plans, Specify"]
            }
        } else {
            return {
                hide: ["Injury treatment plans, Specify"]
            }
        }
    },
    "Mental wellness findings, Lifestyle modification": function(formName, formFieldValues) {
        var mentalWellnessFindings = formFieldValues['Mental wellness findings, Lifestyle modification'];
        if (mentalWellnessFindings === "Other") {
            return {
                show: ["Mental wellness findings, Specify"]
            }
        } else {
            return {
                hide: ["Mental wellness findings, Specify"]
            }
        }
    },
    "Mental wellness treatment plans, Lifestyle modification": function(formName, formFieldValues) {
        var mentalWellnessTreatmentPlans = formFieldValues['Mental wellness treatment plans, Lifestyle modification'];
        if (mentalWellnessTreatmentPlans === "Other") {
            return {
                show: ["Mental wellness treatment plans, Specify"]
            }
        } else {
            return {
                hide: ["Mental wellness treatment plans, Specify"]
            }
        }
    },
    "Differential Diagnosis": function(formName, formFieldValues) {
        var differentialDiagnosis = formFieldValues['Differential Diagnosis'];
        if (differentialDiagnosis === "Other, Specify") {
            return {
                show: ["Orthopaedic Form Differential Diagnosis, Specify"]
            }
        } else {
            return {
                hide: ["Orthopaedic Form Differential Diagnosis, Specify"]
            }
        }
    },
    "Diagnosis": function(formName, formFieldValues) {
        var diagnosis = formFieldValues['Diagnosis'];
        if (diagnosis === "Other, Specify") {
            return {
                show: ["Orthopaedic Form Differential Diagnosis, Specify"]
            }
        } else {
            return {
                hide: ["Orthopaedic Diagnosis, Specify"]
            }
        }
    },
    "Investigations": function(formName, formFieldValues) {
        var investigations = formFieldValues['Investigations'];
        if (investigations === "Other, Specify") {
            return {
                show: ["Orthopaedic Investigations, Specify"]
            }
        } else {
            return {
                hide: ["Orthopaedic Investigations, Specify"]
            }
        }
    },
};