# OpenShift OKD
This project provisions a single node OpenShift OKD cluster on KVM/QEMU VM's.

# Important
When using okd, make sure to download the openshift tools for okd. The redhat provided tools will not work on fedora coreos.[^1].

# Setup
## vm's
|hostname           |cpu's |memory (mib) |ip address    |
|-------------------|------|-------------|--------------|
|okd-bootstrap      |4     |15260        |192.168.150.3 |
|okd-controlplane-1 |4     |15260        |192.168.150.10|

## cluster
|name |domain  |url                                                  |
|-----|--------|-----------------------------------------------------|
|local|okd.lab |https://console-openshift-console.apps.local.okd.lab |


# Pre-requisites
- Download and unzip the Fedora CoreOS QEMU image into [coreos](coreos)[^2]
- Download openshift-install and extract it into [tools](tools)[^3]
- Setup dnsmasq so everything can be resolved
    ```bash
    address=/okd.lab/192.168.150.3
    address=/okd.lab/192.168.150.10
    ```
- RedHat pull secret[^4]
- Generate ignition configuration files
    ```bash
    openshift-install create ignition-configs --dir ignition_configs/
    ```

# Provision OpenShift OKD
- Create infrastructure, run the commands from within the terraform directory
    ```bash
    terraform init
    terraform apply -auto-approve
    ```
- Install bootstrap node, run commands from within the ignition_configs directory
    ```bash
    openshift-install wait-for bootstrap-complete --log-level=debug
    ```
- At this point the bootstrap node can be destroyed
    ```bash
    # destroy bootstrap node with terraform
    ```
- Install controlplane, run commands from within the igntion_configs directory
    ```bash
    openshift-install wait-for install-complete --log-level=debug
    ```

# References
- https://www.okd.io/
- https://www.okd.io/guides/upi-sno/#architecture-this-refers-to-a-full-high-availability-cluster
- https://www.okd.io/installation/#plan-your-installation
- https://docs.fedoraproject.org/en-US/fedora-coreos

[^1]: https://shivering-isles.com/til/2021/07/openshift-installer-is-not-openshift-installer
[^2]: https://fedoraproject.org/coreos/download
[^3]: https://github.com/okd-project/okd/tags
[^4]: https://console.redhat.com/openshift/downloads
