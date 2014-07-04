//
//  glesInitViewController.h
//  gles
//
//  Created by Alexander Popov on 7/4/14.
//  Copyright (c) 2014 ---. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "AGLKVertexAttribArrayBuffer.h"

@interface glesInitMiscViewController : GLKViewController {
    AGLKVertexAttribArrayBuffer *_vertexBuffer;
    GLKBaseEffect *_baseEffect;
}

@end
