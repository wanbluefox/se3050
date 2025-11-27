-- data.sql
USE mn_marketlink;

-- ----------------------------------------------------
-- 1. Market_Address (10 entries)
-- ----------------------------------------------------
INSERT INTO Market_Address (zip_code, city, state, location_address) VALUES
('55101', 'St Paul',    'MN', '123 Main St'),
('55102', 'St Paul',    'MN', '200 Riverfront Dr'),
('55401', 'Minneapolis','MN', '10 Nicollet Mall'),
('55403', 'Minneapolis','MN', '500 Loring Park Dr'),
('55343', 'Hopkins',    'MN', '1 Downtown Plaza'),
('55344', 'Eden Prairie','MN','800 Prairie Center Dr'),
('55116', 'St Paul',    'MN', '210 Highland Pkwy'),
('55082', 'Stillwater', 'MN', '50 River Market Ln'),
('55305', 'St Louis Park','MN','300 Park Commons'),
('55340', 'Maple Grove','MN','700 Arbor Lakes Pkwy');

-- ----------------------------------------------------
-- 2. Markets (10 markets)
-- ----------------------------------------------------
INSERT INTO Markets (name, zip_code, market_date, start_time, end_time,
                     season_start, season_end, description, is_active)
VALUES
('St Paul Downtown Market',       '55101', '2025-07-05', '08:00:00', '13:00:00', '2025-06-01', '2025-10-01', 'Downtown Saturday market', TRUE),
('St Paul Riverfront Market',     '55102', '2025-07-06', '09:00:00', '14:00:00', '2025-06-01', '2025-09-30', 'Sunday riverfront market', TRUE),
('Minneapolis Nicollet Market',   '55401', '2025-07-05', '07:30:00', '12:30:00', '2025-05-15', '2025-10-15', 'Weekday downtown market', TRUE),
('Loring Park Farmers Market',    '55403', '2025-07-07', '15:00:00', '19:00:00', '2025-06-01', '2025-09-15', 'Evening market in the park', TRUE),
('Hopkins Mainstreet Market',     '55343', '2025-07-05', '08:00:00', '12:00:00', '2025-06-10', '2025-09-30', 'Small-town community market', TRUE),
('Eden Prairie Farmers Market',   '55344', '2025-07-08', '16:00:00', '19:30:00', '2025-06-10', '2025-09-20', 'Weeknight family market', TRUE),
('Highland Village Market',       '55116', '2025-07-06', '09:00:00', '13:00:00', '2025-06-15', '2025-09-30', 'Neighborhood-focused market', TRUE),
('Stillwater River Market',       '55082', '2025-07-05', '07:00:00', '12:00:00', '2025-05-25', '2025-10-10', 'Historic riverfront market', TRUE),
('West End Market',               '55305', '2025-07-09', '15:30:00', '19:30:00', '2025-06-01', '2025-09-15', 'After-work stop for commuters', TRUE),
('Maple Grove Town Green Market', '55340', '2025-07-10', '16:00:00', '20:00:00', '2025-06-05', '2025-09-25', 'Suburban evening market with music', TRUE);

-- ----------------------------------------------------
-- 3. Vendors (20 farmers / vendors)
-- ----------------------------------------------------
INSERT INTO Vendors (business_name, farm_name, email, contact_phone, website,
                     description, logo_url, is_organic_certified)
