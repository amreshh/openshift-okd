https://github.com/okd-project/okd/blob/master/Guides/UPI/libvirt/libvirt.md
https://www.okd.io/guides/upi-sno/#architecture-this-refers-to-a-full-high-availability-cluster
https://www.okd.io/installation/#plan-your-installation


# Important
When using okd, make sure to download the openshift tools for okd. The redhat provided tools will not work on fedora coreos: https://shivering-isles.com/til/2021/07/openshift-installer-is-not-openshift-installer
https://www.okd.io/installation/#getting-started



# Virtual Network
- Create with virtual_network.xml

# Download tools
```bash
# Check for versions: https://quay.io/repository/openshift/okd?tab=tags&tag=latest
./oc adm release extract --tools quay.io/openshift/okd:4.13.0-0.okd-2023-08-18-135805

# or maybe https://github.com/okd-project/okd/releases
```

# Bootstrap node
1. Create VM with:
    - CPUs: 4
    - RAM: 8192 MB
    - Disk: 100 GB
2. Boot from iso and run
    ```bash
    sudo coreos-installer install /dev/vda --ignition-url http://192.168.100.2:8080/bootstrap.ign --image-url http://192.168.100.2:8080/fedora-coreos-38.20230806.3.0-metal.x86_64.raw.xz  --insecure-ignition -–insecure
    ```
3. Shutdown VM, change boot order to boot from disk and start VM again
4. Locally run
    ```bash
    ./openshift-install wait-for bootstrap-complete --log-level=debug
    ```

# Master node
1. Create VM with:
    - CPUs: 4
    - RAM: 16384 MB
    - Disk: 100 GB
2. Boot from iso and run
    ```bash
    sudo coreos-installer install /dev/vda --ignition-url http://192.168.100.2:8080/master.ign --image-url http://192.168.100.2:8080/fedora-coreos-38.20230806.3.0-metal.x86_64.raw.xz  --insecure-ignition -–insecure
    ```
3. Shutdown VM, change boot order to boot from disk and start VM again
4. Locally run
    ```bash
    ./openshift-install --dir bootstrap wait-for bootstrap-complete --log-level=debug
    ```



# Debugging
https://github.com/okd-project/okd/issues/229
https://github.com/openshift/installer/blob/master/docs/user/metal/install_upi.md


```bash
INFO Checking to see if there is a route at openshift-console/console...
DEBUG Route found in openshift-console namespace: console
DEBUG OpenShift console route is admitted
INFO Install complete!
INFO To access the cluster as the system:admin user when using 'oc', run 'export KUBECONFIG=/okd/install/all-files/auth/kubeconfig'
INFO Access the OpenShift web-console here: https://console-openshift-console.apps.okd-lab.okd.local
INFO Login to the console with user: "kubeadmin", and password: "Y8XPA-xnQ9L-DF3ut-YSH6F"
DEBUG Time elapsed per stage:
DEBUG Cluster Operators: 5m39s
INFO Time elapsed: 5m39s
[root@okd-svc all-files]#
```



https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/
https://coreos.github.io/butane/