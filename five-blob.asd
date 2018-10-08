(asdf:defsystem five-blob
  :author "Pavel Korolev"
  :description "Foreign library collection of libfive"
  :license "MIT"
  :defsystem-depends-on (:bodge-blobs-support)
  :class :bodge-blob-system
  :depends-on (base-blobs)
  :libraries (((:darwin :x86-64) "libfive.dylib" "x86_64/")
              ((:darwin :x86-64) "libfive.wrapper.dylib" "x86_64/")
              ((:unix (:not :darwin) :x86-64) "libfive.so" "x86_64/")
              ((:unix (:not :darwin) :x86-64) "libfive.wrapper.so" "x86_64/")
              ((:windows :x86-64) "libfive.dll" "x86_64/")
              ((:windows :x86-64) "libfive.wrapper.dll" "x86_64/")))
