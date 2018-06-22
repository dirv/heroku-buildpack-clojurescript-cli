#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

_createBaseProject() {
  cat > ${BUILD_DIR}/deps.edn <<EOF
{:deps {org.clojure/clojure {:mvn/version "1.9.0"}
        org.clojure/clojurescript {:mvn/version "1.10.238"}}}
EOF

  mkdir -p ${BUILD_DIR}/config

  cat > ${BUILD_DIR}/config/compiler.edn <<EOF
{ :output-to "compiled/main.js"
  :optimizations :simple
  :target :nodejs
  :main "sample.core"
}
EOF

  mkdir -p ${BUILD_DIR}/src/sample

  cat > ${BUILD_DIR}/src/sample/core.cljs <<EOF
(ns sample.core)

(defn -main [& args]
  (println "Welcome to my project! These are your args:" args))

(set! *main-cli-fn* -main)
EOF
}

testCompileJdk7() {
  _createBaseProject
  compile
  echo $(cat ${STD_OUT})
  echo $(cat ${STD_ERR})
  assertCapturedSuccess
  assertCaptured "Downloading: clojure-tools-1."
}
