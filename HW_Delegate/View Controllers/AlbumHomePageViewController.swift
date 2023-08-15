//
//  AlbumHomePageViewController.swift
//  HW_Delegate
//
//  Created by 曹家瑋 on 2023/8/12.
//

import UIKit
import SafariServices   // 加入 framework SafariServices
import PhotosUI // 加入 framework PhotosUI

/// 攝影集首頁
class AlbumHomePageViewController: UIViewController {
    
    /// 大頭照按鈕IBOutlet（用與設置該Button的ImageView）
    @IBOutlet weak var profilePictureButton: UIButton!
    /// 背景圖片
    @IBOutlet weak var backgroundImageView: UIImageView!
    /// 攝影集相本表格
    @IBOutlet weak var albumTableView: UITableView!
    
    /// 建立 相簿cell的資料
    let albumSections: [AlbumSection] = [
        AlbumSection(sectionTitle: "北部", albums: [
            Album(albumCoverImageName: "KeelungCover", albumTitle: "雨都基隆", albumDate: "2022 / 09", description: "基隆迷人海景與獨特的城市風貌",
                  details: AlbumDetail(images: ["keelung01", "keelung02", "keelung03", "keelung04","keelung05", "keelung06", "keelung07", "keelung08", "keelung09", "keelung010"], contentText: "基隆位於臺灣北部，三面環山，僅北面一處有少量平原迎向大海，即為深水谷灣之基隆港。港灣深入市區，水面寬闊，集商港、軍港、漁港於一身，為進入北臺灣門戶。\n由於地形受東北季風的影響，基隆的冬天經常多雨，平均溫度僅在攝氏22度左右，素有「雨港之都」之稱。基隆是雨港也是漁港，魚市的漁貨種類繁多，各地遠洋、近海的漁貨種類，當天現撈的鮮活漁貨，應有盡有，崁仔頂的魚市場可說是全臺灣最有活力、有趣的魚鮮拍賣交易場。\n在基隆火車站旁的小港碼頭可搭乘遊艇遊基隆港，沿岸景觀頗有可看之處，從大海看陸地山光水色，由各國駛進駛出之豪華客輪、郵輪的繁忙海港風情，湛藍的海水四季與基隆人共同生活，藍色公路之旅是正流行的親水休閒活動。\n清光緒年間，為了加強鞏固海防，因而在基隆地區留下了白米甕砲臺、二沙灣砲臺（海門天險）、大武崙砲臺等戰時古蹟，在此遊山訪古，舊時激烈的戰況早已塵封，只見碉堡的雄偉景觀襯以一望無際的藍天碧海美景。\n數百年來，基隆出入過無數異國船隻，帶來了多元的文化與新知，是臺灣與國際交流的港口，更是臺灣歷史上重要的文化港都！巨舶輻輳的國際港市、熱鬧豐美的中元祭典、多樣精緻的廟口小吃以及砲臺與隧道、岬角與灣澳、漁港和魚市……，走訪其間，令人流連忘返。")),
            Album(albumCoverImageName: "TamsuiCover", albumTitle: "滬尾淡水", albumDate: "2021 / 04", description: "淡水河畔的美麗風景與歷史古蹟",
                  details: AlbumDetail(images: ["tamsui01", "tamsui02", "tamsui03", "tamsui04"], contentText: "「淡水」和「雞籠」曾為整北台灣的泛稱，前指淡水河流域和河口一帶地區。西班牙統治時期，將淡水河流域之地理區稱為淡水省區(Tamchui)。清治時期，1723年，設台灣府淡水海防廳，由彰化縣管理行政事務，並置淡水捕盜同知兼北路防務；1731年，分設淡水廳，開啟了行政區劃的始端。因天津條約，於滬尾開港設海關，開放對外貿易之後，人口逐漸往淡水河河岸的艋舺、大稻埕、滬尾等開埠、集市與居住。其中「滬尾」是在淡水河口東北側河岸的聚落名，也就是今日淡水的重要市街之一。\n於西元1858年天津條約簽訂後，淡水正式開港。所有外國船隻來臺灣後只能限定到通商口岸進行貿易，在其他口岸交易者一律視為走私。\n1862年，淡水正式開始徵收關稅。1863年，英國為了避免原本已經在雞籠(今基隆)活動的商船被視為走私，便要求另開雞籠為淡水的外口，清朝政府也認為在雞籠增設海關有助於稅收，從此以後，淡水和雞籠便成為外國商人雲集之地。\n茶、樟腦、硫磺、煤、染料等輸出和鴉片、日常用品的進口，不但使淡水成為全臺灣最大的貿易港，也讓淡水躍升國際舞台。不僅英國人在聖多明哥城附近設立領事館辦事，各國洋行也都到淡水街設行貿易，因此進入黃金時代。淡水不但在貿易上獨佔鰲頭，也成為西方文化的登陸臺灣的門戶。\n日治時期，因淡水河河道日漸淤淺、大型船舶出入不便，乃積極建設基隆港及臺北與基隆之鐵路運輸，漸漸取代淡水成為重要貿易港地位。")),
            Album(albumCoverImageName: "TaipeiCover", albumTitle: "青山祭", albumDate: "2020 / 12", description: "台北市的熱鬧慶典和豐富文化",
                  details: AlbumDetail(images: ["taipei01", "taipei02", "taipei03", "taipei04", "taipei05", "taipei06", "taipei07", "taipei08", "taipei09"], contentText: "艋舺青山宮位於臺北第一街的貴陽街上，1854年地方上發生瘟疫，在當時的泉州移民擔心是妖精作怪，於是奉請青山靈安尊王到艋舺鎮煞。相傳尊王經過西園路時，神輿就無法前行，並指示就地建廟。在平安渡過此劫後，艋舺青山宮成為當地居民重要信仰中心。百年多來一直在此守護著地方。每年在靈安尊王誕辰之際，會舉辦俗稱「艋舺大拜拜」的遶境活動。\n「艋舺大拜拜」活動日程:前兩天於南、北萬華進行暗訪，第三天則為盛大的「正日遶境」。\n近年來在民間文化保存意識抬頭之下，「艋舺青山宮暗訪暨遶境」已於99年登錄為臺北市民俗文化資產。民國109年是青山王來台165週年，廟方也擴大慶典的規模，請來北港媽、白沙屯媽、淡水清水祖師、新莊文武大眾老爺等知名大廟讚境，也與文化總會合作，以「萬華大鬧熱」為主軸，希望能寫下臺灣宗教史上璀璨的一頁。\n活動內容豐富精彩，包含宮廟慶典文物展、暖壽音樂會、傳統民俗市集、大專青年藝陣表演、特色踩街、接駕活動等等。青山王祭不僅保留臺灣傳統特有的廟會文化，亦融合了人文藝術，熱鬧非凡，已成為臺北市特色廟會慶典活動。"))
        ]),
        AlbumSection(sectionTitle: "中部", albums: [
            Album(albumCoverImageName: "ChiayiCover", albumTitle: "嘉義諸羅", albumDate: "2021 / 11", description: "嘉義的地方文化和風俗民情",
                  details: AlbumDetail(images: ["Chiayi01", "Chiayi02", "Chiayi03", "Chiayi04"], contentText: "嘉義地區由於開發甚早故擁有不少歷史古蹟，觀光景點多半與歷史有關，如日本時代建造的嘉義車站、北門車站、檜意森活村、嘉義市立博物館、嘉義市立文化中心、嘉義市文化局交趾陶館、嘉義文化創意產業園區、嘉義市立美術館、嘉義玫瑰花園、嘉義鐵道藝術村、希諾奇台灣檜木博物館、祥太文化館、行嘉吊橋。\n嘉義市也有許多百年的老廟，城隍廟、雙忠廟、仁武宮等，而嘉義公園內有歷史悠久的福康安生祠碑、孔廟等古蹟。\n嘉義市著名的觀光景點有蘭潭泛月、彌陀曉鐘、中央噴水圓環、中央廣場，以及嘉義公園、植物園、嘉義市石頭資料館、二二八紀念公園、嘉義市二二八紀念公園二二八紀念碑（原稱「嘉義市彌陀路二二八紀念碑」）等。\n而著名商圈為文化路夜市，有許多知名的道地小吃。\n另西區最大的北香湖公園，也是著名的觀光景點。其中較具特色有蘭潭與嘉義公園。古稱紅毛埤的蘭潭水庫、蘭潭風景區，為1620年代荷蘭人截八掌溪水入此，所鑿之埤塘，為供水師操戰之用；潭呈葫蘆形，如今為嘉義市水源以及觀光去處，而嘉義紅毛井亦為荷蘭人遺跡。"))
        ]),
        AlbumSection(sectionTitle: "南部", albums: [
            Album(albumCoverImageName: "TainanCover", albumTitle: "古色台南", albumDate: "2020 / 09", description: "台南的古建築與豐富的歷史背景",
                  details: AlbumDetail(images: ["Tainan01", "Tainan02", "Tainan03", "Tainan04", "Tainan05", "Tainan06", "Tainan07", "Tainan08", "Tainan09"], contentText: "臺南市建城歷史可上溯至1620年代，為臺灣最早開發建立之城，也是「臺灣」一名的發源地。臺南市位於北回歸線之南，屬副熱帶季風氣候，全年溫暖少雨，日照時數居全島之冠，平均氣溫24.1℃。\n現今臺南市共37區，轄區原分屬臺灣省轄之臺南市和臺南縣，2010年後合併升格改制為直轄市。\n走進古都臺南，像是踏入一處活歷史，作為臺灣第一處發展的城市，當然也是民生發展的源頭，你能走進全臺首學，驚嘆發揚臺灣教育之地；踏入各大廟宇，探看古今信仰的傳承；漫遊古蹟運河，見證文明故事更迭。在臺南，隨意轉個彎，便與年代久遠的廟宇與古蹟相遇，細數百年的舊城軼事。豐富、平價又美味的臺南小吃說是臺灣一絕也不為過，曾被全球知名旅遊評鑑米其林綠色指南（Michelin Green Guide）列為推薦美食。不論是新鮮清甜的牛肉湯、撒上魚鬆和肉燥的米糕，或者是充滿米香氣的碗粿等，這些在地特有主食與古早味小吃是臺灣飲食文化的根源，也承載了臺南三百多年的歷史記憶。"))
        ]),
        AlbumSection(sectionTitle: "東部", albums: [
            Album(albumCoverImageName: "YilanCover", albumTitle: "海風東北角", albumDate: "2022 / 03", description: "東北角自然美景與海岸線",
                  details: AlbumDetail(images: ["Yilan01", "Yilan02", "Yilan03", "Yilan04", "Yilan05", "Yilan06", "Yilan07"], contentText: "東北角海岸地形以三貂角為界，以北是沉降海岸地形，山脈與海岸線幾成垂直相交，軟硬岩層的分佈幾乎與海岸垂直；在東北季風侵襲與海蝕作用影響下，形成多海岬、海灣及海崖的地形。以南為斷層海岸，山脈與海岸線、東北季風吹向平行，海岸線較平直，多海蝕平台、單面山地形；烏石港以南，則多為沖積平原。\n沿線地形大致分為四段，第一段從南雅到鼻頭角，具有海蝕平台、小型灣岬，海崖近海岸；第二段從鼻頭角到三貂角，多為大型的岬灣地形，像是龍洞灣、龍洞岬、澳底、福隆和卯澳等，其間福隆是沙灘地形；第三段從三貂角的萊萊鼻到頭城北方的北港口，此段地形以海蝕平台、單面山和豆腐岩地形最為顯著；第四段從頭城到蘇澳海濱區大多為平直沙岸，僅蘇澳附近為沉降海岸形成之陸連島及沙頸岬。\n在宜蘭頭城海岸外有一凸出海面之火山島(龜山島)，目前仍殘留有火山活動；將本風景區多元的地貌及多樣的地景豐富地呈現出來，無一不是我們欣賞地質之美的最佳去處。")),
            Album(albumCoverImageName: "TaitungCover", albumTitle: "花東好山好水", albumDate: "2021 / 10", description: "台東的原始山水景色與純樸",
                  details: AlbumDetail(images: ["Taitung01", "Taitung02", "Taitung03", "Taitung04", "Taitung05", "Taitung06", "Taitung07", "Taitung08"], contentText: "花東兩縣位於台灣東部，由於自然環境優美，民風淳樸，環境未受污染，具有獨特的自然及人文景觀，觀光遊憩資源極為豐富。為維護此彌足珍貴之觀光資源與自然生態體系，同時為拓展國民旅遊空間，加速東部地區觀光事業發展，1996年5月30日行政院核定花東縱谷地區劃設為國家級風景特定區，並於1996年9月13日核准設置花東縱谷國家風景區管理處，負責本特定區規劃建設與經營管理，1997年5月1日交通部觀光局花東縱谷國家風景區管理處於瑞穗泛舟服務中心正式揭牌運作。\n花東縱谷線的觀光旅遊活動，最大的特色是體驗東台灣的產業、平野幽谷之風情。由於縱谷線本身所具備之產業、地景、田園、人文、聚落等資源，讓旅途不只可以獲得鄉野休憩的舒適，還可進一步享受知性地、學習性的深刻樂趣。整個花東縱谷沿線景點包括有卑南初鹿地區、鹿野延平地區、關山池上地區、富里玉里地區、瑞穗萬榮地區、光復鳳林地區及吉安壽豐地區等。"))
        ]),
        AlbumSection(sectionTitle: "外島", albums: [
            Album(albumCoverImageName: "MatsuCover", albumTitle: "戰地風情馬祖", albumDate: "2020 / 10", description: "馬祖列島的壯麗風光和軍事歷史",
                  details: AlbumDetail(images: ["Matsu01", "Matsu02", "Matsu03", "Matsu04"], contentText: "馬祖列島就像灑落在太平洋上的一串珍珠，閃耀著質樸而獨特的光芒，東引、北竿、南竿、莒光、等大大小小的小島，有大時代下遺留的戰地風貌，純樸的傳統聚落及生性熱情的島民，都值得您放慢腳步細細品味，感受馬祖絕世而獨立的美喔。\n馬祖現今已脫離軍事管制，而化身為桃源仙境的馬祖，除了到處可見斑駁的戰爭精神標語之外，亦可見自然孕育出的獨特人文風華。因為受到環境氣候影響，靜落於灣澳山坡的傳統民居聚落，與封火山牆的廟宇建築均極具特色。\n自國民政府遷臺後，馬祖因為地理位置的關係，由一個純樸的漁村，突然轉變成了軍事重地。因為其歷史際遇，而塵封長達數十年，直到民國81年戰地政務解除，才於83年開放觀光，形成現今特有的戰地風貌。對海峽兩岸的人來說，馬祖帶著幾許的神祕色彩，這可能是來自過去的戰地政務，也可能是來自海峽兩岸的時、空對峙與隔閡。\n得天獨厚的馬祖，除了有陡峭雄偉的岩岸峭壁，也有美麗平直的沙灘，在北竿有「糖沙」美稱的塘后道沙灘、午沙沙灘、坂里沙灘，在莒光有福正沙灘與坤坵沙灘。而擁有奇岸怪石的西莒菜浦澳與清澈海水的西引清水澳，則是馬祖礫灘的代表。\n離開近岸地區馬祖路域多屬丘陵地區，僅有少數台地，起伏崎嶇蜿蜒的道路，是馬祖各大島嶼的共同特色之一；霧季來臨時，雲霧裊繞變幻，抬首所視皆縹緲，恍如置身太虛之境。"))
        ]),
        AlbumSection(sectionTitle: "綜合", albums: [
            Album(albumCoverImageName: "CatCover", albumTitle: "貓星人", albumDate: "2021 / 11", description: "貓咪們在各種場合的瞬間",
                  details: AlbumDetail(images: ["Cat01", "Cat02", "Cat03", "Cat04", "Cat05", "Cat06", "Cat07"], contentText: "貓星人，那些可愛的生物，它們的每一個瞬間都是如此令人陶醉。從懶洋洋的午睡姿勢，到奇特的搖尾巴的節奏，每個小動作都蘊含著獨特的趣味。這些毛茸茸的生命似乎有著神奇的力量，能夠輕易地融化我們的心，讓我們不禁展開最溫柔的微笑。\n每一隻貓咪都有著令人著迷的個性和魅力。有些可能活潑好動，總是追逐著陽光中的影子；而另一些可能安靜乖巧，靜靜地注視著窗外的風景。無論它們是驚奇地彈跳，還是優雅地舒展，它們的存在總是在不經意間為我們帶來歡笑和安慰。\n這個貓星人相簿，就像是一扇門，將我們引領進入了一個充滿毛茸茸的奇妙世界。在這個世界裡，我們可以透過鏡頭捕捉到每個貓咪的獨特時刻，感受到它們帶來的快樂和幸福。這些可愛的生物，不僅是家中的寵物，更是我們生活中最珍貴的陪伴。\n讓我們一同踏入這個毛茸茸的世界，感受每一個貓星人的迷人風采，並讓這份喜悅和幸福持續綻放。无论它們正在逗趣地玩耍，還是優雅地休息，每個細節都展現了它們的獨特魅力，讓我們沉浸在這份愛的海洋中。")),
            Album(albumCoverImageName: "CoffeeCover", albumTitle: "咖啡隨拍", albumDate: "2021 / 01", description: "咖啡的香醇美味與悠閒的咖啡時光",
                  details: AlbumDetail(images: ["Coffee01", "Coffee02", "Coffee03", "Coffee04", "Coffee05", "Coffee06", "Coffee07", "Coffee08"], contentText: "咖啡，是一種獨特的飲品，能夠以香氣喚醒清晨，又能在疲倦時為我們帶來安慰。咖啡隨拍相簿將帶你深入一個充滿咖啡的世界，讓你沉浸在香濃的美味和獨特的風味之中。從濃縮的黑咖啡，到濃情的拿鐵，再到充滿風味的卡布奇諾，每一杯咖啡都承載著不同的故事和情感，等待著你去品味。\n這個相簿不僅僅是一系列咖啡圖片的集合，更是一段咖啡之旅。透過鏡頭，你將走進咖啡的世界，感受它所帶來的情感和體驗。每一張圖片都像是一個故事的一部分，透露著咖啡文化的多樣性和魅力。\n讓我們一同穿越時光，走入咖啡的世界。這個相簿不僅將帶你品味不同種類的咖啡，更將讓你感受到咖啡的魔力，以及在悠閒的咖啡時光中帶來的喜悅和輕松。無論你是咖啡愛好者還是初次嚐試，這個相簿都將為你打開一扇通往咖啡的大門，讓你沉浸在這個美味和文化之中。"))
        ])
    ]
    
    
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // 設置TableView的delegate和dataSource
        albumTableView.delegate = self
        albumTableView.dataSource = self
    }
    
    /// 點擊選擇照片給profilePictureButton使用 （會先跳出UIAlertController）
    @IBAction func selectProfilePictureTapped(_ sender: UIButton) {
        
        // 建立 actionSheet 警告控制器，讓用戶選擇照片
        let selectPhotoAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // 新增選取大頭照的按鈕（UIAlertAction），點擊後將呼叫 PHPickerViewController 來選擇照片
        let cofirmAction = UIAlertAction(title: "選取大頭照", style: .default) { _ in
            var configuration = PHPickerConfiguration()
            configuration.filter = .images       // filter 只能選取圖片
            configuration.selectionLimit = 1     // 選取數量限制為1
            let imagePicker = PHPickerViewController(configuration: configuration)
            imagePicker.delegate = self
            self.present(imagePicker, animated: true)   // 顯示imagePicker（圖片選擇器）
        }

        // 新增取消按鈕
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        // 將按鈕加入警告控制
        selectPhotoAlertController.addAction(cofirmAction)
        selectPhotoAlertController.addAction(cancelAction)
        // 顯示警告控制
        present(selectPhotoAlertController, animated: true)
    }
    
    
    /// 點擊按鈕連結到外部網站
    @IBAction func openWebPageButtonTapped(_ sender: UIButton) {
        // 建立 alert 警告控制器，讓用戶前往網站
        let webAlertController = UIAlertController(title: "前往網站", message: "是否要前往網站", preferredStyle: .alert)
        
        // 確認，將打開指定的網址
        let confirmAction = UIAlertAction(title: "確認", style: .destructive) { UIAlertAction in
            if let webUrl = URL(string: "https://www.instagram.com/film_wayne/") {
                let webController = SFSafariViewController(url: webUrl)
                self.present(webController, animated: true)
            }
        }
        
        // 取消動作
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        // 將按鈕添加到警告控制器
        webAlertController.addAction(confirmAction)
        webAlertController.addAction(cancelAction)
        // 顯示警告控制器
        present(webAlertController, animated: true)
    }
    
    
    /// 通過 showAlbumDetail segue 來展示選中相簿的詳細內容。通過索引查找相對應的相簿資訊，並傳遞給 AlbumDetailViewController 來顯示該相簿的內容。
    @IBSegueAction func showAlbumDetail(_ coder: NSCoder) -> AlbumDetailViewController? {
        
        // 使用guard let 解包，獲取所選相簿的索引
        guard let indexPath = albumTableView.indexPathForSelectedRow else { return nil }
        
        // 使用索引查找所選相簿
        let selectedAlbum = albumSections[indexPath.section].albums[indexPath.row]
        
        // 創建並返回AlbumDetailViewController的實例，並將所選相簿指派給它
        let contorller = AlbumDetailViewController(coder: coder)
        contorller?.album = selectedAlbum
        
        return contorller
    }
    
}



