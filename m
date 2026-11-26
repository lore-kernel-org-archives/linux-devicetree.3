Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702459;
	b=s3Q5eliFeRWDbjutwxfdjsQoBhFlZsdNXSyO/qbIyUebSRsO2GGq4r3l0JdxV2Sex9P4
	 u3ctny+C3AzmP6DBnrrM5SZu3JgOKIHPP6/daUx7asNphTxK1PdfsgFGm0ismg1RbdmB4
	 xXdXQFXId84WMF+E76j2Xkb/ch/A+xQnIta4QPro1mFLBWtlDno6gnbDI08lkZynx3nMt
	 Yh034+MFw5Xy+UvUSmUwUrHOM83DcLFU5eN2KpNJOy4nHry3i731P2kp6HGfDE00xE2z0
	 gYtSfykZAp9w2Pa06SNvzxQJ0t5uRw6d549phVJCYlteXdr6e/REsyNv88LN6sxbTug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702459;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=qVAXqerUP7sbqeSVsjtLE6JO9kSq/GRwAU1fb/UnAj8=;
	b=N0fr0DGUb7WpQ61qPi4L4erkFJFAtRkrvo6j7buqi1jAL7DuSn6v5udgGvFgsujR28T1
	 pKK+dW9jvLeWXWMUC3fF4K2VGbckx6erCJ5WPWyEXobTjUFbGdfSpSqmGOSKiCYgMIfbm
	 yEU2cKZv/idzMTprm8aAyEkZYzleWwHGOAvW0kYieQ3eXyOBCm+N/HXWs/hezPrZbQZOa
	 dTBDTwtqAu3G7o8QgLoFtQ7TcQRLkMgu20YLXP71BJggewABndWcFA137YfoQCK/IDd8w
	 O8m+6D893ovUeMSEnAb4j9QCYbFUGcjKbMNlr/7b06/duSTpxM7BSB0rzWnADJZ0zAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="Arv5g/Zc";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E760606A69C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 14:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E760606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Arv5g/Zc
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 62C594E417A7;
	Thu, 26 Nov 2026 14:14:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 341E6604ED;
	Thu, 26 Nov 2026 14:14:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9EC911E68308;
	Thu, 26 Nov 2026 15:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795702456; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qVAXqerUP7sbqeSVsjtLE6JO9kSq/GRwAU1fb/UnAj8=;
	b=Arv5g/Zc2q7Y0+jNBs9+vNA9VhFMRh6GxMA7CGHYbvqW++2AXQP+GrmfuP0kEhwXNsx+8u
	9iwk9voWrhRB34qryXDWqt28oPtWG+jktsb1ZEP6Hm5wBZxuIzy5+ACuPxw0y2RsJQo9+/
	wcw1san2dwKqCbszPRm4QQRih5uuMlXNrDvifRtMWJAxERixSQzcX257s4j2fC2ODAox4W
	RonbNxoWiTWL8xmLrm6h7LC5Orp7wuFl0aKG7SaUbCHKMnIo7aGl/ONfkIPB7lrZ/XkdsU
	mZmY2bFl2WfiC/0ya516Hbl6bf/NtQ0twIUCj2sCzJsmAaWJ/RTGVY36GfZS3Q==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Thu, 26 Nov 2026 15:13:45 +0100
Subject: [PATCH net-next 3/3] net: dsa: lan9303: add LED mode configuration
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-lan9303-leds-v1-3-a96731317859@bootlin.com>
References: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
In-Reply-To: <20261126-lan9303-leds-v1-0-a96731317859@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Jerry Ray <jerry.ray@microchip.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bo Mellberg <bo.mellberg@se.com>, 
 Pascal Eberhard <pascal.eberhard@se.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795702442; l=5781;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=VkpmakpVMIRR3BKgz/6UzbYCPxlQNuFUuiQRVFARBuQ=;
 b=0sNtOK/KKjYbJb4VQvoDF31FHCevr/ifbLunu1RehpjxCsRRTPJVEVFt2YOWpue6CDsYdBmRT
 cdbox+L6O4UC8f3s13/162ONYl0dVjM48SdmEoTmi5RrIxmzr2rvJVl
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The LED function of the LAN9303 and LAN9354 is selected by a single
LED_FUN field that applies to all six LED pins of the two external
ports.

