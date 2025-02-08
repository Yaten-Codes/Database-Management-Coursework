# Date updated: 6/13/24

USE sales;

INSERT INTO salesRep VALUES ('123456789', 'Peter', 'Parker', '13100 Whittier Blvd.', 'Whittier', 'CA', '90602');
INSERT INTO salesRep VALUES ('234567890', 'Lynda', 'Carter', '13101 Whittier Blvd', 'Whittier', 'CA', '90602');
INSERT INTO salesRep VALUES ('345678901', 'Buster', 'Crabbe', '231 Penny Lane', 'Utica', 'NY', '13501');
INSERT INTO salesRep VALUES ('456789012', 'George', 'Reeves', '57 Lois Lane', 'Woolstock', 'IA', '50599');
INSERT INTO salesRep VALUES ('567890123', 'Adam', 'West', '1 Mermaid lane', 'Brooklyn', 'NY', '11201');

SELECT * FROM salesRep;

INSERT INTO techSalesRep VALUES ('123456789', 'Peter', 'Parker', '13100 Whittier Blvd.', 'Whittier', 'CA', '90602');
INSERT INTO techSalesRep VALUES ('934567890', 'Gertrude', 'Ederle', '983 Forest Path', 'Stratford', 'NY', '13429');
INSERT INTO techSalesRep VALUES ('945678901', 'Johnny', 'Weissmuller', '342 Treetop Lane', 'Hollywood', 'CA', '90028');
INSERT INTO techSalesRep VALUES ('956789012', 'Sonny', 'Bono', '45 Any Street', 'Palm Springs', 'CA', '92262');
INSERT INTO techSalesRep VALUES ('567890123', 'Adam', 'West', '1 Mermaid lane', 'Brooklyn', 'NY', '11201');

SELECT * FROM techSalesRep;