VALUES
('Green Valley Farms',      'Green Valley',         'greenvalley@example.com',   '651-000-0001', 'https://greenvalleyfarm.com',      'Organic vegetables and greens',                        NULL, TRUE),
('Riverbend Orchards',      'Riverbend Orchard',    'riverbend@example.com',     '651-000-0002', 'https://riverbendorchard.com',     'Local apples and seasonal fruit',                      NULL, FALSE),
('Prairie Dairy Co.',       'Prairie Dairy',        'prairiedairy@example.com',  '952-000-0003', 'https://prairiedairy.com',         'Small-batch milk, cheese, and yogurt',                 NULL, TRUE),
('North Star Meats',        'North Star Farm',      'northstar@example.com',     '612-000-0004', 'https://northstarmeats.com',       'Grass-fed beef and pasture-raised pork',               NULL, TRUE),
('Sunrise Bakes',           'Sunrise Bakery',       'sunrisebakes@example.com',  '612-000-0005', 'https://sunrisebakes.com',         'Artisan breads and pastries',                          NULL, FALSE),
('Bloom & Stem Flowers',    'Bloom & Stem',         'bloomstem@example.com',     '952-000-0006', 'https://bloomandstem.com',         'Cut flowers and bouquets',                             NULL, FALSE),
('Valley Honey Co.',        'Valley Apiaries',      'valleyhoney@example.com',   '651-000-0007', 'https://valleyhoney.com',          'Raw honey and beeswax products',                       NULL, FALSE),
('Forest Edge Mushrooms',   'Forest Edge Farm',     'forestedge@example.com',    '612-000-0008', 'https://forestedge.com',           'Gourmet mushrooms',                                    NULL, FALSE),
('River Root CSA',          'River Root Farm',      'riverroot@example.com',     '651-000-0009', 'https://riverrootcsa.com',         'Mixed vegetables CSA shares',                          NULL, TRUE),
('Lakeside Eggs',           'Lakeside Farm',        'lakesideeggs@example.com',  '952-000-0010', 'https://lakesideeggs.com',         'Free-range eggs',                                      NULL, TRUE),
('Cedar Grove Farms',       'Cedar Grove',          'cedargrove@example.com',    '651-000-0011', NULL,                               'Vegetables and herbs',                                 NULL, FALSE),
('Oak Ridge Organics',      'Oak Ridge Farm',       'oakridge@example.com',      '651-000-0012', NULL,                               'Certified organic produce',                            NULL, TRUE),
('Twin Cities Microgreens','TC Microgreens',        'tcmicro@example.com',       '612-000-0013', NULL,                               'Microgreens and sprouts',                              NULL, TRUE),
('Heritage Grain Mill',     'Heritage Grains',      'heritagegrain@example.com', '952-000-0014', NULL,                               'Fresh-milled flour and grains',                        NULL, FALSE),
('Sunny Acres Goat Dairy',  'Sunny Acres',          'sunnyacres@example.com',    '651-000-0015', NULL,                               'Goat cheese and milk',                                 NULL, TRUE),
('Starlight Orchard',       'Starlight Orchard',    'starlight@example.com',     '651-000-0016', NULL,                               'Stone fruit and apples',                               NULL, FALSE),
('Blue Sky Berries',        'Blue Sky Farm',        'bluesky@example.com',       '612-000-0017', NULL,                               'Berries and berry products',                           NULL, FALSE),
('Meadow Lane Herbs',       'Meadow Lane',          'meadowlane@example.com',    '952-000-0018', NULL,                               'Culinary and medicinal herbs',                         NULL, FALSE),
('Northfield Cider Co.',    'Northfield Cider',     'northfieldcider@example.com','507-000-0019',NULL,                               'Small-batch cider and juice (non-alcohol sample data)',NULL, FALSE),
('Prairie Roots Veggies',   'Prairie Roots',        'prairieroots@example.com',  '507-000-0020', NULL,                               'Root vegetables and storage crops',                    NULL, TRUE);

-- ----------------------------------------------------
-- 4. Products (50 unique products: 5 per vendor for vendors 1–10)
-- ----------------------------------------------------
INSERT INTO Products (vendor_id, name, category, description, unit_type,
                      base_price, image_url, is_seasonal, availability_notes)