On some boards the LED straps double as configuration straps for other
functions, such as the PHY address or the EEPROM size, so the desired
LED mode cannot be strapped and has to be programmed by the driver.

The LED subsystem is not used here: it models each LED independently,
while this hardware has one function field for all LEDs.

Read the optional "smsc,led-mode", and configure the device accordingly.

Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>
---
 drivers/net/dsa/lan9303-core.c | 74 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/dsa/lan9303.h    |  8 +++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/lan9303-core.c b/drivers/net/dsa/lan9303-core.c
index 8eeb8953ff24..6a9ade873e42 100644
--- a/drivers/net/dsa/lan9303-core.c
+++ b/drivers/net/dsa/lan9303-core.c
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/mii.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/phy.h>
 #include <linux/if_bridge.h>
 #include <linux/if_vlan.h>
@@ -63,6 +64,13 @@
 #define LAN9303_SWITCH_CSR_CMD_BUSY BIT(31)
 #define LAN9303_SWITCH_CSR_CMD_RW BIT(30)
 #define LAN9303_SWITCH_CSR_CMD_LANES (BIT(19) | BIT(18) | BIT(17) | BIT(16))
+#define LAN9303_LED_CFG 0x6f
+# define LAN9303_LED_CFG_LED_FUN_MAX_VAL 0x7
+# define LAN9303_LED_CFG_LED_FUN_SHIFT 8
+# define LAN9303_LED_CFG_LED_FUN_MASK GENMASK(9, 8)
+# define LAN9303_LED_CFG_LED_MODES GENMASK(3, 0)
+# define LAN9354_LED_CFG_LED_FUN_MASK GENMASK(10, 8)
+# define LAN9354_LED_CFG_LED_MODES (GENMASK(5, 0) | BIT(7))
 #define LAN9303_VIRT_PHY_BASE 0x70
 #define LAN9303_VIRT_SPECIAL_CTRL 0x77
 #define  LAN9303_VIRT_SPECIAL_TURBO BIT(10) /*Turbo MII Enable*/
@@ -240,6 +248,16 @@ static unsigned int flow_ctl_reg[] = {
 	LAN9303_MANUAL_FC_2
 };
 
+static const struct lan9303_led_info lan9303_led_info = {
+	.fun_mask = LAN9303_LED_CFG_LED_FUN_MASK,
+	.avail_modes = LAN9303_LED_CFG_LED_MODES,
+};
+
+static const struct lan9303_led_info lan9354_led_info = {
+	.fun_mask = LAN9354_LED_CFG_LED_FUN_MASK,
+	.avail_modes = LAN9354_LED_CFG_LED_MODES,
+};
+
 static int lan9303_read(struct regmap *regmap, unsigned int offset, u32 *reg)
 {
 	int ret, i;
@@ -778,6 +796,20 @@ static int lan9303_enable_processing_port(struct lan9303 *chip,
 				LAN9303_MAC_TX_CFG_X_TX_ENABLE);
 }
 
+static int lan9303_setup_leds(struct lan9303 *chip)
+{
+	unsigned int val;
+
+	if (chip->led_sel_mode >= 0) {
+		val = chip->led_sel_mode << LAN9303_LED_CFG_LED_FUN_SHIFT;
+
+		return regmap_update_bits(chip->regmap, LAN9303_LED_CFG, chip->led_info->fun_mask,
+					  val);
+	}
+
+	return 0;
+}
+
 /* forward special tagged packets from port 0 to port 1 *or* port 2 */
 static int lan9303_setup_tagging(struct lan9303 *chip)
 {
@@ -902,8 +934,14 @@ static int lan9303_check_device(struct lan9303 *chip)
 		return ret;
 	}
 
