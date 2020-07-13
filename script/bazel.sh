VERSION=$1
cd $HOME/toolchains
wget https://github.com/bazelbuild/bazel/archive/$VERSION.zip
unzip $VERSION.zip
cd bazel-$VERSION
env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh
echo "Remember to add bazel in your PATH\n"
echo "Bazel is in bazel/output"
