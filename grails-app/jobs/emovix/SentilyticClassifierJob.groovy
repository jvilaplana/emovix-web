package emovix

import com.jordiv.emovix.TwitterQueryResponse
import com.jordiv.emovix.TwitterQueryResponseClassification
import grails.plugins.rest.client.RestBuilder

class SentilyticClassifierJob {
    static triggers = {
      simple repeatInterval: 20 * 1000l // execute job once in 5 seconds
    }

    def execute() {
        // execute job
		def twitterQueryResponseList = TwitterQueryResponse.list()
		
		def rest = new RestBuilder(connectTimeout:1000, readTimeout:20000)
		def host = "http://restful.scm.ulster.ac.uk:8080/Treze/SentilyticClassifier?message="
		for(TwitterQueryResponse r : twitterQueryResponseList) {
			if(r.classifications.size() == 0) {
				//def resp = rest.get(host + java.net.URLEncoder.encode(r.text))
				def resp = rest.get(host + r.text.encodeAsURL().replace('+', ' '))
				//println "\tRESP: " + resp.json.Response
				resp.json.Response.Classifications.each { c ->
					def twitterQueryResponseClassification = new TwitterQueryResponseClassification()
					twitterQueryResponseClassification.queryResponse = r
					twitterQueryResponseClassification.offendingWords = c["Offending Words"]
					twitterQueryResponseClassification.ranking = c["Ranking"]
					twitterQueryResponseClassification.score = c["Score"]
					twitterQueryResponseClassification.type = c["Type"]
					twitterQueryResponseClassification.save(flush: true)
				}
			}
		}
    }
}
