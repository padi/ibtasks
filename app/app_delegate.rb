include SugarCube::Adjust

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds

    storyboard = UIStoryboard.storyboardWithName "Storyboard", bundle: nil

    @window.rootViewController = storyboard.instantiateInitialViewController

    @window.makeKeyAndVisible

    @task = Task.deserialize_from_file 'tasks.dat'
    true
  end
end
