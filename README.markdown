# EUI, It's a thing
This project is currently a library of layout managers for use with UIKit. The long term plan is 
to identify and abstract really laborious and error-prone day to day tasks but only if they are *really* 
laborious and *painfully* error-prone so as to keep the library lightweight.

## Using it
Clone the source and open up the project in XCode. You will see two targets. One is a kitchen sink 
example application, the other is a static library. To use EUI in your own project you can link to the 
static library or just copy the sources.

## Gimmee the 15 second overview
Ok, it's pretty simple. There is an `EUIContainer` class which is a subclass of `UIView`. To use layouts,
you create an `EUIContainer` and set it's `layout` property to one of the `EUILayout` classes. Containers
can have a delegate which will get notified when the size of the container changes. `EUILayout` will lay out
its containers subviews when it is sent the message `layoutContainer`. You can also layout the container
*and* specify the sizes for each subview at the same time by sending `layoutContainerWithSubviewSizes`.
This makes it possible to animate a lot of changes in one block smoothly.

Don't forget to check out the example app if it's not clicking.

## License
You can do whatever you like with it 'cuz it's MIT.