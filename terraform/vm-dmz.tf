resource "proxmox_virtual_environment_vm" "srv_dmz" {
  node_name = "pve"
  name      = "SRV-DMZ"
  vm_id     = 105

  cpu {
    cores = 1
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 1024
  }

  cdrom {
    file_id   = "local:iso/ubuntu-26.04-live-server-amd64.iso"
    interface = "ide0"
  }

  disk {
    datastore_id = "local-lvm"
    size         = 20
    interface    = "virtio0"
    discard      = "on"
  }

  network_device {
    bridge = "vmbr4"
    model  = "virtio"
  }

  boot_order = ["ide0", "virtio0"]
  started    = false
}
