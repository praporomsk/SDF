# SDF
Distance field fonts for cocos2dx 3v

to convert image use image magic

<img src="https://github.com/praporomsk/SDF/raw/master/bmf.png" width=200> -> <img src="https://github.com/praporomsk/SDF/raw/master/font.png" width=200>

```convert bmf.png -filter Jinc -resize 400% -threshold 30%  \( +clone -negate -morphology Distance Euclidean -level 50%,-50% \) -morphology Distance Euclidean -compose Plus -composite -level 45%,55% -resize 25% font.png ```

cocos2dx example

```
Label* sdfLabel = Label::createWithBMFont("fonts/font.fnt", "12345678");
sdfLabel->setPosition(Vec2(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));
this->addChild(sdfLabel);
  
GLProgram* mSdfShader = GLProgram::createWithFilenames("shaders/sdfFont.vsh", "shaders/sdfFont.fsh");
GLProgramState* state = GLProgramState::create(mSdfShader);
sdfLabel->setGLProgramState(state);
    
state->setUniformVec4("color", Vec4(1,0,0,1));
state->setUniformVec3("borderColor", Vec3(1,1,1));
state->setUniformVec4("params", Vec4(0.48,22,0.35,10));
```