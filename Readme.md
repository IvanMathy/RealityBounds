#RealityBounds

For years, 3D software engineers around the globe have been trying to solve a seemingly simple question: "Is my content in the right spot?".

Hello my name is Ivan and for the past week I have been fighting and trying to understand why in heck my RealityKit content is being clipped and overall not in the right spot.

After a few days of placing colorful spheres in random places and troubleshooting, I arrived at the conclusion that volumes in VisionOS previews are, in their current form, broken. The size of the clipped content is seemingly arbitrary and so is its position. I opened a radar (FB13129449) to hopfully getting it resolved, but it also means that for now, we have to stick to the fully-fledge simulator.

Without the ability to do some quick reload and tweaks, answering the "Is my content in the righy spot?" question become a whole lot difficult. While Xcode does provide a Boundong box debug visualization, it is not very helful considering it shows the models and OS elements, but not the one thing that is truly useful: the bounds of the volume itself. Furthermore, if you had the audacity to start your application in a way that isn't aligned with the original view direction, the bounding box aren't aligned with your volume's origin.

As such, I decided to create a small utility that draw big ugly blocky boxes in each corner so you can tell what's what.

```Swift

RealityView { content, attachments in

  content.add(BoundsVisualizer())

} 
  // ...

```

This assumes your volume is the default size, as in `[1, 1, 1]`. If not, you can easily provide custom dimensions:

```Swift

RealityView { content, attachments in

  content.add(BoundsVisualizer(bounds: [1,2,3]))

} 
  // ...

```