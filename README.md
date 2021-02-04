# ace-s2i-demo
Initial experiments with S2I; see ot4i-ace-docker also

```
s2i build -e LICENSE=accept https://github.com/tdolby-at-uk-ibm-com/ace-s2i-demo.git ace-s2i-builder-image --runtime-image ace-s2i-runtime-image --runtime-artifact /tmp/ace-server ace-sample-s2i-image
```
Images from https://github.com/tdolby-at-uk-ibm-com/ace-docker/tree/master/experimental/s2i which in turn depend on ace-full and ace-minimal in the peer directories in that repo.


## What doesn't work

Using the "oc new-app" tool doesn't work properly, as it insists on using the **builder** image (3GB) instead of switching to the runtime image (400MB). There are also some issues with setting LICENSE=accept, but those can be worked around. Assuming a registry at my.registry:5000 with the images from ace-docker from above, the command would look like this:
```
oc new-app -e LICENSE=accept my.registry:5000/ace-s2i-builder-image2~https://github.com/tdolby-at-uk-ibm-com/ace-s2i-demo -e LICENSE=accept
```
