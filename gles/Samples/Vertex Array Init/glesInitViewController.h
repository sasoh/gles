//
//  glesInitViewController.h
//  ch1_init
//
//  Created by Alexander Popov on 7/1/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import <GLKit/GLKit.h>

@interface glesInitViewController : GLKViewController {
    GLuint _vertexBufferId;
    GLKBaseEffect *_baseEffect;
    GLKVector3 vertices[3];
}

@end
