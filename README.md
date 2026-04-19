# ecommerce-proto

Source de vérité unique des contrats Protobuf pour l'ensemble de l'écosystème :
- Backend Rust (`ecommerce-api`)
- Frontend Next.js (`ecommerce-web`)
- Application iOS (`ecommerce-ios`)

Les contrats sont publiés sur le **Buf Schema Registry (BSR)** :
**`buf.build/owenbriceindrianarison/ecommerce`**

## Workflow

1. Modifier un `.proto` → ouvrir une PR
2. La CI valide : `buf lint` + `buf breaking` contre la branche `main`
3. Merge → tag semver (ex: `v1.3.0`) → push to BSR via la CI
4. Les consommateurs (api / web / ios) bumpent leur dépendance vers la nouvelle version

## Versionnement

On suit semver strict :
- **MAJOR** : breaking change (renommage, suppression de champ, changement de type)
- **MINOR** : ajout d'un champ optionnel ou d'une RPC
- **PATCH** : correction de commentaire / formatage

## Commandes

\`\`\`bash
buf lint                  # vérifie la syntaxe et les conventions
buf breaking --against .git#branch=main  # vérifie la rétrocompatibilité
buf build                 # compile sans générer de code
buf push --tag v1.3.0     # publie vers le BSR (fait par la CI sur tag)
\`\`\`