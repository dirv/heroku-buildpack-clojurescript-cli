# heroku-buildpack-clojurescript-cli

Use this package if you want to build ClojureScript applications using the built-in Clojure CLI, without having to use Leiningen or Boot.

An added benefit is that you can run Clojure tasks, which I use for migrations with Migratus via the Heroku release phase.

I think eventually this could be useful for Clojure apps too, especially if the Clojure CLI supported building in addition to running programs.

# For it to work

Both `deps.edn` and `prod.cljs.edn` must be present in the project root.

# Still outstanding

 * Should cache .cpcache directory too
 * No environment variable support yet
 * `bin/release` should have some default targets if `Procfile` is not present
 * No ability to build a JAR during compile

