/*
 Navicat Premium Dump SQL

 Source Server         : database
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : travel_tribe

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 24/04/2025 22:19:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` int NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `article_user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `article_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `article_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容',
  `article_view_count` int NULL DEFAULT 0 COMMENT '访问量',
  `article_comment_count` int NULL DEFAULT 0 COMMENT '评论数',
  `article_like_count` int NULL DEFAULT 0 COMMENT '点赞数',
  `article_is_comment` int UNSIGNED NULL DEFAULT NULL COMMENT '是否允许评论',
  `article_status` int UNSIGNED NULL DEFAULT 1 COMMENT '状态',
  `article_order` int UNSIGNED NULL DEFAULT NULL COMMENT '排序值',
  `article_update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `article_create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `article_summary` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '摘要',
  `article_thumbnail` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `article_destination` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '目的地',
  `article_startdate` datetime NULL DEFAULT NULL COMMENT '开始日期',
  `article_enddate` datetime NULL DEFAULT NULL COMMENT '结束日期',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 'A Detailed Guide to Amer Fort (Amber Fort), Jaipur\'s Golden Palace', '<p class=\"\">As you catch your first glimpse of Amer Fort sitting perfectly atop the rugged hills of Aravalli, you’ll immediately be swept off your feet. </p><p class=\"\">The Amer Fort (otherwise known as Amber Fort) is a palace like no other. A gorgeous piece of ancient architecture that has stolen the heart of many travellers from around the world, and rightly so.</p><p class=\"\">Becoming more beautiful as time passes, Amer Fort is the perfect fusion of the finest Rajput and Mughal styles of architecture - a <a href=\"https://whc.unesco.org/en/list/247/\" target=\"_blank\">UNESCO World Heritage Site</a> dreamland of pastel-hued sandstone and licks of white marble, enchanting courtyards, gardens to frolic within, intricate archways overhead, flowing serpentine staircases, endless floral patterns adorning the walls, and some seriously good looking gates. </p><p class=\"\">Set 11km on the outskirts of Jaipur, the huge and well-maintained complex overlooks the charming Maota Lake and connects to the impressive Jaigarh Fort through a set of underground tunnels. </p><p class=\"\">With four expansive sections, we suggest you spend a solid 3 hours navigating your way through the maze of exquisite hallways and cobbled paths, admiring every courtyard, opulent royal room and breathtaking view she has to offer.</p><p class=\"\">For those of you planning to visit Amer Fort, this guide will give you everything you need to plan your own visit to one of Jaipur’s most incredible and <a href=\"https://www.thecommonwanderer.com/blog/places-to-visit-jaipur-india\" target=\"_blank\">popular attractions</a>.<img src=\"http://localhost:8090/plugin/layui/images/face/47.gif\" alt=\"[心]\"> </p>', 37, 6, 0, 1, 1, 3, '2025-04-14 09:46:11', '2025-04-14 09:45:26', 'As you catch your first glimpse of Amer Fort sitting perfectly atop the rugged hills of Aravalli, you’ll immediately be swept off your feet. The Amer ', '/img/thumbnail/e104d0e2-c251-44ec-b5e3-a910eb9b40a81744623953642.png', 'Jaipur', '2025-04-14 16:00:00', '2025-04-17 16:00:00');
INSERT INTO `article` VALUES (2, 1, 'The Yan at Broadrayne, Grasmere, Lake District, UK', '<p><span>As a child on holiday in the Lake District, I remember learning to count to ten in the old Cumbrian dialect—the same rhythmic numbers that shepherds have used for generations to tally their flock. “Yan, tan, tethera” is “one, two, three” in the traditional sheep counting system, making “</span><a href=\"https://www.theyan.co.uk/\" target=\"_blank\" rel=\"noreferrer noopener sponsored nofollow\">The Yan</a><span>” a fitting name for a place that aspires to be “The One”. But does The Yan at Broadrayne, a warm and stylish retreat on the edge of Grasmere, live up to its name? Read on to find out.</span></p><p><span>Ahead of our arrival, we were emailed a personalised door code, for&nbsp;the&nbsp;duration of our stay. This allowed us independent access into&nbsp;the&nbsp;resident’s lounge through&nbsp;a small porch, and to our room beyond. As things turned out, on arrival, we were warmly welcomed by Lauren, who guided us through the process and showed us to our room. The check-in felt much more relaxed than a traditional hotel, instantly setting a relaxed and comfortable tone that defined the rest of our stay.</span></p>', 10, 0, 0, 1, 1, 2, '2025-04-14 09:58:08', '2025-04-14 09:58:08', 'As a child on holiday in the Lake District, I remember learning to count to ten in the old Cumbrian dialect—the same rhythmic numbers that shepherds h', '/img/thumbnail/bad51e54-9d8e-4ea1-ae72-25a6ea93070b1744624687480.jpg', 'Lake District, UK', '2025-04-14 16:00:00', '2025-04-16 16:00:00');
INSERT INTO `article` VALUES (3, 1, '17 Tips For First Timers In Africa', '<p>Travelling to Africa for the first time can freak people out. All we seem to know about the place is that it’s a land full of war, disease, poverty and starving children.</p><p>But that’s not really true.</p><p>Africa is a beautiful continent, full of fast developing nations and incredibly rich in culture and diversity. If it’s soon going to be your first time in Africa, it doesn’t matter whether you’re going on safari in&nbsp;<a href=\"https://brenontheroad.com/where-to-stay-in-nairobi-kenya-an-insiders-guide/\" target=\"_blank\" rel=\"noreferrer noopener\">Kenya</a>, doing a road trip through&nbsp;<a href=\"https://brenontheroad.com/accommodation-windhoek-everything-need-know/\" target=\"_blank\" rel=\"noreferrer noopener\">Namibia</a>, exploring&nbsp;<a href=\"https://brenontheroad.com/dar-es-salaam-guide-for-beginners-where-to-stay-what-to-eat-and-when-to-visit/\" data-type=\"page\" data-id=\"28025\">Tanzania</a>, visiting the winding alleys of&nbsp;<a href=\"https://brenontheroad.com/travel-guide-morocco/\" target=\"_blank\" rel=\"noopener noreferrer\">Morocco</a>, or photo bombing the great pyramids of&nbsp;<a href=\"https://brenontheroad.com/pyramids-of-giza-egypt-tour-review/\" data-type=\"post\" data-id=\"28603\">Egypt</a>; it’s surely going to be like no other place you’ve been on earth.</p><p>With that in mind, here’s a few things you’ll need to know before you take that first trip into the motherland.</p><p>After almost a decade of full time travel I can tell you my #1 travel tip is this: Never (ever ever ever ever ever) travel without travel insurance!</p><p>And that advice is x100 when travelling through Africa, especially if it’s your first time!</p><p>Travel insurance usually will cost you between $2 and $5 a day but will literally save you tens of thousands or even hundreds of thousands of dollars in the event of an accident, and possibly even save your life.</p><p><span>If you can’t afford travel insurance, you can’t afford to travel.</span>&nbsp;Put your plans on hold and save for a few more months until you can.</p><p>What happens when you buy travel insurance?</p><p>If your bus crashes and you break a leg, break some ribs, go into a coma, or are going to die, your travel insurance will get you the highest quality care or evacuate you to somewhere that can provide it. If you die, they’ll get the body home for your family. If you’re riding a bike and you smash into someone’s expensive car, they’ll pay for it. If your bag gets lost, you’ll get a few thousand dollars to buy clothes and shoes and toiletries. If you get malaria or dengue and need to spend a week in hospital, it won’t cost you $50,000 like it costs other uninsured (and stupid) travellers. It will cost you nothing.</p><p>Travel insurance is the first thing you should buy before you even book your air ticket or hotel. That way, your trip is covered if you need to cancel! (It’s not covered if you need to cancel and&nbsp;<em>then</em>&nbsp;decide to buy insurance after).</p><p>If you’re looking for a travel insurance provider, I have been using&nbsp;<a href=\"http://www.brenontheroad.com/go/worldnomads\" target=\"_blank\" rel=\"noreferrer noopener\">World Nomads</a>&nbsp;for 10 years and still use them today. They provide coverage for all major destinations in Africa.</p><p>I also have a guide explaining everything you need to know about travel insurance, which I highly recommend you read.&nbsp;<a rel=\"noreferrer noopener\" href=\"https://brenontheroad.com/good-travel-insurance/\" target=\"_blank\">Click here to open the guide in a new tab.</a></p>', 9, 0, 0, 1, 1, 2, '2025-04-14 10:01:27', '2025-04-14 10:01:27', 'Travelling to Africa for the first time can freak people out. All we seem to know about the place is that it’s a land full of war, disease, poverty an', '/img/thumbnail/868b223e-f819-49a0-9dc7-66f075ee69b21744624855203.jpg', 'Africa', '2025-04-14 16:00:00', '2025-04-22 16:00:00');
INSERT INTO `article` VALUES (4, 1, 'Asia travel itinerary: Guide to an amazing journey through the continent', '<h2 id=\"1.+The+ideal+duration+for+an+Asia+travel+itinerary\">1. The ideal duration for an Asia travel itinerary</h2><p>Determining the ideal duration for an&nbsp;<em>Asia travel itinerary</em>&nbsp;depends on various factors, including the choice of countries visited, the time spent in each country, personal preferences, etc.</p><h3 id=\"1.1.+For+spending+time+in+one+region\">1.1. For spending time in one region</h3><p>If you plan to visit one specific region in your&nbsp;<span><a href=\"https://vinpearl.com/en/asia-tours-19-must-visit-destinations-for-travelers\" target=\"_blank\">Asia tours</a></span>, it is recommended to allocate at least 2 - 4 weeks or more. This duration allows an in-depth exploration of cultural nuances, historical sites, and unique experiences, fostering an immersive journey. Additionally, focusing on one region allows you to develop a deeper connection with the local culture and reduce travel time.</p><p>Choosing the destinations for your Asia travel itinerary depends on your region of choice. Below are some favored spots among travelers:</p><ul><li aria-level=\"1\"><span>Southeast Asia:</span>&nbsp;Thailand, Vietnam, The Philippines, Singapore, Cambodia, Indonesia, Laos, Malaysia, Myanmar</li><li aria-level=\"1\"><span>East Asia:&nbsp;</span>China, Japan, South Korea</li><li aria-level=\"1\"><span>South Asia:</span>&nbsp;Bhutan, India, The Maldives, Sri Lanka, Nepal</li><li aria-level=\"1\"><span>Central Asia:</span>&nbsp;Kazakhstan, Kyrgyzstan, Tajikistan, Turkmenistan, Uzbekistan</li></ul><p><ul><li aria-level=\"1\"><span>West Asia:</span>&nbsp;Cyprus, Turkey</li></ul><h3 id=\"1.2.+For+exploring+multiple+regions\">1.2. For exploring multiple regions</h3></p><ul><li aria-level=\"1\"><p>To discover the majority of Asia, you should allocate about 2, 3, or even 6 months. Visiting multiple regions during a single trip offers the advantages of cultural diversity, exposing you to diverse cultures, languages, and traditions. Additionally, this broader exposure boasts various attractions, enhancing the overall depth of your upcoming journey. Below are some recommendations for your Asia travel itinerary:</p><ul><li aria-level=\"1\"><span>East Asia and Central Asia tour:&nbsp;</span>Afghanistan, China, Japan, South Korea, Kazakhstan, Mongolia, Uzbekistan</li><li aria-level=\"1\"><span>Southeast Asia, South Asia, and East Asia tour:&nbsp;</span>Thailand, Vietnam, Singapore, Indonesia, Malaysia, China, Japan, South Korea, Bhutan, India, Nepal</li></ul><p><ul><li aria-level=\"1\"><span>Central Asia and West Asia tour:&nbsp;</span>Turkey, Georgia, Azerbaijan, Armenia, Artsakh, Iran</li></ul><h2 id=\"2.+Recommended+Asia+travel+itineraries+for+different+durations\">2. Recommended Asia travel itineraries for different durations</h2></p><ul><li aria-level=\"1\"><p>To help you plan your Asia travel itinerary, we will suggest some popular&nbsp;<span><a href=\"https://vinpearl.com/en/asia-destinations\" target=\"_blank\">Asia destinations</a></span>&nbsp;based on the duration of the tour. You can make adjustments based on your personal preferences.</p><h3 id=\"2.1.+2-week+Asia+travel+itinerary:+Vietnam+-+Thailand\">2.1. 2-week Asia travel itinerary: Vietnam - Thailand</h3><p>Embarking on a&nbsp;<a href=\"https://vinpearl.com/en/2-week-southeast-asia-itinerary-detailed-plans-for-everyone\" target=\"_blank\"><span>2-week Southeast Asia itinerary</span></a>&nbsp;through Vietnam and Thailand promises an immersive experience.</p><p><span>Week 1:</span>&nbsp;<span><a href=\"https://vinpearl.com/en/vietnam-travel-a-list-of-things-you-need-to-know-before-traveling\" target=\"_blank\">Vietnam travel</a></span></p><ul><li aria-level=\"1\"><span>Day 1-2:&nbsp;<a href=\"https://vinpearl.com/en/hanoi-vietnam-travel-guide\" target=\"_blank\">Hanoi</a></span></li></ul><p>Notable attractions: Hoan Kiem Lake, West Lake, the Temple of Literature, Ho Chi Minh Mausoleum</p><ul><li aria-level=\"1\"><span>Day 3: Ninh Binh</span></li></ul><p>Notable attractions: Trang An Scenic Landscape Complex</p><ul><li aria-level=\"1\"><span>Day 4:&nbsp;<a href=\"https://vinpearl.com/en/ha-long-bay-in-vietnam-the-latest-and-most-detailed-travel-guide\" target=\"_blank\">Ha Long</a></span></li></ul><p>Notable attractions: Tuan Chau Island, Ti Top Beach, Bai Chay Old Town, Quang Ninh Museum</p><ul><li aria-level=\"1\"><span>Day 5-6:&nbsp;<a href=\"https://vinpearl.com/en/da-nang-vietnam\" target=\"_blank\">Da Nang</a></span></li></ul><p>Notable attractions: My Khe Beach, Linh Ung Pagoda, Son Tra Peninsula, Dragon Bridge</p><ul><li aria-level=\"1\"><span>Day 7:&nbsp;<a href=\"https://vinpearl.com/en/hoi-an-vietnam-what-you-should-know-to-prepare-for-a-perfect-excursion\" target=\"_blank\">Hoi An</a></span></li></ul><p>Notable attractions: Japanese Covered Bridge, Tan Ky Ancient House, Fujian Assembly Hall, Quan Cong Temple</p></li></ul></li></ul>', 31, 2, 0, 1, 1, 2, '2025-04-14 10:24:58', '2025-04-14 10:24:58', '1. The ideal duration for an Asia travel itineraryDetermining the ideal duration for an&nbsp;Asia travel itinerary&nbsp;depends on various factors, in', '/img/thumbnail/8471fba2-36fa-4a65-a3c7-78037e634e681744626297041.jpg', 'Asia', '2025-04-14 16:00:00', '2025-04-22 16:00:00');
INSERT INTO `article` VALUES (7, 7, 'A Walk Through Time', '<p class=\"ds-markdown-paragraph\">Kyoto, the ancient capital of Japan, is a mesmerizing blend of history and nature. Strolling through the Fushimi Inari Shrine’s endless red torii gates felt like stepping into a mystical world. The cherry blossoms at Maruyama Park were in full bloom, painting the city in soft pink hues.</p><p class=\"ds-markdown-paragraph\">I also experienced a traditional tea ceremony in a centuries-old wooden tea house. The matcha was bitter yet refreshing, and the host explained the deep cultural significance behind each movement.</p>', 4, 0, 0, 1, 1, 2, '2025-04-23 04:40:34', '2025-04-23 04:40:34', 'Kyoto, the ancient capital of Japan, is a mesmerizing blend of history and nature. Strolling through the Fushimi Inari Shrine’s endless red torii gate', '/img/thumbnail/7bf8f6fb-502b-4c8c-9adc-94a175822a081745383233315.png', 'Kyoto, Japan', '2025-03-31 16:00:00', '2025-04-02 16:00:00');
INSERT INTO `article` VALUES (8, 7, 'Sunsets and Whitewashed Beauty', '<p class=\"ds-markdown-paragraph\"><strong>Highlights:</strong>&nbsp;Caldera Views, Blue-Domed Churches, Volcanic Beaches</p><p class=\"ds-markdown-paragraph\">Santorini’s postcard-perfect scenery took my breath away. The whitewashed buildings with blue domes in Oia contrasted beautifully against the deep blue Aegean Sea. At sunset, the sky turned into a canvas of oranges and pinks, making it a photographer’s dream.</p><p class=\"ds-markdown-paragraph\">I explored the unique volcanic beaches, like Red Beach, where the crimson cliffs met turquoise waters. A boat tour to the volcanic islands included a dip in the hot springs—a surreal experience!</p>', 0, 0, 0, 1, 1, 2, '2025-04-23 04:42:33', '2025-04-23 04:42:33', 'Highlights:&nbsp;Caldera Views, Blue-Domed Churches, Volcanic BeachesSantorini’s postcard-perfect scenery took my breath away. The whitewashed buildin', '/img/thumbnail/5d1d9aa8-5fa9-4c46-a61e-2da35c03ebe21745383352423.png', 'Santorini, Greece', '2025-04-04 16:00:00', '2025-04-09 16:00:00');
INSERT INTO `article` VALUES (9, 7, 'Wilderness Adventure', '<p class=\"ds-markdown-paragraph\"><strong>Highlights:</strong>&nbsp;Lake Louise, Wildlife, Hiking Trails</p><p class=\"ds-markdown-paragraph\">Banff is nature at its finest. The emerald waters of Lake Louise were even more stunning in person, surrounded by snow-capped peaks. I hiked the Plain of Six Glaciers Trail, where I spotted a grizzly bear from a safe distance!</p><p class=\"ds-markdown-paragraph\">The Banff Gondola offered panoramic views of the Rockies, and the hot springs were the perfect way to unwind after a long day of exploration.</p>', 2, 0, 0, 1, 1, 2, '2025-04-23 04:44:53', '2025-04-23 04:44:53', 'Highlights:&nbsp;Lake Louise, Wildlife, Hiking TrailsBanff is nature at its finest. The emerald waters of Lake Louise were even more stunning in perso', '/img/thumbnail/cf37d569-c69c-4dae-9478-5ddd46bb30281745383489898.png', 'Banff, Alberta, Canada', '2025-04-04 16:00:00', '2025-04-05 16:00:00');
INSERT INTO `article` VALUES (10, 7, 'A Feast for the Senses', '<p class=\"ds-markdown-paragraph\"><strong>Duration:</strong>&nbsp;5 Days<br><strong>Best Time to Visit:</strong>&nbsp;October-April</p><h3><strong>Day 1: Jemaa el-Fnaa &amp; Souks</strong></h3><p class=\"ds-markdown-paragraph\">The&nbsp;<strong>Jemaa el-Fnaa square</strong>&nbsp;was electrifying—snake charmers, henna artists, and food stalls filled the space. I got lost in the&nbsp;<strong>souks</strong>, bargaining for spices, leather goods, and lanterns.</p><h3><strong>Day 2: Bahia Palace &amp; Majorelle Garden</strong></h3><p class=\"ds-markdown-paragraph\">The&nbsp;<strong>Bahia Palace</strong>&nbsp;dazzled with intricate mosaics and carved cedar ceilings. The&nbsp;<strong>Majorelle Garden</strong>, once owned by Yves Saint Laurent, was a peaceful oasis of cobalt blue and exotic plants.</p><h3><strong>Day 3: Atlas Mountains &amp; Berber Villages</strong></h3><p class=\"ds-markdown-paragraph\">A&nbsp;<strong>day trip to the Atlas Mountains</strong>&nbsp;included a visit to a&nbsp;<strong>Berber village</strong>, where I shared mint tea with locals and hiked to waterfalls.</p><h3><strong>Day 4: Agafay Desert Camp</strong></h3><p class=\"ds-markdown-paragraph\">An overnight&nbsp;<strong>luxury desert camp</strong>&nbsp;in the Agafay Desert featured camel rides, traditional music, and a sky full of stars.</p>', 0, 0, 0, 1, 1, 2, '2025-04-23 04:50:33', '2025-04-23 04:50:33', 'Duration:&nbsp;5 DaysBest Time to Visit:&nbsp;October-AprilDay 1: Jemaa el-Fnaa &amp; SouksThe&nbsp;Jemaa el-Fnaa square&nbsp;was electrifying—snake c', '/img/thumbnail/dd63c465-5d5a-498c-86be-dfb725c5b11e1745383820963.png', 'Marrakech, Morocco', '2025-04-11 16:00:00', '2025-04-16 16:00:00');
INSERT INTO `article` VALUES (11, 7, 'Trekking at the End of the World', '<p class=\"ds-markdown-paragraph\"><strong>Best Time to Visit:</strong>&nbsp;November-March (Summer)</p><h3><strong>Day 1: Arrival in Puerto Natales</strong></h3><p class=\"ds-markdown-paragraph\">I flew into&nbsp;<strong>Punta Arenas</strong>&nbsp;and took a bus to&nbsp;<strong>Puerto Natales</strong>, the gateway to&nbsp;<strong>Torres del Paine National Park</strong>. After renting gear, I joined a briefing on the famous&nbsp;<strong>\"W Trek.\"</strong></p><h3><strong>Day 2: Trek to Grey Glacier</strong></h3><p class=\"ds-markdown-paragraph\">The first leg of the trek took me to&nbsp;<strong>Grey Glacier</strong>, a massive ice field with floating icebergs. I kayaked near the glacier, listening to the thunderous sounds of ice calving.</p><h3><strong>Day 3: French Valley – The Most Dramatic Hike</strong></h3><p class=\"ds-markdown-paragraph\">The&nbsp;<strong>French Valley</strong>&nbsp;was the highlight—a steep climb led to a panoramic view of jagged peaks and glacial rivers. Condors soared overhead as I ate lunch on a rocky outcrop.</p><h3><strong>Day 4: Base of the Towers</strong></h3><p class=\"ds-markdown-paragraph\">A pre-dawn hike brought me to the&nbsp;<strong>Base of the Towers</strong>, where the three granite spires glowed red at sunrise. The view was worth every grueling step.</p><h3><strong>Day 5: Relaxation at EcoCamp</strong></h3><p class=\"ds-markdown-paragraph\">I stayed at an&nbsp;<strong>EcoCamp</strong>, a geodesic dome with views of the park. At night, I sipped Chilean wine under the clearest Milky Way I’d ever seen.</p><h3><strong>Day 6: Wildlife Spotting – Guanacos &amp; Pumas</strong></h3><p class=\"ds-markdown-paragraph\">A guided safari revealed&nbsp;<strong>guanacos, foxes, and even a puma</strong>&nbsp;stalking its prey. The vast grasslands felt untouched by time.</p><h3><strong>Day 7: Boat Ride to Serrano Glacier</strong></h3><p class=\"ds-markdown-paragraph\">A catamaran took me to&nbsp;<strong>Serrano Glacier</strong>, where I hiked alongside electric-blue icebergs.</p><h3><strong>Day 8: Return to Civilization</strong></h3><p class=\"ds-markdown-paragraph\">I reluctantly left Patagonia, already dreaming of my next adventure here.</p><p class=\"ds-markdown-paragraph\"><strong>Image:</strong>&nbsp;The iconic Torres del Paine peaks at sunrise, reflected in a glacial lake.</p>', 0, 0, 0, 1, 1, 2, '2025-04-23 04:53:30', '2025-04-23 04:53:30', 'Best Time to Visit:&nbsp;November-March (Summer)Day 1: Arrival in Puerto NatalesI flew into&nbsp;Punta Arenas&nbsp;and took a bus to&nbsp;Puerto Natal', '/img/thumbnail/7c9b78bb-8c96-4280-ac71-096967c13c201745384008771.png', 'Torres del Paine, Chile', '2025-04-02 16:00:00', '2025-04-10 16:00:00');
INSERT INTO `article` VALUES (12, 7, 'A Fairytale in Stone', '<p class=\"ds-markdown-paragraph\"><strong>Best Time to Visit:</strong>&nbsp;May-September</p><h3><strong>Day 1: Old Town &amp; Astronomical Clock</strong></h3><p class=\"ds-markdown-paragraph\">I wandered through&nbsp;<strong>Old Town Square</strong>, where the&nbsp;<strong>Astronomical Clock</strong>&nbsp;put on its hourly show. The Gothic&nbsp;<strong>Týn Church</strong>&nbsp;loomed overhead as I sipped a&nbsp;<strong>trdelník (chimney cake)</strong>.</p><h3><strong>Day 2: Charles Bridge &amp; Prague Castle</strong></h3><p class=\"ds-markdown-paragraph\">At dawn, I had&nbsp;<strong>Charles Bridge</strong>&nbsp;almost to myself, with statues of saints lining the way.&nbsp;<strong>Prague Castle</strong>, the largest ancient castle in the world, offered stunning city views.</p><h3><strong>Day 3: Jewish Quarter &amp; Kafka Museum</strong></h3><p class=\"ds-markdown-paragraph\">The&nbsp;<strong>Jewish Quarter</strong>&nbsp;was hauntingly beautiful, with its old cemetery and synagogues. The&nbsp;<strong>Kafka Museum</strong>&nbsp;delved into the writer’s surreal world.</p><h3><strong>Day 4: Day Trip to Kutná Hora</strong></h3><p class=\"ds-markdown-paragraph\">I visited the&nbsp;<strong>Sedlec Ossuary</strong>, a chapel decorated with&nbsp;<strong>40,000 human bones</strong>, and the stunning&nbsp;<strong>St. Barbara’s Cathedral</strong>.</p>', 2, 0, 0, 1, 1, 2, '2025-04-23 04:57:50', '2025-04-23 04:55:11', 'Best Time to Visit:&nbsp;May-SeptemberDay 1: Old Town &amp; Astronomical ClockI wandered through&nbsp;Old Town Square, where the&nbsp;Astronomical Clo', '/img/thumbnail/3b86406e-39f2-45e3-8972-64c7a3b4a5771745384110062.png', 'Prague, Czech Republic', '2025-03-31 16:00:00', '2025-04-04 16:00:00');

-- ----------------------------
-- Table structure for article_category_ref
-- ----------------------------
DROP TABLE IF EXISTS `article_category_ref`;
CREATE TABLE `article_category_ref`  (
  `article_id` int NOT NULL COMMENT '文章ID',
  `category_id` int NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`article_id`, `category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_category_ref
-- ----------------------------
INSERT INTO `article_category_ref` VALUES (1, 1);
INSERT INTO `article_category_ref` VALUES (1, 5);
INSERT INTO `article_category_ref` VALUES (2, 1);
INSERT INTO `article_category_ref` VALUES (2, 6);
INSERT INTO `article_category_ref` VALUES (3, 15);
INSERT INTO `article_category_ref` VALUES (3, 17);
INSERT INTO `article_category_ref` VALUES (4, 100000007);
INSERT INTO `article_category_ref` VALUES (4, 100000008);
INSERT INTO `article_category_ref` VALUES (5, 1);
INSERT INTO `article_category_ref` VALUES (5, 4);
INSERT INTO `article_category_ref` VALUES (6, 1);
INSERT INTO `article_category_ref` VALUES (6, 3);
INSERT INTO `article_category_ref` VALUES (7, 1);
INSERT INTO `article_category_ref` VALUES (7, 3);
INSERT INTO `article_category_ref` VALUES (8, 10);
INSERT INTO `article_category_ref` VALUES (8, 11);
INSERT INTO `article_category_ref` VALUES (9, 1);
INSERT INTO `article_category_ref` VALUES (9, 4);
INSERT INTO `article_category_ref` VALUES (10, 1);
INSERT INTO `article_category_ref` VALUES (10, 4);
INSERT INTO `article_category_ref` VALUES (11, 1);
INSERT INTO `article_category_ref` VALUES (11, 2);
INSERT INTO `article_category_ref` VALUES (12, 1);
INSERT INTO `article_category_ref` VALUES (12, 2);

-- ----------------------------
-- Table structure for article_tag_ref
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_ref`;
CREATE TABLE `article_tag_ref`  (
  `article_id` int NOT NULL COMMENT '文章ID',
  `tag_id` int NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_tag_ref
-- ----------------------------
INSERT INTO `article_tag_ref` VALUES (1, 18);
INSERT INTO `article_tag_ref` VALUES (2, 2);
INSERT INTO `article_tag_ref` VALUES (3, 6);
INSERT INTO `article_tag_ref` VALUES (4, 1);
INSERT INTO `article_tag_ref` VALUES (5, 2);
INSERT INTO `article_tag_ref` VALUES (5, 8);
INSERT INTO `article_tag_ref` VALUES (5, 12);
INSERT INTO `article_tag_ref` VALUES (6, 2);
INSERT INTO `article_tag_ref` VALUES (7, 1);
INSERT INTO `article_tag_ref` VALUES (7, 8);
INSERT INTO `article_tag_ref` VALUES (8, 18);
INSERT INTO `article_tag_ref` VALUES (9, 6);
INSERT INTO `article_tag_ref` VALUES (9, 7);
INSERT INTO `article_tag_ref` VALUES (9, 36);
INSERT INTO `article_tag_ref` VALUES (10, 1);
INSERT INTO `article_tag_ref` VALUES (10, 5);
INSERT INTO `article_tag_ref` VALUES (10, 7);
INSERT INTO `article_tag_ref` VALUES (11, 21);
INSERT INTO `article_tag_ref` VALUES (12, 2);
INSERT INTO `article_tag_ref` VALUES (12, 8);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_pid` int NULL DEFAULT NULL COMMENT '分类父ID',
  `category_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `category_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `category_order` int UNSIGNED NULL DEFAULT 1 COMMENT '排序值',
  `category_icon` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE INDEX `category_name`(`category_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000009 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 0, 'Travel', 'Travel experiences and stories', 1, 'fa fa-coffee');
INSERT INTO `category` VALUES (2, 1, 'Adventure Travel', 'Exciting adventure travel stories', 1, '');
INSERT INTO `category` VALUES (3, 1, 'Solo Travel', 'Experiences of traveling alone', 1, '');
INSERT INTO `category` VALUES (4, 1, 'Family Travel', 'Family vacation stories and tips', 1, '');
INSERT INTO `category` VALUES (5, 1, 'Budget Travel', 'Tips for traveling on a budget', 1, '');
INSERT INTO `category` VALUES (6, 1, 'Luxury Travel', 'High-end travel experiences', 1, '');
INSERT INTO `category` VALUES (7, 1, 'Cultural Travel', 'Cultural immersion experiences', 1, '');
INSERT INTO `category` VALUES (8, 1, 'Road Trips', 'Road trip adventures and routes', 1, '');
INSERT INTO `category` VALUES (9, 1, 'Backpacking', 'Backpacking travel guides', 1, '');
INSERT INTO `category` VALUES (10, 0, 'Destinations', 'Travel destinations worldwide', 1, 'fa fa-cubes');
INSERT INTO `category` VALUES (11, 10, 'Asia', 'Travel experiences in Asia', 1, '');
INSERT INTO `category` VALUES (12, 10, 'Europe', 'Travel experiences in Europe', 1, '');
INSERT INTO `category` VALUES (13, 10, 'North America', 'Travel experiences in North America', 1, '');
INSERT INTO `category` VALUES (14, 10, 'South America', 'Travel experiences in South America', 1, '');
INSERT INTO `category` VALUES (15, 0, 'Travel Tips', 'Useful travel advice and tips', 1, 'fa-snowflake-o fa');
INSERT INTO `category` VALUES (16, 15, 'Packing Guides', 'What to pack for different trips', 1, '');
INSERT INTO `category` VALUES (17, 15, 'Travel Safety', 'Safety tips for travelers', 1, '');
INSERT INTO `category` VALUES (19, 100000000, 'Travel Photography', 'Tips for travel photography', 1, '11');
INSERT INTO `category` VALUES (100000003, 15, 'Travel Gadgets', 'Useful gadgets for travelers', NULL, '');
INSERT INTO `category` VALUES (100000004, 15, 'Local Cuisine', 'Experiencing local foods', NULL, '');
INSERT INTO `category` VALUES (100000005, 15, 'Accommodation', 'Finding places to stay', NULL, '');
INSERT INTO `category` VALUES (100000006, 15, 'Transportation', 'Getting around while traveling', NULL, '');
INSERT INTO `category` VALUES (100000007, 0, 'Planning', 'Planning your perfect trip', NULL, '');
INSERT INTO `category` VALUES (100000008, 100000007, 'Itineraries', 'Sample travel itineraries', NULL, '');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Comment ID',
  `comment_pid` int UNSIGNED NULL DEFAULT 0 COMMENT 'Parent comment ID',
  `comment_pname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Parent comment author name',
  `comment_article_id` int UNSIGNED NOT NULL COMMENT 'Article ID',
  `comment_author_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Comment author name',
  `comment_author_email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Comment author email',
  `comment_author_url` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Comment author homepage',
  `comment_author_avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Comment author avatar',
  `comment_content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Content',
  `comment_agent` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'User agent',
  `comment_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'IP address',
  `comment_create_time` datetime NULL DEFAULT NULL COMMENT 'Comment timestamp',
  `comment_role` int NULL DEFAULT NULL COMMENT 'Role (admin or not)',
  `comment_user_id` int NULL DEFAULT NULL COMMENT 'User ID (nullable)',
  `comment_floor` int NULL DEFAULT NULL COMMENT 'Comment floor',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (115, 0, '', 4, 'Yan Zhao', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '/img/avatar/avatar1.jpg', 'hhhhhh', NULL, '0:0:0:0:0:0:0:1', '2025-04-18 18:23:39', 1, 1, 1);
INSERT INTO `comment` VALUES (116, 0, '', 4, 'Yan Zhao', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '/img/avatar/avatar1.jpg', 'aaaaaaaaaaaaaaaaaaa', NULL, '0:0:0:0:0:0:0:1', '2025-04-18 18:23:49', 1, 1, 2);
INSERT INTO `comment` VALUES (121, 0, '', 1, 'Laura', '18811321306@163.com', '', '/img/thumbnail/ef6d7e7f-9831-4a8f-a276-c2f822e3d9471744188285859.png', 'lalal', NULL, '0:0:0:0:0:0:0:1', '2025-04-23 16:21:33', 0, 7, 1);
INSERT INTO `comment` VALUES (122, 121, 'Laura', 1, 'Yan Zhao', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '/img/avatar/avatar1.jpg', 'good', NULL, '127.0.0.1', '2025-04-23 16:22:15', 1, 1, 1);
INSERT INTO `comment` VALUES (123, 0, '', 1, 'Yan Zhao', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '/img/avatar/avatar1.jpg', 'good', NULL, '127.0.0.1', '2025-04-23 16:22:27', 1, 1, 2);
INSERT INTO `comment` VALUES (124, 0, '', 1, 'Laura', '18811321306@163.com', '', '/img/thumbnail/ef6d7e7f-9831-4a8f-a276-c2f822e3d9471744188285859.png', 'goods', NULL, '0:0:0:0:0:0:0:1', '2025-04-24 14:13:35', 0, 7, 3);
INSERT INTO `comment` VALUES (125, 121, 'Laura', 1, 'Laura', '18811321306@163.com', '', '/img/thumbnail/ef6d7e7f-9831-4a8f-a276-c2f822e3d9471744188285859.png', 'I think so！！！！', NULL, '0:0:0:0:0:0:0:1', '2025-04-24 14:13:55', 0, 7, 2);
INSERT INTO `comment` VALUES (126, 121, 'Laura', 1, 'Laura', '18811321306@163.com', '', '/img/thumbnail/ef6d7e7f-9831-4a8f-a276-c2f822e3d9471744188285859.png', 'lalala', NULL, '0:0:0:0:0:0:0:1', '2025-04-24 14:16:10', 0, 7, 3);

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `link_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `link_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `link_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `link_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像',
  `link_description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `link_owner_nickname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所属人名称',
  `link_owner_contact` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `link_update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `link_create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `link_order` int UNSIGNED NULL DEFAULT 1 COMMENT '排序号',
  `link_status` int UNSIGNED NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`link_id`) USING BTREE,
  UNIQUE INDEX `link_name`(`link_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of link
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '名称',
  `menu_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `menu_level` int NULL DEFAULT NULL COMMENT '等级',
  `menu_icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图标',
  `menu_order` int NULL DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `menu_name`(`menu_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'Better Hotels', '/hotel/search/form', 2, 'fa fa-comment', 1);
INSERT INTO `menu` VALUES (2, 'Archieve', '/articleFile', 2, 'ssss', 3);
INSERT INTO `menu` VALUES (3, 'Profile', '/home/profile', 1, 'fa fa-info', 1);
INSERT INTO `menu` VALUES (4, 'My Travels', '/admin/article', 1, 'fa-list-alt fa', 2);
INSERT INTO `menu` VALUES (5, 'Create Travels', '/admin/article/insert', 1, 'fa fa-link', 3);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `notice_content` varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容',
  `notice_create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `notice_update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `notice_status` int UNSIGNED NULL DEFAULT 1 COMMENT '状态',
  `notice_order` int NULL DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, 'Welcome to TravelTribe', 'Welcome to TravelTribe', NULL, NULL, 1, NULL);
INSERT INTO `notice` VALUES (2, 'Begain Search Travel Ideas!', 'Begain Search Travel Ideas!', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `option_id` int NOT NULL,
  `option_site_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_site_descrption` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_meta_descrption` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_meta_keyword` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_aboutsite_avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_aboutsite_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_aboutsite_content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_aboutsite_wechat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_aboutsite_qq` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_aboutsite_github` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_aboutsite_weibo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_tongji` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `option_status` int NULL DEFAULT 1,
  PRIMARY KEY (`option_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (2, 'TravelTribe', 'A community for travelers', 'Join TravelTribe to explore, share, and connect with global travelers.', 'travel, adventure, backpacking, community, tourism', '/img/img.png', 'Welcome to TravelTribe', 'TravelTribe is your ultimate travel companion, connecting explorers worldwide.', 'TravelTribe_Official', '123456789', 'https://github.com/TravelTribe', 'https://weibo.com/TravelTribe', 'Google Analytics ID: UA-XXXXX-X', 1);

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page`  (
  `page_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自定义页面ID',
  `page_key` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'key',
  `page_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题',
  `page_content` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容',
  `page_create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `page_update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `page_view_count` int UNSIGNED NULL DEFAULT 0 COMMENT '访问量',
  `page_comment_count` int UNSIGNED NULL DEFAULT 0 COMMENT '评论数',
  `page_status` int UNSIGNED NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`page_id`) USING BTREE,
  UNIQUE INDEX `page_key`(`page_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES (1, 'map', 'Site Map', NULL, NULL, NULL, 0, 0, 2);
INSERT INTO `page` VALUES (2, 'articleFile', 'Archieve', NULL, NULL, NULL, 0, 0, 2);
INSERT INTO `page` VALUES (3, 'message', 'Message board', NULL, NULL, NULL, 0, 0, 2);
INSERT INTO `page` VALUES (4, 'applyLink', 'FriendsLink', NULL, NULL, NULL, 0, 0, 2);
INSERT INTO `page` VALUES (5, 'aboutSite', 'About Us', '<h2>关于项目</h2><p>该项目是博主暑假粗略学完&nbsp;<a href=\"https://liuyanzhao.com/tag/ssm/\" title=\"查看与 SSM 相关的文章\" target=\"_blank\">SSM</a>（Spring+SpringMVC+Mybatis）后，开始着手做的一个博客系统。<br>主要涉及的包括 JSP，JSTL，EL表达式，MySQL，Druid连接池，Spring，SpringMVC，MyBatis 等。<br>前端采用Layui框架和扒了一个[网站](http://liuyanzhao.com)的前台样式。通过Maven管理依赖。</p><h2>效果预览</h2><p>预览地址：<a href=\"https://liuyanzhao.com/wp-content/themes/begin/inc/go.php?url=http://blog.liuyanzhao.com\" target=\"_blank\" rel=\"noopener noreferrer\">http://blog.liuyanzhao.com</a></p><p>前台效果图<br><img class=\"alignnone size-large wp-image-6348\" data-original=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/front-1024x608.jpg\" src=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/front-1024x608.jpg\" alt=\"一个简单漂亮的Java博客系统\" width=\"1024\" height=\"608\" srcset=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/front-1024x608.jpg 1024w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/front-300x178.jpg 300w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/front-768x456.jpg 768w\" sizes=\"(max-width: 1024px) 100vw, 1024px\"></p><p>后台效果图<br><img class=\"alignnone size-large wp-image-6349\" data-original=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/back-1024x611.jpg\" src=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/back-1024x611.jpg\" alt=\"一个简单漂亮的Java博客系统\" width=\"1024\" height=\"611\" srcset=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/back-1024x611.jpg 1024w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/back-300x179.jpg 300w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/back-768x458.jpg 768w\" sizes=\"(max-width: 1024px) 100vw, 1024px\"></p><p>&nbsp;</p><p><span>后台地址：/admin 或者 /login</span></p><p><span>用户名为admin，密码为123456</span></p><p>&nbsp;</p><h2>使用注意</h2><p><strong>1、使用IDE导入项目</strong></p><p>将项目即（ForestBlog文件夹）放到 某个位置，用IDE(如Eclipse，IntelliJ IDEA)导入，然后可以在IDE里运行 Tomcat，访问项目。</p><p>因为该项目使用了`Maven`，所有你需要新的IDE需要有Maven插件或者功能，这里就不多介绍了。</p><p><img class=\"size-large wp-image-6350 aligncenter\" data-original=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog-517x1024.jpg\" src=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog-517x1024.jpg\" alt=\"一个简单漂亮的Java博客系统\" width=\"517\" height=\"1024\" srcset=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog-517x1024.jpg 517w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog-151x300.jpg 151w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog.jpg 681w\" sizes=\"(max-width: 517px) 100vw, 517px\"></p><p><strong>2、 导入数据库</strong></p><p>新建数据库 `forest_blog`，导入数据库（即forest_blog.sql）。注意，数据库的编码和排序规则是utf-8和utf-8_general_ci</p><p><img class=\"size-full wp-image-6352 aligncenter\" data-original=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog2.jpg\" src=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog2.jpg\" alt=\"一个简单漂亮的Java博客系统\" width=\"400\" height=\"540\" srcset=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog2.jpg 400w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog2-222x300.jpg 222w\" sizes=\"(max-width: 400px) 100vw, 400px\"></p><p><strong>3、修改项目中的数据库连接信息</strong></p><p>修改&nbsp;`db.properties` 文件，该文件很容易找到，在 src/main/resources 中，注意修改数据库地址、表名、用户名和密码。</p><p><span><strong>如果不修改，会出现无法启动项目</strong></span></p><p>&nbsp;</p><p><strong>4、修改上传文件路径</strong></p><p>该项目中，文件上传是传到本地，且和项目文件夹不在一起，就是说是分离的。比如你的项目是在D盘，你可以修改上传路径到E盘。当然我们访问上传的图片时，需要 &nbsp; 给Tomcat添加静态资源映射，比如访问 localhost:8080/uplaods/1.jpg tomcat可以在你的E盘找到。这个在第5步会说。</p><p>现在是修改上传文件路径，该文件在 src/main/java/com/liuyanzhao/blog/controller/Common/UploadFileController.java</p><p>修改第33行的 `String rootPath =\"/www/uploads/\";` 为你的 uploads 的路径。</p><p><span><strong>如果不修改，会出现无法上传图片</strong></span></p><p>&nbsp;</p><p><strong>5、给uploads文件夹添加静态资源映射</strong></p><p>同第4步，我们已经修改了uploads路径，该路径就要和下面的docBase一致。<br>在 tomcat/conf/server.xml 的 Host 标签内添加如下代码</p><div class=\"dp-highlighter\"><ol class=\"dp-j\" start=\"1\"><li class=\"alt\">&lt;Context&nbsp;path=<span class=\"string\">\"/uploads\"</span>&nbsp;docBase=<span class=\"string\">\"/www/uploads\"</span>&nbsp;debug=<span class=\"string\">\"0\"</span>&nbsp;reloadable=<span class=\"string\">\"true\"</span>&nbsp;/&gt;</li></ol></div><p>对啦，如果你使用的是IDE，需要在该IDE里修改。</p><p>比如 IntelliJ IDEA 是在Tomcat配置中添加</p><p><img class=\"alignnone size-large wp-image-6354\" data-original=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog4-1024x181.jpg\" src=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog4-1024x181.jpg\" alt=\"一个简单漂亮的Java博客系统\" width=\"1024\" height=\"181\" srcset=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog4-1024x181.jpg 1024w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog4-300x53.jpg 300w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog4-768x136.jpg 768w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog4.jpg 1426w\" sizes=\"(max-width: 1024px) 100vw, 1024px\"></p><p><span><strong>如果不修改，会出现uploads的图片无法加载，网页打开有延迟</strong></span></p><p>&nbsp;</p><p><strong>6、修改 Tomcat的首页为该项目</strong></p><p>跟第5步相似</p><p>该项目中的所有根路径都是 / ，没有使用相对路径的 `${pagecontext.request.getcontextpath}` ,因为如何相对路径不存在，该值就会为空字符串，以致 &nbsp; 首页链接我必须改为 / 。<br>所以，你的项目首页应该是 localhost:8080，而不是loclahost:8080/ForestBlog</p><p>所以要在 server.xml 的Host标签内里添加</p><div class=\"dp-highlighter\"><ol class=\"dp-j\" start=\"1\"><li class=\"alt\">&lt;Context&nbsp;path=<span class=\"string\">\"\"</span>&nbsp;docBase=<span class=\"string\">\"/www/server/panel/vhost/tomcat/ForestBlog\"</span>&nbsp;debug=<span class=\"string\">\"0\"</span>&nbsp;reloadable=<span class=\"string\">\"true\"</span>&nbsp;/&gt;</li></ol></div><p>其中path=\"\"表示为首页,即localhost:8080或者127.0.0.1：8080<br>docBase-\"xxx\"是文件路径</p><p><img class=\"size-large wp-image-6355 aligncenter\" data-original=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog5-1024x134.jpg\" src=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog5-1024x134.jpg\" alt=\"一个简单漂亮的Java博客系统\" width=\"1024\" height=\"134\" srcset=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog5-1024x134.jpg 1024w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog5-300x39.jpg 300w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog5-768x101.jpg 768w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog5.jpg 1570w\" sizes=\"(max-width: 1024px) 100vw, 1024px\"></p><p>对啦，如果你使用的是IDE，需要在该IDE里修改。</p><p>比如 IntelliJ IDEA 是在Tomcat配置中添加</p><p><img class=\"alignnone size-large wp-image-6353\" data-original=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog3-1024x321.jpg\" src=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog3-1024x321.jpg\" alt=\"一个简单漂亮的Java博客系统\" width=\"1024\" height=\"321\" srcset=\"https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog3-1024x321.jpg 1024w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog3-300x94.jpg 300w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog3-768x241.jpg 768w, https://media.liuyanzhao.com/wp-content/uploads/2017/10/blog3.jpg 1428w\" sizes=\"(max-width: 1024px) 100vw, 1024px\"></p><p><span><strong>如果不修改，会出现内页很多链接不对</strong></span></p><p>&nbsp;</p><h2>下载地址：</h2><p>Github地址：<a href=\"https://liuyanzhao.com/wp-content/themes/begin/inc/go.php?url=https://github.com/saysky/ForestBlog\" target=\"_blank\" rel=\"noopener noreferrer\">https://github.com/saysky/ForestBlog</a></p><p><em>（如果可以帮忙点一次Star和Fork）</em></p><p>&nbsp;</p><h2>更新</h2><p>上一次更新：2017年10月10日14:02:02</p>', '2017-10-06 23:40:35', '2017-10-10 14:58:12', NULL, NULL, 1);
INSERT INTO `page` VALUES (7, 'hello', '11', '11111111', '2018-12-21 21:46:50', '2018-12-21 21:46:50', NULL, NULL, 1);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tag ID',
  `tag_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Tag name',
  `tag_description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Description',
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `tag_name`(`tag_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'Asia', 'Travel in Asia');
INSERT INTO `tag` VALUES (2, 'Europe', 'Travel in Europe');
INSERT INTO `tag` VALUES (3, 'Americas', 'Travel in Americas');
INSERT INTO `tag` VALUES (4, 'Island', 'Island vacation');
INSERT INTO `tag` VALUES (5, 'City Tour', 'Urban sightseeing');
INSERT INTO `tag` VALUES (6, 'Nature', 'Natural scenery travel');
INSERT INTO `tag` VALUES (7, 'Food Tour', 'Culinary-themed travel');
INSERT INTO `tag` VALUES (8, 'Road Trip', 'Self-drive travel');
INSERT INTO `tag` VALUES (9, 'Backpacking', 'Backpacker travel style');
INSERT INTO `tag` VALUES (10, 'Family Trip', 'Family-friendly travel');
INSERT INTO `tag` VALUES (11, 'Honeymoon', 'Romantic honeymoon travel');
INSERT INTO `tag` VALUES (12, 'Skiing', 'Ski vacation');
INSERT INTO `tag` VALUES (13, 'Diving', 'Scuba diving travel');
INSERT INTO `tag` VALUES (14, 'Hiking', 'Hiking and trekking');
INSERT INTO `tag` VALUES (15, 'Cultural', 'Cultural experience travel');
INSERT INTO `tag` VALUES (16, 'Heritage', 'Historical sites visit');
INSERT INTO `tag` VALUES (17, 'Luxury', 'High-end luxury travel');
INSERT INTO `tag` VALUES (18, 'Budget', 'Budget-friendly travel');
INSERT INTO `tag` VALUES (19, 'Photography', 'Photography-themed travel');
INSERT INTO `tag` VALUES (20, 'Festival', 'Festival and event travel');
INSERT INTO `tag` VALUES (21, 'Wildlife', 'Wildlife watching');
INSERT INTO `tag` VALUES (22, 'Hot Spring', 'Hot spring resort');
INSERT INTO `tag` VALUES (23, 'Cruise', 'Cruise vacation');
INSERT INTO `tag` VALUES (24, 'Adventure', 'Adventure travel');
INSERT INTO `tag` VALUES (25, 'Shopping', 'Shopping-focused travel');
INSERT INTO `tag` VALUES (26, 'Tokyo', 'Travel to Tokyo, Japan');
INSERT INTO `tag` VALUES (27, 'Paris', 'Travel to Paris, France');
INSERT INTO `tag` VALUES (28, 'New York', 'Travel to New York, USA');
INSERT INTO `tag` VALUES (29, 'Bali', 'Travel to Bali, Indonesia');
INSERT INTO `tag` VALUES (30, 'Maldives', 'Travel to Maldives');
INSERT INTO `tag` VALUES (31, 'Disney', 'Disney theme parks');
INSERT INTO `tag` VALUES (32, 'Aurora', 'Northern lights viewing');
INSERT INTO `tag` VALUES (33, 'Mountain', 'Mountain climbing');
INSERT INTO `tag` VALUES (34, 'Wine Tour', 'Wine region travel');
INSERT INTO `tag` VALUES (35, 'B&B', 'Bed and breakfast experience');
INSERT INTO `tag` VALUES (36, 'Train', 'Train journey travel');
INSERT INTO `tag` VALUES (37, 'Volunteer', 'Volunteer travel programs');
INSERT INTO `tag` VALUES (38, 'Eco', 'Eco-friendly travel');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'Username',
  `user_pass` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'Password',
  `user_nickname` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT 'Nickname',
  `user_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'Email',
  `user_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'Personal Homepage',
  `user_avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Avatar',
  `user_last_login_ip` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'Last Login IP',
  `user_register_time` datetime NULL DEFAULT NULL COMMENT 'Registration Time',
  `user_last_login_time` datetime NULL DEFAULT NULL COMMENT 'Last Login Time',
  `user_status` int UNSIGNED NULL DEFAULT 1 COMMENT 'Status',
  `user_role` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'user' COMMENT 'Role',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `user_email`(`user_email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', 'Yan Zhao', 'admin@liuyanzhao.com', 'https://liuyanzhao.com', '/img/avatar/avatar1.jpg', '127.0.0.1', '2017-10-06 21:56:33', '2025-04-23 16:53:32', 1, 'admin');
INSERT INTO `user` VALUES (5, 'wangwu', '123456', 'Wang Wu', 'wangwu@qq.com', NULL, '/img/avatar/avatar.png', '127.0.0.1', '2021-02-25 09:12:33', '2025-04-10 14:21:02', 1, 'user');
INSERT INTO `user` VALUES (2, 'zhangsan', '123456', 'Zhang San', 'zhangsan@china.com', '', '/img/avatar/avatar2.jpeg', '0:0:0:0:0:0:0:1', '2018-11-25 14:45:08', '2021-02-25 10:19:30', 1, 'user');
INSERT INTO `user` VALUES (3, 'youke', '123456', 'Guest', 'youke@aa.com', '', '/img/avatar/avatar3.jpeg', '0:0:0:0:0:0:0:1', '2018-11-25 14:45:08', '2020-04-18 21:41:06', 1, 'user');
INSERT INTO `user` VALUES (4, 'lisi', '123456', 'Li Si', 'lisi@qq.com', '', '/img/avatar/avatar.png', NULL, '2021-02-25 09:11:42', NULL, 1, 'user');
INSERT INTO `user` VALUES (7, '18811321306', '18811321306', 'Laura', '18811321306@163.com', '', '/img/thumbnail/ef6d7e7f-9831-4a8f-a276-c2f822e3d9471744188285859.png', '0:0:0:0:0:0:0:1', '2025-04-03 07:57:58', '2025-04-24 14:10:33', 1, 'user');
INSERT INTO `user` VALUES (8, 'Yim234', '123456', '12334341', '18811321300@163.com', NULL, '/img/avatar/avatar.png', NULL, '2025-04-03 08:01:19', NULL, 1, 'user');
INSERT INTO `user` VALUES (9, '188113', '123456', '12334341', '18811321308@163.com', NULL, '/img/avatar/avatar.png', NULL, '2025-04-03 08:10:23', NULL, 1, 'user');

SET FOREIGN_KEY_CHECKS = 1;
