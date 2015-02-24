package com.jordiv.emovix

class TwitterQueryResponseClassification {
	Date dateCreated
	String offendingWords
	Float ranking
	Float score
	String type
	
	static belongsTo = [queryResponse: TwitterQueryResponse]
	
    static constraints = {
		offendingWords nullable: true, blank: true
		ranking nullable: false
		score nullable: false
		type nullable: false
    }
}
