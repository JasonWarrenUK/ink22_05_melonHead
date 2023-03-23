#author: Jason Warren
#title: Human Resources Happiness Profile

//Variables
	VAR userActive = "\{ERROR EMPLOYEE UNIDENTIFIED\}"
	VAR reasonDenied = "ERROR"
	VAR userProfile = ""
	VAR currentStatus = "Access Denied"
	
	-   Welcome, new employee. #class: terminal
	-   Please complete HR Happiness Profile before commencing duties. #delay: 1500 #class: terminal
	
	+   Begin
	        #CLEAR
	        -> begin


=== begin
	-   Welcome {userActive}.#class: terminal
	-   As per our Privacy Policy, we have scraped relevant image files from your social media accounts. #class: terminal
	-   (selection) Please select image file for Employee Identification Photographic Record #delay: 1500 #class: terminal
	
	+   tinder.jpg
	        --  #CLEAR
	        ~ userProfile = "tinder"
	        --  Current Profile Picture: #image: avatar_tinder.jpg #delay: 1500
	+   grindr.jpg
	        --  #CLEAR
	        ~ userProfile = "grindr"
	        --  Current Profile Picture: #image: avatar_grindr.jpg #delay: 1500
	+   linkedin.jpg
	        --  #CLEAR
	        ~ userProfile = "linkedin"
	        --  Current Profile Picture: #image: avatar_linkedin.jpg #delay: 1500
	
	
	-   Confirm profile picture? #class: terminal
    
    +   Yes
        #CLEAR
        -> check
    +   No
        #CLEAR
        -> selection
	
=== check
	-> checkStart

	= checkStart

		-	Initiate security check? #class: terminal

		+	[Yes]
				#clear
				-> checkQuestion_birth

		+	[No]
				#clear
				-> checkResult
			
	= checkResult

		-	Active User: {userActive} 	#delay: 1500 #class: terminal
		-	Status: {currentStatus} 	#delay: 1500 #class: terminal
		-	Details: {reasonDenied} 	#delay: 1500 #class: terminal

		+	Re-Enter Security Details
				#CLEAR
				-> checkStart
				
	= checkQuestion_birth

		-	Please choose birth year. #class: terminal

		+	1961
				~ userActive = "Shouty_Man"
				~ reasonDenied = "Potential Dictator"
		+	1985
				~ userActive = "PerfectBrother"
				~ reasonDenied = "Too Sexy"
		+	1996
				~ userActive = "M370nh34d"
				-> checkQuestion_Name
		+	2000
				~ userActive = "ImperfectBrother"
				~ reasonDenied = "Interpol Red List"

		-
			#CLEAR
				-> checkResult
				
	= checkQuestion_Name
		
		-	User Active: {userActive} #class: terminal
			Correct? #delay: 1500 #class: terminal

		+	Yes
			#CLEAR
				-> checkPass_input

		+	No
			#CLEAR
			~ reasonDenied = "User Confused"
				-> checkResult
				
	= checkPass_input
		
		VAR passSyllable = 1
		VAR passAssembled = ""
		VAR passAddition = ""

		-	Welcome, {userActive} #class: terminal
			Archive Access is restricted; passphrase required. #delay: 1500 #class: terminal
		
		-	(input) {passAssembled != "": Passphrase Assembly: |} {passAssembled} #class: terminal

		-	Input Passphrase (Segment {passSyllable}): #class: terminal

		*	{passSyllable == 1} [m48]
			~ passAddition = "m48"
			~ passSyllable += 1

		*	{passSyllable == 2} [m4831d]
			~ passAddition = "31d"
			~ passSyllable += 1

		*	{passSyllable == 3} [0^^]
			~ passAddition = "0^^"
			~ passSyllable += 1

		*	{passSyllable == 4} [y93]
			~ passAddition = "y93"
			~ passSyllable += 1

		*	{passSyllable == 5} [n!5]
			~ passAddition = "n!5"
			~ passSyllable += 1

		*	{passSyllable == 6} [h3d]
			~ passAddition = "h3d"
			~ passSyllable += 1

	    ~ stringBuilder (passAssembled, passAddition)

		-	#CLEAR

		-	{passSyllable: 
				- 7: -> checkPass_done
				- else: -> input
			}
			
	= checkPass_done
		
		#CLEAR

		-> submit
		
		-	(submit) Submit passphrase? #class: terminal

		+	{submit == 1} m4831d0^^y93n!5h3d
		+	{submit == 2} M483lD0^^yP3n!5h3d
		+	{submit == 3} M4b31 D0^ny P3n!sh3d
		+	{submit == 4} Mabel Donny Penishead

		-	#CLEAR

		-	(attempts) {submit < 4: ERROR, PASSPHRASE CORRUPTED -> submit} #class: terminal
		
		-	(accepted) PASSPHRASE ACCEPTED #delay: 1500 #class: terminal
				
		-   #CLEAR

			-> archive

	
	
