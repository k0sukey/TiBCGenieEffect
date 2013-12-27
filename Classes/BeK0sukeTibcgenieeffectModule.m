/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "BeK0sukeTibcgenieeffectModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiViewProxy.h"
#import "KrollCallback.h"

#import "UIView+Genie.h"

@implementation BeK0sukeTibcgenieeffectModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"6c3836b9-d47a-4efd-a94d-6719b2dd3304";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"be.k0suke.tibcgenieeffect";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	// [super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}

-(void)animate:(id)args
{
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    ENSURE_UI_THREAD_1_ARG(args);
    #pragma clang diagnostic pop
    
    TiViewProxy *proxy;
    NSDictionary *properties;
    KrollCallback *callback;
    
    ENSURE_ARG_AT_INDEX(proxy, args, 0, TiViewProxy);
    ENSURE_ARG_OR_NIL_AT_INDEX(properties, args, 1, NSDictionary);
    ENSURE_ARG_OR_NIL_AT_INDEX(callback, args, 2, KrollCallback);
    
    NSTimeInterval duration = [TiUtils floatValue:[properties objectForKey:@"duration"] def:1000] / 1000;
    CGRect rect = CGRectInset([TiUtils rectValue:[properties objectForKey:@"destination"]], 5.0, 5.0);
    
    if ([TiUtils intValue:[properties objectForKey:@"type"] def:0])
    {
        [proxy.view genieOutTransitionWithDuration:duration
                                         startRect:rect
                                         startEdge:[TiUtils intValue:[properties objectForKey:@"edge"] def:0]
                                        completion:^{
                                            if (callback)
                                            {
                                                [proxy _fireEventToListener:@"animated"
                                                                 withObject:nil
                                                                   listener:callback
                                                                 thisObject:proxy];
                                            }
                                        }];
    }
    else
    {
        [proxy.view genieInTransitionWithDuration:duration
                                  destinationRect:rect
                                  destinationEdge:[TiUtils intValue:[properties objectForKey:@"edge"] def:0]
                                       completion:^{
                                           if (callback)
                                           {
                                               [proxy _fireEventToListener:@"animated"
                                                                withObject:nil
                                                                  listener:callback
                                                                thisObject:proxy];
                                           }
                                       }];
    }
}

MAKE_SYSTEM_PROP(GENIE_IN, 0);
MAKE_SYSTEM_PROP(GENIE_OUT, 1);
MAKE_SYSTEM_PROP(RECT_TOP, BCRectEdgeTop);
MAKE_SYSTEM_PROP(RECT_RIGHT, BCRectEdgeRight);
MAKE_SYSTEM_PROP(RECT_BOTTOM, BCRectEdgeBottom);
MAKE_SYSTEM_PROP(RECT_LEFT, BCRectEdgeLeft);

@end
