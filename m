Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC099383998;
	Sat, 15 Aug 2026 09:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785293; cv=none; b=KymE53lGl6jukYdxBXlzAHinB/JNl+B0rtgIQNuucXxLY0++r0QXEh9NWJ97LvNwVeiiGwpO4TY3aWtYI0Fmr3OqPDWZs3s98yYH406r6XWmFa5i2+pmyEzMLmOKKZiJ/3figspYiTkBZVtXzZebMUfrMezW60DYD9/dGCb8CaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785293; c=relaxed/simple;
	bh=iTMFW9PtcXtthHHYIKyXUPqjK5gtUDESdCp0WUlX6Q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IsIHZRUKaL4ar4B0AgPo3Tg/hMmocgjTuqTdp+JcO9wbCX4XMX+z05uJ4fy9G+VgE2zEbCFfEZBRmm994hskYo/UI4uIOQUSOu26lN9gk07G6J8SQj/+dgHnmjfA/96A6ehYI8eqZbyJWO9nWHYougZHvXE5AV+HyqEopyyPPn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=LWY/NZrx; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="LWY/NZrx"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5AA9A881CC;
	Sat, 15 Aug 2026 11:14:50 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1S2K92VLyO6; Sat, 15 Aug 2026 11:14:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786785286; bh=iTMFW9PtcXtthHHYIKyXUPqjK5gtUDESdCp0WUlX6Q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LWY/NZrxuEuMwc4xc5Q4xjZlZG8Mi6MZLDWmcj6s4zSiV0jxlCftuFaf0Cz6BSscW
	 7aPSyKjiQBwhWul2jbY/cv8iJlqKN1zDMpaB2VsXqHuUq0GzoiAu2JlDss+evIxrNM
	 d23oDfqtAxbl+0afhphAs6OmUcZ7yjESlGYmyPzs5e+Ywk1visxdfx0KR68woBx5jj
	 PVd+BF8vesBfpGEH/FTjV+SvX9BafrN8ddSnjA1nrCQwqzPl5pMf1VLXZY4v7G6x6L
	 ICwKqluD/jJLIP8jyE0Z3DkN7ziICytWrhJoT2cIvBRikYjQ+WoTeOmv4Hx4sBc0QQ
	 sDayj/k861oRw==
From: Rustam Adilov <adilov@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rustam Adilov <adilov@disroot.org>,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: [PATCH v7 5/6] phy: realtek: usb2: add support for RTL9607C USB2 PHY
Date: Sat, 15 Aug 2026 14:13:39 +0500
Message-ID: <20260815091340.26910-6-adilov@disroot.org>
In-Reply-To: <20260815091340.26910-1-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
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
before proceeding with phy parameter writes. Since it belongs into
the vstatus register region, it requires the use of added read and
write helper functions.

Add the bool variable to the driver data struct and hide this whole
procedure under the if statement that checks this new variable.

Add the appropriate big endian read and write functions for rtl9607
and assign them to its rtl9607_phy_reg_desc struct.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 66 ++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 2ddad7be7353..990ceca37ef8 100644
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
 
@@ -107,6 +113,7 @@ struct phy_cfg {
 	bool use_default_parameter;
 	bool is_double_sensitivity_mode;
 	const struct phy_reg_desc *reg_desc;
+	bool force_host_disconnect;
 };
 
 struct phy_parameter {
@@ -144,6 +151,16 @@ static void rtk_usb2phy_write(u32 val, void __iomem *reg)
 	writel(val, reg);
 }
 
+static u32 rtk_usb2phy_read_be(void __iomem *reg)
+{
+	return ioread32be(reg);
+}
+
+static void rtk_usb2phy_write_be(u32 val, void __iomem *reg)
+{
+	iowrite32be(val, reg);
+}
+
 /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
 static inline int page_addr_to_array_index(u8 addr)
 {
@@ -600,6 +617,23 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
 		goto do_toggle;
 	}
 
+	if (phy_cfg->force_host_disconnect) {
+		const struct phy_reg_desc *reg_desc = phy_reg->desc;
+		void __iomem *vstatus = phy_reg->reg_wrap_vstatus;
+		u32 temp;
+
+		temp = reg_desc->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		/* disable force-host-disconnect */
+		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
+
+		reg_desc->write(temp, vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+		temp = reg_desc->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
+
+		/* allow IP to startup */
+		usleep_range(10000, 11000);
+	}
+
 	/* Set page 0 */
 	phy_data_page = phy_cfg->page0;
 	rtk_phy_set_page(phy_reg, 0);
@@ -1109,6 +1143,14 @@ static const struct phy_reg_desc rtd_phy_reg_desc = {
 	.write = rtk_usb2phy_write,
 };
 
+static const struct phy_reg_desc rtl9607_phy_reg_desc = {
+	.vstatus_offset = 0xc,
+	.vstatus_busy = PHY_9607_VSTS_BUSY,
+	.new_reg_req = PHY_9607_NEW_REG_REQ,
+	.read = rtk_usb2phy_read_be,
+	.write = rtk_usb2phy_write_be,
+};
+
 static const struct phy_cfg rtd1295_phy_cfg = {
 	.page0_size = MAX_USB_PHY_PAGE0_DATA_SIZE,
 	.page0 = { [0] = {0xe0, 0x90},
@@ -1342,6 +1384,29 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.reg_desc = &rtd_phy_reg_desc,
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
+	.reg_desc = &rtl9607_phy_reg_desc,
+	.force_host_disconnect = true,
+};
+
 static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1295-usb2phy", .data = &rtd1295_phy_cfg },
 	{ .compatible = "realtek,rtd1312c-usb2phy", .data = &rtd1312c_phy_cfg },
@@ -1352,6 +1417,7 @@ static const struct of_device_id usbphy_rtk_dt_match[] = {
 	{ .compatible = "realtek,rtd1395-usb2phy-2port", .data = &rtd1395_phy_cfg_2port },
 	{ .compatible = "realtek,rtd1619-usb2phy", .data = &rtd1619_phy_cfg },
 	{ .compatible = "realtek,rtd1619b-usb2phy", .data = &rtd1619b_phy_cfg },
+	{ .compatible = "realtek,rtl9607-usb2phy", .data = &rtl9607_phy_cfg },
 	{},
 };
 MODULE_DEVICE_TABLE(of, usbphy_rtk_dt_match);
-- 
2.55.0

