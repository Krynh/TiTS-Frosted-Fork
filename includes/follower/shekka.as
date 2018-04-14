//Mostly written by SomeKindofWizard

public function shekkaIsCrew():Boolean
{
	return (flags["SHEKKA_ONBOARD"] != undefined);
}
public function shekkaRecruited():Boolean
{
	return (flags["SHEKKA_RECRUITED"] == 1);
}
public function shekkaAddicted():Boolean
{
	return false;
}
public function shekkaIsAvailable():Boolean
{
	return (!pc.hasStatusEffect("Shekka_Cum_Playing") && !pc.hasStatusEffect("SHEKKA_CHEATING_ON_YOU_CD"));
}
//Post-Crew Menu
//Clicking on Shekka’s name when you’re selecting Ship Followers gives you the current description.
public function approachCrewShekka(back:Boolean = false):void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	if(flags["SHEKKA_ANNO_NERDOFF"] == -1)
	{
		shekkaAnnoFightFollowup();
		return;
	}
	if(back)
	{
		output("Shekka’s still there, cute as ever. Did you need anything else from her?");
	}
	else
	{
		output("Although it seems that Shekka doesn’t notice you on her approach, one of those floor-touching ears is flipped back, and her tail squirms nervously from side-to-side. She does a good job of looking busy... or maybe she actually <i>is</i> busy, thinking about it. She’s done a good job of converting your engine-room to an impromptu workshop. Although having a chest of tools has made a warm room even warmer, the body-suited Rask seems to be coping just fine.");
		output("\n\n<i>“Hey Shekka”</i> you say, smirking when she doesn’t jump in surprise. The curvy shortstack flips back her ears and ruffles her feathers out.");
		output("\n\n<i>“G’");
		if(hours < 12) output("mornin’");
		else if(hours < 18) output("noon");
		else output("evenin’");
		output(" [pc.name]. Is there anything I can do you for?”</i>");
	}
	shekkaCrewMenu();
}

public function shekkaCrewMenu():void
{
	clearMenu();
	addButton(0,"Appearance",crewShekkaAppearance);
	addButton(1,"Talk",talkToCrewShekka);
	addButton(2,"Spend Time",spendTimeWithShekka,undefined,"Spend Time","Spend some leisure time with your rasky crewmember.");
	if(pc.lust() >= 33) addButton(3,"Sex",shekkaCrewSexApproach);
	else addDisabledButton(3,"Sex","Sex","You aren’t quite in the mood for that.");
	/*Her menu looks as follows:
		//Appearance
		//Talk
		//	Planets
		//Tarkus
		//Tavros //Unlocked by going there with her on crew
		//New Texas //Unlocked by going there with her on crew
		//Myrellion //Unlocked by going there with her on crew
		//Uveto //Unlocked by going there with her on crew
		//Crew
		//	Anno
		//	Azra
		//	Bess
		//	Celise
		//	Nova
		//	Reaha
		//	Yammi	
		//Spend Time //Either do Tavros shit or Ship shit
		//??? //Turns into <i>“Addiction”</i> if you have aphrodisiac spit and she sleeps with you
		//Body //starts a conversation line about being Futa
		//Sex
		//	Bend her over
		//	Cum play //For people with them nuki nuts
		//	Ear play //now with a variation for smaller cocks	
		//	Anno Threesome
		//	Bed sex
		//		Be ridden
		//		Hard lovin’
		//	Get fucked //Greyed out unless Shekka Futa
		//		Anal
		//		Oral
		//		Vagoo
	*/
	addButton(5,"Buy", shekkaShop);
	addButton(6,"Sell", shekkaShop, true);
	if(pc.hasStatusEffect("Rusted Emitters")) addButton(7,"Fix Emit.",fixMyEmittersShekka,undefined,"Fix Emit.","See if Shekka can possibly fix your sydian-damaged shield emitters.");
	else addDisabledButton(7,"Fix Emit.","Fix Emit.","Your shield emitters are totally undamaged. Don’t worry about it.");
	if(pcHasJunkPrize() && flags["SHEKKA_SCRAP_DISABLED"] == undefined) addButton(8,"Sell Prize",shekkaGetsSoldRaskShitz,undefined,"Sell Prize","Try to sell off the sweet loot you bought from the gang of raskvel males.");
	else addDisabledButton(8,"Sell Prize","Sell Prize","You haven’t found any special salvage to sell.");
	addButton(14,"Back",crew);
}

//Appearance
public function crewShekkaAppearance():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard or Fenoxo");
	output("You take your time to admire Shekka’s figure, and she strikes a little pose for you, fanning herself. It seems moving from her previous wasteland to your ship has done wonders for her diet. Or more correctly... probably added a little to her cup-size.");
	output("\n\nShe hasn’t seen fit to change out of her usual hex-patterned, Aegis-shipyards jumpsuit either. It clings to her body like an erotic second skin. Her nipples poke accusingly out as though shrinkwrapped, and the plump lips of her pussy seem almost engorged by the tight layer of nano-weave fabric. The rest of her body is much as it has always been; the broad, egg-laying hips of a Raskvel put the span of her shoulders to shame.");
	//if futa
	if(shekka.hasCock()) 
	{
		output("\n\nNot including, of course, her more recent addition of a turgid, bitch-breaking ");
		if(!shekka.hasCock(GLOBAL.TYPE_EQUINE)) output("throbb-knob");
		else output("horsecock");
		output(" as it struggles not to break out of her clothing.");
	}
	output("\n\nThe feathers that makes for her species’ hair is still dyed the adorable bubblegum-pink, flaring exotically at the top whilst hanging down to her back. The red-scaled alien’s ears don’t so much as emerge from her plumage as it does drape down her sides. Thick golden rings and studs jingle and jangle from them with every errant head-moving, ensuring she can never sneak anywhere. Her face is adorable and youthful, with a button nose, soft lips, and big, slitted eyes.");
	if(flags["SHEKKA_SPITDICTED"] == 1) output(".. although, those slit pupils are currently dilated as far as they can go, tracing the movement of your mouth with ill-disguised need.");
	output("\n\nShe bounces on her heels, adding a little clicker-click of her clawed feet to the music of her ears. <i>“If you want a proper look at me, I’m happy to accommodate!”</i>");
	clearMenu();
	addButton(0,"Next",approachCrewShekka,true);
}

//Talk
public function talkToCrewShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("You let her know that you’re just down for a chat, and she puts down some miscellaneous machined-piece down on the floor–hopefully that didn’t come from your engine.");
	processTime(2);
	clearMenu();
	addButton(14,"Back",approachCrewShekka,true)
	addButton(0,"Places",talkToShekkaAboutPlaces,undefined,"Places","Talk to Shekka about some of the places you’ve been.");
	addButton(1,"People",talkToShekkaAboutPeople,undefined,"People","Talk to Shekka about some of the people you know.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED) || flags["SHEKKA_SPITDICTED"] != undefined) addButton(3,"Addiction",shekkaAddictionWheeee);
	else addDisabledButton(3,"???","???","You need aphrodisiac spit for this...");
	if(flags["SHEKKA_SLEEPWITH_INTRODUCED"] != undefined) addButton(4,"Sleep With",shekkaRepeatBedTalkies);
	else addDisabledButton(4,"Sleep With","Sleep With","Once Shekka has suggested sharing the bed, she’ll be more amenable to this in the future.");
	if(!shekka.hasCock()) addButton(5,"Get A Dick",talkToShekkaAboutGettingADick,undefined,"Get A Dick","It’s always better to have a little extra.");
	else addDisabledButton(5,"Get A Dick","Get A Dick","Shekka already has a dick!");
}

//Places
public function talkToShekkaAboutPlaces():void
{
	clearOutput();
	showShekka();
	output("Which place will you discuss?");
	clearMenu();
	addButton(14,"Back",talkToCrewShekka);
	if(flags["SHEKKA_BEEN_TAVROS"] != undefined) addButton(0,"Tavros",shekkaTalksAboutTavros);
	else addDisabledButton(0,"Tavros","Tavros","Shekka hasn’t been there yet!");
	addButton(1,"Tarkus",talkToCrewShekkaAboutTarkus);
	if(flags["LANDED_ON_TEXAS"] == undefined) addDisabledButton(2,"???","???","You haven’t been to this location yet!");
	else if(flags["SHEKKA_BEEN_NT"] != undefined) addButton(2,"New Texas",talkToShekkaAboutNewTexas);
	else addDisabledButton(2,"New Texas","New Texas","Shekka hasn’t been there yet!");
	if(flags["VISITED_MYRELLION"] == undefined) addDisabledButton(3,"???","???","You haven’t been to this location yet!");
	else if(flags["SHEKKA_BEEN_MYRELLION"] != undefined) addButton(3,"Myrellion",shekkaMyrellionTalk);
	else addDisabledButton(3,"Myrellion","Myrellion","Shekka hasn’t been there yet!");
	if(flags["VISITED_UVETO"] == undefined) addDisabledButton(4,"???","???","You haven’t been to this location yet!");
	else if(flags["SHEKKA_BEEN_UVETO"] != undefined) addButton(4,"Uveto",shekkaUvetoTalk);
	else addDisabledButton(4,"Uveto","Uveto","Shekka hasn’t been there yet!");
}
//Tarkus
public function talkToCrewShekkaAboutTarkus():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“Soooo...”</i> you begin, wondering where to start with such a question. <i>“What do you think about Tarkus these days?”</i>");

	output("\n\nShekka squints, rubbing one of her ears. <i>“Tarkus itself? I mean, it’s highly likely in my lifetime I get to see it become a place worth living in. More than just a shitty little scrapyard pretending to be more. Right now though? Still dangerous, and unhealthy.”</i>");

	output("\n\nShe sighs and gives the matter a little more thought. <i>“I mean, I know you aren’t asking me for the tourist-planner description, after all you have been through, I should be going to </i>you<i> for advice on traversing the wastes out there.”</i>");

	//Annoquest done, goos saved//
	if(flags["ANNO_MISSION_OFFER"] == 3 && flags["DECK13_GRAY_PRIME_DECISION"] != 3)
	{
		output("\n\n<i>“There are less of those Goos than before, and the ones still out there are occasionally being given... uh, memory chits I think? I know that the Galotian queen wanted to try and lend a hand with their being-recognized as a race. Sounds neat to me! ");
		//gave bodies//
		if(flags["DECK13_GRAY_PRIME_DECISION"] == 1) output("Especially since their Captain’s doing well, she’s able to turn some heads... what with being a technically-ancient, mortal-turned-immortal sentient. ");
		//Goo bodies//
		if(flags["DECK13_GRAY_PRIME_DECISION"] == 2) output("There </i>is<i> a little issue with the fact that the queen is more than a little horrified that an entire ship’s worth emergent, innocent intelligences got wiped out and replaced by functionally dead people.");
		output("”</i>");
	}
	//Cont here
	output("\n\nYou wave her on to continue. <i>“Yeah, yeah. Okay, well. Sidians are still jerks. That’s probably racist, but still. They’re all sorta... dying out. If I’m honest there’s only one thing that’s truly bothering me, and it’s those fucking Goblins.”</i>");
	output("\n\nWow, racist, you remark, and she furrows her brows. <i>“You’re right, you’re right. They’re probably not all bad. But except for that crazy dude who sold weird condoms or whatever they were, they take advantage of my people in order to get us to mine resources for them. Or, y’know. Outright slavery.”</i> she cracks her knuckles slowly.");
	output("\n\n<i>“I’ve seen the syllabus for the new Rasks though. Unlike most of my people, I plan. I’m a planner. And hopefully all the new kids will turn out to be planners too. Happy, healthy planners... who won’t take any of their shit.”</i>");
	output("\n\nIt’s the first time you’ve ever seen her properly express her distaste about someone. It’s kind of scary.");
	//Domme//
	//?if() output("The urge to break her in has your fingers twitching///subby//Mnf.}");
	output("\n\nShekka takes a deep breath after that, fondly stroking a spanner. <i>“Well, with that little unpleasantness covered. Anything else, [pc.name]?”</i>");
	//Next: back to Places menu
	processTime(30);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
}

//Tavros //Unlocked by going there with her on crew
public function shekkaTalksAboutTavros():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“I was wondering what your opinion was on Tavros.”</i> You begin, eyeing Shekka up and down. She immediately breaks out into a bright smile, clapping her hands together.");
	output("\n\n<i>“Terrifying!”</i> she says with delight, wiggling her hips.");
	output("\n\nThe response gives you a moment’s pause, but the curvy egg-layer doesn’t leave you curious for too long. <i>“Let’s look at it this way. Back when I lived on Tarkus the only thing that scared me was the dangers I already knew about. Tavros? Sweet stars and suns [pc.boyGirl]! There is now so much I don’t know. And somehow I’m fairly sure I could fix every last part of it!”</i>");
	output("\n\nHer cheerful smile becomes a briefly bashful grin <i>“Nearly got in trouble trying to tweak some girl’s engine, apparently ship security? Noooot fans of unsolicited repairs on dry-docked stuff, even if it looks half like scrap. Maybe I was just nostalgic.”</i>");
	output("\n\n<i>It couldn’t be, could it?</i>");
	output("\n\n<i>“The drinking is cool, the totally open sexual stuff is as exciting as it is mind-blowing... although I admit I’d have more fun doing that stuff with you than any other random spacer,”</i> she giggles when you roll your eyes before continuing. <i>“It’s a space station, except it’s right here in the middle of galactic fuck-nowhere, drawing in more varieties of aliens and droids and sex and drugs and foods than I’ve literally ever been able to dream of. And I dream pretty big.”</i>");
	if(pc.isBro()) output("\n\n<i>“Yeah, I think it’s a cool place too.”</i>");
	else if(pc.isBimbo()) output("\n\n<i>“Ohmigosh, I love it too Shekka!”</i>");
	else output("\n\n<i>“It certainly sounds like a glowing endorsement to me then.”</i>");
	output("\n\nShekka smirks, shaking her head a little. <i>“It </i>is<i> still scary though. I’m a small girl and there is so much I don’t know about the UGC. I’m like an oil-pit to a scrak-lizard for all manner of fast-talking scammers. I wasn’t aware that so many of the various bipedal species were total pieces of shit.”</i>");
	output("\n\nFair point.");
	//Next: back to Places menu
	processTime(10);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
}

//New Texas //Unlocked by going there with her on crew
public function talkToShekkaAboutNewTexas():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Alright, the curiosity is too much; what does Shekka think about New Texas? Fun? Sexy? Exciting?");
	output("\n\n<i>“Awful”</i> Shekka says, with a smirk.");

	//Normal
	if(!pc.isBimbo()) output("\n\n<i>“Oh... care to explain why?”</i>");
	//Bimbo
	else output("\n\n<i>“But, but like, the sex!”</i>");
	//Merge
	output("\n\n<i>“Don’t get me wrong, the sex part of the whole planet is great. The attractions are great, and the attractions are attractive.”</i> Shekka pauses to enjoy her silly word-play, nodding to herself. <i>“It’s the circumstance though. What they’ve done to their people is literally the opposite of what I did to mine. I can’t express how fucking terrifying that is. They </i>want<i> to be idiots, incapable of thinking about nothing but sex so that they can’t cause trouble. Sure, their planet is idyllic, but they had the luck to start off human. The only people who can take advantage of </i>them<i> are their own.”</i>");
	//Treated
	if(pc.isTreated()) output("\n\nThe Raskvel pauses, looking you up and down a few times. <i>“You know I don’t mean to offend you too, right? You stand out as a prime example of someone who can still get things done even with a terrible case of cockbrain. But I’m going to assume you didn’t start your life like that. Right?”</i> You nod; that’s right.");
	//Cont
	output("\n\n<i>“Also? Calling it ‘The Treatment’ just makes it kind of scary, as if you weren’t a citizen until you got your brain all jacked up... Which, again, I recognize the hypocrisy of that statement coming from me. I’ve literally done the same. You can see why I don’t like this place. The other side of the coin is a shitty place to be when you realize it’s probably just as shineless as the other.”</i>");
	output("\n\nShe sighs and crosses her arms, glancing away.");
	//Next: back to Places menu
	processTime(10);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
}

//Myrellion //Unlocked by going there with her on crew
public function shekkaMyrellionTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("How does she feel about Myrellion? Plenty of sexy addictive Reds and squishable Honey-pot Golds there.");

	//If Shekka’s Addicted
	if(shekkaAddicted()) output("\n\n<i>“Well... the reds I... I got a chance to see a few. That was... yeah.”</i> Shekka chews on her bottom lip, staring at your own kisser in accusation. <i>“It’s better with you though.”</i>");
	//Else
	else output("\n\n<i>“Hmmn... there is something appealing about those hard-body Reds. All that order they preach about makes them almost like machines, ya know? And that’s sort of exciting to me, like if I studied them long enough, I could puzzle out a way to squeeze a little bit of extra efficiency out of their society. They’re less like jerks than I expected, too. I even saw a few smile!”</i>");
	//Merge
	output("\n\n<i>“The golds are a hot sticky mess. I mean their boobs are freaking ginormous, but that hasn’t really done them any favors... and the way they breed is just so... </i>alien<i>. Everybody should get to lay eggs, not just one, big egged-up slut! Queens aside, the golds I’ve met have been perfectly friendly. </i>More than friendly.<i> And while they’re real organized, sort of like the reds, they seem to be a lot less strict about it. I like that. Appeals to my inner chaos-lizard, ya know?”</i>");
	output("\n\nFair enough.");
	//Next: back to Places menu
	//Make shekka not hate golds fen. SkoW is crazy. - DONE!
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
}

//Uveto //Unlocked by going there with her on crew
public function shekkaUvetoTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Shekka reflexively shivers, rubbing at her arms. <i>“Something I learned from my first visit there? Rasks are not built for that level of cold. Seeing snow for the first time was awesome, but I damn-near froze my scales off just standing around.”</i> The cold was an obvious thing to mention, but you push her for a little more info.");
	output("\n\n<i>“Eh... I never went out into the wastes, since I’m not a crazy spacer like you. After the first visit pretty much just stayed on the station, where it’s warm. Oh! I did get a squishy hug from one of those bigger, fluffier Ausar girls. That warmed me up a bit.”</i>");
	output("\n\nNo kidding? You give her a questioning look, and she clears her throat, blushing purple. <i>“We didn’t do anything. Maybe we would’ve, but one of those feathery fuckmuppets were watching and complaining about something. Bit of a mood killer.”</i>");
	//Next: back to Places menu
	processTime(8);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPlaces);
}

//People
public function talkToShekkaAboutPeople():void
{
	clearOutput();
	showShekka();
	clearMenu();
	addButton(14,"Back",talkToCrewShekka);
	var button:Number = 0;
	if(annoIsCrew()) addButton(button++,"Anno",shekkaAnnoTalk);
	if(azraIsCrew()) addButton(button++,"Azra",shekkaAzraTalk);
	if(bessIsCrew()) addButton(button++,chars["BESS"].short,shekkaBessTalk);
	if(celiseIsCrew()) addButton(button++,"Celise",shekkaCeliseTalk);
	if (hasGooArmor() || gooArmorIsCrew()) addButton(button++,chars["GOO"].short,talkToShekkaAboutNova);
	if(reahaIsCrew()) addButton(button++,"Reaha",shekkaReahaTalk);
	if(yammiIsCrew()) addButton(button++,"Yammi",talkToShekkaAboutYammi);

	if(button != 0) output("Who would you like to talk to Shekka about?");
	else
	{
		output("There is nobody to talk to Shekka about right now.");
	}
}
//Anno
public function shekkaAnnoTalk():void
{
	clearOutput();
	showShekka();
	output("<i>“Alright”</i> you begin, sizing the little Raskvel up. <i>“What do you think about Anno?”</i>");
	output("\n\nShekka grunts and huffs. <i>“Super annoying. She thinks she’s so smart too. And she’s so... so bouncy and stuff, and she doesn’t seem bothered by anything”</i>");
	output("\n\nUh huh... you give her an even look, waiting for her to crack. <i>“Okay, okay! She’s... she’s alright I guess. Don’t you dare tell her I kind of enjoy having a rival nerd. I’m still better than her, and her stupid university degrees.”</i>");
	output("\n\nThat sounds a lot more like it. It’s tempting to give her another poke and see if you can learn something really juicy, but the poor girl’s cheeks are already starting to turn to plums.");
	//Next: back to People menu
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Azra
public function shekkaAzraTalk():void
{
	clearOutput();
	showShekka();
	output("<i>“Azra, huh? Well... it would be intimidating how she’s as tall as four of me stood on my shoulders. But she’s been nothing but cool. I admire that she’s determined to learn more about the Galaxy.”</i> She hesitates for a moment, looking up at you carefully. <i>“That said, it does seem like an awful lot of danger is involved. I’d never forgive her if she got you hurt chasing after some kind of fuckable lilypad.”</i>");
	output("\n\nYou give her a reassuring pat on the head, rubbing the base of her ear until she starts to coo. <i>“Unfair, distracting me like that...”</i> You ask if there’s anything more about her she finds interesting than just her job.");
	output("\n\n<i>“...Alright, so maybe I want to scale her like a big, fuckable mountain, mash my face into her rack, and see just how good she is with those lovely large hands. Put in a good word for me, okay?”</i>");
	processTime(5);
	//Next: back to People menu
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Bess
public function shekkaBessTalk():void
{
	clearOutput();
	showShekka();
	output("Shekka frowns at your next query, ears jingling as she shifts her head from side-to-side. <i>“Weird, I guess. They got dumped in the middle of the wastes by someone, and now they’re here. Maybe I’ve been watching too much shitty holo-drama, but I half expect her to reveal some kind of hidden malevolent directive and laser-blast us to hell.”</i>");
	output("\n\n<i>“Also bots that are super synthetic don’t do it for me. I like that clunky, scrappy style. I want to see some metal, and bolts. I want our sexable future to be shiny and chrome!”</i>");
	output("\n\nCool.");
	//Next: back to People menu
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Celise
public function shekkaCeliseTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("When you bring up the issue of Celise to her, Shekka’s head immediately whips around. <i>“She’s not here, is she? Last time I took a nap at the engines I woke up to find myself totally spotless.”</i>");
	output("\n\n<i>“So?”</i> you ask <i>“She cleaned up?”</i>");
	output("\n\n<i>“I was also naked. I went to sleep in my suit. And my pussy felt so plump and tingly. I’m okay with fooling around, but I’d rather she didn’t pull a stealth on me.”</i>");
	output("\n\nYou promise to bring that up with your green gooey friend, inviting Shekka to continue.");
	output("\n\n<i>“Other than that, she does a lovely job keeping the place spotless. The odd hug-on-demand seems like fair trade for a loving companion, you know? It was weird being around a Goo that didn’t have some kind of assault-for-juices-protocol.”</i>");
	output("\n\nMaybe she does, she’s just a lot gentler about it.");
	processTime(5);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Nova
public function talkToShekkaAboutNova():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//If wearing Nova
	if(pc.armor is GooArmor) 
	{
		output("<i>“Heeeey... I’m right here!”</i> your armor says, forming a face to look up at you with a pout. The little Raskvel flinches in surprise before struggling to fight down snorts and giggles.");
		output("\n\n<i>“Obviously I think she’s a sweetheart, [pc.name]”</i> she says after a pause, grinning when the weaponized grey-goo climbs off of you to give her a hug.");
	}
	//Else
	else output("<i>“If I’d been told one of those rapey little monsters could turn out to be a wearable, weaponized bimbo-armor, I would have said that was crazy. But no... She is a total sweetheart. Sadly a bit out of my technological expertise or I’d have a poke around inside of her.”</i>");
	//Next: back to People menu
	processTime(4);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Reaha
public function shekkaReahaTalk():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Shekka looks down at her chest with a frown. <i>“I’m jealous of those big ol’ milky tits of hers. I’m happy to admit that much. Also she dodged getting herself retardulated by the Treatment, which I suppose I approve of... I can’t imagine how guilty she must have felt knowing she still wanted to look like a curvy milk-tank. I said something kind of rude to her when we first spoke, I assumed she was Treated... she took it well, and made me feel like an asshole. Which I deserved.”</i>");
	output("\n\nAfter that, she smiles and nods in satisfaction. <i>“She’s good people, and her milk is delicious. Look after that Moo.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Yammi	
public function talkToShekkaAboutYammi():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“You have a habit for trying to rescue people with money, don’t you?”</i> Shekka asks, grinning. <i>“I don’t know that I have much to say about her, but sweet scrap and stars she cooks an awesome meal... do you think my thighs look fat?”</i>");
	output("\n\nTrick question, you’re sure.");
	output("\n\nShekka snorts and slaps you on the leg <i>“Ass. But yeah, I like her, she’s nice. I can’t cook for crap, until meeting her I’d never had anything so incredibly delicious. You’re so lucky she’s not in some high-class establishment right now.”</i>");
	processTime(3);
	clearMenu();
	addButton(0,"Next",talkToShekkaAboutPeople);
}

//Spend time
//On Tavros Station
public function spendTimeWithShekka():void
{
	clearOutput();
	showShekka();
	//On Tavros
	if(getPlanetName().toLowerCase() == "tavros station")
	{
		output("You ask if Shekka would like to take a break from... whatever it is she’s doing and hang out with you for a while. <i>“Hmmm, you’re asking me without that mischievous eyebrow wiggle, I assume you don’t mean sex?”</i>");
		output("\n\n<i>“The night’s still young–wait, I have a tell?”</i>");
		output("\n\nShekka snorts and brushes her quills to fluffy softness, inviting you to lead on.");
		output("\n\nConsidering you’re on Tavros, it only makes sense to get some time away from the ship. You are a little bit tall to be arm-in-arm, but you offer a hand which she takes with a smirk. <i>“So, where to?”</i> Shekka asks, eyes tracing over a few ships. There’s a recognizable twitch in her grip, and you have to guide her past before she gets in trouble tinkering.");
		processTime(2);
		clearMenu();
		addButton(0,"Anon’s Bar",shekkaTavrosHangoutOne);
		addButton(1,"Beth’s Broads",shekkaTavrosHangoutTwo);
	}
	//Not on Tavros
	else
	{
		output("You basically have to peel Shekka away from her impromptu work-desk, lifting her up and onto your ");
		if(pc.thickness > 65) output("broad, huggable ");
		else if(pc.tone >= 66) output("firm, muscular ");
		output("side before propping her up with a hand. <i>“I resent being carried around like a hatchling, [pc.name].”</i>");

		output("\n\n<i>“And yet you look so comfy and cute”</i> you tease, putting her down. <i>“Time to take a break, come hang out for a bit”</i>.");
		output("\n\nAlthough Shekka whines in complaint, she allows herself to be dragged away.");
		processTime(3);
		clearMenu();
		addButton(0,"Couch & TV",shekkaSofaHangout);
		addButton(1,"Bed",shekkaHangoutBed);
	}
}

//Option One
public function shekkaSofaHangout():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Shekka seems immediately disappointed when the first thing you do is drop length-wise onto your old sofa to switch on the Holonet. <i>“...You’re kidding, right? You dragged me away for this?”</i>");
	output("\n\nWith a sigh, you drag her onto you, get comfortable and instruct her to watch. There is a little more grumbling before you have her head ");
	if(pc.biggestTitSize() >= 1) output("cushioned between your breasts");
	else output("laid up on your chest");
	output(". <i>“What are we even watching, [pc.name]?”</i>");

	output("\n\nYou shrug; it’s never really about what’s on, just that you’re comfortable while your brain spends some time being occupied. It appears to be some show called ‘How They Do It’. Shekka squints as the seemingly over-elaborate process of constructing ");
	if(silly) output("plumbos");
	else output("artisanal dildos");
	output(" plays out. <i>“This is all by hand? I don’t... I mean, a machine could handle it.”</i>");
	//LOL
	output("\n\nSmirking, you shake your head. <i>“It’s all about putting the proper care and affection in. Knowing that whoever’s enabling your good time pushed out all the shleem by hand, and shaved away the plubus and grumbo with manual tools.”</i>");
	output("\n\nShekka sighs, nuzzling into your chest for a moment before returning her attention to the screen. <i>“The narrator has a soothing voice at least. I swear half of those words are made up, but it makes sense when he says it.”</i>");
	output("\n\n<i>“I wonder if they re-use the freej juice for anything else?”</i> you wonder, as a particularly curvaceous gryvain woman lovingly shines the titanic tool down.");
	output("\n\n<i>“Looking at her, I could think of a few extra uses for it...”</i> the little Rask giggles, squeaking when you give the base of her tail a little squeeze.");
	output("\n\nEventually the channels transition to adverts that seem just as eclectic as the television itself.");

	//Time transitions three hours
	//Next: back to ship menu
	processTime(180);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Option Two
public function shekkaHangoutBed():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("There isn’t anywhere in particular to go on the ship to take Shekka away from her work, but you have a pretty good idea of what to do. The little Rask smirks and raises a brow as you take her to the bedroom and begins to undress...");
	output("\n\nOnly to blink in confusion when you carry her into bed under the covers, put on some relaxing music, and go to sleep with a faceful of giant jingly ears. <i>“...Uh... [pc.name]?”</i> she asks, only to get no answer from you but an affirmative squeeze around the hips. <i>“You pulled me away from working for this?”</i>");
	output("\n\nYou just nod into her pink-quilled hair, letting out a soothing sigh. Shekka’s complaints gradually die down when you take one of her ears in your [pc.hand], rubbing and squeezing her. It isn’t enough to actually get the poor red-scaled cutie worked up, but it does quiet her down.");
	output("\n\nShe actually manages to drop off before you do, although your own lids sink closed soon enough. It isn’t until a few hours pass that the music you left playing changes into a soft alarm. From experience you remember that ignoring this alarm will result in Ausaril Death Metal being played loudly, a warning you pass on to Shekka when she grumbles complaints.");
	output("\n\n<i>“Hey, maybe I find metal roars to be relaxing”</i> she grunts, trying to get un-entwined from your nude form. You both manage to get redressed, just before the first thrumming drum-beats of Deth Gröwl kick to life.");
	if(annoIsCrew()) output(" Probably Anno’s fault.");
	output("\n\n<i>“It was a good nap, thank you for the company Shekka”</i> you say, putting on your most charming grin. Shekka blushes like a plum and waves it off.");
	output("\n\n<i>“Yeah, yeah, it’s fine... I enjoyed it too. I now smell like you completely, which will make for distracting thoughts, but oh well. You’ll just have to swing by later and help me scratch that itch, no?”</i>");
	output("\n\nAs if she could stop you.");
	processTime(180);
	restHeal();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Option One
public function shekkaTavrosHangoutOne():void
{
	clearOutput();
	showShekka();
	//put in anons
	generateMapForLocation("ANON'S BAR AND BOARD");
	author("SomeKindofWizard");
	output("Of course, the best place to go before anywhere else is Anon’s bar!");
	output("\n\nYou quickly discover that Shekka can put down a surprisingly decent amount of alcohol. ");
	if(pc.tolerance() < 50) output("More than you, actually");
	else output("It’s nothing to your own expertly-trained liver, but impressive nonetheless");
	output(". By the time shots have started to be ordered your table has a good card game going. The pink-haired Rask took a few rounds to figure out what’s going on, but by round six the pot is practically cascading into her little arms. <i>“Read ‘em and weep, suckers!”</i>");
	output("\n\nOnce she has your hand back in hers (which she nuzzles into affectionately now) she hands you a credit chit. <i>“Here y’go... that wash fun, should cover the drink...”</i>");
	//Increase drunkenness by 2 if physique greater than 20, by 4 if less.
	
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	processTime(60);
	pc.imbibeAlcohol(20);
	//Time passes by five hours, back to ship menu
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}	

//Option Two
public function shekkaTavrosHangoutTwo():void
{
	clearOutput();
	generateMapForLocation("BETHS BROADS");
	showShekka();
	author("SomeKindofWizard");
	//put in beth's
	output("Maybe it’s lacking in the romantic-hangout angle, but there’s a perfectly useable stripclub.");
	output("\n\nAlthough Shekka makes a face at your suggestion, she seems happy to be led along to Beth’s Busty Broads. Her hands squeeze at yours tighter at the sight of a towering, latex-coated Gryvain Futa. ");
	if(flags["MET_TERENSHA"] != undefined) output("Terensha; hard not to miss that girl...");
	else output("You’ll have to see her later...");
	output(" She gives you both a wink, and then walks right past... just in time for her nethers to give you a wink too, planted between two expansive asscheeks.");
	output("\n\n<i>“Okay [pc.name]... I think this place is pretty great.”</i>");
	output("\n\nThe two of you grab a spot at the back, and Shekka climbs into your lap");
	if(pc.hasCock())
	{
		output(", hotdogging your ");
		if(pc.isErect()) output("unrepentant");
		else output("burgeoning");
		output(" erection between her own cushiony backside");
	}
	else if(pc.hasVagina()) output(", grinding her tail between your thighs for a teasing rub against your [pc.pussy]");
	output(". A few drinks come, and the both of you while away a few hours admiring men and women of various kinds as they dance and strut...");
	output("\n\nEventually the teasing becomes too much, and after fingering Shekka through her suit until she cums for perhaps the third time, she practically races you back to your ship for a romp. The smell of sex, booze, and perfume clings to the both of you in a heady aroma, and her eyes are glazed over with need.");
	processTime(120);
	pc.lust(40);
	currentLocation = "SHIP INTERIOR";
	shekkaCrewSexMenu();
}

//Addiction
//This shows up as ??? and is greyed out unless you have addictive spit (such as red myr)
public function shekkaAddictionWheeee():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	//No More Aphrodisiac
	//Selecting this when you no longer have aphrodisiac saliva will result in the following
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		output("<i>“Hey, Shekka... about your, uh... addiction?”</i> you begin, looking the curvy girl up and down. Shekka blinks a few times, staring at your face.");
		output("\n\n<i>“...You don’t smell like it anymore. Oh. Oooh...”</i> she mutters, sniffing a few times.");
		output("\n\nIgnoring the fact that she can apparently pick up that scent on your lips, you squat down to get ");
		if(pc.tallness < 7*12) output("eye-to-eye");
		else output("closer to eye level");
		output(". <i>“Are you going to be okay?”</i> you ask.");
		output("\n\nShekka’s eyes skirt about the room, unconsciously twitching. She nervously scratches at her ear, before walking away <i>“Yeah, just... uh. Wait here a moment...”</i>");
		output("\n\nA few minutes pass, and Shekka returns, looking flushed. She rubs idly at a nipple hard enough to be seen through her suit. <i>“All good, I’m cured.”</i> she says with a confident smile.");
		output("\n\nThat easy?! You stare, aghast. ");
		if(flags["REAHA_ADDICTION_CURED"] == 1) output("Just thinking about how long it took for Reaha to recover makes this seem a little unlikely. ");
		output("Shekka shrugs helplessly <i>“I was addicted to you because it was fun. Fuck. Fuck it was so hot to crave you...”</i>");
		output("\n\n<i>“And you just had the cure around because you were enjoying it?”</i>");
		output("\n\nThe Raskvel smiles, taking another slow, deep breath. <i>“Yup, a different kind of addictive aphrodisiac, and a shit ton of caffeine. They’ll do battle in my brain or whatever for a while. Then I’m fine.");
		if(flags["REAHA_ADDICTION_CURED"] == 1) output(" It’s not like Reaha’s case, that girl spent fuck knows how long on synthetic lust drugs.");
		output("”</i>");
		output("\n\nWell... if she’s sure.");
		flags["SHEKKA_SPITDICTED"] = 1;
		processTime(20);
		//Next: Back to ship menu
		clearMenu();
		addButton(0,"Next",approachCrewShekka,true);
		//Greys out box until she’s addicted again, hovering over this says “You’ve already spoken to Shekka about her addiction”
	}
	//Shekka is Addicted
	//Selecting this when you have had sex with her at least once when you have aphrodisiac saliva gives this.
	else if(flags["SHEKKA_SPITDICTED"] == 1)
	{
		flags["SHEKKA_SPITDICTED"] = undefined;
		output("You bite the bullet and ask her outright; <i>“Shekka, are you addicted to me?”</i>");
		output("\n\nThe Rask in question gives the question maybe a half-heartbeat of thought before nodding. <i>“One hundred percent, [pc.name]. And before you say anything else? It is fucking <i>awesome</i>.”</i>");
		output("\n\nOkay. Not the response you were anticipating.");
		output("\n\n<i>“Like, think about it. I crave you, in a way that temporarily completes me. Sure, sometimes the addict-brain thing kicks in and I start to get a bit shaky without a hit... the tradeoff is an incredible orgasm all lip-to-lip.”</i>");
		output("\n\nJust thinking about it seems to have Shekka all juicy, judging by the way she squirms on the spot, pupils dilating. <i>“Look, [pc.name]. You don’t have to worry about me. The stuff you pump out is pretty damn clean chemically speaking. If you ever replace it, I should be able to drop the habit nooooo problem.”</i>");
		output("\n\nWell, if she’s sure...");
		//back to talk
		processTime(8);
		clearMenu();
		addButton(0,"Next",talkToCrewShekka);
	}
}

//Body
//Wherein we get Shekka to bolt on some of that sweet-sweet futa-donger.
public function talkToShekkaAboutGettingADick():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("There is no doubt about it. When it comes to women, the whole deal is immediately altered by a liberal application of dicks. It’s not a conversation you’ve ever breached with Shekka before, and when you do so, she squints at you.");
	output("\n\n<i>“Really? I, uh... I don’t know, Steele. I guess I never really put my thought into it. I’ve got this hips, these thighs, this ass...”</i> she gives her ass a spank for good measure, cooing as it sets the tender flesh to quivering. <i>“Do you think I need more?”</i>");
	output("\n\nShekka sighs and shrugs, looking you up and down as if she could gauge a proper response. You give the matter some thought as well, does she?");
	//Two Buttons: Get a dick and Stay girl
	processTime(3);
	clearMenu();
	addButton(0,"Get A Dick",giveShekkaFollowerADick);
	addButton(1,"Stay A Girl",stayAGirl);
}