// 擴展 AlbumHomePageViewController 符合 PHPickerViewControllerDelegate 協議（選取照片相關）
extension AlbumHomePageViewController: PHPickerViewControllerDelegate {
    
    // 當使用者完成圖片選擇後呼叫此方法
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)  // 關閉圖片選擇器（因為我只能夠選一張照片，加強使用方便性）
        
        // 檢查是否有選擇結果
        guard let result = results.first else {
            print("未選取照片")
            return
        }
        
        // 使用 itemProvider 載入 UIImage，練習閉包
        result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
            // 如果載入圖片出現錯誤（基本上不會發生）
            if let error = error {
                print("圖片加載失敗: \(error.localizedDescription)")
                return
            }
            
            // 如果選擇的項目是圖片 (從 itemProvider 加載物件時，得到的物件是一個符合 NSItemProviderReading 協定的型別)
            if let image = object as? UIImage {
                // 在主執行緒更新 UI
                DispatchQueue.main.async {
                    // 將圖片設置為按鈕的背景
                    self.profilePictureButton.setBackgroundImage(image, for: .normal)
                    // 將圖片設置為背景圖片
                    self.backgroundImageView.image = image
                }
            } else {
                print("選擇的項目不是圖片")  // 如果載入的物件不是圖片，則 image 變數將為 nil（基本上不會運行到）
            }
        
        }
    }
}