-	if (((reg >> 16) != LAN9303_CHIP_ID) &&
-	    ((reg >> 16) != LAN9354_CHIP_ID)) {
+	switch (reg >> 16) {
+	case LAN9303_CHIP_ID:
+		chip->led_info = &lan9303_led_info;
+		break;
+	case LAN9354_CHIP_ID:
+		chip->led_info = &lan9354_led_info;
+		break;
+	default:
 		dev_err(chip->dev, "unexpected device found: LAN%4.4X\n",
 			reg >> 16);
 		return -ENODEV;
@@ -932,6 +970,30 @@ static int lan9303_check_device(struct lan9303 *chip)
 	return 0;
 }
 
+static int lan9303_parse_dt(struct lan9303 *chip)
+{
+	u32 led_mode;
+	int ret;
+
+	if (!device_property_present(chip->dev, "smsc,led-mode")) {
+		chip->led_sel_mode = -1;
+	} else {
+		ret = device_property_read_u32(chip->dev, "smsc,led-mode", &led_mode);
+		if (ret)
+			return ret;
+
+		if (led_mode > LAN9303_LED_CFG_LED_FUN_MAX_VAL ||
+		    !(chip->led_info->avail_modes & BIT(led_mode))) {
+			dev_err(chip->dev, "invalid led mode %u\n", led_mode);
+			return -EINVAL;
+		}
+
+		chip->led_sel_mode = led_mode;
+	}
+
+	return 0;
+}
+
 /* ---------------------------- DSA -----------------------------------*/
 
 static enum dsa_tag_protocol lan9303_get_tag_protocol(struct dsa_switch *ds,
@@ -964,6 +1026,10 @@ static int lan9303_setup(struct dsa_switch *ds)
 		regmap_write(chip->regmap, LAN9303_VIRT_SPECIAL_CTRL, reg);
 	}
 
+	ret = lan9303_setup_leds(chip);
+	if (ret)
+		dev_err(chip->dev, "failed to setup leds %d\n", ret);
+
 	ret = lan9303_setup_tagging(chip);
 	if (ret)
 		dev_err(chip->dev, "failed to setup port tagging %d\n", ret);
@@ -1477,6 +1543,10 @@ int lan9303_probe(struct lan9303 *chip, struct device_node *np)
 	if (ret)
 		return ret;
 
+	ret = lan9303_parse_dt(chip);
+	if (ret)
+		return ret;
+
 	ret = lan9303_register_switch(chip);
 	if (ret) {
 		dev_dbg(chip->dev, "Failed to register switch: %d\n", ret);
diff --git a/include/linux/dsa/lan9303.h b/include/linux/dsa/lan9303.h
index 3ce7cbcc37a3..f0111ad7fb7f 100644
--- a/include/linux/dsa/lan9303.h
+++ b/include/linux/dsa/lan9303.h
@@ -17,6 +17,11 @@ struct lan9303_alr_cache_entry {
 	u8  stp_override;     /* non zero if set LAN9303_ALR_DAT1_AGE_OVERRID */
 };
 
+struct lan9303_led_info {
+	u32 fun_mask;
+	u32 avail_modes;
+};
+
 struct lan9303 {
 	struct device *dev;
 	struct regmap *regmap;
@@ -30,6 +35,9 @@ struct lan9303 {
 	const struct lan9303_phy_ops *ops;
 	bool is_bridged; /* true if port 1 and 2 are bridged */
 
+	const struct lan9303_led_info *led_info;
+	int led_sel_mode;
+
 	/* remember LAN9303_SWE_PORT_STATE while not bridged */
 	u32 swe_port_state;
 	/* LAN9303 do not offer reading specific ALR entry. Cache all

-- 
2.56.1

