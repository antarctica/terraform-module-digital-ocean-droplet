# Module variables

variable "hostname" {
	description = "Label for droplet within terraform and the droplet's hostname"
}
variable "image" {
	default = "ubuntu-14-04-x64"
	description = "See https://developers.digitalocean.com/#list-all-images for a list of possible values"
}
variable "region" {
	default = "lon1"
	description = "See https://developers.digitalocean.com/#regions for a list of possible values"
}
variable "size" {
	default = "512mb"
	description = "See https://developers.digitalocean.com/#sizes for a list of possible values"
}
variable "private_networking" {
	default = "true"
	description = "See https://www.digitalocean.com/company/blog/introducing-private-networking/"
}
variable "ssh_fingerprint" {
	description = "See module read-me for details"
}


# Module 'actions' (for lack of a better word)

resource "digitalocean_droplet" "droplet" {
    image = "${var.image}"
    name = "${var.hostname}"
    region = "${var.region}"
    size = "${var.size}"
    private_networking = "${var.private_networking}"
    ssh_keys = [
    	"${var.ssh_fingerprint}"
    ]
}


# Module outputs

output "hostname" {
    value = "${var.hostname}"
}
output "ip_v4_address_public" {
    value = "${digitalocean_droplet.droplet.ipv4_address}"
}
output "ip_v4_address_private" {
    value = "${digitalocean_droplet.droplet.ipv4_address_private}"
}
