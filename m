Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994D533A007;
	Thu,  2 Apr 2026 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144692; cv=none; b=HpgtTYmtUmh2m2j3nuYtY26SgnJBCZxF6SosaELqkFfz0lyi7qNGBag7a+ndM2AKTvrDlmm2vIpX1j73sIKEaD0AvMrEy4x2RlP9ScnKwLcBXQ68c+0Xpa7lHJW9HZXRKsemFkrDqbn2w2vUcO+R3J0+EQhjL6yYFcqigBbKUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144692; c=relaxed/simple;
	bh=AsXZHe8dhzo/iV7ai1HnoAnUoNxuSgEq0RdX3yPSBFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jk8TR1vLuYs0XDvqr7CuOOGnLBXqE5COpffKktk7HizBNYdAVbaXga2oma6wl+zqDsZg0562Htp0C9eZXwMPi/Ixo7x94ME8QJKEg9Yo5/BkfG8TaZeyrYc0sdScaSoM3Y2MEx0vAVXVFlMBmhoGnv668ik4f/vhcLeKwkDpHaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=PjfCyNXW; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="PjfCyNXW"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 34B2C26561;
	Thu,  2 Apr 2026 17:44:49 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdmBa8nCOhzh; Thu,  2 Apr 2026 17:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775144688; bh=AsXZHe8dhzo/iV7ai1HnoAnUoNxuSgEq0RdX3yPSBFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PjfCyNXW1IZgKnfoJwO7l53ddi/UgOfVYRe2C+296HVjtqMFGOeP/Rd+44REvTP/k
	 y+DMHFjshTKG1+w8G53rBwmYwd1aSYsce28zaTylfO2RFz1KWMOnbpBhHFP4QqXrC8
	 5Ei5nQtWISxsEgThJwZpoj1yxRThm3h3yXVhWXXHnBz4SFq4og2fCaOqKqpBoXErru
	 ZWh5MbMIhaUyXgK/1b2RjLQHvrpMMh3GDrEVym2VGMM/3TSfMdU6QU4/RfNbhgmOau
	 sGzyQdYUBJVYhVIgKt8Meg5l2YFBVeMKNFDOlQ6hL3POENWcdM4fQ+hDqjtgB+vcLs
	 acprV29uiVdng==
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
Subject: [PATCH v3 1/6] phy: realtek: usb2: introduce vstatus/new_reg_req variables to driver data
Date: Thu,  2 Apr 2026 20:44:09 +0500
Message-ID: <20260402154414.196012-2-adilov@disroot.org>
In-Reply-To: <20260402154414.196012-1-adilov@disroot.org>
References: <20260402154414.196012-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In RTL9607C SoC, the vstatus register is located at a certain offset from
the base and so introduce the vstatus_offset to handle it.

Busy bit of the vstatus and new_reg_req bit are also different and so
introduce these variables to the driver data as well.

Add these variables to the pre-existing phy cfg structs for RTD SoCs and
assign them the default values.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 59 ++++++++++++++++++++++++------
 1 file changed, 48 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 248550ef98ca..f5d2f0c3376a 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -64,6 +64,9 @@ struct phy_reg {
 	void __iomem *reg_wrap_vstatus;
 	void __iomem *reg_gusb2phyacc0;
 	int vstatus_index;
+	int vstatus_offset;
+	int vstatus_busy;
+	int new_reg_req;
 };
 
 struct phy_data {
@@ -96,6 +99,9 @@ struct phy_cfg {
 	bool do_toggle_driving;
 	bool use_default_parameter;
 	bool is_double_sensitivity_mode;
+	int vstatus_offset;
+	int vstatus_busy;
+	int new_reg_req;
 };
 
 struct phy_parameter {
@@ -162,21 +168,21 @@ static char rtk_phy_read(struct phy_reg *phy_reg, char addr)
 	addr -= OFFEST_PHY_READ;
 
 	/* polling until VBusy == 0 */
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
 	/* VCtrl = low nibble of addr, and set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
 	/* VCtrl = high nibble of addr, and set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	val = phy_reg->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
@@ -194,25 +200,25 @@ static int rtk_phy_write(struct phy_reg *phy_reg, char addr, char data)
 	int ret = 0;
 
 	/* write data to VStatusOut2 (data output to phy) */
-	writel((u32)data << shift_bits, reg_wrap_vstatus);
+	writel((u32)data << shift_bits, reg_wrap_vstatus + phy_reg->vstatus_offset);
 
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
 	/* VCtrl = low nibble of addr, set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
 	/* VCtrl = high nibble of addr, set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	val = phy_reg->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
@@ -957,6 +963,7 @@ static int get_phy_data_by_efuse(struct rtk_phy *rtk_phy,
 
 static int parse_phy_data(struct rtk_phy *rtk_phy)
 {
+	struct phy_cfg *phy_cfg = rtk_phy->phy_cfg;
 	struct device *dev = rtk_phy->dev;
 	struct device_node *np = dev->of_node;
 	struct phy_parameter *phy_parameter;
@@ -974,6 +981,9 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
 		phy_parameter->phy_reg.reg_wrap_vstatus = of_iomap(np, 0);
 		phy_parameter->phy_reg.reg_gusb2phyacc0 = of_iomap(np, 1) + index;
 		phy_parameter->phy_reg.vstatus_index = index;
+		phy_parameter->phy_reg.vstatus_offset = phy_cfg->vstatus_offset;
+		phy_parameter->phy_reg.vstatus_busy = phy_cfg->vstatus_busy;
+		phy_parameter->phy_reg.new_reg_req = phy_cfg->new_reg_req;
 
 		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
 			phy_parameter->inverse_hstx_sync_clock = true;
@@ -1085,6 +1095,9 @@ static const struct phy_cfg rtd1295_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg = {
@@ -1109,6 +1122,9 @@ static const struct phy_cfg rtd1395_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg_2port = {
@@ -1133,6 +1149,9 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1619_phy_cfg = {
@@ -1155,6 +1174,9 @@ static const struct phy_cfg rtd1619_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1319_phy_cfg = {
@@ -1181,6 +1203,9 @@ static const struct phy_cfg rtd1319_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1312c_phy_cfg = {
@@ -1206,6 +1231,9 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1619b_phy_cfg = {
@@ -1231,6 +1259,9 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1319d_phy_cfg = {
@@ -1256,6 +1287,9 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1315e_phy_cfg = {
@@ -1282,6 +1316,9 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct of_device_id usbphy_rtk_dt_match[] = {
-- 
2.53.0

