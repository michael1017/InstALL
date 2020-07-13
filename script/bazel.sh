#/bin/bash -e
VERSION=$1
cd $HOME/toolchains
wget https://github.com/bazelbuild/bazel/releases/download/$VERSION/bazel-$VERSION-dist.zip
unzip bazel-$VERSION-dist.zip -d bazel-$VERSION-dist
cd bazel-$VERSION-dist
env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh
echo "Remember to add bazel in your PATH\n"
echo "Bazel is in bazel/output"
