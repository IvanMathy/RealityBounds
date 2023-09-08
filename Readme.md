<hr/>

<p align="center">

  <img src="docs/logo.svg?raw=true" width="663" alt="logo">
</p>

<hr/>

For years, 3D software engineers around the globe have been trying to solve a seemingly simple question: "Is my content in the right spot?".

Hello my name is Ivan and for the past week I have been fighting and trying to understand why in heck my RealityKit content is being clipped and overall not in the right spot.

<p align="center">
  <img src="docs/hero.png?raw=true" width="663" alt="screenshot">
</p>

After a few days of placing colorful spheres in random places and troubleshooting, I arrived at the conclusion that volumes in visionOS previews are, in their current form, broken. The size of the clipped content is seemingly arbitrary and so is its position. I opened a radar (FB13129449) to hopfully getting it resolved, but it also means that for now, we have to stick to the fully-fledge simulator.

Without the ability to do some quick reload and tweaks, answering the "Is my content in the righy spot?" question become a whole lot difficult. While Xcode does provide a Boundong box debug visualization, it is not very helful considering it shows the models and OS elements, but not the one thing that is truly useful: the bounds of the volume itself. Furthermore, if you had the audacity to start your application in a way that isn't aligned with the original view direction, the bounding box aren't aligned with your volume's origin.



As such, I decided to create a small utility that draw big ugly blocky boxes in each corner so you can tell what's what. It's not terribly complicated but it's pretty darn useful. Plus the great thing about open source is that I am allowed to rant in the readme.

## How do I use it?

Import RealityBounds into your project (`File > Add Package Dependencies...`) then paste this repo's URL (`https://github.com/IvanMathy/RealityBounds`) into the top right search box.

```Swift
import SwiftUI
import RealityKit
import RealityBounds

struct GameWindow: View {
  var body: some View {
    RealityView { content in
      content.add(BoundsVisualizer())
    }
  }
}

```

<p align="center">
  <img src="docs/one.png?raw=true" width="663" alt="screenshot">
</p>

This assumes your volume is the default size, as in `[1, 1, 1]`. If not, you can easily provide custom dimensions:

```Swift
content.add(BoundsVisualizer(bounds: [1,2,3]))
```

> [!IMPORTANT]  
> Make sure you resize your window with `.defaultSize(width: 1, height: 2, depth: 3, in: .meters)` first.a


<p align="center">
  <img src="docs/two.png?raw=true" width="663" alt="screenshot">
</p>

You can also customize the size and the length of the indicators, to change the visual appearance of the bounding box:

```Swift
content.add(BoundsVisualizer(bounds: [1,1,1], size: 0.01, length: 0.4))
```

<p align="center">
  <img src="docs/three.png?raw=true" width="663" alt="screenshot">
</p>

As the virtual evironment are pretty busy, the default color can easily get lost. You can change the color/material of the indicators by passing a material:

```Swift
let mat = UnlitMaterial(color: .green)
content.add(BoundsVisualizer(bounds: [1,1,1], material: mat))
```

<p align="center">
  <img src="docs/four.png?raw=true" width="663" alt="screenshot">
</p>


## Why does it not work in Xcode previews?

Because previews clip the content differently than volumetric windows and I cannot for the life of me figure out how to get it to work properly. I have opened a Radar about it as previously mentioned. 

## Anything else?

You should [follow me on Mastodon](https://mastodon.social/@ivanmathy) because that is where I primarily post about visionOS development. I am also on the other platforms under the [@OKatBest](https://twitter.com/OKatBest) handle.