VALUES
-- Vendor 1: Green Valley Farms
(1, 'Mixed Salad Greens',      'vegetables', 'Fresh mixed lettuces and greens', 'lb',     4.50, NULL, TRUE,  'Best in summer months'),
(1, 'Carrots',                 'vegetables', 'Sweet orange carrots',            'lb',     2.50, NULL, TRUE,  'Available June–October'),
(1, 'Kale Bunch',              'vegetables', 'Curly kale bunch',                'bunch',  3.00, NULL, TRUE,  'Frost tolerant fall crop'),
(1, 'Radishes',                'vegetables', 'Red radish bunches',              'bunch',  2.25, NULL, TRUE,  'Spring and fall only'),
(1, 'Tomatoes',                'vegetables', 'Heirloom tomatoes',               'lb',     5.00, NULL, TRUE,  'High season July–September'),

-- Vendor 2: Riverbend Orchards
(2, 'Honeycrisp Apples',       'fruits',     'Minnesota Honeycrisp apples',     'lb',     3.50, NULL, TRUE,  'Fall harvest'),
(2, 'Apple Cider (quart)',     'fruits',     'Fresh-pressed apple cider',       'each',   5.00, NULL, TRUE,  'Keep refrigerated'),
(2, 'Apple Butter Jar',        'fruits',     'Spiced apple butter spread',      'each',   6.00, NULL, FALSE, 'Shelf-stable'),
(2, 'Pears',                   'fruits',     'Bartlett pears',                  'lb',     3.25, NULL, TRUE,  'Limited quantities'),
(2, 'Dried Apple Rings',       'fruits',     'Dehydrated apple snacks',         'each',   4.75, NULL, FALSE, 'Packaged product'),

-- Vendor 3: Prairie Dairy Co.
(3, 'Whole Milk (half gallon)','dairy',      'Creamline whole milk',           'each',   4.25, NULL, FALSE, 'Returnable glass bottle'),
(3, 'Cheddar Cheese Block',    'dairy',      'Aged cheddar cheese',            'lb',     8.50, NULL, FALSE, 'Farmstead cheese'),
(3, 'Plain Yogurt (quart)',    'dairy',      'Plain whole-milk yogurt',        'each',   5.25, NULL, FALSE, 'Live cultures'),
(3, 'Chocolate Milk (pint)',   'dairy',      'Chocolate-flavored milk',        'each',   2.75, NULL, FALSE, 'Great for kids'),
(3, 'Herb Cheese Spread',      'dairy',      'Soft cheese with herbs',         'each',   6.50, NULL, FALSE, 'Spreadable'),

-- Vendor 4: North Star Meats
(4, 'Ground Beef',             'meat',       'Grass-fed ground beef',          'lb',     9.00, NULL, FALSE, 'Frozen, vacuum-sealed'),
(4, 'Beef Steaks',             'meat',       'Assorted steak cuts',            'lb',    16.00, NULL, FALSE, 'Limited supply'),
(4, 'Pork Chops',              'meat',       'Pasture-raised pork chops',      'lb',    10.50, NULL, FALSE, 'Frozen'),
(4, 'Breakfast Sausage',       'meat',       'Pork breakfast sausage links',   'lb',     8.75, NULL, FALSE, 'Mild seasoning'),
(4, 'Beef Soup Bones',         'meat',       'Bones for stock',                'lb',     4.00, NULL, FALSE, 'Great for broth'),

-- Vendor 5: Sunrise Bakes
(5, 'Sourdough Loaf',          'bakery',     'Naturally leavened sourdough',   'each',   7.00, NULL, FALSE, 'Baked same day'),
(5, 'Cinnamon Rolls (4-pack)', 'bakery',     'Iced cinnamon rolls',            'each',   8.50, NULL, FALSE, 'Contains dairy'),
(5, 'Multigrain Sandwich Bread','bakery',    'Hearty multigrain loaf',         'each',   6.50, NULL, FALSE, 'Slices well'),
(5, 'Blueberry Muffins (4-pack)','bakery',   'Blueberry muffins',              'each',   7.00, NULL, TRUE,  'Blueberry season'),
(5, 'Chocolate Chip Cookies',  'bakery',     'Dozen cookies',                  'dozen',  9.00, NULL, FALSE, 'Family favorite'),