// 擴展AlbumHomePageViewController類別，實現UITableViewDataSource協議
extension AlbumHomePageViewController: UITableViewDataSource {
    
    // 此方法負責提供表格視圖的cell。每當表格視圖需要顯示一個cell時，就會調用此方法。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 從Storyboard中取得reuseable cell，並將其轉換為AlbumTableViewCell
        // withIdentifier：將 reuse id 定義成 cell 的類別，使用 string interpolation 產生字串 AlbumTableViewCell。（直接輸入字串也ok）
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(AlbumTableViewCell.self)", for: indexPath) as? AlbumTableViewCell else {
            fatalError("Cannot dequeue cell as AlbumTableViewCell")
        }

        // 取得對應section和row的相簿資料
        let album = albumSections[indexPath.section].albums[indexPath.row]
//        print("目前正在處理的 Section 是 \(indexPath.section)，Row 是 \(indexPath.row)")  // 測試觀察用

        // 設置相簿封面
        cell.albumCoverImageView.image = UIImage(named: album.albumCoverImageName)
        // 設置相簿的標題、描述和拍攝日期
        cell.albumTitleLabel.text = album.albumTitle
        cell.albumDescriptionLabel.text = album.description
        cell.albumDateLabel.text = album.albumDate
        
        // 設置cll背景色
        cell.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        // 設置選中cell時的背景色
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1)
        cell.selectedBackgroundView = selectedBackgroundView
        
        return cell
    }
    
    // 返回表格視圖的section數量，即不同地區section的數量（北部、中部、南部、東部、外島、綜合）
    func numberOfSections(in tableView: UITableView) -> Int {
//        print("表格section數量\(albumSections.count)")      // 測試
        return albumSections.count
    }
    
    // 返回給定section的行數，每個section的相簿數量（row數量）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(albumSections[section].albums.count)      // 測試觀察
        
        // 每個section有不同數量的row，允許每個section有不同數量的row（北部section：2）
        return albumSections[section].albums.count
    }
}