//Get a dick
public function giveShekkaFollowerADick():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“Honestly...”</i> you begin, a wicked grin creeping across your [pc.face]. <i>“I’ve gotta say, it would be pretty hot...”</i>");
	output("\n\n<i>“Well, I mean... I get to pick what </i>kind<i> of cock, right?”</i> she answers, rubbing her chin idly. <i>“I want horse cock.”</i>");
	//Pc has a horse cock:
	if(pc.hasCock(GLOBAL.TYPE_EQUINE)) output("\n\n<i>“Well, you only had to ask.”</i> you say, smirking and patting your crotch. Shekka snorts in amusement, shaking her head hard enough to set her long ears to jingle-jangling.");
	//Else 
	else if(pc.hasCock()) output("\n\nYou look down at your own [pc.cock], frowning and shifting side-to-side. Shekka follows your gaze, quirking a brow.");
	else output("\n\nYou look down at your own bare crotch, frowning and shifting side-to-side. Shekka follows your gaze, quirking a brow.");
	//Merge
	output("\n\n<i>“Not what I meant. I mean, if I go full futa, I want a big ol’ swingy horse cock. With those juicy flares! You know... a proper cum-cannon on my short frame. Hot, right?”</i>");
	output("\n\nIt’s not the first time you’ve seen such a thing. Sounds good at the very least; Shekka certainly has the bottom-half necessary to support a big ");
	if(silly) output("ol’ floppy horsey-donger.");
	else output("equine member.");
	processTime(5);
	clearMenu();
	//Three Options: Not Yet, SynthSheath and Throbb
	addButton(0,"Not Yet",stayAGirl);
	if(pc.hasItemByClass(HorseCock)) addButton(1,"SynthSheath",synthsheathShekka,undefined,"SynthSheath","You have a handy-dandy artificial horse-cock right here. It’ll be so easy, so very easy to give her one.");
	else addDisabledButton(1,"SynthSheath","SynthSheath","You don’t have a synthetic horse-cock to slap on her.");
	//if(pc.hasItemByClass(Throbb)) addButton(2,"Throbb",throbbUpShekka,undefined,"Throbb","It’s not a horse-cock, but that can always be fixed later, right? Throbb’ll get her halfway there.");
	//else addDisabledButton(2,"Throbb","Throbb","You don’t have any throbb.");
}

public function stayAGirl():void
{
	clearOutput();
	showShekka();
	author("Fenoxo");
	output("<i>“Maybe later...”</i> you mutter, stroking your chin. It’ll be something to consider as an option for the future.");
	output("\n\nShekka shrugs, ears jangling. <i>“It’s real easy to forget that out here I can bolt on a dick lickity-split. I mean, if you’re really into that sort of thing, I wouldn’t mind fucking you till you wished </i>you<i> were full of eggs.”</i>");
	output("\n\nSounds like a plan.");
	clearMenu();
	addButton(0,"Next",approachCrewShekka,true);
}

//SynthSheath
public function synthsheathShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("You haul out a big floppy equine phallus, complete with balls. The small Rask’s eyes are drawn to the way it sways from side-to-side.");
	output("\n\n<i>“Is that what I think it is, [pc.name]?”</i>");
	output("\n\n<i>“Yup”</i> you answer simply, hefting the weight of it in your hands, before holding it out to her, base-first.");
	output("\n\nShekka accepts its, looking the whole thing over as though it might bite. <i>“This looks more like a fuck-sleeve, Steele. Are you sure?”</i> She lifts the slit built into the SynthSheath’s flat base, giving it an idle sniff. <i>“Smells clean. And kinda... surgical-y? Makes sense I suppose. It hasn’t been hooked on to someone; no way to produce musk.”</i>");
	output("\n\nYou hadn’t been anticipating the scientific analysis of the horse-cock, but it’s rather adorable watching her examine the whole thing so closely. It comes as a surprise when she–without ceremony–plants it on her crotch, right above one of her twinned pleasure-buttons.");
	output("\n\nAfter glancing around for somewhere out of the way, you settle for leaning up against the wall, enjoying your front-row seat to this transformation. The first thing to change are the eyes... perhaps that’s a silly thing to notice, but her pupils turn saucer-like as her brain begins pumping hot feel-good throughout her system. She lets out a low moan, dropping to her knees. Although her hands don’t leave the base of what is soon to be her brand-new horse-cock.");
	output("\n\nThe short-stack’s tail lashes about wildly as her grip tightens on the expansive equine prick; all at once the veins on it seem to come to life. She takes her hands away from it in surprise, and the member doesn’t fall away from her crotch. Indeed there’s no evidence of a seam at all. The prick shifts to the natural red of her flesh as it becomes one with her crotch. <i>“O-okay [pc.name]. This. Hohfuck–”</i>");
	output("\n\nWords fail Shekka as pre begins to bead at the head of her broad cumslit. Her mouth hangs open, tongue practically unfurling in time with a low, horny moan. The previously false-looking balls tense up and churn with freshly-forming seed. <i>“Well, there’s the musk...”</i> you add, as the sexual bouquet of horny raskvel mixes with Shekka’s brand new cock. Her hands explore the length of it, fingers hefting the weight of her balls as they continue to firm up.");
	output("\n\n<i>“S-steele... oh stars. The prostate is forming somewhere in here, I can feel it. It’s like someone’s crammed a fucking cum-button somewhere in there.”</i> Shekka gasps, flopping onto her front and pinning the still pre-oozing prick between her body and the cool metal floor of the spaceship. <i>“H-help me out, [pc.name]! I’m going to fucking burst!”</i>");
	processTime(20);
	pc.lust(10);
	pc.destroyItemByClass(HorseCock);
	shekka.createCock();
	shekka.shiftCock(0,GLOBAL.TYPE_EQUINE);
	shekka.cocks[0].cLengthRaw = 14;

	shekkaCrewSexMenu();
	//Next: Sex scene
}

//Throbb
public function throbbUpShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Well, it isn’t a horse-cock, but when it comes to dick-fixing juices, you have the hookup to hand...");
	output("\n\nShekka eyes the syringe with trepidation as you hand it to her, and she spends a few additional moments scrolling over the label. <i>“Okay, I’ll use it, because I am curious as hell. But we’re taking a trip to the station so I can grab something with a little giddy-up, okay?”</i> There’s a glimmer in her eyes at the terrible joke, but you let the moment pass without comment. <i>“...Hmph.”</i> she pouts, popping the cap off of the syringe.");
	output("\n\nShe sinks it into her thigh without a moment’s hesitation, depressing the plunger while she nibbles on her bottom lip. <i>“Huh, I didn’t even feel the needle go in. How promising that the anaesthetic on this black-market cock-sauce is actually decent quali... qual... oh my.”</i>");
	output("\n\nThe words seem to drift away from her in time with the chemical load that pounds its way furiously into her system, rewriting and reforming flesh.");
	output("\n\nYou can see in real-time how her red skin grows more flushed, and her body starts to glisten with sweat as it tries to compensate for the abrupt shift in her hormones.");
	//Started female, have a dick:
	if(9999 == 0) output(" You recognize it well; when your own abrupt growth occurred it felt like every inch of your brain was torn between cumming on the spot, and finding somewhere to hide yourself.");
	output(" The raskvel woman squirms on the spot, trying to figure out what to do with herself. Her tail begins buzzing away in response to the way her body slips into lusty-fucking overdrive.");
	output("\n\n<i>“Ah fuck, it’s happening. I can feel it!”</i> No kidding; you can see how her hips roll on the spot as though she were treating you to a pole dance... except that she was about to bring the pole herself. Her clit begins to swell; that’s the first evidence at least. A new one seems intent on growing beneath, but her body takes its own shortcuts. Part of the show isn’t particularly attractive. For instance watching a cumslit grow in real-time is more than a little discomforting.");
	output("\n\nThe way pre builds at the head of a freshly growing cock, or the sight of twinned thick balls dropping into place however? That’s a particularly fine point of the show, especially when the slickness of her own cunt polishes the brand-new balls to an alluring shininess. The subtle scent of her feminine nectar becomes the mixed-musk of a futa-girl. Each of the shortstack’s heartbeats bring additional length to her cock, until it stands almost painfully hard and pointed directly at you.");
	output("\n\n<i>“Is that it? We definitely need to make this fucker into a hor-... horse–”</i> Shekka’s breath hitches up. Her balls tense up, clenching towards her brand-new dick. Her unseen prostate churns over with fresh, unknown pressure. And then she cums like a fountain, immediately painting your [pc.tummy] with pearlescent jizz. Your companion tries her best to apologize, or speak, or anything at all, but her eyes cross and yet more cum is produced.");
	output("\n\nIt would have been worth keeping a timer going because the poor little thing seems to orgasm for a painfully long time, making a mess of both yourself and the floor.");
	if(celiseIsCrew()) output(".. if Celise is around, you’re sure she’d appreciate it.");
	output(" She takes a few long, deep breaths, clutching at her modest chest and squeezing her nipples between her fingers. <i>“Okay... that was awesome.");
	if(pc.hasCock()) output(" I can see why you seem to enjoy filling me up so much.");
	output(" The moment we turn this thing into a foot of stallion schlong, I’m going to turn the walls white.”</i>");
	pc.destroyItemByClass(Throbb);
	shekka.createCock();
	shekka.cocks[0].cLengthRaw = 7;
	processTime(20);
	pc.lust(10);
	clearMenu();
	addButton(0,"Next",approachCrewShekka,true);
}

//Shekka Share Bed Intro
//Sleeping without Shekka
public function shareShekkaBedProc():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("You’re partway to pulling off your [pc.clothes] when there’s a gentle tap on your leg. <i>“Hey, [pc.name]. Can’t help but notice that your bed is looking awfully not-full-of-Raskvel. Fancy changing that?”</i>");
	output("\n\nYou peek down at her, raising a brow slowly. That was a rather cheesy line. Shekka grins bashfully, grinding her foot into the floor. <i>“I’m not hearing a no! Well, not yet at least”</i>");
	processTime(1);
	flags["SHEKKA_SLEEPWITH_INTRODUCED"] = 1;
	clearMenu();
	addButton(0,"Share Bed",shareBedWithShekka);
	addButton(1,"No Share",dontShareBedWithShekka);
}

public function shareBedWithShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("Too cute. You don’t so much as take her to bed as you do throw her into it, dropping ontop of her and nibbling at one particularly large ear, nuzzling until she squirms. <i>“Oooh fuck! Want!”</i>");
	flags["CREWMEMBER_SLEEP_WITH"] = "SHEKKA";
	//Sex Options:
	shekkaCrewSexMenu();
}

//No:
public function dontShareBedWithShekka():void
{
	clearOutput();
	showShekka();
	author("SomeKindofWizard");
	output("<i>“D’awwh. Well, give me a squeeze if you’d ever fancy it. I’m going to go crash as well.”</i> Shekka smiles warmly and gives you a little hip-wiggle for show. The little devil...");
	//Next: Sleep as usual, +5 lust
	clearMenu();
	sleep(false);
}

//Sleeping without Shekka and with Anno
public function shekkaBedIntroWithAnnoProc():void
{
	clearOutput();
	showBust(annoBustDisplay(),shekkaBustDisplay());
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	output("You’re partway to pulling off your [pc.clothes] when there’s a gentle tap on your leg. <i>“Hey, [pc.name]. Can’t help but notice that your bed is looking awfully not-full-of-Raskvel. Fancy changing that?”</i>");
	output("\n\nBefore you get a chance to respond, Anno saunters out of your shower in all of her squishy, nude glory. <i>“Hrmn... you’re not trying to steal my sweet-dreamie-snuggles, are you?”</i> a couple of hops (giving you a delightfully bouncy show) over has her leaning over your shoulder. Her tits press against your back, ");
	if(pc.hasWings()) output("pushing your [pc.wings] out to the side.");
	else output("teasing you with a little wriggle.");

	output("\n\nShekka scowls, brow furrowing cutely. <i>“It’s not stealing if [pc.heShe] isn’t yours to own. And don’t you already have girlfriends? I’m all on my lonesome here.”</i>");
	output("\n\nTo her credit, the puppy-slut doesn’t immediately bury her foot in her mouth, pausing for a few breaths before doing so. <i>“You don’t have any girlfriends or boyfriends? Why not?”</i>");
	output("\n\nWishing you could pick her up by the scruff, you settle for reaching backwards over your shoulder to bap her on the nose, earning a little yelp of surprise. Shekka watches, snorting in amusement before continuing. <i>“No, Anno. I don’t. To be honest? It takes a little extra work for me to get in the mood. Really only [pc.name] seems to... y’know... </i>do<i> it for me.”</i>");
	output("\n\nAnno gasps, before a smug grin creeps across her face. <i>“you loooove " + pc.mf("hiiiim","heeeer") + "~”</i>");
	output("\n\n<i>“Shut up you bimbo!”</i> she shouts, cheeks beginning to purple. You silence them both before one of them gets teased a little too far.");
	processTime(10);
	clearMenu();
	flags["SHEKKA_SLEEPWITH_INTRODUCED"] = 1;
	addButton(0,"Both of You",bothOfYouShekka);
	addButton(1,"Just Anno",sleepWithJustAnno);
	addButton(2,"Just Shekka",sleepWithJustShekka);
}

public function shekkaRepeatBedTalkies():void
{
	clearOutput();
	showShekka();
	if(flags["CREWMEMBER_SLEEP_WITH"] != "SHEKKA" && flags["CREWMEMBER_SLEEP_WITH"] != "SHEKKA AND ANNO")
	{
		output("Do you want to invite Shekka into your bed at night?");
		clearMenu();
		if(annoIsCrew() && flags["ANNO_SLEEPWITH_INTRODUCED"] != undefined)
		{
			output(" Maybe you could add Anno for the perfect combination of short and stacked.");
			addButton(1,"Take Both",bothOfYouShekka);
		}
		addButton(0,"Take Shekka",shareBedWithShekka);
		addButton(14,"Back",talkToCrewShekka);
	}
	else
	{
		output("Shekka is currently warming your bed (and other places) at night. You can kick her out if you absolutely need.");
		clearMenu();
		addButton(0,"Empty Bed",kickShekkaOuttaBed);
		addButton(14,"Back",talkToCrewShekka);
	}
}

public function kickShekkaOuttaBed():void
{
	clearOutput();
	showShekka();
	output("You let Shekka know that you’d like a little more room in the bed for right now.")
	output("\n\n<i>“Awww, for serious?”</i> Shekka lets out a deep-seated sigh. <i>“I was just getting used to it.”</i> She shrugs. <i>“Well if you change your mind... you know where I’ll be.”</i> Shekka slips out, starting to unzip her suit.");
	flags["CREWMEMBER_SLEEP_WITH"] = undefined;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function bothOfYouShekka():void
{
	clearOutput();
	showBust(annoBustDisplay(),shekkaBustDisplay());
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	//Both of you
	output("The obvious answer here is to just take the both of these fine women to bed, and you tell them as much. It takes a few moments for confusion to change into something wholly more curious, and Shekka is the first to speak up. <i>“I... I’unno. I was prepared for one bedbuddy.”</i>");
	output("\n\nDespite the nervousness of the shortstack’s voice, Anno leans in, tail wagging. <i>“Awww, can’t handle all this fluffy softness? These sweet sweet chest-pillows?”</i> responds the white-fluffed Ausar with an eye-capturing bounce of said chest-pillows. Trust her to dispel the tension with her ‘assets’. She squeals and giggles when you push her onto the bed, before rolling onto her back to give both you and Shekka her very best bedroom-eyes, trailing one fluffy limb down her front to her fragrant gulf.");
	output("\n\nYour hands help slip Shekka out of her tight-fitting suit, freeing her to the open air of your ship. Despite a few of her motions lacking surity, Anno practically helps you pull your new lover into the bed before you climb in after them.");
	flags["CREWMEMBER_SLEEP_WITH"] = "SHEKKA AND ANNO";
	processTime(3);
	clearMenu();
	sleep(false);
}

/*Sleep now
Fen note: Cut this bit. Didn't make much sense anywhere.
public function sleepNowWithShekkaAndAnno():void
output("\n\n	Grasping groping hands lay into you, but with a grumble you bat them away, earning a duo of half-worded complaints. Eventually they settle in properly though, and your bed somehow manages to accommodate you all. You rest your head on Anno’s chest, listening to her heartbeat, even while Shekka wraps herself around your lower-half, using you like an oversized pillow.");

output("\n\n//Next: sleep as normal, next day");*/

//Anno
public function sleepWithJustAnno():void
{
	clearOutput();
	showBust(annoBustDisplay(),shekkaBustDisplay());
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	output("You run your fingers through your [pc.hair], looking over the two of them and trying to keep your expression plain. It may seem unfair, but Anno was here first. It’s not right to supplant her just because of that.");
	output("\n\nShekka lets out a deep-seated sigh and nods bashfully. <i>“You’re right, you’re right. Sorry for losing my temper.”</i> she directs the second part of her apology at Anno, who appears just as embarrassed to have started up an argument. You give them both head-ruffle, and Shekka slips out again, starting to unzip her suit.");
	output("\n\nNot wanting to hear anything from Anno, you give her a nudge towards the bed, earning a surprised yelp before tossing the covers over the both of you.");
	//Next: sleep as normal, next day
	flags["CREWMEMBER_SLEEP_WITH"] = "ANNO";
	processTime(2);
	clearMenu();
	sleep(false);
}

//Shekka
public function sleepWithJustShekka():void
{
	clearOutput();
	showBust(annoBustDisplay(),shekkaBustDisplay());
	showName("ANNO &\nSHEKKA");
	author("SomeKindofWizard");
	output("It is true that Anno doesn’t particularly have any issues with finding companions... whereas if Shekka is struggling...");
	output("\n\nIt takes a valiant force of will not to look at the puppy-dog-eyes Anno is beaming your way. Judging by the look on Shekka’s face, she wasn’t prepared for that particular trap. A gentle boop on Anno’s nose breaks the spell, and she lets out a soft whine before giving up. <i>“Okay, okay... I understand. If you change your mind, you know where to find me.”</i>");
	output("\n\nThe snowy-furred Ausar gives you a peck on the cheek, plucks up her towel and clothing, and slips out of the room, giving you both a hip-swaying show as she goes. Your red-scaled shortstack looks up, appearing guilty as all hell. <i>“Crap... I’m sorry...”</i>");
	output("\n\nPutting your hands up in mock surrender, you announce there’s nothing you hate more than drama. It takes a few more babbled apologies, but eventually Shekka gives up and agrees, scrambling into your bed. <i>“Well then Captain, if that’s the case... think you could help me out of my suit?”</i> she licks her lips, waving her egg-layer-hips in your face enticingly.");
	output("\n\nAs if anyone could stop you.");
	flags["CREWMEMBER_SLEEP_WITH"] = "SHEKKA";
	processTime(2);
	clearMenu();
	sleep(false);
}

/*Asking Anno
Fen note: lazy
//If you’re sharing with Shekka and ask Anno to join you in bed, you can ask just her, or invite her to join you and Shekka. Asking her works as normal, following text is for inviting her to join you.
output("\n\n	<i>“What’s that Boss? You want me and scalebutt to make you into a little Steele Sandwich?”</i> Anno appears pensive, resting a finger demurely on her chin. The wagging of her tail can’t lie however.");

output("\n\n<i>“Hey Shekka!”</i> she abruptly calls, nearly spooking you out of your {skin/fur/scales}. <i>“Make some space in that bed! We’re going to squish up like a naughty little fuckpuddle tonight!”</i>");
output("\n\n//Next: conversation closes, sleeping is set as having Anno and Shekka shared");
*/

//Waking: Sharing Shekka
//Randomized chance of each scene occurring, Aphrodisiac scenes first; these are triggered by having the aphrodisiac tag on your tongue
public function shekkaSleepWithMornings():void
{
	clearOutput();
	showShekka(true);
	author("SomeKindofWizard");
	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED))
	{
		//1
		if(rand(2) == 0)
		{
			output("Needy fingers digging into your chest are the first thing to wake you up... followed very swiftly by a boiling-hot cunt pressing its flushed lips against ");
			if(pc.hasCock()) output("the shaft of [pc.oneCock]");
			else output("your [pc.leg]");
			output(", grinding slowly up and down. <i>“Fuck... I can’t help it... sorry for waking you up, [pc.name]... I– I just need this, I need this right now!”</i>");

			output("\n\nThere’s a surprising amount of strength in her grip as her body works and grinds, mouth wide open. <i>“I need you, your saliva, your touch! I woke up and it’s all I could think about! I need you to treat me like a wanton whore!”</i> Realizing her body is jonesing for a hit of your aphrodisiac-laden spit, you haul her up to your mouth, capturing her lips in yours. Her exultant moans drift into horny, lust-drunk whimpers as the chemical load dumps itself into her brain.");
			output("\n\nShe squirts onto your abdomen, sent immediately crashing into a surprise orgasm. For her own safety you end the kiss, nuzzling her as she quakes and twitches on you. <i>“Thanksh”</i> she mumbles drunkenly, even as her fingers plumb at her own now-puffy labia.");
			pc.lust(10);
		}
		//2
		else
		{
			output("As sleep finally scatters into wakefulness, you become aware of a great warmth, naked flesh, and smooth scales pressing down on your body. Your eyes peel open, seeing Shekka looking up at you hungrily ");
			if(pc.biggestTitSize() >= 2) output("from between your massive breasts");
			else output("with her chin perched on your pecs");
			output(". Her lids slowly open and close, and her hips raise up, wiggling like a predator about to pounce.");
			output("\n\nYou get perhaps halfway into a ‘Good Morning’ before she pounces, diving in for a hungry kiss. She has the dilated pupils of an addict, and the moment her tongue meets your it hits her like a shock of electricity. Shekka trembles atop you, whimpering into your mouth as she gets her fix, practically gushing from her now-flushed quim. Your hands instinctively grasp at her cushiony rear, giving her a slow squeeze until she stops moaning through your lips and comes up for air.");
			output("\n\n<i>“Ffffuck... [pc.name], I held out for as long as I could, I seriously needed my fix....”</i>");
			output("\n\nShe rolls off of you, idly stroking herself. <i>“Better than morning coffee...”</i>");
			pc.lust(10);
		}
	}
	//Normal
	else
	{
		//1
		if(rand(2) == 0)
		{
			output("A soft, trilling breathing tickles at one of your [pc.ears]. It’s a very much alien sound, as though it were a hint away from a sibilant hiss, or trickling birdsong. Peeking over your shoulder reveals an innocently sleeping face, and the need to climb out of bed and get on with your day has to pose a quick war with comfort.");
			output("\n\nYou reach around your back, planting your hands on warm, naked ass-cheeks. Although Shekka’s eyes stay closed, her breathing shifts. She’s probably awake now. Not that it stops you from continuing, massaging her expansive rear and rubbing the very base of her tail until the horny Rask struggles to fight down delighted little ‘coo-ing’ sounds. She finally fives up, nibbling your shoulder and moaning sweetly. <i>“A girl could get used to a little hands-on wakeup like that.”</i>");
			output("\n\nShekka gives you a quick spank, disentangling from your body and letting you up.");
		}
		//2
		else
		{
			output("Your dreams are interrupted by an all-encompasing sensation of warmth at your core, of dainty little fingers squeezing at your thighs. Opening your eyes to a brand new day feels a little bit too challenging, but you do so anyway at the rather insistent need to cum. Unknown waves of orgasm are apparently cresting the shores of your resolve, and a peek beneath the bedsheets reveals the culprit; Shekka.");
			output("\n\nHer ears are laid out across your legs, ass up in the air as the nude creature lovingly licks and kisses at ");
			if(pc.hasVagina()) output("your thoroughly-soaked slit");
			else if(pc.hasAKnot()) output("engorging knot");
			else output("turgid shaft");
			output(". The very first question on your lips is how long she’s been at it, but the breath is practically stolen from you after one exceptionally adoring kiss. Apparently it must have been a while since you’re immediately sent crashing into orgasm, ");
			if(pc.hasCock()) 
			{
				output("painting your own chest in [pc.cum]");
			}
			else output("coating her face in [pc.girlcum]");
			output(".");
			output("\n\nShekka licks her lips, ensuring the rest of your morning is taken up by her dutiful cum-cleaning tongue, before you’re given a nuzzle. <i>“Good morning, [pc.name]!”</i>");
		}
	}
	sleep(false);
}