=== archive
	-> archiveOpen

	= archiveOpen
	    #CLEAR
	    VAR issuesAll = 0
	    
	    VAR issuesAssociates = 0
	    VAR issuesHealth = 0
	    VAR issuesCriminal = 0
    
		-   Welcome Melonhead. #class: terminal
		
		-   (menu) {issuesAll != 6: Please contact HR to resolve the following issues before commencing employment.| Checking...} #class: terminal
        -   (update)    ~ issuesAll = issuesAssociates + issuesHealth + issuesCriminal

		+   {issuesAll == 6} [All Issues Resolved]
		        #CLEAR
		        -> ending
		+   {issuesAssociates != 2} [Associations with Sanctioned Individuals]
		        #CLEAR
		        -> associates
	    +   {issuesHealth != 2} [Health Concerns]
		        #CLEAR
		        -> health
	    +   {issuesCriminal != 2} [Allegations of Criminality]
		        #CLEAR
		        -> criminal
		

    = associates
        -   Known links to the following individuals of interest to (inter)national authorities:  #class: terminal
        
        *   [Burton Kev] 
                #CLEAR
                --  Burton Kev has been implicated in the downfall of several governments. #class: terminal
                --	#image: criminal01.jpg #delay: 1500
                --  Mainly targets devolved administrations in predominantly Celtic cultural areas. #delay: 1500 #class: terminal
                --  Currently top of the Cornish Liberation Movement's most wanted list. #delay: 1500 #class: terminal
                --  Banned from Isle of Man after shouting "This isn't even a real fucking country" at passers-by. #delay: 1500 #class: terminal
                
        *   ["Cabin Boy"]
                #CLEAR
                --  "Cabin Boy" was banned from UK waters after attaching submachine guns to luxury yachts against both maritime law & owners' wishes. #class: terminal
                --	#image: criminal02.jpg #delay: 1500
                --  May be same individual as the "Putin of the Pacific" mentioned in Puerto Rican news reports #delay: 1500 #class: terminal
        
        -   ~ issuesAssociates += 1
        
        +   Review more issues.
                #CLEAR
                -> archiveOpen.menu
        
    
    = health
        *   [Dietary Imbalance]
                #CLEAR
                --  Please note that positions in North American offices will not be offered until a Healthy Lifestyle Retraining Course is undertaken. #class: terminal
                #image: food01.jpg
                
        *   [Emotional Instability]
                #CLEAR
                --  As evidenced in the following images (taken 5 seconds apart), worrying swings in emotional state have been observed. #class: terminal
                #image: emotion01.jpg
                #image: emotion02.jpg
        
        -   ~ issuesHealth += 1
        
        +   Review more issues.
                #CLEAR
                -> archiveOpen.menu
        
    = criminal
        Criminal charges pending trial. Please note that a guilty verdict will automatically nullify any pre-existing employment contract. #class: terminal
        
        *   [Religiously Motivated Hate Crimes]
                #CLEAR
                --  For more information, please refer to the BBC documentary "The Bumming of the Christ Child: Max Warren's Festive Subversion" #class: terminal
                #image: culture01.jpg
                
        *   [Unprovoked Violence/Terror Attacks]
                #CLEAR
                --  Trial date pending; police have been unable to locate the kindly elderly gentleman seen being attacked here. #class: terminal
                #image: violence01.jpg
        
        -   ~ issuesCriminal += 1
        
        +   Review more issues.
                #CLEAR
                -> archiveOpen.menu
    
=== ending
    -   Happy Birthday fuckpuffin!
        Here's some other gems I've found. #delay: 1500
    
    -   #image: duo01.jpg #delay: 1500
    -   #image: duo02.jpg #delay: 1500
    -   #image: trio01.jpg #delay: 1500
    -   #image: trio02.jpg #delay: 1500
    -   #image: trio03.jpg #delay: 1500
    -   #image: trio04.jpg #delay: 1500
    
    -   See you soon. #delay: 1500
    
    +   Start Game Again
            #RESTART
            -> DONE
    +   Fuck That
            #CLEAR
            THE END
            -> END

=== silo
	-> undefined
	
	= WIP
	
		-	Out of content, LOL.

		+	Start Again
			#RESTART
			    -> DONE
		+	Fuck no.
	    		-> END
	    		
	= undefined
	    -   ERROR: Undefined
	        You've been sent to the silo knot directly without a stitch address
	            -> END
=== function stringBuilder (ref old, new)
	~ old += new