// 擴展AlbumHomePageViewController類別，實現UITableViewDelegate協議
extension AlbumHomePageViewController: UITableViewDelegate {
    
    // 當使用者返回到相簿主頁時，之前選中的 cell 將不再處於選中狀態（沒設置的話返回TableView該cell還會是選中的狀態）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // 對 section 標題的自定義設計，包括調整字體、顏色、背景。（用於展示每個區域的名稱）
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

//        print("目前處理的 Section 是 \(section)，標題是 \(albumSections[section].sectionTitle), 該section有\(albumSections[section].albums.count)個row")  // 測試觀察

        // 創建一個自定義的 Header View
        let headerView = UIView()

        // 創建一個 Label 來顯示 section 的標題
        let titleLabel = UILabel()
        titleLabel.text = albumSections[section].sectionTitle   // 設置標題文字為對應 section 的標題
        titleLabel.textColor = .white                           // 設置字體顏色為白色
        titleLabel.font = UIFont(name: "jf-openhuninn-2.0", size: 14)   // 設置字體且大小為 14
        titleLabel.frame = CGRect(x: 16, y: 0, width: tableView.frame.width - 16, height: 45)   // 設置 Label 的位置和大小

        // 將 Label 添加到 Header View 中
        headerView.addSubview(titleLabel)

