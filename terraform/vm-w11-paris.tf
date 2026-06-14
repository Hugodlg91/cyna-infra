resource "proxmox_virtual_environment_vm" "clt_w11_paris" {
  node_name = "pve"
  name      = "CLT-W11-PARIS"
  vm_id     = 104

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 4096
  }

  cdrom {
    file_id   = "local:iso/windows11.iso"
    interface = "ide0"
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/virtio-win.iso"
    interface    = "ide1"
    size         = 8
  }

  disk {
    datastore_id = "local-lvm"
    size         = 60
    interface    = "virtio0"
    discard      = "on"
  }

  network_device {
    bridge = "vmbr3"
    model  = "virtio"
  }

  boot_order = ["ide0", "virtio0"]
  started    = false
}