-- Vendor 6: Bloom & Stem Flowers
(6, 'Mixed Flower Bouquet',    'flowers',    'Seasonal mixed bouquet',         'each',  15.00, NULL, TRUE,  'Colors vary weekly'),
(6, 'Sunflower Bunch',         'flowers',    '5-stem sunflower bunch',         'bunch', 10.00, NULL, TRUE,  'Late summer peak'),
(6, 'Tulip Bouquet',           'flowers',    'Spring tulips',                  'bunch', 12.00, NULL, TRUE,  'Spring only'),
(6, 'Dried Flower Wreath',     'flowers',    'Handmade dried wreath',          'each',  25.00, NULL, FALSE, 'Indoor decor'),
(6, 'Small Table Arrangement', 'flowers',    'Mason jar flower arrangement',   'each',  18.00, NULL, TRUE,  'Great for gifts'),

-- Vendor 7: Valley Honey Co.
(7, 'Raw Wildflower Honey (pint)','other',   'Unfiltered wildflower honey',    'each',  10.00, NULL, FALSE, 'Local raw honey'),
(7, 'Raw Wildflower Honey (quart)','other',  'Unfiltered wildflower honey',    'each',  18.00, NULL, FALSE, 'Larger jar'),
(7, 'Honeycomb Slice',         'other',      'Edible honeycomb piece',         'each',   8.00, NULL, FALSE, 'Great on cheese boards'),
(7, 'Beeswax Candles (pair)',  'other',      'Taper candles',                  'each',  12.00, NULL, FALSE, 'Natural beeswax'),
(7, 'Lip Balm',                'other',      'Beeswax lip balm',               'each',   3.50, NULL, FALSE, 'Variety of flavors'),

-- Vendor 8: Forest Edge Mushrooms
(8, 'Oyster Mushrooms',        'vegetables', 'Fresh oyster mushroom clusters', 'lb',    10.00, NULL, TRUE,  'Keep refrigerated'),
(8, 'Shiitake Mushrooms',      'vegetables', 'Fresh shiitake caps',            'lb',    11.50, NULL, TRUE,  'Rich umami flavor'),
(8, 'Lions Mane Mushrooms',    'vegetables', 'Lions mane mushrooms',           'lb',    14.00, NULL, TRUE,  'Limited availability'),
(8, 'Dried Mushroom Mix',      'other',      'Dried mixed mushrooms',          'each',  12.00, NULL, FALSE, 'Great for soups'),
(8, 'Mushroom Grow Kit',       'other',      'Home grow kit',                  'each',  25.00, NULL, FALSE, 'Countertop kit'),

-- Vendor 9: River Root CSA
(9, 'CSA Full Share Box',      'vegetables', 'Weekly box of mixed produce',    'each',  40.00, NULL, TRUE,  'Season-long subscription'),
(9, 'CSA Half Share Box',      'vegetables', 'Smaller weekly box',             'each',  28.00, NULL, TRUE,  'For small households'),
(9, 'Potatoes',                'vegetables', 'Yellow potatoes',                'lb',     2.00, NULL, TRUE,  'Good storage crop'),
(9, 'Onions',                  'vegetables', 'Yellow storage onions',          'lb',     2.25, NULL, TRUE,  'Fall and winter'),
(9, 'Winter Squash',           'vegetables', 'Assorted winter squash',         'lb',     2.75, NULL, TRUE,  'Available Sept–Dec'),

