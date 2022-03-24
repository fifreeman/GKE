provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "vpc" {
  source = "github.com/terraform-google-modules/terraform-google-network"
  project_id   = var.project_id
  network_name = var.network_name

    subnets = [
        {
            subnet_name           = var.subnet_name
            subnet_ip             = var.subnet_ip
            subnet_region         = var.subnet_region
        },
    ]

    secondary_ranges = {
        europe-west2 = [
            {
                range_name    = "europe-west2-01-gke-01-pods"
                ip_cidr_range = "10.1.0.0/24"
            },   
            {
                range_name    = "europe-west2-01-gke-01-services"
                ip_cidr_range = "10.2.0.0/24"
            },
        ]
    }
}
