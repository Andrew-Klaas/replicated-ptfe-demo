output "replicated console password" {
  value = "${random_pet.replicated-pwd.id}"
}

output "ptfe fqdn(s)" {
  value = "${list(module.demo.demo_fqdn, module.pes.pes_fqdn, module.pmd.pmd_fqdn)}"
}

output "next steps" {
  value = "To finish the installation visit https://<fqdn>:8800 to install your license file, choose the release channel and installation type."
}
