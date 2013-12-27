var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
win.open();

var TiBCGenieEffect = require('be.k0suke.tibcgenieeffect');
Ti.API.info("module is => " + TiBCGenieEffect);

var inout = TiBCGenieEffect.GENIE_IN;

var view = Ti.UI.createView({
	width: 100,
	height: 100,
	backgroundColor: '#f00'
});
win.add(view);

var bottomButton = Ti.UI.createButton({
	top: 20,
	width: 60,
	height: 44,
	backgroundColor: '#fff',
	borderWidth: 1,
	borderRadius: 4,
	borderColor: '#333',
	color: '#333',
	title: 'Bottom'
});
win.add(bottomButton);
bottomButton.addEventListener('click', function(){
	TiBCGenieEffect.animate(view,
		{
			type: inout,
			duration: slider.getValue(),
			destination: {
				x: (Ti.Platform.displayCaps.platformWidth - 60) / 2,
				y: 20,
				width: 60,
				height: 44
			},
			edge: TiBCGenieEffect.RECT_BOTTOM
		},
		function(){
			console.log('BOTTOM COMPLETE');
		});

	inout = inout === TiBCGenieEffect.GENIE_IN ? TiBCGenieEffect.GENIE_OUT : TiBCGenieEffect.GENIE_IN;
});

var leftButton = Ti.UI.createButton({
	right: 0,
	width: 60,
	height: 44,
	backgroundColor: '#fff',
	borderWidth: 1,
	borderRadius: 4,
	borderColor: '#333',
	color: '#333',
	title: 'Left'
});
win.add(leftButton);
leftButton.addEventListener('click', function(){
	TiBCGenieEffect.animate(view,
		{
			type: inout,
			duration: slider.getValue(),
			destination: {
				x: Ti.Platform.displayCaps.platformWidth - 60,
				y: (Ti.Platform.displayCaps.platformHeight - 44) / 2,
				width: 60,
				height: 44
			},
			edge: TiBCGenieEffect.RECT_LEFT
		},
		function(){
			console.log('LEFT COMPLETE');
		});

	inout = inout === TiBCGenieEffect.GENIE_IN ? TiBCGenieEffect.GENIE_OUT : TiBCGenieEffect.GENIE_IN;
});

var topButton = Ti.UI.createButton({
	bottom: 0,
	width: 60,
	height: 44,
	backgroundColor: '#fff',
	borderWidth: 1,
	borderRadius: 4,
	borderColor: '#333',
	color: '#333',
	title: 'Top'
});
win.add(topButton);
topButton.addEventListener('click', function(){
	TiBCGenieEffect.animate(view,
		{
			type: inout,
			duration: slider.getValue(),
			destination: {
				x: (Ti.Platform.displayCaps.platformWidth - 60) / 2,
				y: Ti.Platform.displayCaps.platformHeight - 44,
				width: 60,
				height: 44
			},
			edge: TiBCGenieEffect.RECT_TOP
		},
		function(){
			console.log('TOP COMPLETE');
		});

	inout = inout === TiBCGenieEffect.GENIE_IN ? TiBCGenieEffect.GENIE_OUT : TiBCGenieEffect.GENIE_IN;
});

var rightButton = Ti.UI.createButton({
	left: 0,
	width: 60,
	height: 44,
	backgroundColor: '#fff',
	borderWidth: 1,
	borderRadius: 4,
	borderColor: '#333',
	color: '#333',
	title: 'Right'
});
win.add(rightButton);
rightButton.addEventListener('click', function(){
	TiBCGenieEffect.animate(view,
		{
			type: inout,
			duration: slider.getValue(),
			destination: {
				x: 0,
				y: (Ti.Platform.displayCaps.platformHeight - 44) / 2,
				width: 60,
				height: 44
			},
			edge: TiBCGenieEffect.RECT_RIGHT
		},
		function(){
			console.log('RIGHT COMPLETE');
		});

	inout = inout === TiBCGenieEffect.GENIE_IN ? TiBCGenieEffect.GENIE_OUT : TiBCGenieEffect.GENIE_IN;
});

var slider = Ti.UI.createSlider({
	bottom: 64,
	width: 240,
	min: 100,
	max: 3000,
	value: 1000
});
win.add(slider);

win.add(Ti.UI.createLabel({
	bottom: 84,
	left: 10,
	text: 'Duration'
}));