variable _region {
    type = map(string)
    default = {
        default = "us-east-1"
        dev     = "us-east-1"
        homol   = "us-west-1"
        prod    = "sa-east-1"
    }
}