-- Vendor 10: Lakeside Eggs
(10,'Eggs (dozen)',            'dairy',      'Free-range chicken eggs',        'dozen',  6.00, NULL, FALSE, 'Mixed sizes'),
(10,'Eggs (18-pack)',          'dairy',      'Free-range eggs 18-pack',        'each',   8.50, NULL, FALSE, 'Large eggs'),
(10,'Duck Eggs (half dozen)',  'dairy',      'Duck eggs',                      'each',   7.50, NULL, FALSE, 'Richer flavor'),
(10,'Pickled Eggs Jar',        'dairy',      'Jar of pickled eggs',            'each',   9.00, NULL, FALSE, 'Refrigerate after opening'),
(10,'Eggshell Compost Mix',    'other',      'Crushed eggshells for gardens',  'lb',     3.00, NULL, FALSE, 'Soil amendment');

-- ----------------------------------------------------
-- 5. Market_Vendors (sample participation links)
--    (Assumes auto_increment IDs: markets 1–10, vendors 1–10)
-- ----------------------------------------------------
INSERT INTO Market_Vendors (market_id, vendor_id, setup_location, expected_arrival_time,
                            special_requests, is_confirmed)
VALUES
(1, 1, 'Booth A1', '07:30:00', NULL, TRUE),
(1, 2, 'Booth A2', '07:30:00', NULL, TRUE),
(1, 3, 'Booth B1', '07:15:00', NULL, TRUE),
(2, 4, 'Booth C1', '08:30:00', NULL, TRUE),
(2, 5, 'Booth C2', '08:45:00', 'Near bakery row', TRUE),
(3, 6, 'Booth D1', '07:00:00', NULL, TRUE),
(3, 7, 'Booth D2', '07:00:00', NULL, TRUE),
(4, 8, 'Booth E1', '14:30:00', NULL, TRUE),
(5, 9, 'Booth F1', '07:30:00', NULL, TRUE),
(6,10, 'Booth G1', '15:30:00', NULL, TRUE);

-- ----------------------------------------------------
-- 6. Customers (a few example customers)
-- ----------------------------------------------------
INSERT INTO Customers (first_name, last_name, email, phone, preferred_pickup_market)
VALUES
('Alice',  'Johnson', 'alice.johnson@example.com', '651-111-1111', 1),
('Brian',  'Lee',     'brian.lee@example.com',     '612-222-2222', 3),
('Carla',  'Nguyen',  'carla.nguyen@example.com',  '952-333-3333', 2),
('David',  'Smith',   'david.smith@example.com',   '612-444-4444', 1),
('Elena',  'Garcia',  'elena.garcia@example.com',  '651-555-5555', 8);

-- ----------------------------------------------------
-- 7. Orders and Order_Items (sample pre-orders)
-- ----------------------------------------------------

-- Orders
INSERT INTO Orders (customer_id, market_vendor_id, pickup_date, status, payment_status, special_instructions)
VALUES
(1, 1, '2025-07-05', 'confirmed', 'paid',  'Please pack greens separately.'),
(2, 3, '2025-07-05', 'ready',     'paid',  'Customer will arrive early.'),
(3, 5, '2025-07-06', 'pending',   'pending', NULL),
(4, 7, '2025-07-05', 'confirmed', 'paid',  NULL),
(5, 8, '2025-07-07', 'pending',   'pending', 'First-time customer.');

-- Order_Items
-- Assume product_ids from earlier inserts:
-- (just examples; adjust IDs if needed after running SELECT * FROM Products)
INSERT INTO Order_Items (order_id, product_id, quantity, unit_price, subtotal, notes)
VALUES
(1, 1,  2, 4.50,  9.00,  'Two pounds of salad greens'),
(1, 2,  3, 2.50,  7.50,  'Carrots for roasting'),
(2, 11, 1, 4.25,  4.25,  'Half gallon whole milk'),
(2, 12, 1, 8.50,  8.50,  'Cheddar block'),
(3, 21, 1, 7.00,  7.00,  'One sourdough loaf'),
(4, 31, 1,10.00, 10.00,  'Raw honey pint'),
(5, 36, 1,12.00, 12.00,  'Dried mushroom mix');

