Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696351;
	b=IYEj/Z1Ipt8jD1Gdu98G7lnBlMZuyTZHKXLohvwFm+5WxCE9X9fScwlMrOH/lFNPt2TZ
	 wKO3hmRDxGJUSyU3SKrEbl/OLwcxRHArXxfMT16M0eCSMsCVeQNIdhePdUDb59DWGY1xz
	 Ls3yoUCaLeXNwCMeiWY9H8ag23gfeVuuiDDYUINDGBmKI26HEyiqyfCg7pxDStEIOBQYp
	 pXL5c5+FXymyETfB5Zy83my58I2jWpkmGeLsBQsDjxdwS9JAz974WCfhmK/EapntWNDUW
	 MFqTDWYpWwuC0XeAPJG1K4UUsHy8dKOhY2f+sPBrIwhkh9npmu2Bz1sFKogNYQAO1fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9H0FtVqjAvdxJU4WnvNJ2DEU2rxaugxZZsDOPGa/Ctk=;
	b=hM0I7pC22ApurjbM7aDKOZnff0DfpC9QE/d7m8fD7VwnTLLULE8XYYFB+keg9A0ro3D/
	 30iv98+TTodXQer45/Ced14Ujn3hvseR3gRG9+3RE8nu+0rInOYUY3oNlDXkM4Pkk4/qn
	 npPsM4zOv9eejSzr78iGC9c732DEyZicCs+OXENPoaqp7XBVS57x7aVs3MCYKUUDr3C/u
	 vntwUMrct0phkPDtrNSd97fyV5DqRudbJxmzmpWgU7YphNl9HcwvkNVwLFrGheYhJ9mAw
	 IYNtKiOQUkvjeBUlkYL3/mdoOCirZM7NLHTHkcFF9dq6vwlDKqkVe6RxLZk5Z9ssjug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcaeHEBl;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E383606A32F
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E383606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcaeHEBl
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd8b2b817fdso202574a12.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696351; x=1794301151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H0FtVqjAvdxJU4WnvNJ2DEU2rxaugxZZsDOPGa/Ctk=;
        b=kcaeHEBlahAfRFOHpJG5nN3kXTjsLdubAE7Z8Assz03EP5HUkhLfdcUjvw0CbByQFt
         LxwZtu83AlUeoqF9C8Zqpqp/lodgamacn2ihlsZOSw9c3n4cziTDQW1Ozf3xlLtGAcBP
         zRZDqyYKvGK2xhWVb107p1uYpiO0oPS7Rc3Snd0U2cCLtsF9sSpORTVL2cqh7MqlYTVS
         VMANLrHXzTUI+5nltEAhdlZ39FMGeL+gXFJozPWRYBjd9Jz/AHTKctiGwlf771bi40pY
         6VlrFSapscT5V/2KcduDNAeP2Tnwn2MWVKpUY452i+neW8X2CfePPTxSlZv1TPDKdMiE
         IwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696351; x=1794301151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9H0FtVqjAvdxJU4WnvNJ2DEU2rxaugxZZsDOPGa/Ctk=;
        b=gaCByZFaP6p8NRiEYroVRsmCtY1NV2ERdHuvVhCjnORk1t1vCt/mQnu5T+E3DXcLr7
         6V87trcebm9qswcXtaUtGWuJgWDpfHvYS4ff2vLBdmFclWwDeWV3THPfII3IOGkYSTG1
         4b9CLCl0zq85NBP+0jOwuHwPa3QowsVUlESBIfMStaaGaJ7vIIMPcDsBUYV/aBCZ6qdu
         l4mvcDf9ksryI+WEPJPLlIw+d6MlJyDycnaD4mtJrrPclCm5BVLYI3CfLZVe+Z0yUWcx
         REzY8US8azXHmkou7+tldn8n1Y9WT1CnOnLQO4cOYGJ9IeqK1u9UKNfky878ai0M9NPm
         CTlw==
X-Forwarded-Encrypted: i=1; AKwUvBy9EdyEFXuU7YlpxFbhGTBq9jzqjcEnYCngfcuCD8NVqd+9baKiGYwCYILOot9tEcg0eFUskasMqnnw@vger.kernel.org
X-Gm-Message-State: APuU4Z+D3WrX6NYytN1bcMVw3h9Ei5u1JENZ0DQoooojJ2uXeiauXCAu
	p1C+8Ks2PMiBSY3fu0T0ONdI5HCQzEDXRYfFKteYhQv7uI0Ua+hFr07q
