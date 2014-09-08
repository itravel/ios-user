import UIKit

class FileUtility: NSObject {
   
    
    class func cachePath(fileName:String)->String
    {
      var arr =  NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
       var path = arr[0] as String
        return "\(path)/\(fileName)"
    }
    
    
    class func imageCacheToPath(path:String,image:NSData)->Bool
    {
       return image.writeToFile(path, atomically: true)
    }
    
    class func imageDataFromPath(path:String)->AnyObject
    {
       var exist = NSFileManager.defaultManager().fileExistsAtPath(path)
        if exist
        {
          return  UIImage(contentsOfFile: path)
        }
        
        return NSNull()
    }
    
    
    
    
}
