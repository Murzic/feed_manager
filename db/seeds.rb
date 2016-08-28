User.create(email: "admin@fm.md", password: "password")

# Import 3 xml feed files
files_path = File.join File.dirname(__FILE__), "../test/files/" 
xml_feed_1 = File.open(files_path + "/seed_feed_1.xml", 'r')
xml_feed_2 = File.open(files_path + "/seed_feed_2.xml", 'r')
xml_feed_3 = File.open(files_path + "/seed_feed_3.xml", 'r')

FeedImport::XML.new(xml_feed_1).call
FeedImport::XML.new(xml_feed_2).call
FeedImport::XML.new(xml_feed_3).call
