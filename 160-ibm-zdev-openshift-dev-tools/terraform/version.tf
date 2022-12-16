terraform {
  required_providers {
    gitops = {
      source = "cloud-native-toolkit/gitops"
    }

    clis = {
      source = "cloud-native-toolkit/clis"
    }

    ibm = {
      source = "ibm-cloud/ibm"
    }

  }
}