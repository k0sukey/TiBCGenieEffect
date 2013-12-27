## TiBCGenieEffect

Wapping [BCGenieEffect](https://github.com/Ciechan/BCGenieEffect) module.
OSX style genie effect inside your iOS Titanium app.

![image](TiBCGenieEffect.png)

### Usage

More information, see [example/app.js](https://github.com/k0sukey/TiBCGenieEffect/blob/master/example/app.js)

	var Genie = require('be.k0suke.tibcgenieeffect');
	var view = Ti.UI.createView({
		width: 100,
		height: 100,
		backgroundColor: '#f00'
	});
	
	Genie.animate(view,
		{
			type: Genie.GENIE_IN,
			duration: 1000,
			destination: {
				x: (Ti.Platform.displayCaps.platformWidth - 60) / 2,
				y: Ti.Platform.displayCaps.platformHeight - 60,
				width: 60,
				height: 60
			},
			edge: GENIE.RECT_TOP
		},
		function(){
			console.log('animation completed');
		});

### License

The MIT License (MIT) Copyright (c) 2013 Kosuke Isobe, Socketbase Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.