//
//  linmsdebug.h
//  Ratings
//
//  Created by Coming on 12/12/9.
//  Copyright (c) 2012年 Coming. All rights reserved.
//

#ifndef Ratings_linmsdebug_h
#define Ratings_linmsdebug_h

#define linmspl() NSLog(@"%s(%d)\n", __FUNCTION__, __LINE__)
#define linmsfns(args...) do{NSLog(@"%s(%d): ", __FUNCTION__, __LINE__); NSLog(args);}while(0)


#endif
