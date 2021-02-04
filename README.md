# ace-s2i-demo
Initial experiments with S2I; see ot4i-ace-docker also

```
s2i build -e LICENSE=accept . ace-s2i-builder-image --runtime-image ace-s2i-runtime-image --runtime-artifact /tmp/ace-server ace-sample-s2i-image
```
Images from https://github.com/tdolby-at-uk-ibm-com/ace-docker/tree/master/experimental/s2i which in turn depend on ace-full and ace-minimal in the peer directories in that repo.
