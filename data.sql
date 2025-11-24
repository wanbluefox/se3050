-- Market_Address --

INSERT INTO Market_Address (zip_code, city, state, location_address) VALUES
('55401', 'Minneapolis', 'MN', '123 Pearl St'),
('55120', 'Eagan', 'MN', '123 Jade St'),
('55116', 'St Paul', 'MN', '123 Opal St'),
('55343', 'Edina', 'MN', '123 Diamond St'),
('55303', 'Anoka', 'MN', '123 Emerald St'),
('55014', 'Blaine', 'MN', '123 Sapphire St'),
('55306', 'Burnsville', 'MN', '123 Onyx St'),
('55311', 'Maple Grove', 'MN', '123 Topaz St'),
('56041', 'Brainerd', 'MN', '123 Ruby St'),
('55305', 'Minnetonka', 'MN', '123 Aquamarine St');

-- Markets --

INSERT INTO Markets (name, zip_code, market_date, start_time, end_time, season_start, season_end, description) 
VALUES
('Market of Minneapolis', '55401', '2025-04-01', '06:00:00', '14:00:00', '2025-04-01', '2025-08-31', 'Farmers market in Minneapolis'),
('Market of Eagan', '55120', '2025-05-01', '08:00:00', '18:00:00', '2025-05-01', '2025-09-30', 'Farmers market in Eagan'),
('Market of St Paul', '55116', '2025-05-01', '08:00:00', '16:00:00', '2025-05-01', '2025-09-30', 'Farmers market in St Paul'),
('Market of Edina', '55343', '2025-04-01', '06:00:00', '16:00:00', '2025-04-01', '2025-08-31', 'Farmers market in Edina'),
('Market of Anoka', '55303', '2025-04-01', '10:00:00', '18:00:00', '2025-04-01', '2025-08-31', 'Farmers market in Anoka'),
('Market of Blaine', '55014', '2025-06-01', '08:00:00', '14:00:00', '2025-06-01', '2025-10-31', 'Farmers market in Blaine'),
('Market of Burnsville', '55306', '2025-05-01', '07:00:00', '16:00:00', '2025-05-01', '2025-09-30', 'Farmers market in Burnsville'),
('Market of Maple Grove', '55311', '2025-06-01', '10:00:00', '20:00:00', '2025-06-01', '2025-10-31', 'Farmers market in Maple Grove'),
('Market of Brainerd', '56041', '2025-06-01', '08:00:00', '14:00:00', '2025-06-01', '2025-10-31', 'Farmers market in Brainerd'),
('Market of Minnetonka', '55305', '2025-04-01', '12:00:00', '20:00:00', '2025-04-01', '2025-08-31', 'Farmers market in Minnetonka');


-- Vendors --

