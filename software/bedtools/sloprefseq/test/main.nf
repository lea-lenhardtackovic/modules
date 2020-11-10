#!/usr/bin/env nextflow

nextflow.preview.dsl = 2

include { BEDTOOLS_SLOPREFSEQ } from '../../sloprefseq/main.nf' addParams( options: [publish_dir:'test_bed_file'])

// Define input channels

// Run the workflow
workflow test_bed_file{
    def input = []
    input = [ [ id:'test', single_end:true ], 
              [ file("${baseDir}/input/A.bed", checkIfExists: true),] ]

    BEDTOOLS_SLOPREFSEQ (
        input, 
        file("${baseDir}/input/genome.sizes", checkIfExists: true)
    )
    

}

workflow {
    test_bed_file()
}
