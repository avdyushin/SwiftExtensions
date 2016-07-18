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

## UIImage
```
// Image filled with given color and size
let image = UIImage(color: UIColor.orangeColor(), size: CGSizeMake(100, 200))
// Resize image proportionally to width 50
image.resize(50)
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