INSERT INTO Vendors (business_name, farm_name, email, contact_phone, website, description, logo_url, is_organic_certified)
VALUES
('Minneapolis Farm Goods', 'Minneapolis Farm', 'contact1@minneapolis.com', '612-123-4567', 'https://minneapolisfarm.com', 'Fresh vegetables and fruits from Minneapolis Farm.', 'https://minneapolisfarm.com/logo.png', TRUE),
('Minneapolis Fresh Produce', 'Minneapolis Acres', 'contact2@minneapolis.com', '612-223-4567', 'https://minneapolisacres.com', 'Fresh vegetables and fruits from Minneapolis Acres.', 'https://minneapolisacres.com/logo.png', FALSE),
('Eagan Farm Goods', 'Eagan Farm', 'contact1@eagan.com', '651-323-4567', 'https://eaganfarm.com', 'Fresh vegetables and fruits from Eagan Farm.', 'https://eaganfarm.com/logo.png', FALSE),
('Eagan Fresh Produce', 'Eagan Acres', 'contact2@eagan.com', '651-423-4567', 'https://eaganacres.com', 'Fresh vegetables and fruits from Eagan Acres.', 'https://eaganacres.com/logo.png', TRUE),
('St Paul Farm Goods', 'St Paul Farm', 'contact1@stpaul.com', '651-523-4567', 'https://stpaulfarm.com', 'Fresh vegetables and fruits from St Paul Farm.', 'https://stpaulfarm.com/logo.png', TRUE),
('St Paul Fresh Produce', 'St Paul Acres', 'contact2@stpaul.com', '651-623-4567', 'https://stpaulacres.com', 'Fresh vegetables and fruits from St Paul Acres.', 'https://stpaulacres.com/logo.png', FALSE),
('Edina Farm Goods', 'Edina Farm', 'contact1@edina.com', '952-723-4567', 'https://edinafarm.com', 'Fresh vegetables and fruits from Edina Farm.', 'https://edinafarm.com/logo.png', TRUE),
('Edina Fresh Produce', 'Edina Acres', 'contact2@edina.com', '952-823-4567', 'https://edinaacres.com', 'Fresh vegetables and fruits from Edina Acres.', 'https://edinaacres.com/logo.png', FALSE),
('Anoka Farm Goods', 'Anoka Farm', 'contact1@anoka.com', '763-923-4567', 'https://anokafarm.com', 'Fresh vegetables and fruits from Anoka Farm.', 'https://anokafarm.com/logo.png', TRUE),
('Anoka Fresh Produce', 'Anoka Acres', 'contact2@anoka.com', '763-023-4567', 'https://anokaacres.com', 'Fresh vegetables and fruits from Anoka Acres.', 'https://anokaacres.com/logo.png', TRUE),
('Blaine Farm Goods', 'Blaine Farm', 'contact1@blaine.com', '763-123-4567', 'https://blainefarm.com', 'Fresh vegetables and fruits from Blaine Farm.', 'https://blainefarm.com/logo.png', TRUE),
('Blaine Fresh Produce', 'Blaine Acres', 'contact2@blaine.com', '763-223-4567', 'https://blaineacres.com', 'Fresh vegetables and fruits from Blaine Acres.', 'https://blaineacres.com/logo.png', FALSE),
('Burnsville Farm Goods', 'Burnsville Farm', 'contact1@burnsville.com', '952-323-4567', 'https://burnsvillefarm.com', 'Fresh vegetables and fruits from Burnsville Farm.', 'https://burnsvillefarm.com/logo.png', TRUE),
('Burnsville Fresh Produce', 'Burnsville Acres', 'contact2@burnsville.com', '952-423-4567', 'https://burnsvilleacres.com', 'Fresh vegetables and fruits from Burnsville Acres.', 'https://burnsvilleacres.com/logo.png', TRUE),
('Maple Grove Farm Goods', 'Maple Grove Farm', 'contact1@maplegrove.com', '763-523-4567', 'https://maplegrovefarm.com', 'Fresh vegetables and fruits from Maple Grove Farm.', 'https://maplegrovefarm.com/logo.png', FALSE),
('Maple Grove Fresh Produce', 'Maple Grove Acres', 'contact2@maplegrove.com', '763-623-4567', 'https://maplegroveacres.com', 'Fresh vegetables and fruits from Maple Grove Acres.', 'https://maplegroveacres.com/logo.png', TRUE),
('Brainerd Farm Goods', 'Brainerd Farm', 'contact1@brainerd.com', '218-723-4567', 'https://brainerdfarm.com', 'Fresh vegetables and fruits from Brainerd Farm.', 'https://brainerdfarm.com/logo.png', TRUE),
('Brainerd Fresh Produce', 'Brainerd Acres', 'contact2@brainerd.com', '218-823-4567', 'https://brainerdacres.com', 'Fresh vegetables and fruits from Brainerd Acres.', 'https://brainerdacres.com/logo.png', FALSE),
('Minnetonka Farm Goods', 'Minnetonka Farm', 'contact1@minnetonka.com', '952-523-4567', 'https://minnetonkafarm.com', 'Fresh vegetables and fruits from Minnetonka Farm.', 'https://minnetonkafarm.com/logo.png', FALSE),
('Minnetonka Fresh Produce', 'Minnetonka Acres', 'contact2@minnetonka.com', '952-623-4567', 'https://minnetonkaacres.com', 'Fresh vegetables and fruits from Minnetonka Acres.', 'https://minnetonkaacres.com/logo.png', TRUE);

