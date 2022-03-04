//
//  ViewController.swift
//  Kolluru_SearchApp
//
//  Created by Kolluru,Anurag on 3/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBttn.isEnabled = false
        nextBttn.isHidden = true
        previousBttn.isHidden = true
        resetBttn.isHidden = true
        resultImage.image = UIImage(named: "search")
        
    }
    @IBOutlet weak var searchBttn: UIButton!
    @IBOutlet weak var topicDescription: UITextView!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var nextBttn: UIButton!
    @IBOutlet weak var previousBttn: UIButton!
    @IBOutlet weak var resetBttn: UIButton!
    @IBOutlet weak var searchTxtField: UITextField!
    @IBAction func resetBttnOnClick(_ sender: Any) {
        nextBttn.isHidden = true
        previousBttn.isHidden = true
        resetBttn.isHidden = true
        topicDescription.text = nil
        searchTxtField.text = nil
        resultImage.image = UIImage(named: "hello")
        img = 0
        tittle.text = nil
    }
    
    var movie_title = ["The Dark Knight","Dunkirk","Moonlight","The Social Network","Get Out"]
    var popStar_title = ["BTS","Billie Eilish","Justin Bieber","Ariana Grande","Shawn Mendes"]
    var youtuber_title = ["PewDiePie","Kids Diana Show","Like Nastya","Vlad and Niki","MrBeast"]
    
    var search_img = [["The_Dark_Knight_poster","Dunkirk","Moonlight","social_network","Get_out"],["BTS","billie","justin","ariana","shawn"],["Pew","Diana","nastya","Vlad_Niki","MrBeast"]]
    
    var search_topics = ["movies","popStars","youtuber"]
    
    var movie_keywords = ["movie","movies","film","picture","talkie"]
    var popStar_keywords = ["pop stars","pop star","superstar","megastar","personality","Pop Singers"]
    var youtuber_keywords = ["youtuber","youtubers","influencers","social media influencers","digital stars"]
    
    var movie = ["With the help of allies Lt. Jim Gordon (Gary Oldman) and DA Harvey Dent (Aaron Eckhart), Batman (Christian Bale) has been able to keep a tight lid on crime in Gotham City. But when a vile young criminal calling himself the Joker (Heath Ledger) suddenly throws the town into chaos, the caped Crusader begins to tread a fine line between heroism and vigilantism.","In May 1940, Germany advanced into France, trapping Allied troops on the beaches of Dunkirk. Under air and ground cover from British and French forces, troops were slowly and methodically evacuated from the beach using every serviceable naval and civilian vessel that could be found. At the end of this heroic mission, 330,000 French, British, Belgian and Dutch soldiers were safely evacuated.","A look at three defining chapters in the life of Chiron, a young black man growing up in Miami. His epic journey to manhood is guided by the kindness, support and love of the community that helps raise him.","In 2003, Harvard undergrad and computer genius Mark Zuckerberg (Jesse Eisenberg) begins work on a new concept that eventually turns into the global social network known as Facebook. Six years later, he is one of the youngest billionaires ever, but Zuckerberg finds that his unprecedented success leads to both personal and legal complications when he ends up on the receiving end of two lawsuits, one involving his former friend (Andrew Garfield). Based on the book The Accidental Billionaires.","Now that Chris and his girlfriend, Rose, have reached the meet-the-parents milestone of dating, she invites him for a weekend getaway upstate with her parents, Missy and Dean. At first, Chris reads the family's overly accommodating behaviour as nervous attempts to deal with their daughter's interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries leads him to a truth that he never could have imagined."]
    
    var popStar = ["In 2020, BTS set a world record. In fact, they set three similar world records; all of which were for their hit song, Dynamite. With 10.1 million views within 24 hours on youtube, it became the most viewed Youtube video in 24 hours, the most viewed Youtube music video in 24 hours, and the most viewed Youtube music video by a K-pop group in 24 hours. By the end of 2020, Dynamite was 7th on Billboard’s Top 100 Best Songs of the Year, 2nd on the New York Times Best Songs of 2020, and at its peak position, made history as it reached 1st on Billboard’s Global Top 200.","born December 18, 2001) is an American singer and songwriter. She first gained public attention in 2015 with her debut single Ocean Eyes, which was subsequently released by Darkroom, an imprint of Interscope Records. The song was written and produced by her brother, Finneas O'Connell, with whom she frequently collaborates on music and in live shows. Her debut extended play, Don't Smile at Me (2017), was commercially successful, charting within the top 15 in the US, UK, Canada, and Australia.","Despite the chaos in 2020, Justin Bieber still managed to make albums and songs, some of which rose to popularity across the nation and world. Making a total of 4 albums over the course of 2020, Bieber wrote 4 hit songs titled “Lonely,” “Holy,” and “Monster” (a collaboration with singer Shawn Mendes), and the infamous “Yummy.” “Lonely” climbed up the charts nationally and internationally, debuting at number seven on the US Mainstream Top 40 and at fifteenth on the US Billboard Hot 100.","Ariana Grande is a name most, if not all, of us have heard. At age 15, Ariana first debuted in the Broadway musical “13.” She soon began to release albums, and by 2020, her net worth was 150 million dollars. Throughout the course of 2020, she released one album, with a total of 14 songs. These songs included “34+45” and “Positions,” which both topped charts all across the nation. With nearly 22 million streams, “Positions” rose to the number one song of the nation, while “34+45” received a total of 19.5 million streams.","For years, Shawn Mendes has been one of the most popular singers in the world. With countless international fans, he has received popularity from those of all ages. After the release of the “Wonder” album in 2020, Mendes was able to maintain his popularity amongst fans. The album included the hit songs “Monster” and “Wonder.” “Monster,” a collaboration between Mendes and Bieber, became the sixth top 10 single for Mendes on the Billboard Hot 100 when it debuted at number 8."]
    
    var youtuber = ["Felix Kjellberg is the UK-based Swedish gamer who’s been running this channel since 2010. He is YouTube’s number one in terms of popularity and number of subscribers and has reigned YouTube for a while now, even if he’s fought for this spot with other famous YouTubers, notably Smosh. Mainly a gaming influencer, he also likes to diversify into comedy sketches and Vlogs, and even published a book recently.","This channel puts the limelight on 6-year-old Diana as she plays with her family, including her brother Roma, and her friends. The channel is all about childhood, with toy unboxings, stories, and games, this little Ukrainian girl quickly came to dominate YouTube’s children entertainment sphere.","Still in the kid’s sphere and not far behind Diana is Nastya and her cute vlogs. Covering new toys, family games or trips with her friends, Nastya shares her daily life in her vlogs and has become the most subscribed to channel in Russia. What’s more, this channel is only one of the many channels run by Nastya and her family: for example, Like Nastya Vlog and Like Nastya Show also have several millions of subscribers.","TYet another children’s channel, showing the enormous popularity of the genre itself. This is the story of Dubai-based Russian-American brothers Vlad and Niki as they play games, often with their mother as well. The channel is run by parents Sergey and Victoria Vashketov, who add animation and music to target each episode at young kids. They have 16 channels and translate the content into 13 languages, attracting more than 112M subscribers in total and making the growth of this only three-year-old channel most impressive!.","Launched in 2012, this is one of YouTube’s most random, dazzling, and attention-grabbing channels. Jimmy Donaldson from the USA is known for his viral challenges, like eating the world’s largest slice of pizza, and his charity stunts, like giving away $1M dollars with only 1 minute to spend them. It’s hard not to be drawn in by these original and extraordinary videos!"]
    
    var topic:Int!
    var img = 0


    @IBAction func searchTxtFieldAny(_ sender: Any) {
        if(!searchTxtField.hasText){
            searchBttn.isEnabled = false
        }
        else{
            searchBttn.isEnabled = true
        }
    }
    
    
    @IBAction func searchBttnAny(_ sender: Any) {
        nextBttn.isHidden = false
        previousBttn.isHidden = false
        if(img == 0){
        previousBttn.isEnabled = false
        nextBttn.isEnabled = true
        }
        else{
            previousBttn.isEnabled = true
        }
        resetBttn.isHidden = false
        resetBttn.isEnabled = true
        if(movie_keywords.contains(searchTxtField.text!)){
            topic = 0
            update(image: img, topicNumber: topic)
        }
        else if(popStar_keywords.contains(searchTxtField.text!)){
            topic = 1
            update(image: img, topicNumber: topic)
        }
        else if(youtuber_keywords.contains(searchTxtField.text!)){
            topic = 2
            update(image: img, topicNumber: topic)
        }
        else{
            resultImage.image = UIImage(named: "error")
            topicDescription.text! = "Enter any other topic"
            nextBttn.isHidden = true
            previousBttn.isHidden = true
            resetBttn.isHidden = true
        }
        
    }
    
    func update(image: Int, topicNumber: Int){
        resultImage.image = UIImage(named: search_img[topic][img])
        if(topicNumber == 0){
            topicDescription.text = movie[image]
            tittle.text = movie_title[image]
        }
        else if(topicNumber == 1){
            topicDescription.text = popStar[image]
            tittle.text = popStar_title[image]
        }
        else if(topicNumber == 2){
            topicDescription.text = youtuber[image]
            tittle.text = youtuber_title[image]
        }
    }
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBAction func nextImage(_ sender: Any) {
        img += 1
        update(image: img, topicNumber: topic)
        if(topic == 0 && img == movie.count-1){
            nextBttn.isEnabled = false
        }
        else if(topic == 1 && img == popStar.count-1){
            nextBttn.isEnabled = false
        }
        else if(topic == 2 && img == youtuber.count-1){
            nextBttn.isEnabled = false
        }
        previousBttn.isEnabled = true
        resetBttn.isHidden = false
        resetBttn.isEnabled = true
    }
    @IBAction func previousImage(_ sender: Any) {
        img -= 1
        update(image: img, topicNumber: topic)
        if(topic == 0 && img == 0){
            previousBttn.isEnabled = false
        }
        else if(topic == 1 && img == 0){
            previousBttn.isEnabled = false
        }
        else if(topic == 2 && img == 0){
            previousBttn.isEnabled = false
        }
        nextBttn.isEnabled = true
    }
}


