organization updating
notifyOfRecategorizedSelector: element from: oldCategory to: newCategory
	SystemAnnouncer uniqueInstance selector: element recategorizedFrom: oldCategory to: newCategory inClass: self.
	SystemAnnouncer uniqueInstance 
		suspendAllWhile: [self notifyUsersOfRecategorizedSelector: element from: oldCategory to: newCategory].