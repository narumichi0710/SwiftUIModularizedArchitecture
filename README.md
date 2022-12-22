# SwiftUIModularizedArchitecture(12/21~)

## Referred to modularized architecture in [pointfreeco/isowords](https://github.com/pointfreeco/isowords)


## Dependency diagram(編集中)

```mermaid
flowchart LR
  SwiftUIAPP --> AppFeature
 
    subgraph SwiftPackage
    direction TB
        AppFeature --> Tutorial
        AppFeature --> Search
        AppFeature --> Explore
        AppFeature --> Setting
        AppFeature --> ApiClient
    end
```

