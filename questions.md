1. Can `asdf` and `rvm` coexist somehow?
1. I already had a `postgres` installed in my computer through homebrew.  How does `asdf` handle having multiple
versions of postgres on the same computer? What if one of those versions is not installed through `asdf`?
1. What is `overmind`? Replacement to Foreman
1. Can we go through a Hanami structure tour?
  - Is `lib/*` where all the core/common code goes and `slices` where only the bit for each sub application goes?
  - Why the redundancy `lib/entities` and `slices/entities`?
1. Are slices meant to be differnt sub-apps within the codebase? (e.g. API and Web?)
1. What is the purpose of the `view` model?
1. Is it correct to say that every `exposed` variable in the view gets "wrapped" / "decorated" with a view part?
1. is it true that entities get their attributes automatically inferred following the DB structure due to the relations
`infer: true`?
1. Where do associations go? in `repos?` or in `relations`? (I assume that in relations)
