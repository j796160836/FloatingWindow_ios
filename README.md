# FloatingWindow (iOS)

A Swift written floating window view for iOS.

## Screenshot


## Run the example

It use CocoaPods for example.

Run the 

```
pod install
```

then opens `FloatingWindowInApp.xcworkspace` for sample project.

## Usage

Use Xcode interface builder to build a view within a view.  
Like this.



It will use first child of layout element for floatingWindow.

### MarginCalculation

You can define your own `MarginCalculationProtocol` max and min margin calculation.  
It provide two calculation method in example code.

- MarginCalculationToEdge

	- **Min left:** 0  
	(Stick to left edge.) 
	- **Min top:** 0  
	(Stick to top edge.) 
	- **Max left:** containerWidth - floatingWindowWidth  
	(Stick to right edge.) 
	- **Max top:** containerHeight - floatingWindowHeight  
	(Stick to bottom edge.)
	
- MyMarginCalculation

	- **Min left:** -floatingWindowWidth + 40px  
	(Overflow layout with reveal 40px right stitch)
	- **Min top:** -floatingWindowHeight + 40px  
	(Overflow layout with reveal 40px bottom stitch)
	- **Max left:** containerWidth - 40px  
	(Overflow layout with reveal 40px left stitch)
	- **Max top:** containerHeight - 40px  
	(Overflow layout with reveal 40px top stitch)
	
### setFloatingWindowMargin()

You can move floating window by manual using `setFloatingWindowMargin()` method.

```
public func setFloatingWindowMargin(
    leftMargin: CGFloat, topMargin: CGFloat,
    animated: Bool = false, completeCallback: (() -> Void)? = nil) {
    // ...
}
```
See the sample code for details.

## Dependency

This project use following dependency:

- SnapKit



