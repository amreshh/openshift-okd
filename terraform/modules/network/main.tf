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
    options {
      option_name  = "address"
      option_value = "/okd-bootstrap.okd-lab.okd.local/192.168.150.3"
    }
    options {
      option_name  = "host-record"
      option_value = "okd-bootstrap.okd-lab.okd.local,192.168.150.3"
    }
    options {
      option_name  = "address"
      option_value = "/okd-controlplane-1.okd-lab.okd.local/192.168.150.10"
    }
    options {
      option_name  = "host-record"
      option_value = "okd-controlplane-1.okd-lab.okd.local,192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/api.okd-lab.okd.local/192.168.150.2"
    }
    options {
      option_name  = "host-record"
      option_value = "api.okd-lab.okd.local,192.168.150.2"
    }
    options {
      option_name  = "address"
      option_value = "/api-int.okd-lab.okd.local/192.168.150.2"
    }
    options {
      option_name  = "host-record"
      option_value = "api-int.okd-lab.okd.local,192.168.150.2"
    }
    options {
      option_name  = "address"
      option_value = "/etcd-0.okd-lab.okd.local/192.168.150.10"
    }
    options {
      option_name  = "address"
      option_value = "/.apps.okd-lab.okd.local/192.168.150.2"
    }
    options {
      option_name  = "srv-host"
      option_value = "_etcd-server-ssl._tcp,etcd-0.okd-lab.okd.local,2380"
    }
    options {
      option_name  = "address"
      option_value = "/oauth-openshift.apps.okd-lab.okd.local/192.168.150.2"
    }
    options {
      option_name  = "address"
      option_value = "/console-openshift-console.apps.okd-lab.okd.local/192.168.150.2"
    }
  }
}
