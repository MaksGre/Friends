//    RulesSetInfoViewController
//    @IBAction func studyButtonTap(_ sender: UIButton) {
//        presenter?.didTapStudyButton()
//    }
//    
//    RulesSetInfoPresenterImpl
//    func didTapStudyButton() {
//        router.showExercise(rulesSetId: state.rulesSetId)
//    }
//    
//    RulesSetInfoRouterImpl
//    func showExercise(rulesSetId: String) {
//        let vc = ExerciseAssembly.createModule(serviceAssembly: serviceAssembly, rulesSetId: rulesSetId)
//        viewController?.show(vc, sender: self)
//    }
