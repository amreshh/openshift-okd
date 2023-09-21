resource "libvirt_network" "okd_network" {
  name      = "okd_network"
  mode      = "nat"
  domain    = "okd.lab"
  addresses = ["192.168.150.0/24"]
  autostart = false

  dns {
    enabled    = true
    local_only = false
  }

  dnsmasq_options {
    # Bootstrap
    options {
      option_name  = "address"
      option_value = "/okd-bootstrap.local.okd.lab/192.168.150.3"
    }
    options {
      option_name  = "host-record"
      option_value = "okd-bootstrap.local.okd.lab,192.168.150.3"
    }
    options {
      option_name  = "address"
      option_value = "/api-int.local.okd.lab/192.168.150.3"
    }
    options {
      option_name  = "host-record"
      option_value = "api-int.local.okd.lab,192.168.150.3"
    }

    # Control nodes
    options {
      option_name  = "address"
      option_value = "/okd-controlplane-1.local.okd.lab/192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/okd-controlplane-2.local.okd.lab/192.168.150.11"
    }
    options {
      option_name  = "address"
      option_value = "/okd-controlplane-3.local.okd.lab/192.168.150.12"
    }
    options {
      option_name  = "host-record"
      option_value = "okd-controlplane-1.local.okd.lab,192.168.150.10"
    }
    options {
      option_name  = "host-record"
      option_value = "okd-controlplane-2.local.okd.lab,192.168.150.11"
    }
    options {
      option_name  = "host-record"
      option_value = "okd-controlplane-3.local.okd.lab,192.168.150.12"
    }
    options {
      option_name  = "address"
      option_value = "/api.local.okd.lab/192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/api.local.okd.lab/192.168.150.11"
    }
    options {
      option_name  = "address"
      option_value = "/api.local.okd.lab/192.168.150.12"
    }
    options {
      option_name  = "host-record"
      option_value = "api.local.okd.lab,192.168.150.10"
    }
    options {
      option_name  = "host-record"
      option_value = "api.local.okd.lab,192.168.150.11"
    }
    options {
      option_name  = "host-record"
      option_value = "api.local.okd.lab,192.168.150.12"
    }
    options {
      option_name  = "address"
      option_value = "/api-int.local.okd.lab/192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/api-int.local.okd.lab/192.168.150.11"
    }
    options {
      option_name  = "address"
      option_value = "/api-int.local.okd.lab/192.168.150.12"
    }
    options {
      option_name  = "host-record"
      option_value = "api-int.local.okd.lab,192.168.150.10"
    }
    options {
      option_name  = "host-record"
      option_value = "api-int.local.okd.lab,192.168.150.11"
    }
    options {
      option_name  = "host-record"
      option_value = "api-int.local.okd.lab,192.168.150.12"
    }
    options {
      option_name  = "address"
      option_value = "/.apps.local.okd.lab/192.168.150.11"
    }
    options {
      option_name  = "address"
      option_value = "/.apps.local.okd.lab/192.168.150.12"
    }
    options {
      option_name  = "address"
      option_value = "/.apps.local.okd.lab/192.168.150.13"
    }
    options {
      option_name  = "address"
      option_value = "/oauth-openshift.apps.local.okd.lab/192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/oauth-openshift.apps.local.okd.lab/192.168.150.11"
    }
    options {
      option_name  = "address"
      option_value = "/oauth-openshift.apps.local.okd.lab/192.168.150.12"
    }
    options {
      option_name  = "address"
      option_value = "/console-openshift-console.apps.local.okd.lab/192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/console-openshift-console.apps.local.okd.lab/192.168.150.11"
    }
    options {
      option_name  = "address"
      option_value = "/console-openshift-console.apps.local.okd.lab/192.168.150.12"
    }

    # Etcd
    options {
      option_name  = "address"
      option_value = "/etcd-0.local.okd.lab/192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/etcd-1.local.okd.lab/192.168.150.11"
    }
    options {
      option_name  = "address"
      option_value = "/etcd-2.local.okd.lab/192.168.150.12"
    }
    options {
      option_name  = "srv-host"
      option_value = "_etcd-server-ssl._tcp,etcd-0.local.okd.lab,2380"
    }
    options {
      option_name  = "srv-host"
      option_value = "_etcd-server-ssl._tcp,etcd-1.local.okd.lab,2380"
    }
    options {
      option_name  = "srv-host"
      option_value = "_etcd-server-ssl._tcp,etcd-2.local.okd.lab,2380"
    }
  }
}
