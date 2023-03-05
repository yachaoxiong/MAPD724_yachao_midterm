import GameplayKit
import SpriteKit

class Player : GameObject
{
    // Initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        self.zRotation = -.pi / 2
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func Start()
    {
        zPosition = Layer.plane.rawValue
        Reset()
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    override func CheckBounds()
    {
        // constrain the player on the left boundary
        if(position.y <= -255)
        {
            position.y = -255
        }
        
        // constrain the player on the right boundary
        if(position.y >= 255)
        {
            position.y = 255
        }
    }
    
    override func Reset()
    {
        position.x = -705
        position.y = 0
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
    
}
