resource "stackit_kubernetes_project" "cluster" {
  project_id = var.project_id
}

resource "stackit_kubernetes_cluster" "cluster" {
  name                  = var.cluster_name
  kubernetes_project_id = stackit_kubernetes_project.cluster.id

  node_pools = [{
    name          = "c"
    machine_type  = "c1.2"
    minimum       = "4"
    maximum       = "8"
    zones         = ["eu01-1"]
    os_version    = "3374.2.0"
  }]
}
