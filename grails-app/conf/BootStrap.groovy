import com.jordiv.emovix.Role
import com.jordiv.emovix.TwitterQuery
import com.jordiv.emovix.User
import com.jordiv.emovix.UserRole

class BootStrap {

    def init = { servletContext ->
		
		def bootstrapEnabled = false
		
		if(bootstrapEnabled) {
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
			User adminUser = new User(username: 'admin', fullName: 'Jordi Vilaplana', password: 'admin1', enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false).save(flush: true)
			UserRole.create adminUser, adminRole
			
			def twitterQuery = new TwitterQuery(name: 'Bullying', query: '(bitch you OR your) OR (gay your OR your) OR faggot OR (dumb you OR your) OR (stupid you OR your) OR fuck OR shit OR ass -xD lang:en', count: '10', enabled: false).save(flush: true)
		}
    }
    def destroy = {
    }
}
