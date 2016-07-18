# SwiftExtensions
Collection of Swift extensions

## UIColor

```
// Init with string or hex int value
UIColor(string: "#fafafa")   // RGB hex string
UIColor(string: "#fba")      // RGB short hex string
UIColor(string: "#fafafa80") // RGBa hex string
UIColor(string: "#fba8")     // RGBa short hex string
UIColor(hex: 0x808080)       // RGB int hex value
```

## Flat UI Colors
Colors by [flat UI Colors](http://flatuicolors.com/)

```
UIColor.flat.alizarin
UIColor.flat.carrot
...
```


## UIImage
```
// Image filled with given color and size
let image = UIImage(color: UIColor.orangeColor(), size: CGSizeMake(100, 200))
// Resize image proportionally to width 50
image.resize(50)
```

## UIScreen
```
UIScreen.maxDeviceWidth // Returns main screen max width
```
## UIDevice
```
/// Returns device type based on screen inches
switch UIDevice.deviceType {
case .iphone_3_5_inch:
    // iPhone 4/4S
    break
case .iphone_5_5_inch:
    // iPhone 6+/6+S
    break
default:
    break
}
/// Check specific device
switch UIDevice.model {
case .iPhoneSE:
    break
case .iPadPro12:
    break
default:
    break
}
/// Device model string value:
UIDevice.modelName // Returns for ex. "iPhone 6S Plus"
```
## UITraitCollection
```
traitCollection.maxDeviceWidth // Returns max device width in pixels
traitCollection.deviceInches   // Returns device screen inches type

// Easy to check if it is iPhone 4 or 4S
if traitCollection.deviceInches == .iphone_3_5_inch {
    // iPhone 3.5" with inches screen
}
```
