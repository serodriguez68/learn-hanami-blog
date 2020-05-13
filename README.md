# Notes

Request - response cycle
- `/insights/:slug`
- Routes
  - Routes are namespaced per slice
  - `/insights/:slug => "benchmarks.show" => slice/actions/repo/show`
- Actions
  - Equivalent to controller actions, but each action gets its own file
  - Each action explicitly says which view model to use
    - `include Deps[view: "views.benchmarks.show"]`
- Views
  - e.g. `Main::Views::Benchmarks::Show`
  -Each instance of a view object is a transformation between input parameters and a rendered view
  - Documentation: DRY View (Hanami View)
  - It contains the hmtl template to use on the render
  - It interacts with the `repos` to do any operations
  - Repos return `Entities` to the `view`
  - The view`expose`s the variables the html template needs
  - The exposed variables are `Entities` that have been wrapped / decorated as `View::Parts`
  - The inferred name of the `View::Part` is based on the `exposure` name, NOT the `Entity` class
- Repos
  - e.g. `Main::BenchmarkRepo`
  - Encapsulate the persistence API for `Benchmarks`.
  - e.g. create, save, find_by
  - It defines whether a resource can be created, read, updated or deleted and _how_ that is done.
  - Repos never return objects with live connections to the database. This forces you to place
  all your persistence logic in here and expose it to higher levels as methods.
    - This happens if you materialize your results (`#one`, `#to_a`, `#one!`).
    - It is _usually_ bad practice not materialize your results.  Some exceptions to this is pagination. 
  - Repos return `Entities` or `[Entities]`, whose public interface is defined in the corresponding `Entity` class.
  - Internally, `repos` do their work using `ROM::Relations`.
  - `ROM` is like Rails' `ActiveRecord` in the sense that it provides chainable, lazy access to the database using
     just Ruby.
- Entities
  - e.g `Main::Entities::Benchmark < CultureFirst::Entities::Benchmark`
  - They are very close to a PORO.
  - Each `Entity` represents "a thing".
  - They are powered by `ROM::Struct`, that automatically gives entities access to their attribues based on 
  their entity structure (see `Relation`).
- Relations
  - e.g.`Persistence::Relations::Benchmarks`
  - Represents a DB relation (typically maps to 1 table) /  single data source. 
  - An instance of this carries a live connection to the DB
  - It is a singleton instance for the lifecycle of the app
  - TODO: do associations go here? 
  
  
  
