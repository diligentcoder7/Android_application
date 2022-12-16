package processing.test.android_watch_project;
        
import processing.android.PWatchFaceCanvas;
import processing.core.PApplet;
        
public class MainService extends PWatchFaceCanvas {
  @Override
  public PApplet createSketch() {
    PApplet sketch = new android_watch_project();
    
    return sketch;
  }
}