public function shekkaCrewSexMenu():void
{
	clearMenu();
	penisRouter,[shekkaCrewFutaBendoverFuck,chars["SHEKKA"].vaginalCapacity(),false,0]
	if(pc.hasCock())
	{
		if(pc.cockThatFits(chars["SHEKKA"].vaginalCapacity()) >= 0) 
		{
			if(shekka.hasCock()) addButton(0,"Fuck Her",penisRouter,[shekkaCrewFutaBendoverFuck,chars["SHEKKA"].vaginalCapacity(),false,0],"Fuck Her","Bend Shekka over her desk and fuck her while she tries to keep working.");
			else addButton(0,"Fuck Her",penisRouter,[shekkaCrewBendoverFuck,chars["SHEKKA"].vaginalCapacity(),false,0],"Fuck Her","Bend Shekka over her desk and fuck her while she tries to keep working.");
		}
		else addDisabledButton(0,"Fuck Her","Fuck Her","You don’t have a dick small enough to fit her.");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You need to have a penis in order to bend her over her desk and fuck her.");

	if(pc.hasVagina()) 
	{
		if(shekka.hasCock()) addButton(1,"Tribadism",shekkaCrewFutaTailTrib,undefined,"Tribadism","A little bit of tribadism with the raskvel’s tail in the middle for added texture.");
		else addButton(1,"Tribadism",tribCrewVibeyVibe,undefined,"Tribadism","A little bit of tribadism with the raskvel’s tail in the middle for added texture.");
	}
	else addDisabledButton(1,"Tribadism","Tribadism","Tribadism requires you to have a vagina.");

	if(pc.hasCock() && pc.biggestCockVolume() > chars["SHEKKA"].vaginalCapacity() && pc.tallness >= 60 && pc.cumQ() >= 500) 
		addButton(2,"Big Dick",hugeEarShekkaFaps,undefined,"Big Dick Shenanigans","Use your over sized member on the small mechanic. She’s gotta have some way to please it, right?");
	else addDisabledButton(2,"Big Dick","Big Dick Shenanigans","This scene requires a large dick, a height of above five feet, and large volume of cum.");

	//MilkQ over 1000
	if(pc.milkQ() >= 1000 && pc.isLactating()) addButton(3,"FeedMilk",shekkaMilkDranking,undefined,"FeedMilk","Feed her some of the copious milk you’re carrying around.");
	else addDisabledButton(3,"FeedMilk","Feed Shekka Some Milk","You need to be lactating quite heavily to satisfy the little raskvel with your teats alone.");

	if(flags["SHEKKA_ANNO_NERDOFF"] != undefined && flags["SHEKKA_ANNO_NERDOFF"] != -1) addButton(4,"Anno Comp.",shekkaAnnoVibeOffpre,true,"Anno Competition","Have your two mechanically-inclined crew-mates see who can make the more stimulating sex-toy.\n\n<b>Warning:</b> Something will be inserted into an orifice.");
	else addDisabledButton(4,"Locked","Locked","This event requires both Anno and Shekka as crew members partaking in an argument.");

	if(flags["SHEKKA_ONAHOLED"] != undefined && shekka.hasCock()) addButton(5,"Onahole",shekkaOnaholeIntro,undefined,"Onahole","Get Shekka in the mood to play with her onahole again!");
	else addDisabledButton(5,"Locked","Locked","Shekka needs a big ol’ horse-cock before you can catch her playing with it and unlock this scene!");

	addButton(14,"Back",approachCrewShekka,true);
}

//Talk Menu Sex
//In the talk menu when Shekka is a crewmember, this is what the Sex Option brings up before providing options.
public function shekkaCrewSexApproach():void
{
	clearOutput();
	showShekka();
	//Non-Futa
	if(!shekka.hasCock())
	{
		output("Shekka grins at you, hips wiggling. <i>“I know that look in your eyes, [pc.name]. You wouldn’t happen to be looking for an opportunity to let off a little steam?”</i>");
		output("\n\nThe little Rask nibbles her bottom lip, and her tail flips up into her hands so that she can wring it in mock coyness. <i>“Because that would suit me juuust fine!”</i> Her flirting is interrupted by an almost human grunt from your engine, and she gives it a kick, scowling. <i>“Moving on.”</i>");
		//In heat
		if(pc.inHeat() && pc.hasVagina()) 
		{
			output("\n\nShe isn’t wrong considering you’re in heat. Every chemical signal in your body is centered on your core, begging to get off and be filled until your [pc.pussy] is a leaking mess. Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" and dip in for a kiss, growing more excited as your lips meet.");
			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nShekka lets out a shuddering little moan, nipples instantly stiff and rigid through the suit, her eyes dilated from slits into circles. <i>“H-how... god-that’s-good... Uh... how do you wanna do it- me?”</i>");
			else output("\n\nShekka lets out a delighted little moan, nipples growing hard enough to be seen through her sheer suit. <i>“How do you wanna do it, [pc.name]?”</i>");
		}
		//In rut
		else if(pc.inRut() && pc.hasCock())
		{
			output("\n\nNo kidding. You’re in <i>rut</i> afterall, your [pc.cocks] ");
			if(pc.cockTotal() == 1) output("is");
			else output("are");
			output(" practically ");
			if(pc.cockTotal() == 1) output("an aching bar");
			else output("aching bars");
			output(" of red-hot iron ");
			if(!pc.isCrotchExposed()) output("in your [pc.crotchCover]");
			else output("against your naked thighs");
			output(". Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" before scooping her up and onto your hips. Her hands grab onto your ");
			if(pc.biggestTitSize() < 1) output("pecs");
			else output("tits");
			output(", squeezing them like handholds as you draw her into a hungry make-out.");
			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nBy the time you’re done warming up, Shekka’s drooling and shuddering, staring at you in chemically-supplimented adoration. <i>“Oh fuuuuck... How do you want me, [pc.name]? Just fucking take me.”</i>");
			else output("\n\nBy the time you’re done warming up, Shekka’s gasping for breath. <i>“Oh fuck, how do you want me, [pc.name]?”</i>");
		}
		//Else
		else
		{
			output("\n\n<i>“A little roll-around wouldn’t hurt”</i> you say, grinning and crossing your [pc.arms].");
			output("\n\nShekka smiles and hops up to you, throwing her arms around your ");
			if(pc.tone >= 60 && pc.thickness >= 75) output("big strong ");
			else if(pc.tone < 40) output("soft, welcoming ");
			output("shoulders, nuzzling into your neck. <i>“Good. I don’t know what it is you do to me, but damn do I crave it. How do you want me?”</i>");
		}
	}
	//Futa
	else if(shekka.hasCock(GLOBAL.TYPE_EQUINE))
	{
		output("Ever since Shekka started packing a big ol’ horse-cock, the clear indentation of it stands out within her tight suit. She seems to pick up on the lewd look you give her, judging by the way it twitches in its confines, and her eyelashes flutter sweetly. She fluffs out her bright pink quills, putting on her best bedroom eyes. <i>“[pc.name], I daresay you’re looking to get a load off.”</i>");
		output("\n\nThat’s... not quite how that phrase is meant to be spoken, but judging by the way her prick is eagerly anticipating its chance to be a cum-cannon once more it was probably on purpose.");
		//In heat
		if(pc.inHeat() && pc.hasVagina())
		{
			output("\n\nShe isn’t wrong considering you’re in heat. Every chemical signal in your body is centered on your core, begging to get off and be filled until your [pc.pussy] is a leaking mess of rich futa spunk. Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" and dip in for a kiss, growing more excited as your lips meet.");

			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nShekka lets out a shuddering little moan, nipples instantly stiff and rigid through the suit, though nowhere near as obvious as the throbbing, shrink-wrapped length. Her eyes dilate from slits into circles. <i>“H-how... god-that’s-good... Uh... how do you wanna do it- me?”</i>");
			else output("\n\nShekka lets out a delighted little moan, her cock presses against your body in accusation. <i>“How do you wanna do it, [pc.name]?”</i>");
		}
		//In rut
		else if(pc.hasCock() && pc.inRut())
		{
			output("\n\nNo kidding. You’re in <i>rut</i> afterall, your [pc.cocks] ");
			if(pc.cockTotal() == 1) output("is");
			else output("are");
			output(" practically ");
			if(pc.cockTotal() == 1) output("an aching bar");
			else output("aching bars");
			output(" of red-hot iron ");
			if(!pc.isCrotchExposed()) output("in your [pc.crotchCover]");
			else output("against your naked thighs");
			output(". Shekka watches as you ");
			if(pc.tallness < 4*12+6) output("close the distance");
			else output("crouch down to her level");
			output(" before scooping her up and onto your hips. Her cock is trapped ");
			if(pc.biggestTitSize() >= 5) output("between the plush softness of your breasts");
			else output("between the press of your modest chests");
			output(", already oozing pre into her suit. The smaller girl whimpers into a hard make-out, fingers squeezing at you.");
			if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nBy the time you’re done warming up, Shekka’s drooling and shuddering, staring at you in chemically-supplimented adoration. <i>“Oh fuuuuck... How do you want me, [pc.name]? Just fucking take me.”</i>");
			else output("\n\nBy the time you’re done warming up, Shekka’s gasping for breath. <i>“Oh fuck, how do you want me, [pc.name]?”</i>");
		}
		//Else
		else
		{
			output("\n\n<i>“A little roll-around wouldn’t hurt”</i> you say, grinning and crossing your [pc.arms].");
			output("\n\nShekka smiles and hops up to you, throwing her arms around your ");
			if(pc.tone >= 60 && pc.thickness >= 75) output("big strong ");
			else if(pc.tone < 40) output("soft, welcoming ");
			output("shoulders, nuzzling into your neck. Her prick has grown hard enough to jab you in the abdomen even while she moans sweetly. <i>“Good. I don’t know what it is you do to me, but damn do I crave it. How do you want me?”</i>");
		}
	}
	processTime(4);
	pc.lust(20);
	shekkaCrewSexMenu();
}

//Bendover Fuck
public function shekkaCrewBendoverFuck(x:int):void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo and SKoW");
	output("Although it’s far smaller than the one in her warehouse, you flip Shekka around and nudge her towards the bench. <i>“Go ahead and work on... whatever that piece of my ship is. Just let me do all the work.”</i> Your fingers trace up her spine to her neck where a small, hidden clasp resides. Shekka shivers in anticipation once you find it. You artfully twist your thumb and index finger, releasing the catch and revealing her jumpsuit’s seam. The fabric parts slowly, opening just enough to let her pale crimson flesh peek through, the light sparkling off glossy scales as they’re exposed. <i>“Well? I’m waiting. I want to see maximum satisfaction here.”</i>");
	output("\n\nShekka, usually sassy and quick to react, looks at you uncertainly. Her tail swishes back and forth nervously, but she does as you ask, plucking up some (frankly expensive looking) parts from all over her workbench into a small pile before you. A moment later, her confident smile returns. She presses her large rump back against you, curling her tail around your side so as not to interfere with the soft, sensuous press of her buttocks against your package. With just an earnest flex, her cheeks squeeze your [pc.cocks] harder.");
	output("\n\nOhhh, that feels nice. Blood surges to your genitals, and your breath shortens as your heartbeats accelerate. Grunting softly, you grab hold of her slowly releasing suit by its edges and tug, baring her shoulders in an instant. The edge of the fabric catches on her nipples, revealing the soft, eggplant-colored areolae a second before the tips of her nipples pop out over the edge. From there, it’s easy to peel the obstructing garment down past Shekka’s bare belly to her hips. The fit is much tighter there, and the press of her expansive ass against your [pc.cocks] makes choosing between continuing to grind against her or getting her out of her clothes an agonizingly difficult decision.");
	output("\n\n<i>“What’s the matter?”</i> Shekka wonders, applying some ED-80 to a particularly tight fixture to loosen the screws. <i>“Having a little trouble with unwrapping me?”</i>");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" She brings her tail up");
		if(pc.legCount > 1) output(" between");
		else output(" around");
		output(" your [pc.legOrLegs] to slide alongside ");
		if(pc.balls > 0) output("your [pc.sack]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your [pc.base " + x + "]");
		output(".");
	}
	else output(" She curls her tail around to tease your [pc.asshole], the tip circling around the edge of your ring.");
	if(!pc.isNude()) output(" <i>“You haven’t even gotten yourself naked yet.”</i>");
	//Not naked yet
	if(!pc.isCrotchExposed())
	{
		output("Shuddering, you respond to her critique by stepping back and tearing out of your [pc.crotchCovers] in seconds, tossing the obstructing equipment back towards your ship’s hold. You ask, <i>“How’s that?”</i> though it’s revealed as a prideful hypothetical when your exposed form presses back against hers.");
	}
	//Merge
	output("\n\nYou press your [pc.cocks] harder against her - hard enough ");
	if(pc.cockTotal() > 1) output("for one ");
	output("to tease her clenching ring. Shifting the angle, you thread yourself lower between her thighs, pressing your length against the bump of her rear clit, feeling the suit sink into her slit around you as you tease her. Shekka’s busy motions on the table slow before being interrupted by an instinctive twitch of pleasure. The sound of her moan is muffled by her tightly-closed lips, but you hear it nonetheless.");
	output("\n\n<i>“What’s the matter?”</i> it’s your turn to ask. <i>“No wonder you used to be so worried about sex interfering with your work. All it takes is a little rub on one of your knobs to interrupt you.”</i>");
	output("\n\nShekka picks up the pliars she just dropped and grits her teeth. <i>“It... it just slipped is all!”</i> She goes back to work, pausing to whimper every now and again when [pc.oneCock] grinds against her clitty in a particularly delicious way. <i>“I’ll have finished cleaning this before you figure out how to... mmm... fuck my pussy.”</i> She glances over her shoulder to stick her tongue out at you and wink. That lengthy tongue shivers across her lips sensuously on the next thrust before she turns away once more. The little slut is egging you on!");
	output("\n\nTaking one hand off her skin-tight suit, you press your palm to her [shekka.belly], sliding it down to her mons from the opposite side of your slowly thrusting dick. You find the bump of her second clit and press your middle finger down, swiping it back and forth across the pleasure-sensitive bud.");
	output("\n\nYou might as well have hooked her clitties up to batteries judging by the way it makes her jolt. Shekka barks, <i>“Fuck, [pc.name]! Ung! T-take it easy, oooookay?”</i> Her gratuitous hips give a sexy wiggle, wanting more.");
	if(silly) output(" Those hips don’t lie.");

	output("\n\n<i>“Are you sure?”</i> You press and rub her from both sides, still working to peel her out of her jumpsuit. It’s slower going with just the one free hand, but you manage to time each tug with every twitch and buck. The alabaster fabric rolls halfway down her ass before catching between your paired forms. The front is hooked by your busily gyrating finger as well. Somehow she’s managed to oil up some steel wool, grinding it around the inside of some gunked-up seams.");
	output("\n\n<i>“Y-y-yes,”</i> Shekka answers, letting the cleaning wool drop from between her fingers. Not because of the overwhelming feelings coming from her thighs but because she’s finished with it. It’s hard to tell if she was answering your question or merely giving voice to her pleasure. Upon reflection, you realize that it doesn’t really matter much either way. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is");
	else output("are");
	output(" as hard as ");
	if(pc.cockTotal() == 1) output("a titanium bar");
	else output("titanium bars");
	output(", and there’s no way you’re going to pass up on your raskvel honey’s pussy.");

	output("\n\nYou pull away from the fidgeting mechanic. Her hands are shaking as she swaps components, and her breath is as ragged as and endurance runner’s. She’s still managing to do her work, though. The jumpsuit gives way around her hips, stretching before rolling down her scaly hips. It clings to her sopping-wet slit in liquid-assisted defiance before finally breaking away, carrying a glossy sheen as a memento of its time wedged into her crotch. You grunt in appreciation of the fine ass you’ve revealed while you push her clothing to the ground.");

	output("\n\nShekka’s tail pats the side of your face, right on your cheek, and she purrs, <i>“Mmmm, good [pc.boyGirl], but I think I might get this repaired before you can cum inside me.”</i> The naughty little limb snakes down your neck to your chest then around to your [pc.butt]. It slaps you for good measure. <i>“If this is the best you’ve got, maybe I should just let you at me the whole damn day. I could get so much done before you even wring a single orgasm out of my dripping... wet... cunt.”</i> She steps further apart to show you just how wet she’s become.");
	output("\n\nOh wow, is it ever. Her violet lips are absolutely sopping. Beads of clear lubricant hang from her labia as rain clings to a spider’s web. Plump and engorged, her meaty vulva is begging for a fuck. Both her clits are jutting out from between the soaked lips, and droplets hang on slick strands from them, sometimes releasing to patter on the floor. A small puddle has formed beneath the juicy raskvel, matching the one in her suit, proof of just how badly she needs you to fuck her.");
	output("\n\nIt’s too much: her taunting words, the tantalizing gates of pleasure so close that can feel the heat steaming off of them, and the submissive, bent-over pose. Even if you were determined not to fuck her, you couldn’t stop your [pc.hips] from lurching forward. You couldn’t stop your [pc.cock " + x + "] from spreading them wide");
	var y:int = -1;
	if(pc.cockTotal() > 1) 
	{
		y = pc.cockThatFits(shekka.analCapacity());
		if(y == x) y = pc.cockThatFits2(shekka.analCapacity());
		if(y == x) y = -1;
	}
	if(y >= 0) output(" or your [pc.cock " + y + "] from battering into her tight asshole");
	output(". You certainly wouldn’t be capable of holding back the growl that rips its way out of your throat as your body asserts its primal need to fuck and breed the female its been presented with.");
	pc.cockChange();

	output("\n\nShekka’s legs slam against her little table as you take her from behind, pressing on her hard enough that she winds up wrapping her perky chest around a pipe like an impromptu tit-fuck. Her lips cling to your piston like oiled cylinder walls, and as you really start to give it to her they only seal tighter around you. Every forceful thrust is accompanied by lurid squelches, every cock-hilting thrust matched by affectionate, muscular squeezes from Shekka’s box. The impacts cause you to bump her rearward clit repeatedly, and she moans each time. These raskvel were made to be fucked from any angle; no matter how you take them, one of their clits will be happily sparking.");
	output("\n\nYou settle into an easy, musical rhythm. Her swaying, pierced ears provide a pleasant jingling background while her staccato moans provide proof positive that’s getting the hard fucking she wanted. Shekka’s petite body feels almost entirely wrapped around your [pc.cock " + x + "] even though such a thing is impossible. Her tail is wrapped around your waist encouragingly, helping you to thrust into her as hard as absolutely possible. If you weren’t so caught up in the moment, you might be worried that you would bruise her thighs against the workbench. She wouldn’t let you stop, though. She’d tell you to get back to work. After all, she’s working.");

	output("\n\nIt’s hard to tell if she’s still working, actually. She did manage unwedge the cylinder from between her perky tits at least. Damn, her nipples look hard. And she seems to be trying to place it aside and get her hands on another, but she keeps throwing back her head and moaning. Her free hand keeps knocking over the little bottle of cleaning fluid and scrabbling against the workbench’s hard metal surface. Shekka might have made some good progress on her toy, but there’s no way she’s going to finish it in this condition.");

	output("\n\nShe’s little more than a slutty mess of fuckjuice and pleasure now - a tingling bundle of nerves spasming around your ");
	if(y >= 0) output("doubled dicks");
	else output("[pc.cock " + x + "]");
	output(" in an effort to please you. Her tongue lolls out of her mouth. There’s at least half a foot of organ there, tempting you into having the little gadget-slut clean you off afterwards. Holding her by the hips, you pound away, feeling her start to orgasm underneath you, gushing fluid over your [pc.knot " + x + "]");
	if(y >= 0) output(" and clenching around your [pc.cock " + y + "] with her pucker");
	output(". Right now, she’s the perfect little sextoy, and you’re using her like one.");

	output("\n\nFuck, she’s getting tighter every time! It’s actually starting to get hard to pull out of her, and the soaking-wet girl goo bathing you is challenging you to erupt. No, worse than that, her whole body is begging for a thick wad of your [pc.cumNoun]");
	if(y >= 0) output(" - even her ass");
	output(".");

	output("\n\nShekka babbles in a brief interlude between orgasms, <i>“Fucking fuck me! Cum!”</i> Of course, her pink eyes roll back and a second later, and her words transform into poorly enunciated “yes”es and “ahh”s of pleasure. Bending low over top of her, you feel the rising heat inside you, signaling that your own release is soon at hand. You wrap an arm under her chest, lifting her up to press against your [pc.chest]. Grabbing tight, your palm encircles her breast, and you bottom out one last time");
	var knot:Boolean = false;
	var knots:Boolean = false;
	if(pc.hasKnot(x)) knot = true;
	if(y >= 0)
	{
		if(pc.hasKnot(y)) knot = true;
		if(pc.hasKnot(x)) knots = true;
	}
	if(knot) 
	{
		output(", your expanding knot");
		if(knots) output("s");
		output(" slipping in");
	}
	output(".");

	//The knots have it
	if(knot)
	{
		output("\n\nThe feeling of seating yourself deeply inside her and being locked in place by your expanding biology only makes your climax that much hotter.");
		if(knots) output(" Doing that to both her holes at once is even better.");
		if(pc.cumQ() < 10)
		{
			output(" Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25)
		{
			output(" Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output(" Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, secure in the knowledge that your knot");
			if(knots) output("s");
			output(" will pin every drop inside her.");
		}
		else if(pc.cumQ() < 4000)
		{
			output(" Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output(" Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output("full with the first few injections. The next ones, sealed in by your knot");
			if(y >= 0) output("s");
			output(", swell her [shekka.belly] with added weight, giving her a positively pregnant appearance.");
			if(!knots && y >= 0) output(" Sadly, you don’t have knots to plug both sides, and waves of hot-pumping [pc.cumNoun] vent out over one of your [pc.cocks].");
			if(pc.cumQ() >= 9000) output(" Her wobbly, spunk-stuffed tummy grows so big that you worry for her health, but by then the fluid distention widens her passage enough for streams of it to sluice out over your crotch, venting the pressure.");
		}
		output("\n\nYou go limp, your ardor spent, but your knot");
		if(knots) output("s hold");
		else output(" holds");
		output(" you secure inside of her, giving you time to appreciate the outlines of her shoulderblades and the natural fragrance of her feathery hair.");
	}
	//No knot for you, come back next year.
	else
	{
		output("\n\nHer wet, milking walls coax you to a glorious a climax");
		if(y >= 0) output(", and the way her asshole is tugging at your dick doesn’t hurt either");
		output(". ");
		if(pc.cumQ() < 10) 
		{
			output("Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25) 
		{
			output("Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output("Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, feeling some of it slop back out around your [pc.cock " + x + "], ");
			if(pc.balls == 0) output("running down your [pc.leg].");
			else output("clinging to your [pc.sack] to make it shine with sex.");
		}
		else if(pc.cumQ() < 4000)
		{
			output("Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output("Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output(" full with the first few injections. The next ones, heavy as they are, swell her [shekka.belly] with added weight, giving her a positively pregnant appearance. Waves of excess, hot-pumping [pc.cumNoun] vent out over your [pc.cocks] as you continue to ejaculate, sluicing down your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("[pc.leg]");
			output(".");
			if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) output(" Your flared tip makes sure a fair portion of it shoots directly against her cervix.");
		}
		output("\n\nYou go limp, your ardor spent and your softening length");
		if(y >= 0) output("s");
		output(" slipping halfway out of her. You take the moment to appreciate the shapeliness of her shoulder blades and the natural scent of her feathery hair air.");
	}
	//Merge
	output("\n\nAfter a while of holding her like this, she comes down from her own plateau and cranes her head around to look at you, smiling. It isn’t a mere sated smile either - the kind that telegraphs just how well fucked she’s been. No. It’s a gloating, knowing smile. Although her fingers tremble in nerveless aftershocks, she neatly stacks a series of cleaned tubes that belong to your ship’s engine.");
	output("\n\nShekka gently pushes you back with her feet, letting your soaked [pc.cocks] fall away. She pulls herself up onto her workbench, rubbing her belly, a slightly vacant look in her eyes. <i>“I think we both won that little competition.”</i>");
	output("\n\n<i>“Oh?”</i> you say while wiping up.");
	output("\n\nShekka nods, giggling, her hand still on her belly. <i>“Fuck yes. I prefer my work to be on the fixing side compared to the cleaning, but cumming with an armload of sweet techy goodbits? That was nirvana. I’ll make sure to keep the chores stocked up in preparation for the next visit, and we can do this every time.”</i>");
	output("\n\nYou shrug, unable to hide the grin on your face. Your [pc.cum] is pooling between her legs on her bench, and she hasn’t noticed. <i>“Sure thing, babe.”</i>");
	output("\n\nShekka doesn’t even bother cleaning herself up. She just starts tugging on her jumpsuit, making sure its tight enough against her swollen crotch to hold in every drop. Judging by the audible squish it makes as it presses against her nethers, you can only assume it caught a fair amount of liquid action itself.");
	if(pc.cumQ() >= 4000) output(" It does an impressive job of stretching to accommodate her obscenely cum-gravid gut.");
	output(" She doesn’t comment on it, instead mentioning something about showering after reinstalling the pipes, but you think she might just like the feel of her pussy swimming in it.");
	processTime(30);
	fuckedShekka();
	shekka.loadInCunt(pc,0);
	if(y >= 0) shekka.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Bendover Fuck Futa
public function shekkaCrewFutaBendoverFuck(x:int):void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo and SKoW");
	output("Although it’s far smaller than the one in her warehouse, you flip Shekka around and nudge her towards the bench. There’s a small gasp and she has to wiggle her hips to keep her thick horse-cock from getting trapped against furniture. <i>“Go ahead and work on... whatever that piece of my ship is. Just let me do all the work.”</i> Your fingers trace up her spine to her neck where a small, hidden clasp resides. Shekka shivers in anticipation once you find it. You artfully twist your thumb and index finger, releasing the catch and revealing her jumpsuit’s seam. The fabric parts slowly, opening just enough to let her pale crimson flesh peek through, the light sparkling off glossy scales as they’re exposed. <i>“Well? I’m waiting. I want to see maximum satisfaction here.”</i>");
	output("\n\nShekka, usually sassy and quick to react, looks at you uncertainly. Her tail swishes back and forth nervously, but she does as you ask, plucking up some (frankly expensive looking) parts from all over her workbench into a small pile before you. A moment later, her confident smile returns. She presses her large rump back against you, curling her tail around your side so as not to interfere with the soft, sensuous press of her buttocks against your package. With just an earnest flex, her cheeks squeeze your [pc.cocks] harder.");
	output("\n\nOhhh, that feels nice. Blood surges to your genitals, and your breath shortens as your heartbeats accelerate. Grunting softly, you grab hold of her slowly releasing suit by its edges and tug, baring her shoulders in an instant. The edge of the fabric catches on her nipples, revealing the soft, eggplant-colored areolae a second before the tips of her nipples pop out over the edge. From there, it’s easy to peel the obstructing garment down past Shekka’s bare belly to her hips. The fit is much tighter there (even more so with her additional endowment) and the press of her expansive ass against your [pc.cocks] makes choosing between continuing to grind against her or getting her out of her clothes an agonizingly difficult decision.");
	output("\n\n<i>“What’s the matter?”</i> Shekka wonders, applying some ED-80 to a particularly tight fixture to loosen the screws. <i>“Having a little trouble with unwrapping me?”</i>");
	if(pc.hasCock() || pc.hasVagina()) 
	{
		output(" She brings her tail up");
		if(pc.legCount > 1) output(" between");
		else output(" around");
		output(" your [pc.legOrLegs] to slide alongside ");
		if(pc.balls > 0) output("your [pc.sack]");
		else if(pc.hasVagina()) output("[pc.oneVagina]");
		else output("your [pc.base " + x + "]");
		output(".");
	}
	else output(" She curls her tail around to tease your [pc.asshole], the tip circling around the edge of your ring.");
	if(!pc.isNude()) output(" <i>“You haven’t even gotten yourself naked yet.”</i>");
	//Not naked yet
	if(!pc.isCrotchExposed())
	{
		output("Shuddering, you respond to her critique by stepping back and tearing out of your [pc.crotchCovers] in seconds, tossing the obstructing equipment back towards your ship’s hold. You ask, <i>“How’s that?”</i> though it’s revealed as a prideful hypothetical when your exposed form presses back against hers.");
	}
	//Merge
	output("\n\nYou press your [pc.cocks] harder against her - hard enough ");
	if(pc.cockTotal() > 1) output("for one ");
	output("to tease her clenching ring. Shifting the angle, you thread yourself lower between her thighs, pressing your length against the bump of her rear clit. Your dick is enveloped in the feeling of her suit sinking into her slit as you tease her, and the contours of her turgid balls are pushed slowly out of the way. Shekka’s busy motions on the table slow before being interrupted by an instinctive twitch of pleasure. The sound of her moan is muffled by her tightly-closed lips, but you hear it nonetheless.");
	output("\n\n<i>“What’s the matter?”</i> it’s your turn to ask. <i>“No wonder you used to be so worried about sex interfering with your work. All it takes is a little rub on one of your knobs to interrupt you.”</i>");
	output("\n\nShekka picks up the pliars she just dropped and grits her teeth. <i>“It... it just slipped is all!”</i> She goes back to work, pausing to whimper every now and again when [pc.oneCock] grinds against her clitty in a particularly delicious way. <i>“I’ll have finished cleaning this before you figure out how to... mmm... fuck my pussy.”</i> She glances over her shoulder to stick her tongue out at you and wink. That lengthy tongue shivers across her lips sensuously on the next thrust before she turns away once more. The little slut is egging you on!");
	output("\n\nTaking one hand off her skin-tight suit, you press your palm to her [shekka.belly], sliding it down to her cock. The massive (especially on a Raskvel) stallion-prick flops out from its confines, freeing up the musky scent of a horny herm accompanied by the dripping of thick beads of pre. She lets out a low, slow groan, before your hand wraps around her sheath, peeling it down in a quick, wet jerk.");
	output("\n\nYou might as well have crammed her down onto an arm-length dildo judging by the way her cunt tightens around the head of your dick, squeezing you through her suit. Shekka barks, <i>“Fuck, [pc.name]! Ung! T-take it easy, oooookay?”</i> Her gratuitous hips give a sexy wiggle, wanting more.");
	if(silly) output(" Those hips don’t lie.");
	output("\n\n<i>“Are you sure?”</i> You press and rub her from both sides, trailing down her shaft to grope and knead her churning balls while working to peel her out of her jumpsuit. It’s slower going with just the one free hand, but you manage to time each tug with every twitch and buck. The alabaster fabric rolls halfway down her ass before catching between your paired forms. The front hangs loose, trapped between your knob and her sack. Somehow she’s managed to oil up some steel wool, grinding it around the inside of some gunked up seams.");
	output("\n\n<i>“Y-y-yes,”</i> Shekka answers, letting the cleaning wool drop from between her fingers. Not because of the overwhelming feelings coming from her thighs, or the way your eager hand milks more juicy horse-pre out of her, but because she’s finished with it. It’s hard to tell if she was answering your question or merely giving voice to her pleasure. Upon reflection, you realize that it doesn’t really matter much either way. Your [pc.cocks] ");
	if(pc.cockTotal() == 1) output("is as hard as a titanium bar");
	else output("are as hard as titanium bars");
	output(", and there’s no way you’re going to pass up on your raskvel honey’s pussy.");

	output("\n\nYou pull away from the fidgeting mechanic. Her hands are shaking as she swaps components, and her breath is as ragged as and endurance runner’s. She’s still managing to do her work, though. The jumpsuit gives way around her hips, stretching before rolling down her scaly hips. It clings to her sopping-wet slit in liquid-assisted defiance before finally breaking away, carrying a glossy sheen as a memento of its time wedged into her crotch. You grunt in appreciation of the fine ass you’ve revealed while you push her clothing to the ground.");
	output("\n\nShekka’s tail pats the side of your face, right on your cheek, and she purrs, <i>“Mmmm, good [pc.boyGirl], but I think I might get this repaired before you can cum inside me.”</i> The naughty little limb snakes down your neck to your chest then around to your [pc.butt]. It slaps you for good measure. <i>“If this is the best you’ve got, maybe I should just let you at me the whole damn day. I could get so much done before you even wring a single orgasm out of my dripping... wet... cunt.”</i> She steps further apart to show you just how wet she’s become.");
	output("\n\nOh wow, is it ever. Her violet lips are absolutely sopping. Beads of clear lubricant hang from her labia as rain clings to a spider’s web. Plump and engorged, her meaty vulva is begging for a fuck. Both her clits are jutting out from between the soaked lips, and droplets hang on slick strands from them, sometimes releasing to patter on the floor. A small puddle has formed beneath the juicy raskvel, matching the one in her suit, proof of just how badly she needs you to fuck her.");
	output("\n\nAlong with all of that her meaty balls sway and twitch in time with her heartbeat, and her member is forced to point directly down to the floor, flaring eagerly and begging to be milked.");
	output("\n\nIt’s too much: her taunting words, the tantalizing gates of pleasure so close that can feel the heat steaming off of them, and the submissive, bent-over pose. Even if you were determined not to fuck her, you couldn’t stop your [pc.hips] from lurching forward. You couldn’t stop your [pc.cock " + x + "] from spreading them wide");
	var y:int = -1;
	if(pc.cockTotal() > 1) 
	{
		y = pc.cockThatFits(shekka.analCapacity());
		if(y == x) y = pc.cockThatFits2(shekka.analCapacity());
		if(y == x) y = -1;
	}
	if(y >= 0) output(" or your [pc.cock " + y + "] from battering into her tight asshole");
	output(". You certainly wouldn’t be capable of holding back the growl that rips its way out of your throat as your body asserts its primal need to fuck and breed the female its been presented with.");
	pc.cockChange();

	output("\n\nShekka’s legs slam against her little table as you take her from behind, pressing on her hard enough that she winds up wrapping her perky chest around a pipe like an impromptu tit-fuck. Her lips cling to your piston like oiled cylinder walls, and as you really start to give it to her they only seal tighter around you. Every forceful thrust is accompanied by lurid squelches, every cock-hilting thrust matched by affectionate, muscular squeezes from Shekka’s box. The impacts cause you to bump her rearward clit repeatedly, and she moans each time. At the same time, you press down on her back with one hand while the other sneaks down, capturing her turgid mast.");
	output("\n\nHer voice turns into an orchestra of lurid moans as her pleasure is doubled up; a teasing pinky toys with her stretchy cumslit, before trailing down to the base fast enough to make her balls slap into her frontward clit.");
	output("\n\nYou settle into an easy musical rhythm. Her swaying, pierced ears provide a pleasant jingling background while her staccato moans provide proof positive that’s getting the hard fucking she wanted. Shekka’s petite body feels almost entirely wrapped around your [pc.cock " + x + "] even though such a thing is impossible. Her tail is wrapped around your waist encouragingly, helping you to thrust into her as hard as absolutely possible.");
	output("\n\nThere would be cause for concern about bruising her if not for the way your busily-jerking arm keeps her thighs from smashing into the table too hard. Not that she would stop in such a case; she’d tell you to get back to work. After all, she’s working.");
	output("\n\nIt’s hard to tell if she’s still working, actually. She did manage unwedge the cylinder from between her perky tits at least. Damn, her nipples look hard. And she seems to be trying to place it aside and get her hands on another, but she keeps throwing back her head and moaning. Her free hand keeps knocking over the little bottle of cleaning fluid and scrabbling against the workbench’s hard metal surface. Shekka might have made some good progress on her toy, but there’s no way she’s going to finish it in this condition.");
	output("\n\nYou’d steal that stuff for lube if not for the fact you’re one-hundred percent sure if it’s for stripping metal clean, it doesn’t belong on a junker-slut Raskvel’s futa-junk. To be fair, there isn’t much need for it. The moisture from her own slobbering cunt drip down the back of her balls and into your waiting palm, happy to be used as lotion for her impromptu hand-job.");
	output("\n\nShe’s little more than a slutty mess of fuckjuice and pleasure now - a tingling bundle of nerves spasming around your ");
	if(y >= 0) output("doubled dicks");
	else output("[pc.cock " + x + "]");
	output(" in an effort to please you. Her tongue lolls out of her mouth. There’s at least half a foot of organ there, and you wonder how hard it would be for the little gadget-slut to suck herself off, perhaps tonguefuck that stretchy stallion cum-slit. Holding her by the hips, you pound away, feeling her start to orgasm underneath you, gushing fluid over your [pc.knot " + x + "]");
	if(y >= 0) output(" and clenching around your [pc.cock " + y + "] with her pucker");
	output(". Right now, she’s the perfect little sextoy, and you’re using her like one.");

	output("\n\nThick sweet orgasmic wetness is dredged up from her pussy as her body loses temporary track of its inhibitions, and your [pc.footOrFeet] are splashed with hot alabaster Shekka-cum. You refuse to let up on her cock however, and each of your thrusts is accompanied by a long jerk and another rope of cum.");
	output("\n\nFuck, she’s getting tighter every time! It’s actually starting to get hard to pull out of her, and the soaking-wet girl goo bathing you is challenging you to erupt. No, worse than that, her whole body is begging for a thick wad of your [pc.cumNoun]");
	if(y >= 0) output(" - even her ass");
	output(".");

	output("\n\nShekka babbles in a brief interlude between orgasms, <i>“Fucking fuck me! Cum!”</i> Of course, her pink eyes roll back and a second later, and her words transform into poorly enunciated “yes”es and “ahh”s of pleasure. Bending low over top of her, you feel the rising heat inside you, signaling that your own release is soon at hand. You wrap an arm under her chest, lifting her to press against your [pc.chest]. Her cock flails freely in the air, and you point it away from her bench before it has a chance to make a mess of her bits and pieces. Grabbing tight, your palm encircles her breast, and you bottom out one last time");
	var knot:Boolean = false;
	var knots:Boolean = false;
	if(pc.hasKnot(x)) knot = true;
	if(y >= 0)
	{
		if(pc.hasKnot(y)) knot = true;
		if(pc.hasKnot(x)) knots = true;
	}
	if(knot) 
	{
		output(", your expanding knot");
		if(knots) output("s");
		output(" slipping in");
	}
	output(".");

	//The knots have it
	if(knot)
	{
		output("\n\nThe feeling of seating yourself deeply inside her and being locked in place by your expanding biology only makes your climax that much hotter.");
		if(knots) output(" Doing that to both her holes at once is even better.");
		if(pc.cumQ() < 10)
		{
			output(" Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25)
		{
			output(" Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output(" Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, secure in the knowledge that your knot");
			if(knots) output("s");
			output(" will pin every drop inside her.");
		}
		else if(pc.cumQ() < 4000)
		{
			output(" Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output(" Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output("full with the first few injections. The next ones, sealed in by your knot");
			if(y >= 0) output("s");
			output(", swell her [shekka.belly] with added weight, giving her a positively pregnant appearance.");
			if(!knots && y >= 0) output(" Sadly, you don’t have knots to plug both sides, and waves of hot-pumping [pc.cumNoun] vent out over one of your [pc.cocks].");
			if(pc.cumQ() >= 9000) output(" Her wobbly, spunk-stuffed tummy grows so big that you worry for her health, but by then the fluid distention widens her passage enough for streams of it to sluice out over your crotch, venting the pressure.");
		}
		output("\n\nYou go limp, your ardor spent, but your knot");
		if(knots) output("s hold");
		else output(" holds");
		output(" you secure inside of her, giving you time to appreciate the outlines of her shoulderblades and the natural fragrance of her feathery hair.");
		output(" Each tiny shift of your body brings with it an accompanying grunt from Shekka, and a helpless twitch from her overwrought cock.");
		if(pc.cumQ() >= 4000) output(" Although her body is weighed down by the sheer quantity of your [pc.cum], h");
		else output("H");
		output("er balls tighten up against her dick, a whole lot lighter than they were before your tryst.");
	}
	//No knot for you, come back next year.
	else
	{
		output("\n\nHer wet, milking walls coax you to a glorious a climax");
		if(y >= 0) output(", and the way her asshole is tugging at your dick doesn’t hurt either");
		output(". ");
		if(pc.cumQ() < 10) 
		{
			output("Dribs and drabs of [pc.cum] leak out from your ");
			if(y >= 0) output("doubled dicks");
			else output("[pc.cock " + x + "]");
			output(", oozing in thin flows into her oh-so-receptive body. You run out long before the ecstasy subsides. Perhaps you should let your [pc.balls] rest a bit in between orgasms.");
		}
		else if(pc.cumQ() < 25) 
		{
			output("Spurts of [pc.cum] splatter into her waiting body with explosive eagerness, your [pc.hips] twitching a little further forward with each successive ejaculation.");
		}
		else if(pc.cumQ() < 250)
		{
			output("Thick blobs of [pc.cumNoun] explode out of you one after another, bathing Shekka’s interior");
			if(y >= 0) output("s");
			output(" in a thick coat of your [pc.cumColor] love. You hold position, feeling some of it slop back out around your [pc.cock " + x + "], ");
			if(pc.balls == 0) output("running down your [pc.leg].");
			else output("clinging to your [pc.sack] to make it shine with sex.");
		}
		else if(pc.cumQ() < 4000)
		{
			output("Massive blobs of [pc.cum] pour out of you, so voluminous that each barely has time to finish before the next ejaculation is erupting like a volcano. Poor Shekka’s body is absolutely filled with your [pc.cumColor] seed.");
			if(y >= 0) output(" Her belly even rounds from the combined injections.");
		}
		else
		{
			output("Gigantic blasts of [pc.cum] force their way into Shekka’s eager tunnel");
			if(y >= 0) output("s");
			output(" packing ");
			if(y >= 0) output("them ");
			else output("it ");
			output(" full with the first few injections. The next ones, heavy as they are, swell her [shekka.belly] with added weight, giving her a positively pregnant appearance. Waves of excess, hot-pumping [pc.cumNoun] vent out over your [pc.cocks] as you continue to ejaculate, sluicing down your ");
			if(pc.balls > 0) output("[pc.balls]");
			else output("[pc.leg]");
			output(".");
			if(pc.hasCockFlag(GLOBAL.FLAG_FLARED)) output(" Your flared tip makes sure a fair portion of it shoots directly against her cervix.");
		}
		output("\n\nYou go limp, your ardor spent and your softening length");
		if(y >= 0) output("s");
		output(" slipping halfway out of her. You take the moment to appreciate the shapeliness of her shoulder blades and the natural scent of her feathery hair air.");
		if(pc.cumQ() >= 4000) output(" Although her body is weighed down by the sheer quantity of your [pc.cum], h");
		else output("H");
		output("er balls tighten up against her dick, a whole lot lighter than they were before your tryst.");
	}
	//Merge
	output("\n\nAfter a while of holding her like this, she comes down from her own plateau and cranes her head around to look at you, smiling. It isn’t a mere sated smile either - the kind that telegraphs just how well fucked she’s been. No. It’s a gloating, knowing smile. Although her fingers tremble in nerveless aftershocks, she licks her fingers clean of cream and neatly stacks a series of cleaned tubes that belong to your ship’s engine.");
	output("\n\nShekka gently pushes you back with her feet, letting your soaked [pc.cocks] fall away. She pulls herself up onto her workbench, rubbing her belly, a slightly vacant look in her eyes. <i>“I think we both won that little competition.”</i>");
	output("\n\n<i>“Oh?”</i> you say while wiping up.");
	output("\n\nShekka nods, giggling, her hand still on her belly. <i>“Fuck yes. I prefer my work to be on the fixing side compared to the cleaning, but cumming with an armload of sweet techy goodbits? That was nirvana. I’ll make sure to keep the chores stocked up in preparation for the next visit, and we can do this every time.”</i> Her cock pulses in agreement, shining with her own juices and your mixed cums.");
	output("\n\nYou shrug, unable to hide the grin on your face. Your [pc.cum] is pooling between her legs on her bench, and she hasn’t noticed. <i>“Sure thing, babe.”</i>");
	output("\n\nShekka doesn’t even bother cleaning herself up. She just starts tugging on her jumpsuit, making sure it’s tight enough against her swollen crotch to hold in every drop. There is a moment of effort on her part to tuck her equine endowment back against her thigh where it belongs.");
	output("\n\nJudging by the audible squish her suit makes as it presses fully home against her nethers, you can only assume it caught a fair amount of liquid action itself. ");
	if(pc.cumQ() >= 4000) output("It does an impressive job of stretching to accommodate her obscenely cum-gravid gut. ");
	output("She doesn’t comment on it, instead mentioning something about showering after reinstalling the pipes, but you think she might just like the feel of her pussy swimming in it.");
	processTime(30);
	fuckedShekka();
	shekka.loadInCunt(pc,0);
	if(y >= 0) shekka.loadInAss(pc);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Trib Vibrator Tail
public function tribCrewVibeyVibe():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo & SKoW");
	var x:int = rand(pc.totalVaginas());
	output("<i>“Let’s have a little bit of girlish fun, just you and me,”</i> you offer, trailing a finger down your midriff pointedly.");
	output("\n\nShekka grins wickedly, and her tail gently swats your [pc.butt]. Although you’ve proven your sexual proficiency before, she still delights in challenging you. <i>“We’ll just have to see if you can keep up with me.”</i>");
	output("\n\nYou ");
	if(pc.tallness >= 72) output("drop low to ");
	output("grab her around the waist, pulling her up into a surprise kiss - payback for the touch of her teasing tail. Her lips are soft against your own, compressed down by the force of the kiss, but her long, sinuous tongue winds into your own mouth, its pernicious wiggling inciting your [pc.tongue] into a dance.");

	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nThe chemical load hidden in your saliva hits the small woman like a dumptruck of fuck-hungry hormones. She squirms against you, pupils turning to dinner plates as her brain goes into overdrive. Her salivation redoubles, and her fingers dig into your [pc.chest] as she’s taken on a wild ride.");
	//Else
	else output("\n\nYou grab her by the back of the neck, the pink feathers of her hair soft between your fingers, and press her closer, tighter, her budding breasts against your [pc.chest].");
	//Merge
	output("\n\nHer breathing comes in short gasps between your entwined lips as she whimpers into your touch, but eventually her fingers get to work");
	if(!pc.isCrotchExposed()) output(", moving amidst your [pc.crotchCovers], exposing your [pc.skinFurScales] with deft contortions of her fingers");
	else output(", moving over your [pc.skinFurScales]");
	output(", crawling over your body to your [pc.nipples]. They gently tweak them while her tongue curls around your own, filling your mouth with inch after inch of the pliable organ.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your own flexible [pc.tongue] returns the efforts, turning your oral play to a helix of muscle.");
	output("\n\nThe two of you stagger around as Shekka’s hands grasp and squeeze at your [pc.ears], until ");
	output("your [pc.legOrLegs] ");
	if(pc.legCount == 1) output("is");
	else output("are");
	output(" unsteadily wobbling as you try to focus on twisting tongues and the slim fingers prodding at your");
	if(!pc.isCrotchExposed()) output(" increasingly nude");
	output(" form.");

	output("\n\nThe raskvel rides you like a bucking bronco, taking you to the ground once your excitement overwhelms your motor control. She breaks the kiss at last with a satisfied sigh. Her lips are glossy with shared saliva, and her meager chest is heaving with panting breaths. ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("After ingesting so much of your aphrodisiac saliva, her jumpsuit audibly squishes when she squirms ontop of you. ");
	output("Shekka grins and raises a finger to the neckline of her jumpsuit. <i>“Just a little bit of girlish fun.”</i> The suit parts, a line opening up down the center of her chest. She ");
	if(pc.biggestTitSize() < 1) output("greedily caresses your own, letting her fingernail dig in just a little.");
	else output("greedily gropes your tits, squeezing and caressing the orbs impulsively.");
	output(" <i>“Just a little bit.”</i>");

	output("\n\nThe slowly opening divide in the alabaster fabric widens with torturous slowness, but it affords you a detailed view of Shekka’s reddish scales and well-formed breasts. You grab hold of it on both sides and tug. It gives as if there was never anything holding it at all, allowing you to to yank it down to her flared hips in an instant. The raskvel’s puffy nipples pebble in your ship’s atmosphere and you let go of her suit to brush one with your thumb, eliciting a gasp of delight from the tiny alien.");

	output("\n\nShekka giggles and squirms, but she lifts her shapely bottom up off of you to to aid you in disrobing her. You tug it down her legs to her knees before giving up on the current positioning and rolling, pinning her underneath you so that you pull the offending garment entirely away. You toss it over your shoulder, and it lands in a shimmery heap, it’s owner naked and vulnerable below. You echo, <i>“A little fun,”</i> now that you’re above her, your [pc.vaginas] close enough to hers to kiss, the glittering wetness of your anticipation hanging from a [pc.clit] like a drop of dew.");
	output("\n\nHer tail curls up between your bodies to bar her violet entrance from sight. She giggles playfully, then bucks her hips upward, slamming the slightly-ridged texture of her tail into [pc.oneVagina]. You gasp in surprise and pleasure. The sudden press of her warm body against your entrance is at once tantalizing and mildly painful - more the former than the latter. Then, with a knowing grin, Shekka closes her eyes, an expression of pleased focus on her features.");
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined)
	{
		output("\n\nYou remember the vibrator in her tail a second before it activates, but nothing could prepare you for how good her scales feel buzzing against your puffy, aroused entrance.");
	}
	//Not before
	else output("\n\nYou look on in confusion, but her tail answers your unspoken question with a powerful, throbbing buzz, vibrating wildly against your puffy, aroused entrance. It obviously has some kind of implant that lets it shake so... so... well.");
	output("\n\nA high pitched whimper slips from your lips while your [pc.hips] react to the pleasure with an instinctive, powerful thrust, pinning the ");
	if(pc.tallness >= 55) output("smaller");
	else output("equally small");
	output(" mechanic to the ground with your creaming-wet pussy, wrapping half of her tail with your folds. On the other side, her immensely engorged labia spread until you can feel them kissing around the trembling intruder. Both pussies lock into a sopping-wet embrace around her vibrating tail; you barely seem to be different creatures. Where once there were two aroused beings, there remains only a single, writhing beast of sapphic desire.");
	output("\n\nThe buzz of her tail quiets, drowned in a sea of feminine lubricants, but you are far from idle. Supporting yourself with one hand, you reach for one of Shekka’s breasts, grabbing on for dear life. It’s soft and supple, blushing hotly. You can feel the little Raskvel’s tiny heart hammering in her chest as you squeeze. The eager pushes and prods of her own fingers against your [pc.chest] abate. Instead, her arms close around your neck and pull you into her, kissing you once more. Her nails dig into your back, but your sense of pain is deadened by white hot bar of pleasure assailing your loins.");
	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nShe drinks down another dosage of chemical lust from your mouth, and her eyes roll back. Squirts of pleasure fountain out from around your pressed pussies as she tumbles headlong into an unexpected orgasm.");
	//Else
	else output("\n\nDamn, Shekka’s tongue is long. She could probably loop it around your tonsils if she wanted to, but she seems content to slide it against your mouth’s muscle, curling and squeezing it, sometimes constricting, boa-like around it.");
	//Merge
	output("\n\nYou lose yourself in the tangle of limbs, the ecstasy of one body pressed against another and the constant vibrations torturing your [pc.clit] with pleasure. The room seems to be spinning.... Wait, it is spinning!");
	output("\n\nWith a wicked grin Shekka pins you flat on your back, but it frees you to reach down and grab her ass, to feel her cheeks twitch and her muscles dance when a spasm of uncontrollable sexual energy convulses through her hips. She squirms, moaning into you. Your hands pull her harder against you, increasing the force of the tremors wracking your cunt - and hers. The scaley slut screams into your mouth and finally breaks the kiss, shrieking into your shoulder as she cums");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" yet again");
	output(". Her juices spatter over your [pc.legs] like rain from a typhoon. It’s all you can do to steady her thrashing form from tumbling to the floor while avoiding a cunt-wrenching cum all your own.");

	output("\n\nNervelessly fluttering, Shekka’s fingers telegraph her orgasm directly into your [pc.chestNoun], catching on your [pc.nipples] and pressing into the soft, nerve-packed tips. You close your eyes and grit your teeth, holding yourself back from the edge by sheer force of will. The petite beauty above twists and wiggles through euphoric spasms, secure in your arms, juicing twat still pressed to yours around the intrusive wiggling of her tail. You press your lips to hers in a tender kiss, and she slowly stills, only occasionally trembling through aftershocks.");
	output("\n\nStill holding tight to her, you feel the heated waves of ecstasy fluttering in your nethers, as irresistible as the ocean tides. The cunt-clenching tsunami crashes over your crumbling wall of willpower, bathing everything in tidepools of pleasure. Your eyes roll back a second before Shekka’s clear.");
	output("\n\nDredging through her own orgasmically-blown mind, the crafty girl acts as soon as she realizes what’s going on. Her tail, once a passive participant for you to grind against, slithers into your [pc.vagina " + x + "], still vibrating. Your convulsing, bliss-filled walls clamp onto it. You can feel the vibrations carry through your pliant, clinging flesh all the way to your [pc.clits].");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], pinned between the two of you, spurt");
		if(pc.cockTotal() == 1) output("s");
		output(" your [pc.cum] between your slick, squirming forms, simultaneously forgotten and yet adding another layer of bliss to your overpowering release.");
	}
	//Cuntchange
	pc.cuntChange(x,5,true,true,false);
	output("\n\nYou twist on the floor, the raskvel riding you, pumping you wildly. The air fills with the high-pitched sounds of your passion and the scent of your mixed secretions almost seems to steam the air around your sweaty, entwined bodies. Shekka pulls partway out to hold her tip against");
	if(pc.hasClit()) output(" [pc.oneClit]");
	else output(" your lips");
	output(", and the vibrating length drives your consciousness away in an explosion of ecstasy.");
	processTime(40+rand(10));
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	clearMenu();
	addButton(0,"Next",shekkaGrindsFinish);
}


public function shekkaCrewGrindsFinish():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo & SKoW");
	output("You come to feeling wet and sticky all over, a small form perched atop you. Its brilliant, exuberant eyes blink at you, and your groggy mind identifies it as Shekka. She giggles, kissing you on the lips once more before standing up and offering a hand");
	if(pc.tallness >= 60) output(", a gesture that’s almost comical given the size difference");
	output(".");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" She sways slightly, hips wiggling and ready to pounce from the sample of your sinfully sensuous saliva.");

	output("\n\n<i>“Wow,”</i> you pant, still a little stunned.");

	//Never had vibrations before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] == undefined)
	{
		flags["TIMES_TAILVIBED_WITH_SHEKKA"] = 0;
		output("\n\nShekka beams. <i>“Subdermal vibrator implant.”</i>");
		output("\n\nThere’s no hiding your surprise.");
		output("\n\n<i>“What? You don’t have those back home?”</i>");
		output("\n\n<i>“No,”</i> you answer. At least, you’re pretty sure you don’t. You haven’t seen one before, anyway.");
		output("\n\nShe waggles her wiggly little appendage. <i>“Well, it’s nice, isn’t it?”</i>");
		output("\n\nIt is indeed.");
	}
	//Had 'em before
	else
	{
		output("\n\nShekka smirks as you get up on");
		if(pc.legCount == 1) output(" your");
		output(" wobbly [pc.legOrLegs]. <i>“It was only a little fun....”</i>");
		output("\n\nYou roll your eyes. <i>“It’s a good thing you’re not any bigger then! I’m not sure I could handle any more of you vibrating like that.”</i>");
	}
	output("\n\nShe snorts in amusement, scooping a mixture of your sexual juices from your [pc.tummy] before noisily slurping it up. Gathering your things, you and the little raskvel make yourselves as decent as you can, though the scent of your recent lovemaking is a practical fog in the suddenly far-too-stuffy engine room.");
	if(celiseIsCrew()) output(" Maybe you’ll have Celise do a quick roll-through here. It’s more than likely Shekka could use a dip in your gooey fuck-friend too.");
	output("\n\n<i>“Fuck... well, okay [pc.name] I’m going to wrap up a few things here, and strongly consider a nap.”</i>");
	//Pass 70-80 minutes
	//Orgasm + shekka orgasm
	flags["TIMES_TAILVIBED_WITH_SHEKKA"]++;
	fuckedShekka();
	//Pass 70-80 minutes
	processTime(30+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Trib Vibrator Tail Futa
public function shekkaCrewFutaTailTrib():void
{
	clearOutput();
	showShekka(true);
	var x:int = rand(pc.totalVaginas());
	output("<i>“Let’s have a little bit of girlish fun, just you and me,”</i> you offer, trailing a finger down your midriff pointedly.");
	output("\n\nShekka grins wickedly, and her tail gently swats your [pc.butt]. Although you’ve proven your sexual proficiency before, she still delights in challenging you. <i>“And leave this big boy out? A shame, but we’ll just have to see if you can keep up with me.”</i> She pointedly grasps the bulge straining against her thigh.");
	output("\n\nYou ");
	if(pc.tallness >= 72) output("drop low to ");
	output("grab her around the waist, pulling her up into a surprise kiss - payback for the touch of her teasing tail. Her lips are soft against your own, compressed down by the force of the kiss, but her long, sinuous tongue winds into your own mouth, its pernicious wiggling inciting your [pc.tongue] into a dance. The sheer fabric of her suit does nothing to hide the sultry heat of her futa-prick digging into your [pc.tummy], but the little Raskvel unabashedly grinds herself against you.");

	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("\n\nThe chemical load hidden in your saliva hits the small woman like a dumptruck of fuck-hungry hormones. She squirms against you, pupils turning to dinner plates as her brain goes into overdrive. Her salivation redoubles, and her fingers dig into your [pc.chest] as she’s taken on a wild ride.");
	//Else
	else output("\n\nYou grab her by the back of the neck, the pink feathers of her hair soft between your fingers, and press her closer, tighter, her budding breasts against your [pc.chest].");

	//Merge
	output("\n\nHer breathing comes in short gasps between your entwined lips as she whimpers into your touch, but eventually her fingers get to work");
	if(!pc.isCrotchExposed()) output(", moving amidst your [pc.crotchCovers], separating it from your [pc.skinFurScales] with deft contortions of her fingers");
	else output(", moving over your [pc.skinFurScales]");
	output(", crawling over your body to your [pc.nipples]. They gently tweak them while her tongue curls around your own, filling your mouth with inch after inch of the pliable organ.");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(" Your own flexible [pc.tongue] returns the efforts, turning your oral play to a helix of muscle.");
	output("\n\nThe two of you stagger around as Shekka’s hands grasp and squeeze at your [pc.ears], until your [pc.legOrLegs] ");
	if(pc.legCount > 1) output("are");
	else output("is");
	output(" unsteadily wobbling as you try to focus on twisting tongues and the slim fingers prodding at your");
	if(!pc.isCrotchExposed()) output(" increasingly nude");
	output(" form.");

	output("\n\nThe raskvel rides you like a bucking bronco, taking you to the ground once your excitement overwhelms your motor control. She breaks the kiss at last with a satisfied sigh. Her lips are glossy with shared saliva, and her meager chest is heaving with panting breaths. ");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("After ingesting so much of your aphrodisiac saliva, her jumpsuit audibly squishes when she squirms ontop of you. ");
	output("Shekka grins and raises a finger to the neckline of her jumpsuit. <i>“Just a little bit of girlish fun.”</i> The suit parts, a line opening up down the center of her chest. She ");
	if(pc.biggestTitSize() < 1) output("greedily caresses your own, letting her fingernail dig in just a little.");
	else output("greedily gropes your tits, squeezing and caressing the orbs impulsively.");
	output(" <i>“Just a little bit.”</i>");

	output("\n\nThe slowly opening divide in the alabaster fabric widens with torturous slowness, but it affords you a detailed view of Shekka’s reddish scales and well-formed breasts. You grab hold of it on both sides and tug. It gives as if there was never anything holding it at all, allowing you to to yank it down to her flared hips in an instant. The raskvel’s puffy nipples pebble in your ship’s atmosphere and you let go of her suit to brush one with your thumb, eliciting a gasp of delight from the tiny alien.");

	output("\n\nShekka giggles and squirms, but she lifts her shapely bottom up off of you to to aid you in disrobing her. You tug it down her legs to her knees, allowing her cock free to slap down onto your [pc.tummy]. <i>“Girlish fun,”</i> you retort before giving up on the current positioning and rolling, pinning her underneath you so that you pull the offending garment entirely away. You toss it over your shoulder, and it lands in a shimmery heap, it’s owner naked and vulnerable below. You echo, <i>“Just a little,”</i> now that you’re above her, your [pc.vaginas] close enough to hers to kiss, the glittering wetness of your anticipation hanging from a [pc.clit] like a drop of dew.");

	output("\n\nHer tail curls up between your bodies to bar her violet entrance from sight. She giggles playfully, then bucks her hips upward, slamming the slightly-ridged texture of her tail into [pc.oneVagina]. You gasp in surprise and pleasure. The sudden press of her warm body against your entrance is at once tantalizing and mildly painful - more the former than the latter. Then, with a knowing grin, Shekka closes her eyes, an expression of pleased focus on her features.");
	//Happened before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] != undefined)
	{
		output("\n\nYou remember the vibrator in her tail a second before it activates, but nothing could prepare you for how good her scales feel buzzing against your puffy, aroused entrance.");
	}
	//Not before
	else output("\n\nYou look on in confusion, but her tail answers your unspoken question with a powerful, throbbing buzz, vibrating wildly against your puffy, aroused entrance. It obviously has some kind of implant that lets it shake so... so... well.");
	output(" Shekka shudders on top of you, oozing pre freely onto your stomach");
	if(pc.biggestTitSize() >= 2) output(" to pool between the underside of your tits");
	if(pc.hasCock()) output(" before mashing against your own [pc.cock]");
	output(".");

	output("\n\nA high pitched whimper slips from your lips while your [pc.hips] react to the pleasure with an instinctive, powerful thrust, pinning the ");
	if(pc.tallness >= 55) output("smaller");
	else output("equally small");
	output(" mechanic to the ground with your creaming-wet pussy, wrapping half of her tail with your folds. On the other side, her immensely engorged labia spread until you can feel them kissing around the trembling intruder. Both pussies lock into a sopping-wet embrace around her vibrating tail; you barely seem to be different creatures.");
	output("\n\nWhere once there were two aroused beings, there remains only a single, writhing beast of sapphic desire");
	if(!pc.hasCock()) output(" adorned with a fountaining cock.");
	else output("adorned with fountaining pricks.");

	output("\n\nThe buzz of her tail quiets, drowned in a sea of feminine lubricants, but you are far from idle. Supporting yourself with one hand, you reach down and take a hold of Shekka’s equine member, wrapping your fingers around her shaft to knead at its mottled flesh. The soft spongy exterior feels deathly hot to your [pc.hand], and immediately coats your digits in musky liquid.");

	output("\n\nYou can actually feel every single one of her hammering staccato heartbeats pulsing through it as you double her pleasure. The eager pushes and prods of her own fingers against your [pc.chest] abate. Instead, her arms close around your neck and pull you into her, kissing you once more. Her nails dig into your back, but your sense of pain is deadened by white hot bar of pleasure assailing your loins.");

	//Aphrodisiac
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) 
	{
		output("\n\nShe drinks down another dosage of chemical lust from your mouth, and her eyes roll back. Squirts of pleasure fountain out from around your pressed pussies and thick gouts of cum splash into ");
		if(pc.biggestTitSize() >= 5) output("your massive breasts");
		else if(!pc.hasMuzzle()) output("your chin");
		else output("the underside of your muzzle");
		output(" as she tumbles headlong into an unexpected orgasm.");
	}
	//Else
	else output("\n\nDamn, Shekka’s tongue is long. She could probably loop it around your tonsils if she wanted to, but she seems content to slide it against your mouth’s muscle, curling and squeezing it, sometimes constricting, boa-like around it.");

	//Merge
	output("\n\nYou lose yourself in the tangle of limbs, the ecstasy of one body pressed against another and the constant vibrations torturing your [pc.clit] with pleasure. The room seems to be spinning.... Wait, it is spinning!");

	output("\n\nWith a wicked grin Shekka pins you flat on your back, but it frees your free hand to reach around and grab her ass, to feel her cheeks twitch and her muscles dance when a spasm of uncontrollable sexual energy convulses through her hips. She squirms, moaning into you. Your hands pull her harder against you, increasing the force of the tremors wracking your cunt - and hers. The scaley slut screams into your mouth and finally breaks the kiss, shrieking into your shoulder as she cums");
	if(pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(" yet again");
	output(". Her juices spatter over your [pc.legOrLegs] like rain from a typhoon, and rich ivory paints your upper-half. It’s all you can do to steady her thrashing form from tumbling to the floor while avoiding a cunt-wrenching cum all your own.");

	output("\n\nNervelessly fluttering, Shekka’s fingers telegraph her orgasm directly into your [pc.chest], catching on your [pc.nipples] and pressing into the soft, nerve-packed tips. You close your eyes and grit your teeth, holding yourself back from the edge by sheer force of will. The petite beauty above twists and wiggles through euphoric spasms, secure in your arms, juicing twat still pressed to yours around the intrusive wiggling of her tail. You press your lips to hers in a tender kiss, and she slowly stills, only occasionally trembling through aftershocks.");
	output("\n\nStill holding tight to her, you feel the heated waves of ecstasy fluttering in your nethers, as irresistible as the ocean tides. The cunt-clenching tsunami crashes over your crumbling wall of willpower, bathing everything in tidepools of pleasure. Your eyes roll back a second before Shekka’s clear, her knob still oozing watery aftershocks.");

	output("\n\nDredging through her own orgasmically-blown mind, the crafty girl acts as soon as she realizes what’s going on. Her tail, once a passive participant for you to grind against, slithers into your [pc.vagina " + x + "], still vibrating. Your convulsing, bliss-filled walls clamp onto it. You can feel the vibrations carry through your pliant, clinging flesh all the way to your [pc.clits].");
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks], pinned between the two of you, spurt");
		if(pc.cockTotal() == 1) output("s");
		output(" your [pc.cum] between your slick, squirming forms, simultaneously forgotten and yet adding another layer of bliss to your overpowering release. It mixes on your body in a lurid puddle of sexual heat");
		if(pc.hasFur()) output(", making an utter mess of your [pc.skinFurScales]");
		output(".");
	}
	//Cuntchange
	pc.cuntChange(x,5,true,true,false);
	output("\n\nYou twist on the floor, the raskvel riding you, pumping you wildly while her dick slaps down against you loudly. The air fills with the high-pitched sounds of your passion and the scent of your mixed secretions almost seems to steam the air around your sweaty, entwined bodies. Shekka pulls partway out to hold her tip against [pc.oneClit], and the vibrating length drives your consciousness away in an explosion of ecstasy.");
	processTime(40+rand(10));
	pc.orgasm();
	chars["SHEKKA"].orgasm();
	clearMenu();
	addButton(0,"Next",shekkaCrewFutaGrindsFinish);
}

public function shekkaCrewFutaGrindsFinish():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo & SKoW");
	output("You come to feeling wet and sticky all over, a small form perched atop you. Its brilliant, exuberant eyes blink at you, and your groggy mind identifies it as Shekka. She giggles, kissing you on the lips once more before standing up and offering a hand");
	if(pc.tallness >= 60) output(", a gesture that’s almost comical given the size difference");
	output(".");

	output("\n\n<i>“Wow,”</i> you pant, still a little stunned.");
	//Never had vibrations before
	if(flags["TIMES_TAILVIBED_WITH_SHEKKA"] == undefined)
	{
		flags["TIMES_TAILVIBED_WITH_SHEKKA"] = 0;
		output("\n\nShekka beams. <i>“Subdermal vibrator implant.”</i>");
		output("\n\nThere’s no hiding your surprise.");
		output("\n\n<i>“What? You don’t have those back home?”</i>");
		output("\n\n<i>“No,”</i> you answer. At least, you’re pretty sure you don’t. You haven’t seen one before, anyway.");
		output("\n\nShe waggles her wiggly little appendage. <i>“Well, it’s nice, isn’t it?”</i>");
		output("\n\nIt is indeed.");
	}
	//Had 'em before
	else
	{
		output("\n\nShekka smirks as you get up on");
		if(pc.legCount == 1) output(" your");
		output(" wobbly [pc.legOrLegs]. <i>“It was only a little fun....”</i>");
		output("\n\nYou roll your eyes. <i>“It’s a good thing you’re not any bigger then! I’m not sure I could handle any more of you vibrating like that.”</i>");
	}
	output("\n\nShe snorts in amusement, scooping a mixture of your sexual juices from your [pc.tummy] before noisily slurping it up. Gathering your equipment, you and the little raskvel make yourselves as decent as you can, though the scent of your recent lovemaking is a practical fog in the suddenly far-too-stuffy engine room.");
	if(celiseIsCrew()) output(" Maybe you’ll have Celise do a quick roll-through here. It’s more than likely Shekka could use a dip in your gooey fuck-friend too.");
	output("\n\n<i>“Fuck... well, okay [pc.name] I’m going to wrap up a few things here, and strongly consider a nap.”</i>");
	//Pass 70-80 minutes
	//Orgasm + shekka orgasm
	flags["TIMES_TAILVIBED_WITH_SHEKKA"]++;
	fuckedShekka();
	//Pass 70-80 minutes
	processTime(30+rand(5));
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Shekka & Anno Nerd-Off Event
//Doing this or having Anno and Shekka share a bed at the same time with you will unlock their threesome stuff!
//Has a random chance of occurring on the ship if Shekka and Anno are on it.
public function shekkaAndAnnoNerdOff():void
{
	clearOutput();
	showName("AN\nARGUMENT!");
	showBust(annoBustDisplay(),shekkaBustDisplay());
	author("SomeKindofWizard");
	output("You’re on a wander through your ship when a little shouting can be heard coming from your room. <i>“You’re obviously wrong! They’re nothing alike!”</i> shouts Anno, arms folded beneath her cushiony chest");
	if(anno.armor is AnnosCatsuit) output(" straining it against her jumpsuit");
	else output(" nearly spilling them out of her blouse");
	output(". Shekka–perched on the edge of your bed and looking frustrated–waves around a dildo in accusation.");

	output("\n\n<i>“Listen, a pulse engine and a vibration unit are effectively identical! All you have to do is crank up the hertz of a pulser and you’ve got yourself a vibrator!”</i> Shekka scoffs, tossing it at the squishy Ausar.");

	output("\n\nAnno catches the dildo out of the air, wagging it like a baton. <i>“There is a set difference between pulse and vibrate that goes beyond hertz! The level of sustain on each vibration is longer. Just speeding up a pulse gives you a lazy vibe that isn’t going to really rock your clit... well, clits, respectively.”</i>");
	output("\n\nYou cough and clear your throat, and they both leap out of their hides. <i>“Ah! Uh, [pc.name],”</i> Anno begins, blushing and tucking the toy behind her back <i>“We were just–”</i>");
	output("\n\n<i>“Arguing about sex toys?”</i> you answer, fighting down a grin and trying to keep your expression stern.");
	output("\n\nShekka hops off of your bed, irritated. <i>“It’s not </i>just<i> sex toys, [pc.name] it’s engineering! It’s science! It’s–”</i>");
	output("\n\n<i>“Everything!”</i> Anno finishes, just as enthused at the subject matter. <i>“From electronics to mathematics, we’ve been at each other’s throats all day!”</i> she sighs, flipping the dildo in her hands at you. When you catch it, it begins to buzz away in your grasp with lewd insistence. <i>“I’m not sure this is all such a good idea.”</i>");
	output("\n\nYou blink slowly, eyeing the two of them over. <i>“");
	if(pc.isNice()) output("That’s silly, it’s obvious that having someone you can argue with about nerdy stuff is something you enjoy,");
	else if(pc.isMischievous()) output("Uh huh, that’s one-hundred percent true is it?");
	else output("Bullshit, you love having someone to argue with,");
	output("”</i> smugly you flip the toy end-over-end in your [pc.hand]. <i>“For one, your tail’s been wagging the entire time you two have been arguing. And Shekka’s buzzer keeps flicking on.”</i>");
	output("\n\nAnno squints. <i>“Her what?”</i>");
	output("\n\nIt’s the Raskvel’s turn to blush now, and she grumbles, holding her tail aloft; it buzzes loudly in agreement. <i>“I have a vibrator in my tail, shut u–”</i>");
	output("\n\n<i>“Ohmigosh that’s awesome!”</i> Anno announces, bouncing up and down in a way that proves exceptionally distracting. <i>“Did you use vibrating motors, or puls–yip!”</i> You quiet her with an ear-pinch, smirking when she tries to turn the sad-puppy eyes on. <i>“Fiiine...”</i>");
	output("\n\n<i>“What’s the actual problem here? Shekka you obviously like Anno, really.”</i>");
	output("\n\nShekka sighs, flopping right back onto your bed again. <i>“Anno’s such an ass though! She thinks all Raskvel are stupid idiots who should have blown up the planet by now!”</i>");
	output("\n\n<i>“I... may have said that, yes. And honestly it feels somewhat warranted. Some people leave their ships untended to and before you know it the whole thing’s been scrapped and a freaking warp core’s just been left out in the open bleeding radiation.”</i>");
	output("\n\n<i>“That happened one time! And more importantly, my people will do better for themselves. I gave up everything I had into that, and [pc.name] put in so much money. It hurts to think that Raskvel are always going to be thought of as scrap-addicted fuck-bunnies.”</i>");
	output("\n\nThere’s an edge of real pain to the red Rask’s voice, and Anno blinks a few times before looking somewhat shamefaced. <i>“I... uh... oh.”</i> She manages tactfully, twiddling her fingers before looking to you. <i>“Can we uh, get a minute?”</i>");
	//Next: Ten minutes pass, selecting either Shekka or Anno in the talk menu will grant this follow-up.
	output("\n\nYou step away for now. Maybe they’ll work things out on their own?");
	processTime(10);
	flags["SHEKKA_ANNO_NERDOFF"] = -1;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
	//cue up next proc :3
}

public function shekkaAnnoFightFollowup():void
{
	clearOutput();
	showName("GETTING\nALONG?");
	showBust(annoBustDisplay(),shekkaBustDisplay());
	author("SomeKindofWizard");
	output("When you hunt both of the girls out again, they’re both sat on your bed, scrolling through a datapad. <i>“A step up from arguing, what are you both looking at?”</i> you begin, rubbing your chin.");
	output("\n\nAnno looks up, tail wagging idly as she gives you a bright smile. <i>“Porn!”</i>");
	output("\n\n<i>“...Of course.”</i>");
	output("\n\n<i>“No, but really,”</i> Shekka adds <i>“It’s one of Anno’s old colleagues doing something fucking wild with sex-toy construction. We... may or may not have restarted the pulse-versus-vibes argument. But we’ve stopped snapping at each other.”</i>");
	output("\n\nThey do seem to be sitting an awful lot closer, and the faint scent of a horny pup wafts to your [pc.nose]. An opportunity perhaps...");
	output("\n\n<b>If you were willing to have them test their vibrating devices on you, maybe they’ll get along a little better. Would you like to try?</b>");
	//Next, 10 minutes pass.
	processTime(5);
	clearMenu();
	addButton(0,"Competition",shekkaAnnoVibeOffpre);
	addButton(1,"Nope",nopeOutofShekkaAnnoVibeOff);
}

public function nopeOutofShekkaAnnoVibeOff():void
{
	clearOutput();
	showName("\nNOPE!");
	showBust(annoBustDisplay(),shekkaBustDisplay());
	output("Nope! You don’t want any mechanical toys stuffed inside you. <i>“I’d love to help you ladies with this, but I’ve got an urgent matter to attend to!”</i>");
	output("\n\nYou can feel their eyes staring daggers into your back as you walk around the corner.");
	output("\n\n<b>If you’d like to volunteer in the future, suggest it to Shekka from her sex menu.</b>");
	flags["SHEKKA_ANNO_NERDOFF"] = 0;
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

public function shekkaAnnoVibeOffpre(repeat:Boolean = false):void
{
	clearOutput();
	showName("GETTING\nALONG?");
	showBust(annoBustDisplay(),shekkaBustDisplay());
	author("SomeKindofWizard");
	//repeat intro work to summon Anno
	if(repeat)
	{
		output("Begging Shekka’s forgiveness, you run off to grab Anno real quick. You’ll need both of them for this. It doesn’t take much convincing to get your white-haired ausar-pup to follow you for a bit of fun.\n\n");
	}
	output("<i>“What about a competition?”</i> you posit. <i>“Both of you build something fun, and I’ll be your proud, unbiased tester.”</i>");
	output("\n\nThe girls blink and share a look, before turning wicked smiles on you. <i>“Oh fuck you’re so on.”</i> Shekka says, hopping off of the bed and making for the back of the ship (and her impromptu workbench).");
	output("\n\nAnno seems to agree, diving into the cupboards to pull out a bunch of her old Steeletech shit. <i>“You sit right there [pc.name]! I’ll whip up something that’ll rock your ");
	if(pc.hasCock()) output("cock off");
	else output("cunt into the stratosphere");
	output("!”</i>");
	processTime(10);
	clearMenu();
	addButton(0,"Next",shekkaAnnoVibeOff);
}

public function shekkaAnnoVibeOff():void
{
	clearOutput();
	showBust(annoBustDisplay(true),shekkaBustDisplay(true));
	author("SomeKindofWizard");
	showName("DOUBLE\nFUN");
	output("Ten minutes pass in peace, laid out across your bed observing Anno as she tightens in some little bolts and seals some wires up. Sadly she told you not to watch the actual important parts of construction; supposedly that would ruin the surprise. Once the snowy-fluffed pup seems to be finished, she fills the whole thing with a tube of clear something-or-other, and screws it tight. With a smug smile, ");
	if(anno.armor is AnnosCatsuit) 
	{
		output("she unzips her jumpsuit, peeling it down with painful slowness until her breasts are able to bounce free from their confines. Her nipples grow hard as she slides the toy into her cleavage, squeezing those wonderful tits together. <i>“Gotta make sure the resin is nice and warm. Always waterproof the absolute heck out of sex toys.”</i>");
	}
	else
	{
		output("she peels out of her clothes until her breasts are able to bounce free and unrestrained. Her nipples grow hard as she slides the toy into her cleavage, squeezing those wonderful tits together. <i>“Gotta make sure the resin is nice and warm. Always waterproof the absolute heck out of sex toys.”</i>");
	}
	output("\n\nShekka saunters in proudly, with a dick-shaped bulge ");
	if(shekka.hasCock()) output("pressed against her thigh");
	else output("now featured pressed against <i>both</i> thighs");
	output(". <i>“You have that much sense to you. Ready to lose?”</i>");

	output("\n\nAnno smiles coquettishly, tail swishing about her person like a parting veil. <i>“I think we need to unwrap our lovely Captain before we get to the gifting first.”</i>");

	output("\n\nThey spring on you together; a wall of fluff and scale and accommodating curves that pushes you down into the mattress. With a series of giddy wiggles and wicked smirks, they divest you of your things and toss them into a pile. The moment their eager fingers make contact with your naked [pc.skinNoun] it sends a thrill through your body, turning your [pc.nipples] into diamond-hard points.");

	//Player Futa
	if(pc.isHerm())
	{
		output("\n\nYour [pc.cocks] soon join");
		if(pc.cockTotal() == 1) output("s");
		output(" in on the fun, growing hard under a particularly loving caress from soft-fluffed digits. At the same time, Shekka’s dextrous little fingers sneak further down, even while her lips latch onto your nipple and start to suck");
		if(pc.canLactate() && pc.isLactating()) output(", receiving a healthy dose of [pc.milk] along with your pleasured moans");
		output(". The horny Raskvel ");
		if(pc.balls > 0) output("slips her hand beneath your [pc.balls] with a hungry purr as she ");
		output("runs her fingers along your [pc.pussy]");
		if(pc.balls == 0) output(" with a hungry little purr");
		output(". <i>“There’s always so much of you to please!”</i> Anno announces brightly, giving your member");
		if(pc.cockTotal() > 1) output("s");
		output(" a squeeze.");

		output("\n\nYou agree with an emphatic groan, sprawled out in bliss as you’re tended to by twin lovers. But this isn’t about your partner’s’ natural talents, and you give them a pointed wiggle of your [pc.hips]. Shekka and Anno blink back to reality before eying one-another up. They retreat to the edge of your bed, retrieving their toys.");

		output("\n\nAnno has to literally rummage around in her cleavage to reclaim her own vibrator, but soon she manages. After a few moments of holding it aloft like some kind of legendary sword, she pounces you once more. On the other hand, Shekka’s still fighting to reclaim hers; her skin tight suit puts up an impressive fight. Your Ausar puppyslut smugly nuzzles her way up your [pc.legOrLegs], tail wagging hard enough to set her ass to jiggling. <i>“Looks like I get to go first!”</i> she says, kissing your inner thigh.");

		output("\n\nShe grows so close to your slavering slit she’s nearly kissing it");
		if(pc.balls > 0) 
		{
			if(pc.ballDiameter() < 6) output(", forced to wear your [pc.balls] like a hat");
			else output(", forced to hold your massive testes to the side");
		}
		output(". At the same time your [pc.cock] drools liberal quantities of [pc.cumFlavor] pre onto her head, ");
		if(pc.cumQ() >= 1000) output("in large enough quantities to utterly soak her ears");
		else output("creating a little spunky crown");
		output(". <i>“Fuck you smell so good, [pc.name]... I could just eat you up. Alas,”</i> Anno begins, pressing the head of her toy up against your [pc.cunt]. <i>“This is for you, not me.”</i>");

		output("\n\n");
		if(pc.vaginas[0].looseness() > 2) output("You aren’t a tight [pc.boyGirl] by any stretch of the imagination but she makes sure to run the smooth faux-cock around your inner walls, teasing as much sensitive flesh as she can");
		else output("It’s a good thing their teasing has you wetter than an Ausar bachelorette party, as your vice-like cunt still attempts to slow down the artificial penetration");
		output(". Shekka sighs after losing out on her attempt to go first, instead undressing herself properly. While Anno draws out the pleasurable sensation of grinding her toy around the insides of your pliable pussy, the horny little Rask strips slowly out of her jumpsuit. Her nipples look hard enough to cut glass, and a musical jingle from her ears accompanies the muted purr of a zipper being drawn down. As always, her impossibly wonderful hips hold up the descent of her suit.");
		output("\n\nAnno blinks up at you, noticing how your attention has shifted away, before tutting. <i>“Now-now [pc.name], you might want to be ready for this.”</i>");
		output("\n\n<i>“Wh-ohfuck!”</i> you manage to gasp as the fluffy scientist flicks a hidden switch. The toy buried up to its limits in you doesn’t so much vibrate as it does explode. Anno’s knuckle bashes gently into your clit as she drills your twat with authoritative thrusts, and the vibrator sends a constant barrage of shocks throughout your body, rocking you from your pussy-lips to your [pc.womb]. It steals the breath from you, and you clench the mattress hard enough to ");
		if(!pc.hasClawedHands()) output("make your nails sting");
		else output("damage the bedding with your claws");
		output(". Not that this has any impact on Anno; if anything drawing such a wicked reaction out of you has her thrusting even faster, stirring your pussy up until the bedding is drenched in liquid love and your prick");
		if(pc.cockTotal() > 1) output("s are so hard they throb");
		else output("is so hard it throbs");
		output(" painfully.");

		output("\n\nWhilst distracted, a fully-undressed Shekka has climbed back up to you, and her fingers deftly circle your [pc.nipples]. <i>“Hey now, if you cum from just this you won’t be able to manage mine!”</i>");

		output("\n\nYour intelligent reply of <i>“mnf- hrrf- ahn!”</i> doesn’t appear to convince her, and she turns her attention to your lower-half. In particular your aching member");
		if(pc.cockTotal() > 1) output("s");
		output(".");

		output("\n\n<i>“Well, if you’re going to make me wait...”</i> Shekka mumbles, before sitting herself on your [pc.tummy]. Her ass grinds against your ");
		if(pc.tone >= 80) output("washboard abs");
		else if(pc.tone < 20) output("sultry squish");
		else output("[pc.belly]");
		output(", leaving a trail of her own excitement as it sets her front-mounted clit to tingling. Paying attention to this still proves to be a challenge with eight inches of hardcore vibrations hilted in your drenched cunt, but a hot breath against your [pc.cockHead] draws you temporarily back to reality.");
		
		output("\n\n<i>“Hey!”</i> Anno whines as Shekka wraps her lips around your bone, sucking loudly and coiling her sinuous tongue around as much of it as she can. <i>“Whatever, you only make [pc.name]’s day even harder. Are you sure you want to secure my victory?”</i>");

		output("\n\nShekka mumbles something that might be a ‘Fuck you’, but it’s hard to be heard with a mouthful of dick. Your Ausar lover just smiles smugly, rubbing one of Shekka’s expansive ears. Although the red-scaled cutie tries to look annoyed with her, you can feel the way her pussy grows juicier. It requires a force of will with an assault on both ends, you bring your nerveless fingers back under control, gripping the base of Shekka’s tail. Your horny Rask gasps as you stroke it like a prick");
		if(shekka.hasCock()) output(", before reaching around to jerk off her actual horse-cock, earning a handful of salty musk");
		output(".");

		output("\n\nAnno huffs, sliding her buzzing toy out of you in order to lick up your sweet feminine slickness. <i>“I feel like this defeats the point of a scientific test.”</i>");
		output("\n\nIn between gasps for breath you manage to eke out some words. <i>“You’ll just have to do a good job too when it’s Shekka’s turn.”</i> You can tell Anno isn’t truly annoyed, considering the addition of her own particular horny scent mingling in the air, and the way her great fluffy tail hasn’t ceased wagging away cheerfully.");
		output("\n\nStill, she places a hand on Shekka’s forehead, pushing her gently off of your cock. <i>“Your go short-stuff.”</i>");
		output("\n\nWhen Shekka lifts herself off of you, a trail of her own lubricants connects you two in a teasing strand. Before you can reach for it, Anno leans past your crotch and gives Shekka’s muff a slurp. She yelps in shock, nearly slipping back down onto you again. <i>“Fff... keep that up and I’ll pin you down myself, you horn-dog.”</i>");
		output("\n\nAnno only giggles, climbing backwards off of the bed with a lick of her lips. <i>“I’ll just have to get naked too. Hurry up Shekka! Don’t want our adorable Captain to get soft again.”</i>");
		output("\n\nThe Raskvel snorts, flicking the head of ");
		if(pc.cockTotal() > 1) output("one of ");
		output("your cock");
		if(pc.cockTotal() > 1) output("s");
		output(". <i>“Fat chance of that.”</i>");

		output("\n\nIt takes a little readjustment");
		if(pc.hasCock()) output(", especially to get your [pc.cocks] out of the way,");
		output(" but soon Shekka has Anno’s previous position claimed. Anno on the other hand has taken up the duty of undressing.");

		//Steele suit
		if(anno.armor is AnnosCatsuit) output("\n\nEvery stretchy, flesh-hugging inch she tugs down seems to peel away like a second skin, revealing luscious shining curves. Although the suit had been dropped down to her expansive cleavage it catches on her nipples, desperate to keep clung to Anno’s body. Not that you could blame any article of clothing for wanting to remain there.");
		//Clothing
		else output("\n\nEvery bit of fabric she pulls away seems to peel away like wrapping paper on a Christmas present, revealing luscious, shining curves. Although her top catches on her nipples, desperate to hang on to the busty Anno’s body, you can’t blame it. Anyone would want to hang on there.");

		//Merge
		output("\n\nAt the same time, your attention becomes torn between the show and your red-scaled sweetheart, who now holds up her own creation. Compared to Anno’s more standard-shape vibrator, her toy is thicker, covered with little nodules. Despite being mid-striptease Anno’s tail goes up, translating her intrigue <i>“Where’d you get the stuff for that in just ten minutes?”</i>");

		output("\n\n<i>“Pfft, I just made the bumps with glue and rubber and then shrink-sealed it with non-porous composite. It even makes them squishy!”</i> Shekka announces proudly, waving it around. It’s perhaps only six inches, but the girth straight-through has to be three inches or so... It’s a good thing Anno went first; at least you’re prepared now. <i>“This is gonna rock your world, [pc.name].”</i>");

		output("\n\nShekka presses the broad head of her nodule-laden sextoy flush against your dewy pussy-lips, ass up in the air and wiggling from side-to-side while she draws the moment out.");

		output("\n\nPoor Anno is given an eyeful of the scaly girl’s callipygian ass");
		if(shekka.hasCock()) output(",");
		else output(" and");
		output(" soaking cunt");
		if(shekka.hasCock()) output(", and pre-oozing horse-shaft");
		output(". By the time she’s finally finished ");
		if(anno.armor is AnnosCatsuit) output("peeling herself out of her suit");
		else output("slipping out of her pants");
		output(" the unique scent of her horny quim sets your blood to boiling. Surprisingly enough, the little Rask patiently waits, just grinding her vibrator against your twat while Anno assumes the position.");

		output("\n\nThe fluffy scientist pauses to give Shekka’s ass a nice, deep squeeze");
		if(shekka.hasCock()) output(", before reaching down to stroke her cock a few times");
		output(". <i>“Mmmm, I approve,”</i> she says, uncaring of how the red-scaled alien scowls at her. She finally hops up onto the bed, immediately lining her dripping pussy up with your mouth. Thick droplets of her juices fall to your ");
		if(!pc.hasMuzzle()) output("mouth");
		else if(rand(2) == 0) output("muzzle");
		else output("maw");
		output(" with a gentle pitter-patter as the lights seem to go out in an eclipse of Ausar-ass.");

		output("\n\nOnce Anno is properly situated on your face she gives Shekka a thumbs up <i>“Now we get to find out how your stupid pulse batteries shape u-aaahhn~”</i> Her sentence peters out into a slit-wettening, shaft-hardening moan, fingers digging into your abdomen as your ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("sinuous tongue drills into her sopping-wet cunt until it’s practically teasing her cervix");
		else output("talented taster grinds beneath her hood and sets her already-juicy cunt to squirting");
		output(", immediately making a moist mess of your face.");

		output("\n\n<i>“Don’t drown [pc.himHer]!”</i> Shekka grunts, reaching forward to bap Anno on the nose. <i>“At least not yet,”</i> she adds, before her more occupied hand begins its unstoppable trajectory into your waiting cunny. Her toy’s girth drives home into your spreading womanhood; each bump on it grinds against sensitive cunt-flesh and sets clusters of nerves to sparking. Before you get a chance to be completely overwhelmed by a twat-stuffing, the cheekily-grinning Ausar opens wide with a loud <i>’Aaaaah!’</i> before gulping up your cock, ");
		if(pc.cocks[0].cLength() > 14) output("slurping its [pc.cockHead]");
		else if(pc.cocks[0].cLength() > 7) output("hilting herself face-first onto your girthy [pc.cockNoun]");
		else output("practically swallowing the entirety of your modest [pc.cock]");
		output(".");

		output("\n\nWarmth and wetness envelops your prick, but your attempts to gasp are stifled by having a faceful of pup-pussy. Instead you’re left with no choice but to eat her out until nectar dribbles down your chin. Shekka moans, low and deep as the vibrator is pressed into you until her knuckles are pressed up against your [pc.pussy]. Of course, it hasn’t started vibrating yet. Blessedly the girl riding your face lifts herself up in order to properly ");
		if(pc.cocks[0].cLength() > 14) output("suck on");
		else if(pc.cocks[0].cLength() > 7) output("deepthroat");
		else output("slobber the entirety of");
		output(" your [pc.cock] just in time for Shekka to find the switch on her toy.");

		output("\n\nThe few lungfuls of cum-laden air you manage to gulp down between mouthfuls of Ausar are nearly blown right out of you again as your depths are turned to jelly. Deep, hard waves of pleasure strain the already stretchy walls of your [pc.pussy] and it’s only thanks to the twinned weights pressed against you that you can’t thrash yourself free.");
		output("\n\n<i>“Hah! You see that slut-pup? This is how you make a toy!”</i> the shorter Rask proudly announces, artfully twisting her wrist a little to grind the various pulsing bumps against nervelessly-twitching flesh.");
		output("\n\nAnno harrumphs, returning her attention to your [pc.cock], now soaked enough to jerk off at a furious pace. She opens wide, holding her mouth over your twitching [pc.cockHead] and making pleading little whimpers. Her ass quivers above your face, and you decide to finish the poor pup off, smacking both of your hands down on each squeezable cheek. One long, hard lick across her clit, followed by drilling into her juicy cunt with ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("your sinuous [pc.tongue] until it’s pressing down on her cervix");
		else output("your talented [pc.tongue]");
		output(".");

		output("\n\nThe Ausar’s gasp is immediately muffled by a mouthful of your cock, but her eyes roll back in orgasm as she paints your maw with sticky feminine cum. Shekka proudly whoops and despite trying to bend all of your will to holding back your own pending finish, she toy-fucks your twat until you too are brought to your untimely end.");

		output("\n\nCalling the orgasmic cascade simply ‘cumming’ would do a disservice, as your [pc.vaginaNoun] tightens up so much there’s a momentary fear that you’ll crack the brand-new toy before it becomes impossible to think. Your [pc.cocks] join");
		if(pc.cockTotal() == 1) output("s");
		output(" in on the fun, blasting ropes of cum into your faithful canine lover’s mouth.");

		//Small loads
		if(pc.cumQ() < 25) output("\n\nYour reserves are used up quickly however, and Anno gurgles your [pc.cum] noisily before leaning forwards. Shekka’s eyes widen in surprise as their lips meet, before lowering to lusty half-lids as she’s snowballed a heaping helping of your [pc.cumFlavor] spunk.");
		//Average loads
		else if(pc.cumQ() < 250) output("\n\nAlthough plenty of your seed is wasted on Anno’s cheeks, she greedily gurgles your [pc.cum], tail swishing cheerfully. Shekka looks as though she’s about to swipe some off of the fluffy pup-scientist before yelping in alarm. Anno leans in, quickly snatching Shekka’s lips and making a mess of the red-scaled cutie’s face with a smearing of [pc.cumFlavor] spunk before snowballing a gobful of cock-sauce back and forth.");
		//Big ol’ juicy cummy-cums
		else 
		{
			output("\n\n could tell what’s about to follow as your ");
			if(pc.balls == 1) output("heaving ball tenses");
			else if(pc.balls > 1) output("heaving balls tense");
			else output("engorged prostate tenses");
			output(" up, but Anno simply closes her eyes and waits. Your bitch-stuffing cum-cannon unloads, immediately filling the poor girl’s mouth, painting her face, and utterly slathering her bouncy breasts in [pc.cum]. Shekka bursts out laughing, unable to keep herself out of the splash-zone. Nude red scales are liberally glazed in [pc.cumColor]. <i>“Damnit [pc.name], you’ve made a total mess of us bo– mnf!”</i>");
			output("\n\nShe’s caught off-guard by Anno, dragged by fluffy (albeit cum-matted) arms into the squishy-scientist’s embrace. Their tongues entwine, passing your [pc.cum] around.");
		}
		//Merge
		output("\n\nOnce they finally finish toying with your seed, the girls gulp noisily and Anno clambers off of you");
		if(pc.cumQ() >= 250) 
		{
			output(", dripping cum freely");
			if(celiseIsCrew()) output("; you’ll have to get Celise on that");
		}
		output(".");

		output("\n\nShekka is the first to speak up before an awkward silence is allowed to develop <i>“...Soooo, what do you think, [pc.name]? Who makes the better toy?”</i>");
		output("\n\nYou shrug helplessly, propping yourself up on shaky [pc.arms]. <i>“They were both great, in totally different ways. But the company makes it far more exciting.”</i>");
		output("\n\nAnno smiles softly, looking Shekka up-and-down. <i>“It was fun, I’m big enough to admit that. But I’m totally going to win next time.”</i>");
		output("\n\n<i>“You wish, slut-pup.”</i>");
		output("\n\n<i>Oh boy...</i>");
		//Next: 40 minutes pass, back to ship menu.
		processTime(40);
		pc.orgasm();
		if(pc.cumQ() >= 1000) pc.applyCumSoaked();
	}
	//Player Cock/Ass
	else if(pc.hasCock())
	{
		output("\n\nYour [pc.cocks] soon join");
		if(pc.cockTotal() == 1) output("s");
		output(" in on the fun, growing hard under a particularly loving caress from soft-fluffed digits. At the same time, Shekka’s dexterous little fingers sneak further down, even while her lips latch onto your nipple and start to suck");
		if(pc.canLactate() && pc.isLactating()) output(", receiving a healthy dose of [pc.milk] along with your pleasured moans");
		output(". The horny Raskvel ");
		if(pc.balls > 0) output("slips her hand beneath your [pc.balls] with a hungry purr as she ");
		output("presses a teasing fingertip against your eager [pc.butthole]");
		if(pc.balls == 0) output(" with a hungry little purr");
		output(". <i>“There’s always so much of you to please!”</i> Anno announces brightly, giving your member");
		if(pc.cockTotal() > 1) output("s");
		output(" a squeeze.");

		output("\n\nYou agree with an emphatic groan, sprawled out in bliss as you’re tended to by twin lovers. But this isn’t about your partners’ natural talents, and you give them a pointed wiggle of your [pc.hips]. Shekka and Anno blink back to reality before eying one-another up. They retreat to the edge of your bed, retrieving their toys.");

		output("\n\nAnno has to literally rummage around in her cleavage to reclaim her own vibrator, but soon she manages. After a few moments of holding it aloft like some kind of legendary sword she pounces you once more. On the other hand, Shekka’s still fighting to reclaim hers; her skin tight suit puts up an impressive fight. Your Ausar puppyslut smugly nuzzles her way up your [pc.legOrLegs], tail wagging hard enough to set her ass to jiggling. <i>“Looks like I get to go first!”</i> she says, kissing your inner thigh.");

		output("\n\nShe grows so close to your tightening ring she’s nearly kissing it");
		if(pc.balls > 0) 
		{
			if(pc.ballDiameter() < 6) output(", forced to wear your [pc.balls] like a hat");
			else output(", forced to hold your massive testes to the side");
		}
		output(". At the same time your [pc.cock] drools liberal quantities of [pc.cumflavor] pre onto her head, ");
		if(pc.cumQ() >= 1000) output("in large enough quantities to utterly soak her ears");
		else output("creating a little spunky crown");
		output(". <i>“Fuck you look so good, [pc.name]... I could just eat you up. Alas,”</i> Anno begins, pressing the head of her toy up against your [pc.asshole]. <i>“This is for you, not me.”</i>");

		output("\n\n");
		if(pc.ass.looseness() > 2) output("You aren’t a tight [pc.boyGirl] by any stretch of the imagination but she makes sure to stir up your insides with the smooth faux-cock");
		else output("It’s a good thing she gave the head of it a nice long slurp as your vice-tight asshole still attempts to slow down the artificial penetration");
		output(". Shekka sighs after losing out on her attempt to go first, instead undressing herself properly. While Anno draws out the pleasurable sensation of grinding her toy around the depths of your bowels, the horny little Rask strips slowly out of her jumpsuit. Her nipples look hard enough to cut glass, and a musical jingle from her ears accompanies the muted purr of a zipper being drawn down. As always, her impossibly wonderful hips hold up the descent of her suit.");
		output("\n\nAnno blinks up at you, noticing how your attention has shifted away, before tutting. <i>“Now-now [pc.name], you might want to be ready for this.”</i>");
		output("\n\n<i>“Wh-ohfuck!”</i> you manage to gasp as the fluffy scientist flicks a hidden switch. The toy buried up to its limits in you doesn’t so much vibrate as it does explode. Anno’s free fingers dig into your thigh as she drills your pliant asshole with authoritative thrusts, and the vibrator sends a constant barrage of shocks throughout your body, rocking you from your now-gaping ass to what feels like the bottom of your stomach. It steals the breath from you, and you clench the mattress hard enough to ");
		if(!pc.hasClawedHands()) output("make your nails sting");
		else output("damage the bedding with your claws");
		output(". Not that this has any impact on Anno; if anything drawing such a wicked reaction out of you has her thrusting even faster, spitting on her loving toy every time so that each jackhammering motion has the bedding beneath your ass drenched in liquid love and your [pc.EachCock] is so hard that it throbs painfully.");

		output("\n\nWhilst distracted, a fully-undressed Shekka has climbed back up to you, and her fingers deftly circle your [pc.nipples]. <i>“Hey now, if you cum from just this you won’t be able to manage mine!”</i>");
		output("\n\nYour elegant reply of <i>“mnf- hrrf- ahn!”</i> doesn’t appear to convince her, and she turns her attention to your lower-half. In particular your aching member");
		if(pc.cockTotal() > 1) output("s");
		output(".");

		output("\n\n<i>“Well, if you’re going to make me wait...”</i> Shekka mumbles, before sitting herself on your [pc.tummy]. Her ass grinds against your ");
		if(pc.tone >= 80) output("washboard abs");
		else if(pc.tone < 20) output("sultry squish");
		else output("[pc.belly]");
		output(", leaving a trail of her own love juices as it sets her front-mounted clit to tingling. Paying attention to this proves to be a challenge with eight inches of hardcore vibrations hilted in your rhythmically-clenching anal muscles, but a hot breath against your [pc.cockHead] draws you temporarily back to reality.");

		output("\n\n<i>“Hey!”</i> Anno whines as Shekka wraps her lips around your bone, sucking loudly and coiling her sinuous tongue around as much of it as she can. <i>“Whatever... you only make [pc.name]’s day even harder. Are you sure you want to secure my victory?”</i>");

		output("\n\nShekka mumbles something that might be a ‘Fuck you’, but it’s hard to be heard with a mouthful of dick. Your Ausar lover just smiles smugly, rubbing one of Shekka’s expansive ears. Although the red-scaled cutie tries to look annoyed with her, you can feel the way her pussy grows juicier. It requires a force of will with an assault on both ends, you bring your nerveless fingers back under control, gripping the base of Shekka’s tail. Your horny Rask gasps as you stroke it like a prick");
		if(shekka.hasCock()) output(", before reaching around to jerk off her actual horse-cock, earning a handful of salty musk");
		output(".");
		output("\n\nAnno huffs, sliding her buzzing toy out of you before pressing it against the base of your [pc.cock]. <i>“I feel like this defeats the point of a scientific test.”</i>");
		output("\n\nIn between gasps for breath you manage to eke out some words. <i>“You’ll just have to do a good job too when it’s Shekka’s turn.”</i> You can tell Anno isn’t truly annoyed, considering the addition of her own particular horny scent mingling in the air, and the way her great fluffy tail hasn’t ceased wagging away cheerfully.");
		output("\n\nStill, she places a hand on Shekka’s forehead, pushing her gently off of your cock. <i>“Your go short-stuff.”</i>");
		output("\n\nWhen Shekka lifts herself off of you, a trail of her own lubricants connects you two in a teasing strand. Before you can reach for it, Anno leans past your crotch and gives Shekka’s muff a slurp. She yelps in shock, nearly slipping back down onto you again. <i>“Fff... keep that up and I’ll pin you down myself, you horn-dog.”</i>");
		output("\n\nAnno only giggles, climbing backwards off of the bed with a lick of her lips. <i>“I’ll just have to get naked too. Hurry up Shekka! Don’t want our adorable Captain to get soft");
		if(!pc.isErect()) output(" again");
		output(".”</i>");
		output("\n\nThe Raskvel snorts, flicking the head of [pc.oneCock]. <i>“Fat chance of that.");
		if(pc.hasPriapism()) output(" [pc.name] couldn’t go soft if [pc.heShe] wanted to.");
		output("”</i>");
		output("\n\nIt takes a little readjustment");
		if(pc.biggestCockLength() > 20) output(", especially to get your [pc.cocks] out of the way,");
		output(" but soon Shekka has Anno’s previous position claimed. Your pup on the other hand has taken up the duty of undressing.");

		//Steele suit
		if(anno.armor is AnnosCatsuit) output("\n\nEvery stretchy, flesh-hugging inch she tugs down seems to peel away like a second skin, revealing luscious shining curves. Although the suit had been dropped down to her expansive cleavage it catches on her nipples, desperate to keep clung to Anno’s body. Not that you could blame any article of clothing for wanting to remain there.");
		//Clothing
		else output("\n\nEvery bit of fabric she pulls away seems to peel away like wrapping paper on a Christmas present, revealing luscious, shining curves. Although her top catches on her nipples, desperate to hang on to the busty Anno’s body, you can’t blame it. Anyone would want to hang on there.");

		//Merge
		output("\n\nAt the same time, your attention becomes torn between the show and your red-scaled sweetheart, who now holds up her own creation. Compared to Anno’s more standard-shape vibrator, her toy is thicker, covered with little nodules. Despite being mid-striptease Anno’s tail goes up, translating her intrigue <i>“Where’d you get the stuff for that in just ten minutes?”</i>");

		output("\n\n<i>“Pfft, I just made the bumps with glue and rubber and then shrink-sealed it with nonporous composite. It even makes them squishy!”</i> Shekka announces proudly, waving it around. It’s perhaps only six inches, but the girth straight-through has to be three or so... It’s a good thing Anno went first; at least you’re prepared now. <i>“This is gonna rock your world, [pc.name].”</i>");

		output("\n\nShekka presses the broad head of her nodule-laden sextoy flush against your well-used asshole, ass up in the air and wiggling from side-to-side while she draws the moment out.");

		output("\n\nPoor Anno is given an eyeful of the scaly girl’s callipygian ass");
		if(shekka.hasCock()) output(",");
		else output(" and");
		output(" soaking cunt");
		if(shekka.hasCock()) output(", and pre-oozing horse-shaft");
		output(". By the time she’s finally finished ");
		if(anno.armor is AnnosCatsuit) output("peeling herself out of her suit");
		else output("slipping out of her pants");
		output(" the unique scent of her horny quim sets your blood to boiling. Surprisingly enough, the little Rask patiently waits, just grinding her vibrator between your buttcheeks while Anno assumes the position.");

		output("\n\nThe fluffy scientist pauses to give Shekka’s ass a nice, deep squeeze");
		if(shekka.hasCock()) output(", before reaching down to stroke her cock a few times");
		output(". <i>“Mmmm~ I approve,”</i> she says, uncaring of how the red-scaled alien scowls at her. She finally hops up onto the bed, immediately lining her dripping pussy up with your mouth. Thick droplets of her juices fall to your ");

		if(!pc.hasMuzzle()) output("mouth");
		else if(rand(2) == 0) output("muzzle");
		else output("maw");
		output(" with a gentle pitter-patter as the lights seem to go out in an eclipse of Ausar-ass.");

		output("\n\nOnce Anno is properly situated on your face she gives Shekka a thumbs up <i>“Now we get to find out how your stupid pulse batteries shape u-aaahhn!”</i> Her sentence peters out into a slit-wettening, shaft-hardening moan, fingers digging into your abdomen as your ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("sinuous tongue drills into her sopping-wet cunt until it’s practically teasing her cervix");
		else output("talented taster grinds beneath her hood and sets her already-juicy cunt to squirting");
		output(", immediately making a moist mess of your face.");

		output("\n\n<i>“Don’t drown [pc.himHer]!”</i> Shekka grunts, reaching forward to bap Anno on the nose. <i>“At least not yet,”</i> she adds, before her more occupied hand begins its unstoppable trajectory into your waiting ");
		if(!silly) output("sphincter");
		else output("boipussy");
		output(". Her toy’s girth drives home into your spreading womanhood; each bump on it grinds against sensitive inner-walls and sets clusters of nerves to sparking. Before you get a chance to be completely overwhelmed by an ass-stuffing, the cheekily-grinning Ausar opens wide with a loud <i>’Aaaaah!’</i> before gulping up your cock, ");
		if(pc.cocks[0].cLength() > 14) output("slurping its [pc.cockHead]");
		else if(pc.cocks[0].cLength() > 7) output("hilting herself face-first onto your girthy [pc.cockNoun]");
		else output("practically swallowing the entirety of your modest [pc.cock]");
		output(".");

		output("\n\nWarmth and wetness envelops your prick, but your attempts to gasp are stifled by having a faceful of pup-pussy. Instead you’re left with no choice but to eat her out until nectar dribbles down your chin. Shekka moans, low and deep as the vibrator is pressed into you until her knuckles are pressed up against your [pc.vagina]. Of course, it hasn’t started vibrating yet. Blessedly the girl riding your face lifts herself up in order to properly ");
		if(pc.cocks[0].cLength() > 14) output("suck on");
		else if(pc.cocks[0].cLength() > 7) output("deepthroat");
		else output("slobber the entirety of");
		output(" your [pc.cock] just in time for Shekka to find the switch on her toy.");

		output("\n\nThe few lungfuls of cum-laden air you manage to gulp down between mouthfuls of Ausar are nearly blown right out of you again as your depths are turned to jelly. Deep, hard waves of pleasure strain the already stretchy walls of your innards and it’s only thanks to the twinned weights pressed against you that you can’t thrash yourself free.");
		output("\n\n<i>“Hah! You see that slut-pup? This is how you make a toy!”</i> the shorter Rask proudly announces, artfully twisting her wrist a little to grind the various pulsing bumps against nervelessly-twitching flesh.");
		output("\n\nAnno harrumphs, returning her attention to your [pc.cock], now soaked enough to jerk off at a furious pace. She opens wide, holding her mouth over your twitching [pc.cockHead] and making pleading little whimpers. Her ass quivers above your face, and you decide to finish the poor pup off, smacking both of your hands down on each squeezable cheek. One long, hard lick across her clit, followed by drilling into her juicy cunt with ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("your sinuous [pc.tongue] until it’s pressing down on her cervix");
		else output("your talented [pc.tongue]");
		output(".");
		output("\n\nThe Ausar’s gasp is immediately muffled by a mouthful of your cock, but her eyes roll back in orgasm as she paints your maw with sticky feminine cum. Shekka proudly whoops and despite trying to bend all of your will to holding back your own pending finish, she toy-fucks your prostate until you too are brought to your untimely end.");
		output("\n\nCalling the orgasmic cascade simply ‘cumming’ would do a disservice, as your body works itself into overdrive, pre-cum literally being milked out of you by pressure on your rectal pleasure-buzzer.Your [pc.ass] tightens up so much there’s a momentary fear that you’ll crack the brand-new toy before it becomes impossible to think. Your [pc.cocks] join");
		if(pc.cockTotal() == 1) output("s");
		output(" in on the fun, blasting ropes of cum into your faithful canine lover’s mouth.");

		//Small loads

		if(pc.cumQ() < 25) output("\n\nYour reserves are used up quickly however, and Anno gurgles your [pc.cum] noisily before leaning forwards. Shekka’s eyes widen in surprise as their lips meet, before lowering to lusty half-lids as she’s snowballed a heaping helping of your [pc.cumFlavor] spunk.");
		//Average loads
		else if(pc.cumQ() < 250) output("\n\nAlthough plenty of your seed is wasted on Anno’s cheeks, she greedily gurgles your [pc.cum], tail swishing cheerfully. Shekka looks as though she’s about to swipe some off of the fluffy pup-scientist before yelping in alarm. Anno leans in, quickly snatching Shekka’s lips and making a mess of the red-scaled cutie’s face with a smearing of [pc.cumFlavor] spunk before snowballing a gobful of cock-sauce back and forth.");
		//Big ol’ juicy cummy-cums
		else 
		{
			output("\n\n could tell what’s about to follow as your ");
			if(pc.balls == 1) output("heaving ball tenses");
			else if(pc.balls > 1) output("heaving balls tense");
			else output("engorged prostate tenses");
			output(" up, but Anno simply closes her eyes and waits. Your bitch-stuffing cum-cannon unloads, immediately filling the poor girl’s mouth, painting her face, and utterly slathering her bouncy breasts in [pc.cum]. Shekka bursts out laughing, unable to keep herself out of the splash-zone. Nude red scales are liberally glazed in [pc.cumColor]. <i>“Damnit [pc.name], you’ve made a total mess of us bo– mnf!”</i>");
			output("\n\nShe’s caught off-guard by Anno, dragged by fluffy (albeit cum-matted) arms into the squishy-scientist’s embrace. Their tongues entwine, passing your [pc.cum] around.");
		}
		//Merge
		output("\n\nOnce they finally finish toying with your seed, the girls gulp noisily and Anno clambers off of you");
		if(pc.cumQ() >= 250) 
		{
			output(", dripping cum freely");
			if(celiseIsCrew()) output("; you’ll have to get Celise on that");
		}
		output(".");
		output("\n\nShekka is the first to speak up before an awkward silence is allowed to develop <i>“...Soooo, what do you think, [pc.name]? Who makes the better toy?”</i>");
		output("\n\nYou shrug helplessly, propping yourself up on shaky arms. <i>“They were both great, in totally different ways. But the company makes it far more exciting.”</i>");
		output("\n\nAnno smiles softly, looking Shekka up-and-down. <i>“It was fun, I’m big enough to admit that. But I’m totally going to win next time.”</i>");
		output("\n\n<i>“You wish, slut-pup.”</i>");
		output("\n\n<i>Oh boy...</i>");
		//Next: 40 minutes pass, back to ship menu.
		processTime(40);
		pc.orgasm();
		if(pc.cumQ() >= 1000) pc.applyCumSoaked();
	}
	//Player Pussy
	else
	{
		output("\n\nShekka’s dextrous little fingers sneak further down, even while her lips latch onto your nipple and start to suck");
		if(pc.isLactating() || pc.canLactate()) output(", receiving a healthy dose of [pc.milk] along with your pleasured moans");
		output(". The horny Raskvel runs her fingers along your [pc.vagina] with a hungry little purr. <i>“There’s always so much of you to please!”</i> Anno announces brightly, giving your thighs a squeeze.");
		output("\n\nYou agree with an emphatic groan, sprawled out in bliss as you’re tended to by twin lovers. But this isn’t about your partners’ natural talents, and you give them a pointed wiggle of your [pc.hips]. Shekka and Anno blink back to reality before eying one-another up. They retreat to the edge of your bed, retrieving their toys.");
		output("\n\nAnno has to literally rummage around in her cleavage to reclaim her own vibrator, but soon she manages. After a few moments of holding it aloft like some kind of legendary sword she pounces you once more. On the other hand, Shekka’s still fighting to reclaim hers; her skin tight suit puts up an impressive fight. Your Ausar puppyslut smugly nuzzles her way up your [pc.legOrLegs], tail wagging hard enough to set her ass to jiggling. <i>“Looks like I get to go first!”</i> she says, kissing your inner thigh.");
		output("\n\nShe grows so close to your slavering slit she’s nearly kissing it. At the same time your feminine gulf soaks the bed beneath your ass with [pc.girlCum]. <i>“Fuck you smell so good, [pc.name]... I could just eat you up. Alas,”</i> Anno begins, pressing the head of her toy up against your [pc.cunt]. <i>“This is for you, not me.”</i>");
		output("\n\n");
		if(pc.vaginas[0].looseness() > 2) output("You aren’t a tight [pc.boyGirl] by any stretch of the imagination but she makes sure to run the smooth faux-cock around your inner walls, teasing as much sensitive flesh as she can");
		else output("It’s a good thing their teasing has you wetter than an Ausar bachelorette party, as your vice-like cunt still attempts to slow down the artificial penetration");
		output(". Shekka sighs after losing out on her attempt to go first, instead undressing herself properly. While Anno draws out the pleasurable sensation of grinding her toy around the insides of your pliable pussy, the horny little Rask strips slowly out of her jumpsuit. Her nipples look hard enough to cut glass, and a musical jingle from her ears accompanies the muted purr of a zipper being drawn down. As always, her impossibly wonderful hips hold up the descent of her suit.");
		output("\n\nAnno blinks up at you, noticing how your attention has shifted away, before tutting. <i>“Now-now [pc.name], you might want to be ready for this.”</i>");
		output("\n\n<i>“Wh-ohfuck!”</i> you manage to gasp as the fluffy scientist flicks a hidden switch. The toy buried up to its limits in you doesn’t so much vibrate as it does explode. Anno’s knuckle bashes gently into your clit as she drills your twat with authoritative thrusts, and the vibrator sends a constant barrage of shocks throughout your body, rocking you from your pussy-lips to your womb. It steals the breath from you, and you clench the mattress hard enough to ");
		if(!pc.hasClawedHands()) output("make your nails sting");
		else output("damage the bedding with your claws");
		output(". Not that this has any impact on Anno; if anything drawing such a wicked reaction out of you has her thrusting even faster, stirring your pussy up until the bedding is drenched in liquid love and your toes are curling.");

		output("\n\nWhilst distracted, a fully-undressed Shekka has climbed back up to you, and her fingers deftly circle your [pc.nipples]. <i>“Hey now, if you cum from just this you won’t be able to manage mine!”</i>");
		output("\n\nYour intelligent reply of <i>“mnf- hrrf- ahn!”</i> doesn’t appear to convince her, and she flips around on your body, watching Anno work on your pliant pussy.");
		output("\n\n<i>“Well, if you’re going to make me wait...”</i> Shekka mumbles, before sitting herself on your [pc.tummy]. Her ass grinds against your ");
		if(pc.tone >= 80) output("washboard abs");
		else if(pc.tone < 20) output("sultry squish");
		else output("[pc.belly]");
		output(", leaving a trail of her own excitement as it sets her front-mounted clit to tingling. Paying attention to this still proves to be a challenge with eight inches of hardcore vibrations hilted in your drenched cunt, but a hot breath against your clit draws you temporarily back to reality.");
		output("\n\n<i>“Hey!”</i> Anno whines as Shekka’s surprisingly long tongue flicks out, attempting to wrap itself around your clit. She slurps and sucks lewdly while her hands rest on your legs. <i>“Whatever, you only make [pc.name]’s day even harder. Are you sure you want to secure my victory?”</i>");
		output("\n\nShekka mumbles something that might be a ‘Fuck you’, but it’s hard to be heard with her tongue extended to its fullest and dancing on your most sensitive package of nerves. Your Ausar lover just smiles smugly, rubbing one of Shekka’s expansive ears. Although the red-scaled cutie tries to look annoyed with her, you can feel the way her pussy grows juicier. It requires a force of will with a dual-woman assault on your nethers, you bring your nerveless fingers back under control, gripping the base of Shekka’s tail. Your horny Rask gasps as you stroke it like a prick");
		if(shekka.hasCock()) output(", before reaching around to jerk off her actual horse-cock, earning a handful of salty musk");
		output(".");
		output("\n\nAnno huffs, sliding her buzzing toy out of you in order to lick up your sweet feminine slickness. <i>“I feel like this defeats the point of a scientific test.”</i>");
		output("\n\nIn between gasps for breath you manage to eke out some words. <i>“You’ll just have to do a good job too when it’s Shekka’s turn.”</i> You can tell Anno isn’t truly annoyed, considering the addition of her own particular horny scent mingling in the air, and the way her great fluffy tail hasn’t ceased wagging away cheerfully.");
		output("\n\nStill, she places a hand on Shekka’s forehead, pushing her gently away from your mound. <i>“Your go short-stuff.”</i>");
		output("\n\nWhen Shekka lifts herself off of you, a trail of her own lubricants connects you two in a teasing strand. Before you can reach for it, Anno leans past your crotch and gives Shekka’s muff a slurp. She yelps in shock, nearly slipping back down onto you again. <i>“Fff... keep that up and I’ll pin you down myself, you horn-dog.”</i>");
		output("\n\nAnno only giggles, climbing backwards off of the bed with a lick of her lips. <i>“I’ll just have to get naked too. Hurry up Shekka! Don’t want our adorable Captain to lose traction.”</i>");
		output("\n\nThe Raskvel snorts, flicking your spit-coated [pc.clit] in accusation. <i>“Fat chance of that.”</i>");
		output("\n\nIt takes a little readjustment, but soon Shekka has Anno’s previous position claimed. Anno on the other hand has taken up the duty of undressing slowly for you.");

		//Steele suit
		if(anno.armor is AnnosCatsuit) output("\n\nEvery stretchy, flesh-hugging inch she tugs down seems to peel away like a second skin, revealing luscious shining curves. Although the suit had been dropped down to her expansive cleavage it catches on her nipples, desperate to keep clung to Anno’s body. Not that you could blame any article of clothing for wanting to remain there.");
		//Clothing
		else output("\n\nEvery bit of fabric she pulls away seems to peel away like wrapping paper on a Christmas present, revealing luscious, shining curves. Although her top catches on her nipples, desperate to hang on to the busty Anno’s body, you can’t blame it. Anyone would want to hang on there.");

		//Merge
		output("\n\nAt the same time, your attention becomes torn between the show and your red-scaled sweetheart, who now holds up her own creation. Compared to Anno’s more standard-shape vibrator, her toy is thicker, covered with little nodules. Despite being mid-striptease Anno’s tail goes up, translating her intrigue <i>“Where’d you get the stuff for that in just ten minutes?”</i>");

		output("\n\n<i>“Pfft, I just made the bumps with glue and rubber and then shrink-sealed it with non-porous composite. It even makes them squishy!”</i> Shekka announces proudly, waving it around. It’s perhaps only six inches, but the girth straight-through has to be three or so... It’s a good thing Anno went first; at least you’re prepared now. <i>“This is gonna rock your world, [pc.name].”</i>");
		output("\n\nShekka presses the broad head of her nodule-laden sextoy flush against your dewy pussy-lips, ass up in the air and wiggling from side-to-side while she draws the moment out.");

		output("\n\nPoor Anno is given an eyeful of the scaly girl’s callipygian ass");
		if(shekka.hasCock()) output(",");
		else output(" and");
		output(" soaking cunt");
		if(shekka.hasCock()) output(", and pre-oozing horse-shaft");
		output(". By the time she’s finally finished ");
		if(anno.armor is AnnosCatsuit) output("peeling herself out of her suit");
		else output("slipping out of her pants");
		output(" the unique scent of her horny quim sets your blood to boiling. Surprisingly enough, the little Rask patiently waits, just grinding her vibrator against your twat while Anno assumes the position.");

		output("\n\nThe fluffy scientist pauses to give Shekka’s ass a nice, deep squeeze");
		if(shekka.hasCock()) output(", before reaching down to stroke her cock a few times");
		output(". <i>“Mmmm, I approve,”</i> she says, uncaring of how the red-scaled alien scowls at her. She finally hops up onto the bed, immediately lining her dripping pussy up with your mouth. Thick droplets of her juices fall to your ");
		if(!pc.hasMuzzle()) output("mouth");
		else if(rand(2) == 0) output("muzzle");
		else output("maw");
		output(" with a gentle pitter-patter as the lights seem to go out in an eclipse of Ausar-ass.");

		output("\n\nOnce Anno is properly situated on your face she gives Shekka a thumbs up <i>“Now we get to find out how your stupid pulse batteries shape u-aaahhn!”</i> Her sentence peters out into a slit-wettening, shaft-hardening moan, fingers digging into your abdomen as your ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("sinuous tongue drills into her sopping-wet cunt until it’s practically teasing her cervix");
		else output("talented taster grinds beneath her hood and sets her already-juicy cunt to squirting");
		output(", immediately making a moist mess of your face.");

		output("\n\n<i>“Don’t drown [pc.himHer]!”</i> Shekka grunts, reaching forward to bap Anno on the nose. <i>“At least not yet,”</i> she adds, before her more occupied hand begins its unstoppable trajectory into your waiting cunny. Her toy’s girth drives home into your spreading womanhood; each bump on it grinds against sensitive cunt-flesh and sets clusters of nerves to sparking. Before you get a chance to be completely overwhelmed by a twat-stuffing, the cheekily-grinning Ausar opens wide with a loud <i>’Aaaaah!’</i> before bending down and lapping at your clit, tail wagging furiously as she does her best to contend with the nervous sexual onslaught your [pc.pussy] is going for.");

		output("\n\nThe heat of her tits press down against your [pc.belly], getting covered in Shekka’s previous juices but your attempts to gasp are stifled by having a faceful of pup-pussy. Instead you’re left with no choice but to eat her out until nectar dribbles down your chin. Shekka moans, low and deep as the vibrator is pressed into you until her knuckles are pressed up against your netherlips. Of course, it hasn’t started vibrating yet. Blessedly the girl riding your face lifts herself up in order to get a proper view; just in time for Shekka to find the switch on her toy.");

		output("\n\nThe few lungfuls of cum-laden air you manage to gulp down between mouthfuls of Ausar are nearly blown right out of you again as your depths are turned to jelly. Deep, hard waves of pleasure strain the already stretchy walls of your [pc.pussy] and it’s only thanks to the twinned weights pressed against you that you can’t thrash yourself free.");

		output("\n\n<i>“Hah! You see that slut-pup? This is how you make a toy!”</i> the shorter Rask proudly announces, artfully twisting her wrist a little to grind the various pulsing bumps against nervelessly-twitching flesh.");

		output("\n\nAnno harrumphs, returning her attention to your body, now soaked enough that she can fan her fingers from side-to-side of your pussy with a furious pace. She opens wide, holding her mouth a scant inch above your jackhammered cunt and making pleading little whimpers. Her ass quivers above your face, and you decide to finish the poor pup off, smacking both of your hands down on each squeezable cheek. One long, hard lick across her clit, followed by drilling into her juicy cunt with ");
		if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output("your sinuous [pc.tongue] until it’s pressing down on her cervix");
		else output("your talented [pc.tongue]");
		output(".");

		output("\n\nThe Ausar’s gasp is immediately muffled by her intently burying her face into your leg, but her eyes roll back in orgasm as she paints your maw with sticky feminine cum. Shekka proudly whoops and despite trying to bend all of your will to holding back your own pending finish, she toy-fucks your twat until you too are brought to your untimely end.");

		output("\n\nCalling the orgasmic cascade simply ‘cumming’ would do a disservice, as your [pc.cunt] tightens up so much there’s a momentary fear that you’ll crack the brand-new toy before it becomes impossible to think.");

		output("\n\nThe both of them are showered in [pc.girlCum] when Shekka pulls her toy out and Anno lifts your body up by the legs, pointing your spasming cunt directly upwards. Shekka giggles and opens wide, attempting to get her face into your juicy box. Sadly she’s caught off-guard by Anno, dragged by fluffy (albeit cum-matted) arms into the squishy-scientist’s embrace. Their tongues entwine, passing your unique flavor around between the two of them.");
		output("\n\nOnce they finally finish fencing with their tongues and drooling on each other, the girls gulp noisily and Anno clambers off of you, dripping cum freely");
		if(celiseIsCrew()) output("; you’ll have to get Celise on that");
		output(".");
		output("\n\nShekka is the first to speak up before an awkward silence is allowed to develop <i>“...Soooo, what do you think, [pc.name]? Who makes the better toy?”</i>");
		output("\n\nYou shrug helplessly, propping yourself up on shaky arms. <i>“They were both great, in totally different ways. But the company makes it far more exciting.”</i>");
		output("\n\nAnno smiles softly, looking Shekka up-and-down. <i>“It was fun, I’m big enough to admit that. But I’m totally going to win next time.”</i>");
		output("\n\n<i>“You wish, slut-pup.”</i>");
		output("\n\n<i>Oh boy...</i>");
		//Next: 40 minutes pass, back to ship menu.
		processTime(40);
		pc.orgasm();
	}
	clearMenu();
	fuckedShekka();
	addButton(0,"Next",mainGameMenu);
	IncrementFlag("SHEKKA_ANNO_NERDOFF");
}

//Shekka's Onahole Adventure
//In which the PC finds Shekka fapping off with an Onahole to take care of her rapaciously hungry horse-cock. The PC can force in the future (and get Misch points) by reaching into her jumpsuit and gathering a bunch of dick musk to hold in her face.
public function shekkaOnaholeIntro():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo Fenbooty");
	if(flags["SHEKKA_ONAHOLED"] == undefined)
	{
		output("As you close in on Shekka’s chosen residence, you hear a sound too distinctly... <i>organic</i> to come from her usual tinkering. It’s a heavy rhythm that slides between wet slurps and powerful slaps with vigorous energy. You have your suspicions, but it’s your ");
		if(pc.hasMuzzle()) output("muzzle");
		else if(pc.isTreated() || pc.isBimbo()) output("gene-spliced ");
		else output("nostrils");
		output(" that confirm them. Shekka’s jacking off, and judging by the scent clouding the air around the engine room, she’s been doing it for a while.");
		output("\n\nThe scent itself is quite unusual for Shekka. Her body never released anything so potently... mammalian until you gave her that big, fat horse-dick, yet now it seems to be all she creates.");
		if(pc.hasCock())
		{
			if(pc.hasPriapism()) 
			{
				output(" Your priapic [pc.cocksNounSimple] twitch");
				if(pc.cockTotal() == 1) output("es");
				output(" along with your cautious sniffs, reacting immediately and instinctively.");
			}
			else if(pc.isErect())
			{
				output(" Your hard [pc.cocksNounSimple] jerk");
				if(pc.cockTotal() == 1) output("s");
				output(" along with your cautious sniffs, instinctively and immediately ready to go.");
			}
			else if(pc.cockTotal() == 1)
			{
				output(" You ");
				if(pc.isCrotchExposed()) output("surge to full tumescence");
				else output("pitch a tent");
				output(" with startling immediacy from those few cautious sniffs, your [pc.cock] ready to go before you’re even aware of it.");
			}
			else
			{
				output(" You ");
				if(pc.isCrotchExposed()) output("surge to full tumescence");
				else output("pitch tents");
				output(" with startling immediacy from those few cautious sniffs, your [pc.cocks] ready to go before you’re even aware of it.");
			}
		}
		else if(pc.totalVaginas() == 1)
		{
			output(" Your [pc.vagina] ");
			if(pc.vaginas[0].wetness() < 3) output("dampens");
			else if(pc.vaginas[0].wetness() < 4) output("soaks itself");
			else output("gushes lube");
			output(" from those few cautious sniffs, ready to ride the raskvel’s pony before you can so much as lay eyes upon it.");
		}
		else
		{
			output(" Your [pc.vaginas] ");
			if(pc.vaginas[0].wetness() < 3) output("dampen");
			else if(pc.vaginas[0].wetness() < 4) output("soak themselves");
			else output("gush lube");
			output(" from those few cautious sniffs, ready to ride the raskvel’s pony before you can so much as lay eyes upon it.");
		}
		output(" A smell shouldn’t make you this <i>hot</i>. Nevertheless, you ");
		if(pc.isBimbo() || pc.hasPerk("Corrupted") || pc.libido() >= 75 || pc.isTreated()) output("take a few huge breaths, just to maximize the effects.");
		else output("smack the environmental controls to crank up the air scrubbers in this section of the ship. It doesn’t help.");
		output(" Sex saturates the air, and as you round the corner, it only grows worse.");

		output("\n\nBestial musk billows out of the overheated engine room. The place exudes ");
		if(flags["MET_GIANNA"] != undefined) output("dickscent just like the New Texan milk-barn... only it’s thicker here.");
		else output("more dickscent than a herd of throbb-addicted centaurs.");
		if(pc.isBimbo()) output(" Fuck, you love that smell! Cock cock <i>cock</i>! You sigh in delight, eyelashes fluttering as you luxuriate in the most unexpected of presents. Maybe someday you can make the whole ship like this!");
		else if(pc.isBro()) output(" Goddamn, she smells like a real breeder! There could be a bit more pussy in the mix, but unless you find something to give her a huge, fat juicy set of cunt-lips and put her into heat, you’ll have to make do with having hermaphrodite crew-member who seems part breeding stud.");
		else output(" Fuck, you’re going to be catching whiffs of this for weeks, aren’t you? You won’t be able to check on your ship’s power without smelling a little bit of Shekka’s dick now and then, not that the heat building in your loins seems to mind.");

		output("\n\nThe source of it all is sitting there on her bunk, pumping a comically undersized onahole up and down her gleaming meat-pole. Shekka hasn’t noticed your approach yet. She’s too busy working that blue jelly-toy over every inch of her turgid mast. Her legs are folded almost double, pinned through her armpits to keep them out of the way while she leans up, planting wet, pre-cummy kisses around the trembling flare. Judging by the half-dried juices on her cheeks, she’s been at it a while.");
		output("\n\nMaybe it’s the shockingly pornographic sight... or maybe it’s the musk clouding the air and tempting you join in, but you stand there in slack-jawed amazement for a second while the big-eared mechanic wrings out globules of alien (or equine?) seed.");
		output("\n\nYou’re still watching when she blinks her eyes open and sees you.");
		output("\n\n<i>“[pc.name]!”</i> Shekka moans, <i>“Look at what this did to me?”</i> She puts both hands on the toy and jacks herself harder, the heavy balls tightening slightly. <i>“It gets all musky, and then I smell like some big, sexy off-world stud, and then I’m all horny and I have to jack it off... but fuuuck, it’s </i>so<i> sexy!”</i> One hand drifts down to squeeze an ear, an action that makes her shiver in delight. <i>“You dirty fucking fucker, thank you! I love this! You wanna help, or are you just gonna watch me screw myself silly?”</i> Shekka’s tail lifts up, buzzing hungrily as it closes in on her exposed, dewy mound.");
		output("\n\nThat’s... a really good question. Shekka and her dick look ");
		if(pc.isBimbo()) output("absolutely mega-super-fuckable right now, and you should take total advantage of her and that yummy-smelling super-cock!");
		else output("pretty fuckable right now, and she’s more than up for whatever you might suggest.");
		if(pc.hasCock()) output(" There’s a bigger version of her onahole on the nightstand. Maybe the two of you could share that one.");
		if(pc.hasVagina()) output(" That tail might fit better inside [pc.oneVagina] while you put your tongue to work on her tongue and balls...");
		output(" Then again, maybe you should just watch... or leave, but you’re not that much of a wimp, right?");
	}
	//Alternate intro for repeat PC initiation.
	else
	{
		output("<i>“I want to see you play with your toy again,”</i> you explain, spinning the thick-thighed mechanic around until her tail slaps into your [pc.legOrLegs].");
		output("\n\n<i>“Oh. Which one?”</i>");
		output("\n\nRunning one hand down the front of her jumpsuit, you give the thickening tube of meat trapped inside a friendly squeeze, firm enough to make the colt-sized cock make a leap toward proper stallion size. <i>“This one.”</i> Shekka’s hips press forward to rub against you through the suit right on cue, giving you the opening you need to slip your other hand into the neck seam of her suit. It’s surprisingly easy going once you get inside, thanks to her scales the suits natural slipperiness.");
		output("\n\n<i>“H-hey,”</i> Shekka gasps, <i>“");
		if(flags["SHEKKA_ONAHOLED"] == 1) output("What are you doing?");
		else output("This again?");
		output("”</i>");
		output("\n\n<i>“");
		if(flags["SHEKKA_ONAHOLED"] == 1) output("Getting you ready to play with your toy,");
		else output("This again,");
		output("”</i> you answer with a deft wriggle that slides your hand through her cute little tits to cup at the side of her bulging shaft. It flexes against your palm, heavy and all but soaked in sweat. It clings to your fingers as you handle her maleness, saturating the crevices of your fingers in artificial equine pheromones. As you stroke lower, the juices thicken, allowing you to harvest hyper-concentrated horse-girl musk in the palm of your hand.");
		output("\n\nThe hermed-up raskvel squirms but doesn’t resist. Ever since you slapped that dick on her, she’s been a lot easier to get worked up. A few touches and she’s putty in your hands, but your goal isn’t to melt her into mush this time. As you lift your hand up, a sly smile spreads across your features");
		if(pc.isBimbo()) output(" in anticipation of getting to douse this room in the heady scent of Shekka-cock. She smells so goddamn good - like all the best parts of fucking.");
		else output(" in anticipation of Shekka’s reaction to getting a noseful of her own musk.");
		output("\n\n<i>“If that hand gets any higher, you better make sure to stick around.”</i> Shekka eyes flick back hungrily. <i>“I’m like this because of you, you know.”</i>");
		output("\n\nYour wrist comes out, followed by a hand absolutely caked in sweat and strings of what you can now see are pre. A perversely strong musk comes with it. After hours of being trapped inside her suit, Shekka’s horse-cock has produced a hyperconcentrated melange of bestial, mammalian pheromones, and they spread with alarming speed once released from air-tight bondage.");
		output("\n\n");
		if(pc.isBimbo()) output("You breathe deep, then lick some up for good measure, granting you an immediate flush for the slutty effort.");
		else output("Your nose wrinkles to try and block it, but you gain an unsubtle flush all the same. You may as well breath normally. They’ll turn you on all the same.");
		output("\n\nShekka groans in disappointment, but you note her cute little nostrils open up wide the moment she finishes. The return breath is taken entirely through her nose. At its conclusion, Shekka’s eyelashes flutter and droop. Her tail wiggles happily behind you, and her fingers obediently jump to her suit’s fasteners. <i>“Mmmm, I’m never going to get used to that.”</i> She rubs her cheek into your hand as she strips out of her jumpsuit, too horny to mind if she smells like her own dick for the rest of the day. <i>“Smells so good, like if I got fucked by this dick, I’d fill right up with eggs.”</i> She looks up at you, eyes dilated. <i>“This dick is so fraggin’ good!”</i>");
		output("\n\nYou slip your finger into the pink-feathered mechanic’s mouth and let her suck her equine prick’s secretions from it. <i>“Show me.”</i>");
		output("\n\nSure enough, Shekka all but rips off her jumpsuit, yanking it down to her overabundant hips in a single motion. The oily black beast between her legs spills out, flexing under its own weight and dribble something sticky and slick. It overwhelms every other odor in the area. Grease? You don’t even notice. Metal? Absolutely overpowered by Shekka’s bulging bitch breaker. By the time she tugs the suit over her bubbly booty, you’re feeling ");
		if(pc.lust() >= 50) output("more turned on than her.");
		else output("nearly as turned on as her.");
		output("\n\nThe red-scaled slut lets your finger slide out of her mouth with a hungry pop, her tongue lashing your palm in goodbye. <i>“This toy?”</i> She cradles her cock affectionately in one hand. It throbs obligingly, throwing off clouds of its virile odor. <i>“Or this one?”</i> She produces a spongy blue onahole from somewhere and makes a single, room-clearing bound with her powerful thighs. A mid-air twist deposits her ass-first onto her bed. Inertia carries her legs a bit farther, bouncing up to hook under her armpits as Shekka slides the onahole onto her dribbling pole.");
		output("\n\nShe gets right to jacking herself, looking you in the eye while she does it. Her strokes are fast and hard, rapid enough to milk fresh coats of fuck-juice to lube up the shaft. Shekka whimpers in delight and leans up a bit, high enough to nuzzle at her expanding flare. She peppers it with kisses while she strokes, getting pre-cum and sweat all over her face. When she speaks, it’s with the confidence of one who has given themselves over entirely to perversion. <i>“Whatcha gonna do to me this time?”</i>");
		output("\n\nThere’s so many choices, but only one is truly inconceivable: leaving. She looks so good like that, jacking out ribbons of crystal-clear pre to slather herself in while she waits. At the very least, watching her take care of that hyper-engorged horse-cock of hers should be entertaining.");
	}
	//[DoubleStuff] [Tail&Oral] [Watch] [Leave]
	processTime(20);
	pc.lust(50);
	clearMenu();
	if(pc.hasCock()) addButton(0,"DoubleStuff",penisRouter,[shekkaDoubleStuffScene,99989,false,0],"DoubleStuff","Stick your dick into a toy with Shekka. She’ll love it!");
	else addDisabledButton(0,"DoubleStuff","DoubleStuff","You need a dick to double-stuff a toy with her.");
	if(pc.hasVagina()) addButton(1,"Tail&Oral",tailAndOralShekka,undefined,"Tail & Oral","Take her tail in your pussy and eat her out while she jacks off. Everyone needs a helping hand - or tongue!");
	else addDisabledButton(1,"Tail&Oral","Tail & Oral","You need a vagina to catch her tail with to do this.");
	addButton(2,"Watch",watchShekkaUseHerToy,undefined,"Watch","Watch Shekka go to town. You won’t get any relief, but Shekka will!");
	addButton(14,"Leave",leaveShekkasHorseyJackie,undefined,"Leave","Leave before you have to deal with any more of this debauchery!");
}

//Leave
public function leaveShekkasHorseyJackie():void
{
	clearOutput();
	showShekka(true);
	showName("\nBYE!");
	output("<i>“Uh... have fun,”</i> you say lamely, turning around and jogging down the corridor.");
	output("\n\nShekka’s voice squeaks out after, <i>“O-oh okay! I will, [pc.name]!”</i> More heavy slaps indicate she’s slamming the toy into her crotch. <i>“Thank youuuu~!”</i>");
	//disable shekkafap 1 hour.
	pc.createStatusEffect("Shekka_Cum_Playing");
	pc.setStatusMinutes("Shekka_Cum_Playing",60);
	IncrementFlag("SHEKKA_ONAHOLED");
	processTime(1);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Tail & Oral
public function tailAndOralShekka():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo Fennybuns");
	output("<i>“Hold that tail,”</i> you call");
	if(!pc.isCrotchExposed()) output(", shucking your [pc.crotchCovers]");
	output(". <i>“I want it.”</i>");
	output("\n\nShekka slows her strokes and raises an eyebrow. The tail, meanwhile, pulses: on, off, on, off, turbo-on, off. <i>“Really?”</i>");
	output("\n\nYou prance forward with your heart hammering in your chest");
	if(pc.legCount > 1)
	{
		if(pc.hasKnees() && pc.tallness >= 66)
		{
			output(", dropping to your [pc.knees] and ");
		}
		else output(", ");
		output("spreading your [pc.legs] into a wide ‘A’-shape to make plenty of room for the thick curve of Shekka’s tail");
	}
	else
	{
		if(pc.tallness >= 66) output(", dropping down and ");
		else output(", ");
		output("shifting your [pc.hips] to present yourself to the thick curve of Shekka’s tail");
	}
	output(". This close to her dick, you can make out every feature in its ink-black skin, from thudding, pumping veins to the wrinkled sheath and heavy, sweat-shined balls. The pheromones are stronger... and fresher here.");
	output("\n\nYou lean forward, pressing your face into her musky sheath before you know what you’re doing. Your tongue slips out to taste it, delighted by the salty tang decidedly virile flavor while your [pc.lips] press down in a sinfully eager kiss. The pheromones saturate the tiny, huffing half-breaths you take until your head is swimming and your crotch is aching with the desire to be filled with something, anything.");
	output("\n\nShekka’s tail is that thing. It slithers in, the tapered tip easing your sopping wet lips apart to make room for the girthier stalk behind it. The vibrator inside buzzes dully, pulsing on long enough to make you leak a little more [pc.girlCum], then pushing another inch inside. It fills you in a way you wish her cock would, a buzzing shaft of pleasure that makes your eyes cross beneath your closed eyelids and your mouth gasp.");
	pc.cuntChange(0,25);
	output("\n\n<i>“Wow,”</i> Shekka breathes from somewhere higher up. <i>“You like it as much as me, huh?”</i>");
	output("\n\nYour nod drags your [pc.lips] up and down a few inches of her dick before you remember that she has a pussy and dive deeper, [pc.tongue] sliding out to caress one fold, then the other. The resulting dribbles of raskvel lube are your reward for a good job, but you’re hardly satisfied by that. You smooch up to her top clit, lashing your tongue around it before you plant a big, suckling kiss down. A second later, you let Shekka’s pleasured twitching yank it out of your mouth and wiggle your way down to the second, favoring it with enough attention to make her glaze your cheeks in desire.");
	output("\n\nA hint of pain below reminds you that there’s a very, very thick tail pushed very deep inside of you, and that it’s thrusting in and out with abandon. That tail is <i>fucking</i> you, and it’s fucking you <i>hard</i>. The vibrator isn’t pulsing any more. Ever since you started kissing Shekka’s clits, she’s had it cranked up to the max. The nerve-battering vibrations, cloying musk, and gorgeous, soaked pussy war for your attention until you’ve no thought left for any of them.");
	pc.cuntChange(0,150);
	output("\n\nYou grab hold of Shekka’s thighs for stability and mash your face into her slit, crying blissful screams of delight into her tunnel in between sensuous, tongue-drilling pussy-kisses. You’re coasting along on instinct at this point. If Shekka put any part of her body in front of you, you’d lick, suck, and worship it with the same eagerness you’ve lacquered on her slippery box. Fortunately for you, she’s content to let you explore her innermost folds. Your [pc.tongue] darts around the sensitive places");
	if(pc.hasTongueFlag(GLOBAL.FLAG_LONG)) output(", burrowing deep to trace the contours of her cervix in a way few others could");
	output(".");
	output("\n\nYou cum a few times. Every orgasm shatters apart any rhythm you might have had for a minute or two, but you come back for more all the same. Eating her out is addictive - the taste, the feel... You’re aware of her clenching and dribbling, and on some level, you want more of the same. So much more of the same. Being [pc.tongue]-deep in cunt is so nice that you barely notice the droplets of pre-cum rolling off Shekka’s sack to saturate your ");
	if(!pc.hasHair()) output("head");
	else output("[pc.hair]");
	output(".");
	output("\n\n<i>“[pc.name]!”</i> Shekka calls, grabbing your head and pushing you harder into her double-clittied slit, <i>“I’m gon-gonna cum!”</i> She shudders once and pulls, too weak to lift you herself, but the push from her tail sends you up onto your [pc.feet], blinking and half-blinded.");
	pc.cuntChange(0,200);
	output("\n\nYou get your sight back just in time to see the cockhead bulge out, flaring wide, and a wild impulse takes the reigns. Your [pc.legOrLegs] throw");
	if(pc.legCount == 1) output("s");
	output(" you forward, pinning Shekka’s bulging boner between you mid-orgasm. The urethra dilates, your eyes doing the same, and you dive forward, mouth opening wide (but not wide enough to get the whole way around its majestically swollen head). A thick hose of salty cream unloads into a throat that didn’t even know how much it wanted to swallow horse-flavored jism until a second ago.");
	output("\n\nThat cum is a fix you didn’t even know you needed. It’s a balm that makes your clutching, sloppily squeezing [pc.vaginaNounSimple] cum all over again. You swallow what you can before the pressure forces you off, allowing Shekka to paint you in a mask of pearlescent, fragrant spunk. Her urethra thuds against your [pc.chest] like a beast’s heartbeat just before its explosive eruptions, giving you enough warning to throw your mouth in front of a few more flows.");
	output("\n\nWhen you think life can’t get any better, Shekka is there, kissing you, sparring tongues while her dick unloads wave after wave of alabaster love into the sides of your faces. It’s hot as hell, letting that beast spray you down while you make out with the cute mechanic.");
	//[Next]
	processTime(20);
	for(var x:int = 0; x < 5; x++)
	{
		pc.orgasm();
	}
	pc.loadInMouth(shekka);
	clearMenu();
	addButton(0,"Next",shekkaTailVibeSuckEpi);
}

public function shekkaTailVibeSuckEpi():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo");
	output("By the time Shekka’s orgasm winds down, you’re basically glued together. Not that you mind.");
	output("\n\nShe pulls away first, simple exhaustion causing her to flop onto her back. <i>“You could’ve fucking warned me you were a champion cunt-licker, [pc.name].”</i>");
	output("\n\nYou meekly apologize ");
	if(!pc.isBimbo()) output("as you grab a nearby towel to wipe the worst of the mess from your face.");
	else output("in between shoveling huge gulps worth of leftover jism into your mouth.");
	output("\n\n<i>“Pshhh, I couldn’t be mad at you if I wanted to.”</i> Shekka grabs her dick and lifts it. <i>“You introduced me to this stud, after all.”</i> She drops it and lets it thwack heavily into her belly, still leaking white-hued juices. <i>“I didn’t think it was possible to cum that hard without laying an egg. Like...”</i> She squeezes her balls and sighs in utter, depraved contentment. <i>“...these things are spraying out so much it’s </i>more<i> than any old egg. I can cum like this whenever I want, and when it’s all over, I get to lay in the muskiest, most virile-smelling puddle of cum in the galaxy. Raskvel girls would fight tooth and claw for a shot at getting knocked up by a stud with one of these.”</i>");
	output("\n\nYou roll to the side, splashing into the sexual muck with your own satisfied sigh.");
	output("\n\n<i>“I know how you feel.”</i> Shekka runs a finger down the underside of her dick, shivering slowly in delight. <i>“It’s going to take me a while to clean up this mess. Give me a little bit to get it shipsh-”</i> She pauses and takes a big breath. <i>“Fuck that smells good. No, fuck that, I’m going to sit here and wallow into this fucking gorgeous scent, maybe jill off a time or two, and then I’ll clean it up.”</i> The raskvel smiles wide at you. <i>“Thanks for that, [pc.name]. I think I’m going to like being a Rusher with you.”</i>");
	processTime(15);
	//cummy disable shekka 50m
	pc.createStatusEffect("Shekka_Cum_Playing");
	pc.setStatusMinutes("Shekka_Cum_Playing",50);
	clearMenu();
	fuckedShekka();
	IncrementFlag("SHEKKA_ONAHOLED");
	addButton(0,"Next",mainGameMenu);
}

//DoubleStuff
public function shekkaDoubleStuffScene(x:int):void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo");
	output("<i>“Two dicks, one toy,”</i> you say, gesturing from your crotch to the musky raskvel’s.");
	if(!pc.isCrotchExposed()) output(" A yank on your coverings has your [pc.cocks] springing out in no time, already hard.");
	output("\n\nShekka’s fapping slows as her eyes zero in on [pc.oneCock]. <i>“Uhhh...”</i>");
	output("\n\nYou’re pleased to note that she licks her lips as the onahole grinds to a halt.");
	//Lil = < 7
	//Norm < 13
	//Samesies < 21
	//Hyper >= 21
	output("\n\n<i>“");
	var dlength:Number = pc.cocks[x].cLength();
	if(dlength < 7) output("Your lil dick’ll get crushed in here!”</i> She pumps once for effect, showing how the toy squeezes her veins almost flat on its way by. <i>“Grab one of the others out of my drawer. I got a few sizes in case this one was too small. It ought to be perfect for a cute, raskvel-sized cock like that one.");
	else if(dlength < 13) output("Oh, but then there’ll be twice as much cock smushed together, and... and...”</i> She shudders, dick straining against the clingy toy’s walls. <i>“Right. Get one of my other toys. I got a whole mess to go with this big ol’ stud, and I think there’s one about the right size for us to share.");
	else if(dlength < 21) output("You’re as big as I am.”</i> She gulps, cock flaring with enough force to lurch in your direction. <i>“That’s a lot of cock. We’d need a real big toy, like the one I have in my bottom drawer.”</i> She shudders and whines, <i>“There’s going to be so much dick and so much cum...");
	else output("Wow, really? It’s so... so fucking big.”</i> Her eyes go wide at the mere suggestion, and her cock flings a rope of pre a few inches into the air. <i>“I have like... a baby-dick next to a cock like yours. I mean, wow. We’d have to get my biggest toy to even try. It’s bigger than I am, [pc.name]. Under the bed.”</i> Shekka is almost drooling in desire. <i>“I bet yours’ll get even slicker and muskier than mine. I’ll have to zip it up back in the jumpsuit, just so I can hold onto your scent till the next time I jack off...");
	output("”</i>");
	//Smol toi
	if(dlength < 7) 
	{
		output("\n\nSure enough, a little rooting around in a drawer reveals a bevy of different-colored onaholes, some modeled after various alien or even animal species. The one she described is pink and molded to have an exceedingly plush mound, like a rahn who decided she’d like to have the biggest, bulgiest camel-toe around.");
		output("\n\nShekka’s already removed the smaller toy and awaits the requested pussy with an outstretched hand. You obligingly toss over the new one, allowing the bigger-dicked girl to do the honors of splitting it open on her blunt, pre-soaked head. It fits her like it was made for her, devouring that lust-fattened horse-cock like a centaur in heat. The raskvel sighs and lifts it slightly, lifting to reveal a small gap between her onyx meat and the pink jelly’s clit. <i>“I saved you a seat.");
		if(pc.tallness < 66) output(" You might need a stool to climb up and get it, though.");
		output("”</i>");
	}
	//Med toy
	else if(dlength < 13)
	{
		output("\n\nSure enough, a little rooting around in a drawer reveals a bevy of onaholes in all shapes and sizes. The one you guess to be a good fit is a pretty, purple leithan mold, the semi-transparent material is filled with eye-catching sparkles that would look so cute surrounding your licentiously grinding phalli - like the some kind of slutty, six-legged pony princess.");
		output("\n\nShekka’s waiting with an outstretched hand, the smaller toy already discarded to drip dry on the bedsheets. You obligingly toss the new one over, smiling a bit when Shekka blushes at the sight of your selection. <i>“It was on sale...”</i> she mutters as she begins to spear her shaft into it, groaning as her slickened sable fuck-pole casually opens the faux leithan’s feminine curtains. It looks a little loose on her, but then again, that’s the idea. She leans back slightly and hooks a finger into the now-slick passage to show just how much room she’s left for you. <i>“Here’s your target, [pc.name].”</i> Webs of pre-cum promise to make your entry smoother than silk. <i>“Come join me.”</i>");
	}
	//Big Boi Toi
	else if(dlength < 21)
	{
		output("\n\nSure enough, the bottom drawer has an appropriately-sized toy propped into it. The plus-sized masturbator is less of a pocket-pussy and more of a satchel-slit, but when you’re packing as much heat as Shekka and you do, a big fat slut-cunt is a necessity. Judging by the shape of the mold, it was made in the model of a centaur");
		if(flags["MET_AINA"] != undefined) output(", like Aina");
		output(", which makes sense given the absurd dick-lengths it’s made to accommodate.");
		output("\n\nShekka’s waiting with a nervous smile and outstretched hands, the old toy tossed over her shoulder and forgotten. You obligingly hand the new one over, smiling a bit when Shekka nearly falls over from its weight. <i>“Big toys for big studs,”</i> she mutters as she wrangles it over her shaft and lets go. It drops straight down, lips opening wide to engulf Shekka’s blunt, oozy tip without pause, plummeting all the way down to her balls in a single second. The raskvel gasps and flings her arms around it, convulsing in pleasure as she tips over backward, revealing just how loosely the lips clutch at her sheath - plenty of room for you to slide yourself into");
		if(pc.tallness < 66) output(", once you grab a stool to get you to the right height");
		output(".");
	}
	//Hyper toi!
	else
	{
		output("\n\nSure enough, there’s a huge toy wedged under the bed and seemingly forgotten. You reach under and tug, but it doesn’t budge. It takes both hands and a pretty significant amount of effort to get the hyper-sized pussy-tube to slide out of hiding. It’s neon green with glowing purple stripes. When you pull it, it stretches obscenely before snapping back to its original size, a clear indicator that it’s built to handle the biggest dicks the galaxy has to offer and then some.");
		output("\n\nWhen you turn back to Shekka, she’s left the bed and her old toy behind, coming up beside the person-sized pussy to help you lift it into the bed. <i>“This one’s a real bitch to move around. Got inches and feet mixed up when I ordered it. Guess I lucked out,”</i> she mutters as the two of you heave it into place. The perky raskvel crawls up after it, letting her hips hang halfway out of bed as she wraps her arms around the tip. A skillful twitch plunges her dick inside, clapping her soaking balls against the stretchy material with a load ‘whap!’");
		output("\n\n<i>“Ohhh... this is actually kinda nice.”</i> The crimson mechanic lifts her knees and hooks her legs around it so that she can start to give it a hump. <i>“It’s a little clingy but like... super stretchy too. You’re going to love this.”</i> She slaps her balls into it one more time and whines, <i>“Hypers have all the best toys~! Come get some of this!”</i>");
	}
	//Merge
	output("\n\nYou don’t need to be asked twice. You");
	if(pc.tallness < 66) output(" grab something to stand on and");
	output(" step up to bat");
	if(pc.tallness >= 90) output(", dropping down a bit to line");
	else output(", lining");
	output(" yourself up with Shekka’s steel-hard cock. Her balls quiver and jostle with her every pleasured movement, and she squeaks cutely when your [pc.cockHead " + x + "] slides in between them.");
	output("\n\nStars, she is turned on! You can feel the seed inside those cum-heavy orbs churning on either side of you, and the heartbeats throbbing through her beastly cock visibly bounce your");
	if(pc.cocks[x].cType == GLOBAL.TYPE_EQUINE || (pc.cocks[x].hasFlag(GLOBAL.FLAG_BLUNT) && pc.cocks[x].hasFlag(GLOBAL.FLAG_FLARED))) output("s");
	else output(" [pc.cock " + x + "]");
	output(" in place. When you move forward, sliding the curtain of sweat and pre, your [pc.cockHead " + x + "] bumps over Shekka’s animalistic sheath, releasing what smells like whole new clouds of hyper-potent, equine musk. The pheromonal cocktail slams into you, and a second later, you’re slamming yourself into the toy, fucking with wild abandon.");

	//Smol
	if(dlength < 7)
	{
		output("\n\nYou get to enjoy a half-dozen inches of traditional frottage before your [pc.cockHead " + x + "] is gliding into the pink snatch’s straining fuck-pocket. Then the pleasure triples. You aren’t just enjoying Shekka’s heat and warmth, you’re feeling it all over, tight and constricting. Her bigger, more impressive boner squeezes the toy around you when it throbs, and when she shifts her hips or the toy, you’re taken along for the ride. What started as a forceful plunge is soon melted down into passive pleasure as you stand there and allow Shekka complete control.");
		output("\n\nThe mischievous mechanic knows it too, though she doesn’t seem to mind. From the way her flare twitches with her strokes, she adores the feeling of your dick grinding against her own. Moving the plush pussy with small, gentle motions, she stimulates you one way while her egg-laying hips provide a hard-pounding contrast. It’s exquisite and confusing, and you whimper in delight, leaning forward to grab Shekka for stability, moaning out loud as her bigger, stronger dick swells with near-orgasmic delight.");
		output("\n\nYour agreeable member is all too happy to climb to the peak right alongside her own. Whatever that wonderful cock wants, you’ll give it. You’re hooked on the phallic pleasure her horse-pole provides, hooked and ready to leap into bliss alongside it.");
	}
	//Med
	else if(dlength < 13)
	{
		output("\n\nPenetrating the leithan-modelled entrance is so natural, so <i>easy</i>, that you nearly pop off on the spot. The pre-cum and sweat her horse-prick produces in abundance made everything so deliciously wet that you’re socketed into the [pc.knotOrSheath " + x + "] before your brain can process the dick-melting levels of pleasure. You throb in ecstasy, squeezing the toy tighter around Shekka and causing her to do the same, which squeezes you tight enough to make you both moan in absolute bliss.");
		output("\n\nYou both have the idea to thrust at the same time, but what starts as a rhythmic fuck soon collapses into feverish, off-tempo banging. Sometimes you slide in together, sometimes you yank out while she’s going in, dizzying you with her veiny length’s slick friction. Other times her balls");
		if(pc.balls > 1) output(" clap against your own, two sets of cum-fattened boulders rubbing together in the height of passion");
		else 
		{
			output(" clap against your ");
			if(pc.hasVagina()) output("[pc.clits]");
			else output("taint");
			output(", the cum-fattened boulders begging you to help them disgorge their virile payload");
		}
		output(". Shekka’s legs wrap around your [pc.thighs] encouragingly, and you pound harder.");
		output("\n\nNeither of you can last long like this, not when the air is filled with the scents and sounds of sex. Nor can you endure the doubled pleasure of hot, sweaty horse-cock and tight, clutching tunnel. You whine in the back of your throat and feel your [pc.cockHead " + x + "] smushing against Shekka’s swelling fore. The closer she gets to climax, the tighter everything gets and the more you engorge. Lurid squeezing mounts in the toy and in your body as you approach the edge, meeting Shekka’s eyes the moment before you ride her into orgasm.");
	}
	//Big bois
	else if(dlength < 21)
	{
		output("\n\nYou’re so thankful that this toy is deeper than the tiny thing she was using before. The long, slick tunnel gives you plenty of time shudder in delight as you slide inside. It feels like it goes on forever, allowing you to revel in the texture of Shekka’s veins against your [pc.cockHead " + x + "] and the way her own twitches snuggly the whole way down around you. You bump past her medial ring and moan the whole way up to her flare, pausing long enough to look down at her in triumph.");
		output("\n\nShekka half smiles, half-pants up at you while her hips quiver in delight. Warmth bubbles against your tip while your eyes are locked. <i>“Mmm, big-dicked slut-sex is the </i>best<i>!”</i> she cheers.");
		output("\n\nYou nod and reach down to stroke one of her ears, feeling her pre all over herself in response.");
		output("\n\n<i>“Ah! Cheater. Quit playing around and fuck me.”</i> She holds the toy still and jerks her hips to make her dick slide a few inches out and back in, grinding exquisitely along your shaft. <i>“Unless you gave me the better dick.”</i> She pumps harder, using longer, dizzying strokes. Your [pc.hips] find themselves shaking along to her rhythm, and before long you’re right there with her. <i>“That’s it... just double-teaming bitches with our big, cunt-stuffing cocks...”</i>");
		output("\n\nIt feels damned good, but she’s going a little too slow. You grab onto the toy, squeezing meaningfully to provide a point of heightened friction, and thrust faster, your [pc.cock " + x + "] dragging past Shekka’s in the rush to stuff the extra-large pussy.");
		output("\n\n<i>“I knew you had it in you.”</i> Shekka lets herself slide out of sync until she’s moving out while you’re plowing in and then matches the tempo, maximizing the amount of time her flesh spends rubbing on your own. Frottage has never felt so good. A veneer of shining pre drips from you on the backstrokes in time to be reapplied in the soaking interior, more drenched than a goo-girl’s pussy. And the toy itself is no slouch either. While you’re sure the galaxy has finer cunts to offer, the tube’s material provides a lovely texture for your top half to enjoy.");
		output("\n\n<i>“So fucking good!”</i> Shekka cries and she humps with wild abandon, balls slapping into ");
		if(pc.balls > 0) output("your own");
		else if(pc.hasVagina()) output("your [pc.clits]");
		else output("your taint");
		output(", heavy with churning seed. Her flare is expanding, true to its nature, and you can feel her pre getting hotter and thicker. The increasing viscousness and swelling of her length tightens the tube around you until you feel right there on the edge with her. You almost wish this was a real pussy so the two huge dicks inside it could creampie it for real, and from the way Shekka is slamming in, she feels exactly the same way.");
		output("\n\n<i>“I’m gonna... I’m gonna-”</i> Shekka moans, thrusting so hard that a wave of pre is sprayed out to splatter your [pc.belly].");
	}
	//Hyper
	else
	{
		output("\n\nThe fact that the opening seems vacuum sealed against Shekka’s cock doesn’t hold you back in the slightest, and neither does the exceedingly forgiving impact against its edge. This device is made to be abused like this, and the touch of a cock causes it to fold right in to grant you access. Your enormous cock may be too big for all but the most exotic of partners, but this thing is made for you. It clutches to your flesh, not strained at all by your girth, merely surrounding it in a gentle hug that presses Shekka’s turgid lube-dispenser against you.");
		output("\n\n<i>“Ohhh, f-f-fuck,”</i> Shekka moans. <i>“It’s so fucking </i>big<i>! How do you walk? How do you do anything without fucking... fucking all the time!”</i> She humps the toy wildly, thickening flare grinding against you, compressing your urethra with enough vigor to milk out dollops of pre. <i>“It’s so fucking </i>big<i>! You could knock up spaceships with a cock like that!”</i>");
		output("\n\n<i>“Yeah?”</i> you ask, savoring her infectious enthusiasm. You feel dizzy as more and more blood is diverted to engorge your loins, your [pc.cock " + x + "] as big as it can possibly be. Fortunately you don’t need much balance to grab a fuck-tube and hump.");
		output("\n\n<i>“Oh yeah, big [pc.boyGirl]. You’re gonna cum all over my little, tiny colt-cock, aren’t you?”</i> Shekka pauses to moan, her tail sliding deep into her slit. You can hear the buzzing and additional dripping it generates. <i>“Fucking bathe me in that hot, hyper spunk, you fucking star-" + pc.mf("king","queen") + "!”</i> Shekka shudders, and her balls clutch tight. She’s nearly to the edge, and you’re right there with her. It feels like gallons of pre are squeezing out of you with every stroke, like she’s milking out enough lube to supply a sixty-person orgy.");
		output("\n\n<i>“I’m gonna... I’m gonna-”</i> Shekka moans, thrusting so hard that a wave of pre is sprayed out to splatter your [pc.belly].");
	}
	//Merge for cummies
	var cum:Number = pc.cumQ();
	output("\n\nYou go off hard enough to momentarily roll your eyes back. Muscles deep inside you clamp down and squeeze at your [pc.balls], mechanically working your plumbing to expel the maximum possible amount of seed.");
	if(cum < 25) output(" If only you had more to give! A few happy squirts is the most you can offer, so little that you’ll never even notice your contribution amongst Shekka’s tide of equine white.");
	else if(cum < 150) output(" Long, thick spurts of [pc.cum] spurt out on cue, mixing into the bigger, thicker flows that Shekka provides. Within a few seconds, you’re firing in sync, your cumshots swirling together into blobs big enough to make a galotian drool.");
	else if(cum < 1000) output(" Huge spurts of [pc.cum] roll out of you alongside Shekka’s. All that jizz mixes together into a syrupy soup, but it’s hard to say who produces more, not that you care. You’re humping and cumming, the press of Shekka’s spunk-swollen urethra driving you to ejaculate at exactly the same time, again and again, creaming right on cue.");
	else output(" Huge eruptions of [pc.cum] spurt out of you, drowning Shekka’s contributions in your hyper-virile offering. She can’t help but join in, her dick’s ejaculations locking into your tempo so that she can shoot her in own right into the porn-grade cum-blasts. Swirling, mixed jizz is everywhere, but you keep right on going.\n\n<i>“So much cum!”</i> Shekka delights. <i>“Here, shoot some here!”</i> She tugs the toy off with a whimper and rocks her pussy right up to your tip, letting the last dregs of seed slide across her double-clitted lips. <i>“Right therrrre~!”</i>");
	processTime(30);
	pc.orgasm();
	clearMenu();
	addButton(0,"Next",shekkaDoubleStuffEpi,[x,cum]);
}

public function shekkaDoubleStuffEpi(args:Array):void
{
	clearOutput();
	showShekka(true);
	var x:int = args[0];
	var cum:int = args[1];
	output("Shekka giggles as the euphoria fades. <i>“Holy fuck that was awesome.”</i>");
	if(cum < 1000) output(" Extricating her dick from the toy, s");
	else output("S");
	output("he hugs both dicks together, planting kisses on her own. <i>“If you ever wanna do this again... well.”</i> She pauses. <i>“I’m sure you’ll come up with something. I owe you as many toy-sharing cum-loads as you could possibly want for giving me this. It’s better than laying eggs. Seriously.”</i>");
	output("\n\nYou raise an eyebrow.");
	output("\n\n<i>“I mean it. That’s high praise from a raskvel. What’s the human word for it... like it’s better than going to Heaven!”</i> Shekka smiles. <i>“Now give me a little bit to cool off, and uh... enjoy all this lovely cum.”</i> She slurps cum from her dick. <i>“And clean. Lots of cleaning.”</i>");
	output("\n\nRiiiight.");
	processTime(10);
	fuckedShekka();
	IncrementFlag("SHEKKA_ONAHOLED");
	pc.createStatusEffect("Shekka_Cum_Playing");
	pc.setStatusMinutes("Shekka_Cum_Playing",60);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Watch
public function watchShekkaUseHerToy():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo");
	output("<i>“I’m gonna watch.”</i>");
	output("\n\nShekka groans, <i>“You’re just gonna watch? Just sit there while I screw myself silly?”</i> The words spill out haltingly, one for every stroke past her medial ring that the toy makes. Beads of sweat and pre roll over the lip of it from the force of her masturbation.");
	output("\n\nLeaning back against the wall, you watch her with hungry eyes, your hands unconsciously edging closer to your ");
	if(pc.hasGenitals()) output("crotch");
	else output("[pc.chest]");
	output(". <i>“Yeah.”</i>");
	output("\n\n<i>“Oh.”</i> Shekka stops stroking, if only to caress her length from cum-swollen nut to blood-engorged crown. <i>“You’re going to leave me... all... alone... with this... big...”</i> She presses her tail against her double-clitted slit and gasps. <i>“B-big, fat... cock.”</i> She bends the head up to her lips and slurps her tongue deep into her urethra. Simultaneously, her tail thrusts straight into her slit, stuffing her dusky alien lips with a heaping helping of girthy friction. Muffled vibration leaks out alongside a torrid flow of clear alien girlcum.");
	output("\n\nYou squirm slightly at the sight.");
	if(pc.libido() >= 40 || pc.isBimbo() || pc.isTreated() || pc.hasPerk("Corrupted") || pc.exhibitionism() >= 33)
	{
		output(" There’s something marvellously erotic about getting to watch this. You scarcely give a second through to ");
		if(pc.hasNippleCocks()) output("rubbing your [pc.nipples] until your [pc.nippleCocks] spring out");
		else if(pc.hasFuckableNipples()) output("digging your fingers into your [pc.nipples]");
		else 
		{
			output("reaching ");
			if(!pc.isCrotchExposed()) output("down");
			else output("into your [pc.crotchCover]");
			output(" for a little play of your own.");
		}
	}
	output(" With your nerves lightened by pleasure, you bite your [pc.lip] and watch Shekka go.");
	output("\n\nShe’s swallowing a fair amount for a creature so small. It must feel so good, having a vibe lodged inside you, a mouth slurping on your aching cockhead, and a tight toy to milk you into spurting ecstasy. The look in Shekka’s heavily lidded eyes seems to agree. When she finally stops fellating her crown, webs of cockslime cling from her nose to her chin. The horny hermaphrodite licks at it while she fumbles for a grip on her pre-coated toy, making several half-strokes before she finally gets a good enough hold to really pump at her flagrantly musky horse-cock.");
	output("\n\n<i>“Mmm, tastes better than yours.”</i> Shekka’s eyes twinkle with mirth as she plants a longing, loving kiss against the side of her flexing, tumescent flesh. <i>“Saltier and sweeter at the same time.”</i> Her tail pistons in and out of her slit. <i>“Could knock up every alien in the quadrant.”</i> A dollop of pre launches up and splatters onto her nose. <i>“But it’s all mine. All the cum.”</i> Her hands pump furiously, bouncing the entire bed. Her flare is bigger now, fatter and flaring wider as she nears the edge. <i>“So much egg-stuffing cum!”</i>");
	output("\n\nA spasm of pleasure tears through her body, stuffing her vibe painfully deep. One of her hands falls away as her eyes roll back, landing on a too-sensitive ear in the moment of climax. Her cock goes off like a shotgun, launching a torrent of creamy white rask-goo to splatter against the ceiling while streamers of clear, girlish delight run down her tail. Hips pumping in shuddering microthrusts, Shekka empties her artificial nuts into the air. Not all of it makes it to the ceiling. Plenty plasters her tits, her face, and even her hair. What follows comes out weaker, milked out in lazy blobs that roll down her urethra to glaze the underside of her bestial crush in equine goo.");
	output("\n\nThe sight");
	processTime(20);
	pc.lust(50);
	if(pc.libido() >= 40 || pc.isBimbo() || pc.isTreated() || pc.hasPerk("Corrupted") || pc.exhibitionism() >= 33) 
	{
		output(" pushes you past the point of no return. Your [pc.legOrLegs] wobble");
		if(pc.legCount == 1) output("s");
		output(" until you’re left sliding to the floor, passionately working yourself through voyeuristic climax that leaves you feeling like one of the many puddles of Shekka-cum on the floor.");
		pc.orgasm();
	}
	else output(" leaves you panting and horny. You’ll have to do something about that later.");
	clearMenu();
	addButton(0,"Next",watchShekkaUseHerToyEpi);
}

public function watchShekkaUseHerToyEpi():void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo");
	output("The lengthy deluge of cum Shekka produces seems like it’ll go on forever. Whenever you suspect she’s all done, another stroke of the toy will wring out another set of feeble, thinning spurts. The raskvel mechanic seems insatiable, refusing to release her cock from climax until it’s sore and aching. <i>“My fucking... fucking... pocket stud. Unf.”</i> Her feet slip out, and she flops onto her back, gasping for breath. <i>“Fucking awesome.”</i>");
	output("\n\nYou’re inclined to agree.");
	output("\n\nA moment passes in agreeable silence.");
	output("\n\n<i>“Hey,”</i> Shekka finally calls.");
	output("\n\n<i>“Yeah?”</i>");
	output("\n\n<i>“I uh... I really like this dick.”</i> The crimson cutie props herself up on her elbows and pets her length affectionately. <i>“It’s enough to make a girl forget about her own stupid eggs.”</i> She wipes some cum into her mouth and swallows it with a fucked-out smile. <i>“Like, cumming with this is the same as laying, really. Probably the same amount comes out of me, and I can make </i>other<i> girls get stupid pregnant, again and again. I wouldn’t even have to wait.”</i>");
	output("\n\nYou notice her cock is inching back toward full hardness.");
	output("\n\n<i>“I don’t mean to get too mushy on you, but... thanks again.”</i> Shekka sits up, cock thwapping heavily into cummy sheets. <i>“Now give me a few minutes to clean up the worst of this and make myself sort of decent.”</i> She sniffs deeply and sighs. <i>“Maybe another twenty or thirty minutes. I just wanna enjoy the </i>scent<i> of it.”</i>");
	output("\n\nYou make your exit as she flops back into bed and starts the arduous task of licking up as much of her cum as possible. One hand never leaves her dick.");
	processTime(10);
	//block shekka 40m for cummies~
	IncrementFlag("SHEKKA_ONAHOLED");
	pc.createStatusEffect("Shekka_Cum_Playing");
	pc.setStatusMinutes("Shekka_Cum_Playing",40);
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Shekka Gym Jump
public function shekkaGymmusInterruptus(light:Boolean = false):void
{
	showBust("SHEKKA");
	showName("SURPRISE\nSHEKKA!");
	author("Fenoxo");
	var x:int = pc.cockThatFits(shekka.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	//HARD WORKOUT INTRO: output("Time to pump iron. You slam some weights on the bars and start hefting. The gym regulars clearly appreciate seeing you put in as much work as they do, and volunteer to spot you, so long as you can spot them in return.”</i>);
	//LIGHT INTRO: You work your way through a row of weight machines, keeping the weights at a moderate level. There’s something oddly relaxing about putting yourself through the simple motions
	output("\n\nJust as you’re about to start your first set, you hear the sound of a hand slapping into your beefcake spotter’s gut.");

	pc.createStatusEffect("SHEKKA_GYM_CD");
	pc.setStatusMinutes("SHEKKA_GYM_CD",60*36);

	//Repeat
	if(flags["SHEKKA_GYMMED"] != undefined)
	{
		output("\n\n<i>“Hey again.”</i> There’s a pause and a sudden increase in musk. <i>“Somebody remembers last time...”</i>");
		output("\n\nShekka slides onto you before you can react. Just like before, she’s wearing all but painted-on workout pants and a scandalous bikini top, her clitties and nipples easily visible through the fabric as she casually sets herself down onto [pc.oneCock]");
		if(!pc.isCrotchExposed()) output(" after fishing it out one-handed");
		output(".");
		if(shekka.hasCock()) output(" Her own dick is on full display, openly exposed by a cleverly opened seam. It bounces gently on your [pc.belly].");
		output(" <i>“");
		if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("Mmm, you don’t mind if I kiss you a little while you work out? I’ll make it worth your while and then some...");
		else output("Mmm, seeing you working out like this, surrounded by all this fucking fuck-smell? It’s the best part of this mudball.");
		output("”</i>");
		output("\n\nYour spotter flashes a thumbs up and casually adjusts the boner that’s threatening to burst out of his workout shorts.");
		if(pc.isBimbo()) output(" Somehow you focus on the task of working out instead of sucking him off. Somehow.");
		output("\n\n<i>“So whaddya say, Captain? Think you can spot for me a set of squats?”</i> Shekka’s tail playfully curls around your [pc.leg], buzzing with lewd promise.");
	}
	//First time
	else
	{
		output("\n\n<i>“Better not drop that on my Captain, or you’ll be answering to me.”</i>");
		output("\n\nIs that... Shekka?");
		output("\n\nYou crane your neck up for a look, and sure enough your ship’s mechanic has followed you to the gym. She’s glaring daggers at the bull until she notices you looking at her, at which point her scowl blossoms into a happy smile. It’s almost stunning enough to ignore her choice of attire - instead of skin-tight jumpsuit she’s wearing hip-hugging workout pants with a shine that borders on latex-like.");
		if(shekka.hasCock()) output(" They do nothing to conceal her cock, opened at a near-invisible seam to let it hang out in the open. }Her top is little more than two pasted-on purple triangles of the same material, connected by near-transparent strings.");
		output("\n\n<i>“Hey there, [pc.name]. Saw you wander in here, and I thought... maybe we could help each other out.”</i> She kicks one leg up into the air and steps over the bench (and you), bridging your body with the girth of her prodigious hips. Two bumps bulge out of the crotch of her pants, connected by a thin crease. ");
		if(shekka.hasCock()) output("Her equine dick smacks onto your [pc.belly], already hard. ");
		output("<i>“See I think... this is the perfect place to do some squats.”</i> She lowers herself down until her cushy ass is grazing your groin");
		if(!pc.isCrotchExposed()) output(" and deftly releases [pc.oneCock] from confinement.");
		else output(" and shifts to slide [pc.oneCock] between her cheeks.");
		output("\n\nYour spotter grunts in approval and flashes a thumbs up.");
		output("\n\nShekka leans forward, hands falling on the bar, and snakes under the bar, close enough to kiss. Her breath is electric on your chin as she whispers, <i>“Truthfully I’m ");
		if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("jonesing for another taste of your mouth, and if I don’t get laid soon I’m going to wind up glued to some bull-brained idiot’s crotch");
		else output("horny as fuck from all this gorgeous man-musk and I’d rather fuck you than any of these bull-brains");
		output(". So for every set you do... I’ll give you a ");
		if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("kiss and a ");
		output("reward. Okay?”</i>");
	}
	//Merge
	output("\n\nDo you accept Shekka’s offer or stick to a normal work-out?");
	processTime(10);
	pc.lust(4);
	clearMenu();
	addButton(0,"Shekka",bonusShekkaWorkout,light,"Shekka","Let Shekka \"squat\" on you while you do your lifting!");
	addButton(1,"No Shekka",noShekkaWorkout,light,"No Shekka","She might not handle this the best.");
}

//No Shekka.
public function noShekkaWorkout(light:Boolean):void
{
	clearOutput();
	showShekka();
	showName("\nWORKOUT");
	output("You push Shekka back. <i>“No. I know this is New Texas, but not right now, okay?”</i>");
	output("\n\nShekka stumbles back, shuddering in shame. <i>“I thought... well... okay fine! I’ll just fuck someone else! You!”</i> She stabs a finger at the nearest bull. <i>“Come with me if you want to fuck.”</i>");
	output("\n\nAnd with that, Shekka stalks out of the room, followed by someone nearly three times her size. Whoops.");
	output("\n\nAt least the rest of your workout proceeds undisturbed.");
	pc.createStatusEffect("SHEKKA_CHEATING_ON_YOU_CD");
	pc.setStatusMinutes("SHEKKA_CHEATING_ON_YOU_CD",60);
	if(light)
	{
		output(" Your muscles have become slightly more toned.");
		pc.energy(-30);
		pc.modTone(1,false);
		sweatyDebuff(1);
		soreDebuff(1);
	}
	else
	{
		output(" Your muscles have become considerably more toned.");
		// +3 muscle tone, +2 toward [Sore] debuff, +2 [Sweaty], -50 energy, Time: 30 minutes	
		pc.energy(-50);
		soreDebuff(2);
		sweatyDebuff(2);
		pc.modTone(3, false);
		pc.slowStatGain("physique",1);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}

//Shekka
public function bonusShekkaWorkout(light:Boolean):void
{
	clearOutput();
	showShekka(true);
	author("Fenoxo");
	var x:int = pc.cockThatFits(shekka.vaginalCapacity(0));
	if(x < 0) x = pc.smallestCockIndex();
	output("You wink at Shekka and put yourself back to work. For the first set, she doesn’t do much of anything, just sits in your lap and preens, trying not to distract you from the arduous process of whipping your body into shape. It’s once you finish that everything goes off the rails.");
	output("\n\n<i>“Good job,”</i> the horny raskvel coos, sliding her soaking lips against your [pc.cock " + x + "]. How did she open those pants?");
	pc.cockChange();
	output("\n\nShekka spears herself on your dick and straights up even as she sinks down, her juices pooling in the delta of your crotch. <i>“Look at how strong you’re getting.”</i> She puts her hands on your [pc.chest] and lifts her hips until the entire length of your dick save for the [pc.cockHead " + x + "] is exposed and glistening. <i>“I’d better work out just as hard.”</i>");
	output("\n\nShekka slides down your pole with a careful, precise motion, her thighs gently coming to rest against your own.");
	if(pc.balls > 1) output(" Her tail curls fiercely about your [pc.balls] as if to say, <i>“Look at these. Everything inside them is going into me.”</i>");
	else output(" Her tail curls fiercely around your [pc.leg] as if to say, <i>“This? This is mine to ride. You’re welcome to watch, but I’m taking this home with me.”</i>");
	output(" Cow-girls look on jealously as she lifts herself back up and down. Somehow, Shekka has turned fucking into a proper workout, and by the time she finishes her thirtieth up-and-down stroke, she’s panting and blushing.");
	if(shekka.hasCock()) output(" Her horse-cock is visibly glistening with sweat, its musk permeating your every breath.");
	output("\n\n<i>“Y-your turn.”</i>");
	output("\n\nYou’re breathing hard too, but it has nothing to do with the first set. Shekka gave you plenty of time to rest, yet the disturbingly erotic feeling of her pussy clutching at you all this time has you feeling light-headed and ready to put on a show. You grunt and lift to the best of your abilities, powering through this group of exercises with comparative ease. Shekka gasps when the weights slam down after the final set, and you feel a trickle of feminine excitement slip onto your skin.");
	//Aphrospit
	if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) 
	{
		output("\n\nShekka ");
		if(pc.tallness >= 72) output("scrabbles up");
		else output("leans over");
		output(" for a kiss, sucking your breathless tongue into her mouth before you can think to stop her. Her muffled moan flows into you as you breathe in. Then, she slides back, sucking every droplet of spit from your tongue in the process. You note that her eyes are fully dilated and her shoulders have relaxed. She’s smiling giddily. Her tail limply flicks back and forth over your [pc.legOrLegs]. <i>“Just needed a warm-up before my second set.”</i>");
	}
	//Nonspit
	else
	{
		output("\n\nShekka ");
		if(pc.tallness >= 72) output("scrabbles up");
		else output("leans over");
		output(" for a kiss, her heated breath flowing into you as you gasp for air. <i>“Look at you go. That’s two now!”</i> ");
		if(pc.hasHair()) output("Her fingers run through your [pc.hair] adoringly.");
		else output("Her fingers slide over your head adoringly.");
		output(" <i>“I got wetter just watching it. Keep that up, and I’m going to end up cumming from how your dick flexes while you lift.”</i> She’s gets a little wiggly as she gets into place for her next attempt at mid-fuck squats.");
	}
	//Merge
	output("\n\nThe thick-thighed aliens build may be well-suited for squatting, but she’s clearly forgotten her previous discipline. Her rise up uneven and shuddery. Instead of lowering herself slowly, Shekka slams herself down to the hilt");
	if(pc.cocks[x].cLength() >= 13) output(", bulging your [pc.cockHead " + x + "] in her belly in the process");
	output(". The whorish moans draw the attention of other gym goers, and your spotter must have pulled out his dick at some point because you can see it drooling a few inches to the side.");
	if(pc.hasCock()) output(" Speaking of drooling dicks, Shekka’s making a real mess of your middle. Pre-cum splatters whenever she bottoms out.");
	else output(" Shekka’s making a similar mess of your thighs, coating them in girl-cum.");
	output("\n\nSpeaking of messes, the short-stack slut’s squats grow ever more undisciplined. By her fifteenth rep, she’s not even pretending to exercise. She’s just bouncing in your lap and moaning, running her fingers under the stretchy fabric of her bikini top to play with her nipples. Someone in the audience slaps her ass at rep number thirty, reminding her to stop.");
	output("\n\n<i>“Uhh... got a bit carried away there. So I guess it’s your turn,”</i> Shekka purrs, her walls idly squeezing. <i>“I’m sorry... I can’t stop. This is just too hot.”</i> Her thighs ripple as she massages you with her cunt. <i>“");
	if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output("Maybe a good luck kiss will help you out.");
	else output("But I bet you can make it, can’t you?");
	output("”</i>");
	if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) 
	{
		output(" A searing-hot tongue kiss is slams into you, pinning you to the bench. Her tongue slithers <i>everywhere</i> as she sucks face, extracting the maximum amount of your druggy spit before you finally push her back.\n\nJudging by her wobbles, the little raskvel came two or three times just from that. Your crotch is soaked");
		if(shekka.hasCock()) output(", and her dick is still leaking cum");
		output(". <i>“Mmm... nice...”</i>");
	}
	output("\n\nSure enough, the third go-round is harder than the first two. Not only are you tired from the previous exertions, but the distracting pressure on your [pc.cock " + x + "] never lets up. The raskvel’s insatiable attentions nearly make you lose your next-to-last rep until you recover at the last second, determined to not to fail in front of so many.");
	output("\n\n<i>“If you do it, I’ll make you cum sooo hard,”</i> Shekka promises");
	if(pc.balls > 0) output(", tail circling your [pc.sack]");
	output(".");
	output("\n\nMaybe it’s the promise, or the audience, but you power right through, [pc.cock " + x + "] rock hard inside the rask’s cunny as you slam the bar into place. A cheer erupts from the crowd while Shekka slides into action, bouncing rapid-fire in your lap.");
	output("\n\n<i>“You did it!”</i> She cheers, moaning whorishly. <i>“And it felt so good inside me.”</i> Her tail whips around happily. <i>“And </i>you<i> get to cum inside me in front of all these sluts.”</i> She gyrates in circles, clitties dragging on your [pc.skinFurScales]");
	if(shekka.hasCock()) output(", heavy balls quaking in delight");
	output(". <i>“You’re the best thing on this fucked up dirtball of a planet, now give me that cum,”</i> Shekka cries. She seizes your head in her hands and pulls you into another kiss, passionate");
	if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(", hot, and for once not attempting to suck the spit out of your mouth");
	else output(" and hot");
	output(".");
	output("\n\nYou provide exactly what she asks for: one ");
	if(pc.balls > 1) output("balls-deep");
	else if(pc.hasKnot(x)) output("knot-deep");
	else output("hilt-deep");
	output(" cunt-stuffing. Your ejaculation is so forceful that your clenching muscles bounce you both on the bench with each pulse.");
	if(pc.cumQ() < 75) output(" Trickles of seed leak out as proof of your virility for all to see.");
	else if(pc.cumQ() < 500) output(" Gushes of seed drool out as proof of your virility for all to see.");
	else if(pc.cumQ() < 3000) output(" Thick rivers of seed roll out as proof of your superior virility for all to see.");
	else output(" Huge sprays of seed jet out as proof that the cum-bubble of a raskvel will never get a load like this from anyone else.");
	output(" Shekka cums to the feeling of it ");
	if(pc.cumQ() < 75) output("hitting");
	else if(pc.cumQ() < 500) output("filling");
	else if(pc.cumQ() < 3000) output("flooding");
	else output("ballooning");
	output(" her womb");
	if(shekka.hasCock()) output(", her dick jerking and spurting onto your chest. Fortunately, some nice cow-girls are more than happy to lick it up");
	output(". Your spotter catches Shekka before her shuddering pleasure sends her falling to the side, again giving you a thumbs up.");
	output("\n\nThe people on New Texas sure are helpful!");
	output("\n\nAs things die down, the audience disperses, leaving you hold onto Shekka until she recovers");
	if(shekkaAddicted() && pc.hasTongueFlag(GLOBAL.FLAG_APHRODISIAC_LACED)) output(", not that she will after that massive-venom load. She’s rubbing her pussy the whole way to the door and giggling something about how her pants are going to seal it for days.");
	else output(". She’s grateful, and gives you a wink and smile before leaving, slapping a couple bulls on the ass on the way out.");
	processTime(45);
	pc.orgasm();
	IncrementFlag("SHEKKA_GYMMED");
	if(light)
	{
		output("\n\nYour muscles have become slightly more toned.");
		pc.energy(-30);
		pc.modTone(1,false);
		sweatyDebuff(1);
		soreDebuff(1);
	}
	else
	{
		output("\n\nYour muscles have become considerably more toned.");
		// +3 muscle tone, +2 toward [Sore] debuff, +2 [Sweaty], -50 energy, Time: 30 minutes	
		pc.energy(-50);
		soreDebuff(2);
		sweatyDebuff(2);
		pc.modTone(3, false);
		pc.slowStatGain("physique",1);
	}
	clearMenu();
	addButton(0,"Next",mainGameMenu);
}