import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    // initializer / constructor
    init()
    {
        super.init(imageString: "cloud", initialScale: 1.0)
        self.position.x = 926
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    
    override func Start()
    {
        zPosition = Layer.cloud.rawValue
        alpha = 0.5 // 50% transparent
        Reset()
    }
    
    override func Update()
    {
        Move()
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        if(position.x <= -926)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        // randomize the vertical speed: 4 to 2
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 4.0) - 2.0
        
        // randomize the horizontal speed: 5 to 10
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // get a pseudo random number for the X position: -262 to 262
        position.x = 926
        
        // get a pseudo random number for the Y position: 414 to -414
        let randomY:Int = (randomSource?.nextInt(upperBound: 928))! - 414
        position.y = CGFloat(randomY)
        
        isColliding = false
    }
    
    // public method
    func Move()
    {
        position.x -= horizontalSpeed!
        position.y -= verticalSpeed!
    }
}
