Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DAD39479B;
	Mon,  6 Apr 2026 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499206; cv=none; b=aQA1Wd2n6ojr25BlPW0WUeOWsU3DufUJS/XA1ZY6whBPXQ5vL2g0T7hcDc4zKVQ71apxGrIduvOwvSRHuUThsblUltdZk7tPDalPysJgJX9LZBZxmUxzV00pmbX+sM41VPPhUz51Ak60n3wyPDnk+qssahdvounUm+kMS/3Oyic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499206; c=relaxed/simple;
	bh=2b582OA9bo8ZO+4nA6VuGo0KsqY+xwfvgTSwFREy4/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kcr9OB+fOV2lnWJ2Go0mS8c+/tMCahMHDZY2EOfo8ehto2Z3mM/z/cwQc+AF/FOvVBt9lUj5k6bD7hvUx2xHJ9yyt72bFBgzWJXjq+aE4ZcRdmbAzIJy5jSjcTiyAXIqMF1GjE5Zif4EYOgBxaLXZoLjWsBgNMnsUCrJhC3ilZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=dxvSqtVn; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="dxvSqtVn"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6B5262708A;
	Mon,  6 Apr 2026 20:13:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JkYX7jfwsH7m; Mon,  6 Apr 2026 20:13:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775499201; bh=2b582OA9bo8ZO+4nA6VuGo0KsqY+xwfvgTSwFREy4/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dxvSqtVnagn1cxHhDJCDbuVm26m5zVu+zstYtFPjDlaj8+a+uTOtKfQNJpGPBYR3m
	 zBQdlmvgA6+f3sitwPEs2ZebyhevJMZcey+96j/0WrhSyUaELdoNeCnjEfNmGvwfCn
	 2cBIKM1E3muAgxppxn02NoMLH4q5xIcottgtKI8QaG8oHs7MHcy4lbc/kcllK9NWDM
	 w0oRR3hVe5hv7GrQSffiNKzBQ2QGayvMDZoMzz8/Za1SxPaL+8mjfuUJywhB7GPcxb
	 FMQeb37CC4LnTAXtXQx987Y9TwTmBCinvs5mGJDMxipNhJPt0Te+ZHQNk+vk+sPgmN
	 fv8R7t2eBWc+g==
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
Subject: [PATCH v4 5/6] phy: realtek: usb2: add support for RTL9607C USB2 PHY
Date: Mon,  6 Apr 2026 23:12:27 +0500
Message-ID: <20260406181228.25892-6-adilov@disroot.org>
In-Reply-To: <20260406181228.25892-1-adilov@disroot.org>
References: <20260406181228.25892-1-adilov@disroot.org>
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

Add the appropriate little endian read and write functions for rtl9607
and assign them to its phy config struct.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 57 ++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 64fd42513b86..9311cf09521b 100644
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
@@ -146,6 +153,18 @@ static void rtk_usb2phy_write(u32 val, void __iomem *reg)
 	writel(val, reg);
 }
 
+static u32 rtk_usb2phy_read_le(void __iomem *reg)
+{
+	return le32_to_cpu(readl(reg));
+}
+
+static void rtk_usb2phy_write_le(u32 val, void __iomem *reg)
+{
+	u32 tmp = cpu_to_le32(val);
+
+	writel(tmp, reg);
+}
+
 /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
 static inline int page_addr_to_array_index(u8 addr)
 {
@@ -609,6 +628,16 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
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
@@ -1374,6 +1403,33 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
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
@@ -1384,6 +1440,7 @@ static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1395-usb2phy-2port", .data = &rtd1395_phy_cfg_2port },
 	{ .compatible = "realtek,rtd1619-usb2phy", .data = &rtd1619_phy_cfg },
 	{ .compatible = "realtek,rtd1619b-usb2phy", .data = &rtd1619b_phy_cfg },
+	{ .compatible = "realtek,rtl9607-usb2phy", .data = &rtl9607_phy_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
-- 
2.53.0

