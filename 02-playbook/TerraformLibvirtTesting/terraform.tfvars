prefix = "my_infra-"

pool_path = "/var/lib/libvirt/"

image = {
  name = "alma-8-genericcloud"
  url  = "https://repo.almalinux.org/almalinux/8/cloud/x86_64/images/AlmaLinux-8-GenericCloud-latest.x86_64.qcow2"
}


vm = {
  bridge = "virbr0"
  cpu    = 1
  disk   = 10 * 1024 * 1024 * 1024
  ram    = 1024
}
