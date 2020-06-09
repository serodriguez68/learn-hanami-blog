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


27 May 2020
1. Are there route helpers?
  - no helpers at this point
1. Are there form helpers that are based on a resource?
  - No form helpers
1. How to to put the CSRF token in the form?
  - bypassed 
1. How are params parsed in controllers
  - articles[title] will get parsed as { articles: { title: 'foo' } }
1. Lets talk about contracts and how to validate stuff
1. How to surface those erros to the form
