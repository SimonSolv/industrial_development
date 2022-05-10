import Foundation

class FeedModule {
    var checkWord: String?
    var controlWord = "Password"
    var input: FeedViewModel
    var output: FeedViewModel
    var view: FeedViewController
    init(input: FeedViewModel, output: FeedViewModel, view: FeedViewController) {
        self.input = input
        self.output = output
        self.view = view
    }

}



