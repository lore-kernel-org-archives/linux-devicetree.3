Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06583E4C76;
	Thu,  2 Apr 2026 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144701; cv=none; b=j+QR3YJbFTgUY3P1VIe9LxeLhqyHUzwmnQzi0Z9PPNDBeTLpNPsMHMNz3OM7a3iDBZP3A/8RUpJL+MKkZYX5oyJm2AebFkgZk4Q0Ac00JObXLn6ybhhAGsrOOW5fypBfnUJUUtp7CzrRH/ZOymS9BWTzBzpPoYn9P/ldG9qdXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144701; c=relaxed/simple;
	bh=U/7gqGoOOmMua4shiac1Tvm9liDcdDLmvlHK+wio3/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=osOyaxujrcpcQ+U6rE3LiJfSFor2acix+dN+17owCJ4Is1PI1YC3nRSnHES+rAQ4R2hZqF+peRJgz6dF45fDNkzPiz0aRB0dfW+4zcx7X2MuFSG8VyEcJanbhyVbepJJtEtVP5vAPczodUK4lchPaSXqNtzlS257lu+xnNuH9K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=CKB8PAvI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="CKB8PAvI"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 794E526EC7;
	Thu,  2 Apr 2026 17:44:58 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjVukXx3MBXM; Thu,  2 Apr 2026 17:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775144697; bh=U/7gqGoOOmMua4shiac1Tvm9liDcdDLmvlHK+wio3/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CKB8PAvIVve6NA7E8UmTiMYrPs9gcvtINC0GXnKHIIsy4yb56YjoXw1+P81VRE4l0
	 izbZqEPfV7ymJLVDl16KLwmiReDUiC46OwLu0otqWWk/+IwayMMHWLsCb1CpORxtGI
	 LrNhhVupCIlvEVjha8bvMh6EyDUW2DCiTB0tw5mfnIMSFjXHNKpHzKSPVxNBHMt8s6
	 8jCoborVl2RoDpCc7jj5ReCFXHYKlvM5D5MbpDEh/8CRJ0WBTbdRSqRqt0Wx8s/5lB
	 i793LcVWNIFdXlmbS1NXZLHYf+94PvJxMkE6B6PHy1MTlzLgVarNl8QsyKXTypLDr5
	 o5zTieC+qEUwA==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: [PATCH v3 5/6] phy: realtek: usb2: add support for RTL9607C USB2 PHY
Date: Thu,  2 Apr 2026 20:44:13 +0500
Message-ID: <20260402154414.196012-6-adilov@disroot.org>
In-Reply-To: <20260402154414.196012-1-adilov@disroot.org>
References: <20260402154414.196012-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the usb2 phy of RTL9607C series based SoCs.
Add the macros and phy config struct for rtl9607.

RTL9607C requires to clear a "force host disconnect" bit in the
specific register (which is at an offset from reg_wrap_vstatus)
before proceeding with phy parameter writes.

Add the bool variable to the driver data struct and hide this whole
procedure under the if statement that checks this new variable.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 45 ++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 288c8e9e1384..4983dd604b62 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -26,6 +26,12 @@
 #define PHY_VCTRL_SHIFT 8
 #define PHY_REG_DATA_MASK 0xff
 
+#define PHY_9607_VSTS_BUSY BIT(17)
+#define PHY_9607_NEW_REG_REQ BIT(13)
+
+#define PHY_9607_FORCE_DISCONNECT_REG 0x10
+#define PHY_9607_FORCE_DISCONNECT_BIT BIT(5)
+
 #define GET_LOW_NIBBLE(addr) ((addr) & 0x0f)
 #define GET_HIGH_NIBBLE(addr) (((addr) & 0xf0) >> 4)
 
@@ -109,6 +115,7 @@ struct phy_cfg {
 
 	u32 (*read)(void __iomem *reg);
 	void (*write)(u32 val, void __iomem *reg);
+	bool force_host_disconnect;
 };
 
 struct phy_parameter {
@@ -621,6 +628,16 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
 		goto do_toggle;
 	}
 
+	if (phy_cfg->force_host_disconnect) {
+		/* disable force-host-disconnect */
+		u32 temp = readl(phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
+		writel(temp, phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		msleep(10);
+	}
+
 	/* Set page 0 */
 	phy_data_page = phy_cfg->page0;
 	rtk_phy_set_page(phy_reg, 0);
@@ -1386,6 +1403,33 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.write = rtk_usb2phy_write,
 };
 
+static const struct phy_cfg rtl9607_phy_cfg = {
+	.page0_size = MAX_USB_PHY_PAGE0_DATA_SIZE,
+	.page0 = { [0] = {0xe0, 0x95},
+		   [4] = {0xe4, 0x6a},
+		  [12] = {0xf3, 0x31}, },
+	.page1_size = MAX_USB_PHY_PAGE1_DATA_SIZE,
+	.page1 = { [0] = {0xe0, 0x26}, },
+	.page2_size = MAX_USB_PHY_PAGE2_DATA_SIZE,
+	.page2 = { [7] = {0xe7, 0x33}, },
+	.num_phy = 1,
+	.check_efuse_version = CHECK_EFUSE_V2,
+	.efuse_dc_driving_rate = EFUS_USB_DC_CAL_RATE,
+	.dc_driving_mask = 0x1f,
+	.efuse_dc_disconnect_rate = EFUS_USB_DC_DIS_RATE,
+	.dc_disconnect_mask = 0xf,
+	.usb_dc_disconnect_at_page0 = true,
+	.do_toggle = true,
+	.driving_updated_for_dev_dis = 0x8,
+	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0xc,
+	.vstatus_busy = PHY_9607_VSTS_BUSY,
+	.new_reg_req = PHY_9607_NEW_REG_REQ,
+	.read = rtk_usb2phy_read_le,
+	.write = rtk_usb2phy_write_le,
+	.force_host_disconnect = true,
+};
+
 static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1295-usb2phy", .data = &rtd1295_phy_cfg },
 	{ .compatible = "realtek,rtd1312c-usb2phy", .data = &rtd1312c_phy_cfg },
@@ -1396,6 +1440,7 @@ static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1395-usb2phy-2port", .data = &rtd1395_phy_cfg_2port },
 	{ .compatible = "realtek,rtd1619-usb2phy", .data = &rtd1619_phy_cfg },
 	{ .compatible = "realtek,rtd1619b-usb2phy", .data = &rtd1619b_phy_cfg },
+	{ .compatible = "realtek,rtl9607-usb2phy", .data = &rtl9607_phy_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
-- 
2.53.0

