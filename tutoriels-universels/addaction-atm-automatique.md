# AddAction ATM automatique

## 1- Introduction <a id="bkmrk-page-title"></a>

Cette modification très simple a faire permet a vos mappeurs de ne pas avoir a placer des Inits sur les objets qu'ils posent: par exemple les ATM.  

Il permet aussi, pour les ATM placé dans le jeu initialement, de posséder un addaction.

## 2- Installation <a id="bkmrk-page-title"></a>

Dans `core/fn_SetUpAction.sqf` rajoutez la ligne suivante juste après

```text
life_Action= [];

life_actions pushBack (life_actions pushBack ( player addAction[ "Distributeur", life_fnc_atmMenu, "",0,false,false,"", ' call life_fnc_nearATM &&  !dialog ' ]);
```