X-Gm-Gg: AYBFou2ZHGls8f1textCtXPGmg0IFIfkj8EpU+udFMMJ/zDp+/G6jmOjFCPZwIlXvKl
	QqAycTBfFE4BX2UIuYW/HbMvWRXHMtsEKpxke97RfKnqsMLXqIy128h5OMDvWOZqLhRnlc1pVXh
	T9Exa4OaCkxWH3lKkwtKJpd5CLl+n4EwE+oqMOkoHhR4bMfwR+QNwKcpF/zPVUSQlfFnN176iFL
	29jX6XH58PqAj4z6y34Oj202e4ECHyYzRovbg/PxMJhFgou5t/eIoirn1ZXAuucbjXv/sO7Szo4
	R57Az94Z/H/k4Gi2yDAlNVG3DlfsVCroM6shojILQfbkhBtPr2V4oFPFOH9A21Ec1oXAdd2ADOw
	BlT1wlo4SwB6ZN5UlDxlsOq9z+y0jlknG7tAmAMQPz3z1okodhg3G8Yl6wI8XypXXsgGQ79V8wn
	aNtglCDTaxjUKznmnsC8UKla3y17uF6cuXucGI/iIKU7JvbZ/UG4XsykypIR/UCnn2hDH4uXL+C
	rCaE+sEG7CGC2VMvmgRD5jAGBOXbXbZbEJI3LxgzUjmV9DZbUt1cmNIO/yOOQ/71sNhzgZZEssU
	8kdeA/GHSzAqwe7Nh1cRkUmzTIpDr1SIzwbGfZnq42Tw7UALhgLeyjsaHGUavSyWCu4wIT3nmcv
	5WOSxH0ORFXk4
X-Received: by 2002:a17:90b:28c7:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3ae897f82c4mr17367231a91.5.1793696350816;
        Tue, 03 Nov 2026 00:59:10 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:10 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 2/3] phy: sophgo: Add USB role switch support for CV18XX/SG200X
Date: Tue,  3 Nov 2026 16:58:46 +0800
Message-ID: <20261103085847.338613-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The USB role of the dwc2 controller on CV18XX/SG200X is selected by the
ID override in the top syscon (offset 0x48, bits 6 and 7). The vendor
kernel switches roles by writing only this override, and dwc2 follows
through its Connector ID status change handling.

The usb-role-switch support in dwc2 does not work on this SoC. It
switches roles through the GOTGCTL session overrides, and clearing
B-valid while the core is a B-device with VBUS present makes
GOTGINT.SesEndDet fire back to back, which hangs the board in the
interrupt handler. This happens on "echo host" and at probe without
role-switch-default-mode.

Register a role switch in the PHY driver when the PHY node has
usb-role-switch, and write only the ID override when the role changes.

There are two ordering details:

 - Set the default role before registering the PHY provider, so dwc2
   already sees the final role when it probes. Otherwise it records the
   role it sees at probe and keeps the interrupt mask of that role.

 - Ignore phy_set_mode() while the role switch is in use, because
   usb_add_hcd() asks for host mode on any controller that has a host
   side, which would override the default role.

The ID has no "unattached" state, so USB_ROLE_NONE selects the default
role.

Move the register write to a helper shared with the set_mode callback,
and update PHY_VBUS_POWER and the ID override in a single write.

Tested on Milk-V Duo 256M with dr_mode = "otg" and a v7.3-rc5 based tree:

  Default peripheral, bare board on a PC, no manual step after boot:
    role device, 0x03000048 = 0x3c0, UDC configured, PC sees 0525:a4a2
    echo host:   role host, 0x03000048 = 0x142
    echo device: role device, 0x03000048 = 0x3c0, UDC configured
    echo none:   role device, 0x03000048 = 0x3c0

  Default host, on the USB & Ethernet IO board, no manual step after boot:
    role host, 0x03000048 = 0x142, the hub enumerates at 3.4 s, a USB
    stick plugged in later shows up as sda

Registers at boot in the host case, before and after this change:

            before        after
  GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
  HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 drivers/phy/sophgo/Kconfig           |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c | 107 +++++++++++++++++++++++++--
 2 files changed, 102 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/sophgo/Kconfig b/drivers/phy/sophgo/Kconfig
index 2c943bbe1f81..055cbcd32891 100644
--- a/drivers/phy/sophgo/Kconfig
+++ b/drivers/phy/sophgo/Kconfig
@@ -10,6 +10,8 @@ config PHY_SOPHGO_CV1800_USB2
 	depends on MFD_SYSCON
 	depends on USB_SUPPORT
 	select GENERIC_PHY
+	select USB_COMMON
+	select USB_ROLE_SWITCH
 	help
 	  Enable this to support the USB 2.0 PHY used with
 	  the DWC2 USB controller in Sophgo CV18XX/SG200X
diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
index 6fe846534e9c..b4c27ab41a6f 100644
--- a/drivers/phy/sophgo/phy-cv1800-usb2.c
+++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
@@ -13,8 +13,11 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
+#include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 
 #define REG_USB_PHY_CTRL		0x048
 
@@ -37,8 +40,93 @@ struct cv1800_usb_phy {
 	struct clk	*usb_lpm_clk;
 	struct clk	*usb_stb_clk;
 	bool		support_otg;
+	struct usb_role_switch	*role_sw;
+	enum usb_role		default_role;
 };
 
+static int cv1800_usb_phy_set_id(struct cv1800_usb_phy *phy, enum usb_role role)
+{
+	unsigned int regval;
+
+	switch (role) {
+	case USB_ROLE_DEVICE:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
+		break;
+	case USB_ROLE_HOST:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST |
+			 PHY_VBUS_POWER;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(phy->syscon, REG_USB_PHY_CTRL,
+				  PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE |
+				  PHY_VBUS_POWER, regval);
+}
+
+static int cv1800_usb_phy_role_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct cv1800_usb_phy *phy = usb_role_switch_get_drvdata(sw);
+
+	if (role == USB_ROLE_NONE)
+		role = phy->default_role;
+
+	return cv1800_usb_phy_set_id(phy, role);
+}
+
+static enum usb_role cv1800_usb_phy_role_get(struct usb_role_switch *sw)
+{
+	struct cv1800_usb_phy *phy = usb_role_switch_get_drvdata(sw);
+	unsigned int val = 0;
+	int ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &val);
+
+	if (ret)
+		return USB_ROLE_NONE;
+
+	if (val & PHY_ID_OVERWRITE_MODE)
+		return USB_ROLE_DEVICE;
+
+	return USB_ROLE_HOST;
+}
+
+static void cv1800_usb_phy_role_unregister(void *data)
+{
+	usb_role_switch_unregister(data);
+}
+
+static int cv1800_usb_phy_setup_role_switch(struct device *dev,
+					    struct cv1800_usb_phy *phy)
+{
+	struct usb_role_switch_desc desc = {
+		.fwnode = dev_fwnode(dev),
+		.set = cv1800_usb_phy_role_set,
+		.get = cv1800_usb_phy_role_get,
+		.allow_userspace_control = true,
+		.driver_data = phy,
+	};
+	int ret;
+
+	if (!device_property_read_bool(dev, "usb-role-switch"))
+		return 0;
+
+	if (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)
+		phy->default_role = USB_ROLE_HOST;
+	else
+		phy->default_role = USB_ROLE_DEVICE;
+
+	ret = cv1800_usb_phy_set_id(phy, phy->default_role);
+	if (ret)
+		return ret;
+
+	phy->role_sw = usb_role_switch_register(dev, &desc);
+	if (IS_ERR(phy->role_sw))
+		return PTR_ERR(phy->role_sw);
+
+	return devm_add_action_or_reset(dev, cv1800_usb_phy_role_unregister,
+					phy->role_sw);
+}
+
 static int cv1800_usb_phy_set_mode(struct phy *_phy,
 				   enum phy_mode mode, int submode)
 {
@@ -46,17 +134,17 @@ static int cv1800_usb_phy_set_mode(struct phy *_phy,
 	unsigned int regval = 0;
 	int ret;
 
+	/* The role switch owns the ID override */
+	if (phy->role_sw)
+		return 0;
+
 	dev_info(&phy->phy->dev, "set mode %d", (int)mode);
 
 	switch (mode) {
 	case PHY_MODE_USB_DEVICE:
-		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
-		regmap_clear_bits(phy->syscon, REG_USB_PHY_CTRL, PHY_VBUS_POWER);
-		break;
+		return cv1800_usb_phy_set_id(phy, USB_ROLE_DEVICE);
 	case PHY_MODE_USB_HOST:
-		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
-		regmap_set_bits(phy->syscon, REG_USB_PHY_CTRL, PHY_VBUS_POWER);
-		break;
+		return cv1800_usb_phy_set_id(phy, USB_ROLE_HOST);
 	case PHY_MODE_USB_OTG:
 		if (!phy->support_otg)
 			return 0;
@@ -107,7 +195,7 @@ static int cv1800_usb_phy_probe(struct platform_device *pdev)
 	if (!parent)
 		return -ENODEV;
 
-	phy = devm_kmalloc(dev, sizeof(*phy), GFP_KERNEL);
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return -ENOMEM;
 
@@ -144,6 +232,11 @@ static int cv1800_usb_phy_probe(struct platform_device *pdev)
 		return ret;
 
 	phy_set_drvdata(phy->phy, phy);
+
+	ret = cv1800_usb_phy_setup_role_switch(dev, phy);
+	if (ret)
+		return ret;
+
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
-- 
2.43.0

