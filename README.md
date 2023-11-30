# OpenShift OKD
This project provisions a single node OpenShift OKD cluster on KVM/QEMU VM's. Infrastructure is provisioned using terraform and the cluster is created using the User-provisioned infrastructure (UPI) method.

# Important
When using okd, make sure to download the openshift tools for okd. The redhat provided tools will not work on fedora coreos[^1].

# Setup
## vm's
|hostname           |cpu's |memory (mib) |ip address    |
|-------------------|------|-------------|--------------|
|okd-bootstrap      |4     |15260        |192.168.150.3 |
|okd-controlplane-1 |4     |15260        |192.168.150.10|
|okd-controlplane-2 |4     |15260        |192.168.150.11|
|okd-controlplane-3 |4     |15260        |192.168.150.12|

## cluster
|name |domain  |url                                                  |
|-----|--------|-----------------------------------------------------|
|local|okd.lab |https://console-openshift-console.apps.local.okd.lab |


# Pre-requisites
Do these steps before opening the project in a devcontainer.
- Download and unzip the Fedora CoreOS QEMU image into `./coreos`[^2] (create the folder if it doesn't exist)
- Download openshift-install and extract it into `./.devcontainer/tools`[^3][^4] (create the folder if it doesn't exist)
- Setup dnsmasq so everything can be resolved
    ```bash
    address=/okd.lab/192.168.150.3    # bootstrap
    address=/okd.lab/192.168.150.10   # controlplane 1 
    address=/okd.lab/192.168.150.11   # controlplane 2
    address=/okd.lab/192.168.150.12   # controlplane 3
    ```
- RedHat pull secret[^5]
- Copy [install-config.yaml.template](install-config.yaml.template) to [install-config.yaml](install-config.yaml) and fill in the required values. The install-config.yaml file is used to generate the ignition files[^6].

Following steps can be done within the devcontainer.
- Generate ignition configuration files
    ```bash
    openshift-install create ignition-configs --dir ignition_configs/
    ```

# Provision OpenShift OKD
- Create the infrastructure
    ```bash
    cd terraform
    terraform init
    terraform apply -auto-approve
    ```
- Install the bootstrap node
    ```bash
    cd ignition_configs
    openshift-install wait-for bootstrap-complete --log-level=debug
    ```
- At this point the bootstrap node can be destroyed
    ```bash
    cd terraform
    terraform destroy -target module.domain.libvirt_domain.okd_bootstrap
    ```
- Install the cluster
    ```bash
    cd ignition_configs
    openshift-install wait-for install-complete --log-level=debug
    ```

# References
- https://www.okd.io/
- https://www.okd.io/installation/#plan-your-installation
- https://www.okd.io/guides/upi-sno/#architecture-this-refers-to-a-full-high-availability-cluster
- https://docs.fedoraproject.org/en-US/fedora-coreos
- https://docs.openshift.com/container-platform/4.13/installing/installing_platform_agnostic/installing-platform-agnostic.html

[^1]: https://shivering-isles.com/til/2021/07/openshift-installer-is-not-openshift-installer
[^2]: https://fedoraproject.org/coreos/download
[^3]: https://github.com/okd-project/okd/tags
[^4]: https://amd64.origin.releases.ci.openshift.org/
[^5]: https://console.redhat.com/openshift/downloads
[^6]: https://docs.openshift.com/container-platform/4.13/installing/installing_platform_agnostic/installing-platform-agnostic.html#installation-initializing-manual_installing-platform-agnostic