-- Products --

INSERT INTO Products (vendor_id,name,category,description,unit_type,base_price,image_url,is_seasonal,availability_notes) 
VALUES
(1,'Apples','fruits','Fresh apples from Minneapolis Farm.','lb',2.00,'https://minneapolisfarm.com/images/apples.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(1,'Blueberries','fruits','Fresh blueberries from Minneapolis Farm.','lb',3.00,'https://minneapolisfarm.com/images/blueberries.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(1,'Zucchini','vegetables','Fresh zucchini from Minneapolis Farm.','lb',2.00,'https://minneapolisfarm.com/images/zucchini.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(2,'Cherries','fruits','Fresh cherries from Minneapolis Acres.','lb',3.50,'https://minneapolisacres.com/images/cherries.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(2,'Grapes','fruits','Fresh grapes from Minneapolis Acres.','lb',4.00,'https://minneapolisacres.com/images/grapes.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(2,'Aronia berries','fruits','Fresh Aronia berries from Minneapolis Acres.','lb',4.00,'https://minneapolisacres.com/images/aronia.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(3,'Strawberries','fruits','Fresh strawberries from Eagan Farm.','lb',3.50,'https://eaganfarm.com/images/strawberries.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(3,'Melons','fruits','Fresh melons from Eagan Farm.','each',4.00,'https://eaganfarm.com/images/melons.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(3,'Beans','vegetables','Fresh beans from Eagan Farm.','lb',2.50,'https://eaganfarm.com/images/beans.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(4,'Pears','fruits','Fresh pears from Eagan Acres.','lb',3.00,'https://eaganacres.com/images/pears.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(4,'Plums','fruits','Fresh plums from Eagan Acres.','lb',3.55,'https://eaganacres.com/images/plums.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(4,'Brussels sprouts','vegetables','Fresh Brussels sprouts from Eagan Acres.','lb',3.00,'https://eaganacres.com/images/brussels.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(5,'Raspberries','fruits','Fresh raspberries from St Paul Farm.','lb',4.50,'https://stpaulfarm.com/images/raspberries.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(5,'Rhubarb','vegetables','Fresh rhubarb from St Paul Farm.','lb',3.50,'https://stpaulfarm.com/images/rhubarb.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(5,'Dill','vegetables','Fresh dill from St Paul Farm.','bunch',2.00,'https://stpaulfarm.com/images/dill.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(6,'Asparagus','vegetables','Fresh asparagus from St Paul Acres.','lb',4.00,'https://stpaulacres.com/images/asparagus.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(6,'Beets','vegetables','Fresh beets from St Paul Acres.','lb',2.50,'https://stpaulacres.com/images/beets.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(6,'Honeyberries','fruits','Fresh honeyberries from St Paul Acres.','lb',3.50,'https://stpaulacres.com/images/honeyberries.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(7,'Bok choy','vegetables','Fresh bok choy from Edina Farm.','lb',3.00,'https://edinafarm.com/images/bokchoy.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(7,'Broccoli','vegetables','Fresh broccoli from Edina Farm.','lb',3.00,'https://edinafarm.com/images/broccoli.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(7,'Kohlrabi','vegetables','Fresh kohlrabi from Edina Farm.','lb',3.00,'https://edinafarm.com/images/kohlrabi.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(8,'Cabbage','vegetables','Fresh cabbage from Edina Acres.','lb',2.50,'https://edinaacres.com/images/cabbage.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(8,'Carrots','vegetables','Fresh carrots from Edina Acres.','lb',2.00,'https://edinaacres.com/images/carrots.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(8,'Parsley','vegetables','Fresh parsley from Edina Acres.','bunch',1.50,'https://edinaacres.com/images/parsley.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(9,'Cauliflower','vegetables','Fresh cauliflower from Anoka Farm.','lb',2.50,'https://anokafarm.com/images/cauliflower.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(9,'Celery','vegetables','Fresh celery from Anoka Farm.','lb',2.00,'https://anokafarm.com/images/celery.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(9,'Radicchio','vegetables','Fresh radicchio from Anoka Farm.','lb',3.00,'https://anokafarm.com/images/radicchio.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(10,'Cucumbers','vegetables','Fresh cucumbers from Anoka Acres.','each',1.50,'https://anokaacres.com/images/cucumbers.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(10,'Eggplant','vegetables','Fresh eggplant from Anoka Acres.','lb',3.00,'https://anokaacres.com/images/eggplant.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(10,'Watermelon','fruits','Fresh watermelon from Anoka Acres.','each',5.00,'https://anokaacres.com/images/watermelon.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(11,'Garlic','vegetables','Fresh garlic from Blaine Farm.','lb',3.00,'https://blainefarm.com/images/garlic.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(11,'Kale','vegetables','Fresh kale from Blaine Farm.','bunch',2.50,'https://blainefarm.com/images/kale.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(12,'Leeks','vegetables','Fresh leeks from Blaine Acres.','lb',3.50,'https://blaineacres.com/images/leeks.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(12,'Lettuce','vegetables','Fresh lettuce from Blaine Acres.','each',2.00,'https://blaineacres.com/images/lettuce.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(13,'Mushrooms','vegetables','Fresh mushrooms from Burnsville Farm.','lb',4.00,'https://burnsvillefarm.com/images/mushrooms.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(13,'Onions','vegetables','Fresh onions from Burnsville Farm.','lb',2.50,'https://burnsvillefarm.com/images/onions.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(14,'Parsnips','vegetables','Fresh parsnips from Burnsville Acres.','lb',3.00,'https://burnsvilleacres.com/images/parsnips.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(14,'Peas','vegetables','Fresh peas from Burnsville Acres.','lb',3.00,'https://burnsvilleacres.com/images/peas.png',TRUE,'Available from May 01, 2025 to September 30, 2025.'),
(15,'Peppers','vegetables','Fresh peppers from Maple Grove Farm.','lb',3.50,'https://maplegrovefarm.com/images/peppers.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(15,'Potatoes','vegetables','Fresh potatoes from Maple Grove Farm.','lb',2.00,'https://maplegrovefarm.com/images/potatoes.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(16,'Pumpkins','vegetables','Fresh pumpkins from Maple Grove Acres.','each',5.00,'https://maplegroveacres.com/images/pumpkins.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(16,'Radishes','vegetables','Fresh radishes from Maple Grove Acres.','lb',2.50,'https://maplegroveacres.com/images/radishes.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(17,'Shallots','vegetables','Fresh shallots from Brainerd Farm.','lb',3.50,'https://brainerdfarm.com/images/shallots.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(17,'Spinach','vegetables','Fresh spinach from Brainerd Farm.','bunch',2.50,'https://brainerdfarm.com/images/spinach.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(18,'Sprouts','vegetables','Fresh sprouts from Brainerd Acres.','bunch',2.50,'https://brainerdacres.com/images/sprouts.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(18,'Squash','vegetables','Fresh squash from Brainerd Acres.','lb',2.50,'https://brainerdacres.com/images/squash.png',TRUE,'Available from June 01, 2025 to October 31, 2025.'),
(19,'Sweet corn','vegetables','Fresh sweet corn from Minnetonka Farm.','each',1.00,'https://minnetonkafarm.com/images/sweetcorn.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(19,'Sweet potatoes','vegetables','Fresh sweet potatoes from Minnetonka Farm.','lb',2.50,'https://minnetonkafarm.com/images/sweetpotatoes.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(20,'Tomatoes','vegetables','Fresh tomatoes from Minnetonka Acres.','lb',3.00,'https://minnetonkaacres.com/images/tomatoes.png',TRUE,'Available from April 01, 2025 to August 31, 2025.'),
(20,'Turnips','vegetables','Fresh turnips from Minnetonka Acres.','lb',2.50,'https://minnetonkaacres.com/images/turnips.png',TRUE,'Available from April 01, 2025 to August 31, 2025.');