        return headerView
    }

    // 設定每個 section 標題視圖的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40   // 返回 Header View 的高度為 40
    }
}




// 因為過於雜亂因此拆開來
//// 擴展AlbumHomePageViewController類別，實現UITableViewDelegate和UITableViewDataSource協議（相簿的cell相關）
//extension AlbumHomePageViewController: UITableViewDelegate, UITableViewDataSource {
//
//    // 返回給定indexPath的單元格，每個相簿的具體訊息（封面、標題、描述、日期）
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // 從Storyboard中取得reuseable cell，並將其轉換為AlbumTableViewCell
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as? AlbumTableViewCell else {
//            fatalError("Cannot dequeue cell as AlbumTableViewCell")
//        }
//
//        // 取得對應section和row的相簿資料
//        let album = albumSections[indexPath.section].albums[indexPath.row]
//
//        // 設置相簿封面
//        cell.albumCoverImageView.image = UIImage(named: album.albumCoverImageName)
//        // 設置相簿的標題、描述和拍攝日期
//        cell.albumTitleLabel.text = album.albumTitle
//        cell.albumDescriptionLabel.text = album.description
//        cell.albumDateLabel.text = album.albumDate
//
//        return cell
//    }
//
//    // 返回給定section的標題，用於展示每個區域的名稱
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return albumSections[section].sectionTitle
//    }
//
//    // 返回表格視圖的section數量，即不同地區的數量
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return albumSections.count
//    }
//
//    // 返回給定section的行數，每個section的相簿數量（row數量）
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // 每個section有不同數量的row，允許每個section有不同數量的row
//        return albumSections[section].albums.count
//    }
//
//    /// 當使用者返回到相簿主頁時，之前選中的 cell 將不再處於選中狀態
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//
//    /// 對 section 標題的自定義設計，包括調整字體、顏色、背景
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        // 創建一個自定義的 Header View
//        let headerView = UIView()
//
//        // 創建一個 Label 來顯示 section 的標題
//        let titleLabel = UILabel()
//        titleLabel.text = albumSections[section].sectionTitle   // 設置標題文字為對應 section 的標題
//        titleLabel.textColor = .white                           // 設置字體顏色為白色
//        titleLabel.font = UIFont(name: "jf-openhuninn-2.0", size: 14)   // 設置字體為粗體且大小為 14
//        titleLabel.frame = CGRect(x: 16, y: 0, width: tableView.frame.width - 16, height: 35)   // 設置 Label 的位置和大小
//
//        // 將 Label 添加到 Header View 中
//        headerView.addSubview(titleLabel)
//
//        return headerView
//    }
//
//    // 設定每個 section 標題視圖的高度
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 35   // 返回 Header View 的高度為 35
//    }
//}
