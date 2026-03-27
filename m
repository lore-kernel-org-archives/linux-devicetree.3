Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947B034104B;
	Fri, 27 Mar 2026 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627661; cv=none; b=lDZfecT97mxWCTWweKHOmbN+yRJbI05wIL3yA7CadCtmbDYu4Hj9aIveUn2tf0BdRxs2/TsRIGyc/1iq4FX6z2M+8CJ+o5PuIijy8I418KulXcDWAQ30cc6kz4njgaOwl2ry6eXeuxTC0A5Ygq56VfF4AjuzhYEZHCDWkXb8Br0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627661; c=relaxed/simple;
	bh=QaMxN5JIjzz6HwV6IhF0gYp+uTretPZBpdnTbCTSpv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyoA//1GQtux1qvp0TNDLZpvR2S6wCJ1ppPZO/gSRVd4hXfgBO6TYjlP+lU0GKMlRNgb96vCau5ETSZhhvvrFK3rzhfsFNvKGAq+cHpuIs+PTf/eWi45+aVs8bc4N00Fsg9CR5UuGVsZoXaDV1zNKYU/F98neY6U0R0mLJANQUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=OW0penBq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="OW0penBq"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 39B1E271DA;
	Fri, 27 Mar 2026 17:07:38 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X1Hts-iyLWmi; Fri, 27 Mar 2026 17:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774627650; bh=QaMxN5JIjzz6HwV6IhF0gYp+uTretPZBpdnTbCTSpv0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OW0penBqkLvztX9fUafhonQiKKJoXJioTTo+jJLvVm+drvgI5c36ieTIGZg25phBg
	 zrDVlPqO7JF902A8bSuV+he5nirS62bM8xXxbbwnH3t7v9yg5FRgPb5nnuy5hvYxzv
	 To5qbsuE68EwcDvqXhr7Atlmq1/iAB4kt/uiskbRD4XYp6WezDrwkCSLL+MsknRpxW
	 8wSAbjADHJ9fOGpQ2HYf98aKD7H5SksfUGgEtDdr7VMZLvAVTKDxOQcWDs/4OE/HD+
	 OsP6Xp4bX6i9NHTU+Pu5jiMBN8JqiLnOUUcWz57ndmCq+XdQDGY1qBH40EG1XkqWiR
	 +c62QATOIVDkA==
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
Subject: [PATCH v2 5/6] phy: realtek: usb2: add support for RTL9607C USB2 PHY
Date: Fri, 27 Mar 2026 21:06:37 +0500
Message-ID: <20260327160638.15134-6-adilov@disroot.org>
In-Reply-To: <20260327160638.15134-1-adilov@disroot.org>
References: <20260327160638.15134-1-adilov@disroot.org>
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
 drivers/phy/realtek/phy-rtk-usb2.c | 57 ++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 070cba1e0e0a..bf22d12681dc 100644
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
@@ -614,6 +621,16 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
 		goto do_toggle;
 	}
 
+	if (phy_cfg->force_host_disconnect) {
+		/* disable force-host-disconnect */
+		u32 temp = readl(phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
+		writel(temp, phy_reg->reg_wrap_vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		mdelay(10);
+	}
+
 	/* Set page 0 */
 	phy_data_page = phy_cfg->page0;
 	rtk_phy_set_page(phy_reg, 0);
@@ -1141,6 +1158,7 @@ static const struct phy_cfg rtd1295_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg = {
@@ -1170,6 +1188,7 @@ static const struct phy_cfg rtd1395_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg_2port = {
@@ -1199,6 +1218,7 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1619_phy_cfg = {
@@ -1226,6 +1246,7 @@ static const struct phy_cfg rtd1619_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1319_phy_cfg = {
@@ -1257,6 +1278,7 @@ static const struct phy_cfg rtd1319_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1312c_phy_cfg = {
@@ -1287,6 +1309,7 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1619b_phy_cfg = {
@@ -1317,6 +1340,7 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1319d_phy_cfg = {
@@ -1347,6 +1371,7 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
 };
 
 static const struct phy_cfg rtd1315e_phy_cfg = {
@@ -1378,6 +1403,37 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.new_reg_req = PHY_NEW_REG_REQ,
 	.read = phy_read,
 	.write = phy_write,
+	.force_host_disconnect = false,
+};
+
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
+	.check_efuse = false,
+	.check_efuse_version = CHECK_EFUSE_V2,
+	.efuse_dc_driving_rate = EFUS_USB_DC_CAL_RATE,
+	.dc_driving_mask = 0x1f,
+	.efuse_dc_disconnect_rate = EFUS_USB_DC_DIS_RATE,
+	.dc_disconnect_mask = 0xf,
+	.usb_dc_disconnect_at_page0 = true,
+	.do_toggle = true,
+	.do_toggle_driving = false,
+	.driving_updated_for_dev_dis = 0x8,
+	.use_default_parameter = false,
+	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0xc,
+	.vstatus_busy = PHY_9607_VSTS_BUSY,
+	.new_reg_req = PHY_9607_NEW_REG_REQ,
+	.read = phy_read_le,
+	.write = phy_write_le,
+	.force_host_disconnect = true,
 };
 
 static const struct of_device_id usbphy_rtk_dt_match[] = {
@@ -1390,6 +1446,7 @@ static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1395-usb2phy-2port", .data = &rtd1395_phy_cfg_2port },
 	{ .compatible = "realtek,rtd1619-usb2phy", .data = &rtd1619_phy_cfg },
 	{ .compatible = "realtek,rtd1619b-usb2phy", .data = &rtd1619b_phy_cfg },
+	{ .compatible = "realtek,rtl9607-usb2phy", .data = &rtl9607_phy_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
-- 
2.53.0

