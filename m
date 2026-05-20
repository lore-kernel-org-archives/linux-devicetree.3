Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFC3F44C9;
	Wed, 20 May 2026 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779299894; cv=none; b=cQ8HkOshIs4RfOOjSZVZzAyXhdhGfaOZZK95xBoAYvYxJE26ygyT+vpEjVsMKFDLwNl2b1S/Mw7O4ZO8WsF6Ra7wDJ0do7JZvmkHSbStOXVvK4Kykymw5TW1dJWjhgwzvcLotZhm+VnadQTQeFEdzW3jMc1zfdoxsT5QNjHhXmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779299894; c=relaxed/simple;
	bh=I4SVOFAquh5eiYlUMlgdeL/TMUgvDKa+l2LFRekB3lE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qcJUaj+mEO0jORxw+rsyHo/ziSGzTYmHTh5FD9BseFyt53w4TX/3IsppBWtBPOLCGkBBa36Jjg7sFh+Jgxw1P1LdSKi+bkWlC7077+1EoAXXTJyRsw37Rrm0OsywINmWHv0zErmw4i8EBc3PdJq1RvZBlv3nYwd/HZ5sVTYJJpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fqoNS3IV; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fqoNS3IV"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 50036277B1;
	Wed, 20 May 2026 19:58:05 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BUuOXuJMrPc; Wed, 20 May 2026 19:58:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1779299884; bh=I4SVOFAquh5eiYlUMlgdeL/TMUgvDKa+l2LFRekB3lE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fqoNS3IVjSH9frZ/hbmiTZwHjDnBIkCW5YAS8cy9EGQc7JURmGDnPVYFRXw2WX6yH
	 aaTSs2I1Nm1IGGNXeJ2ks9cpSqNpK+IA4LMKo5Xt9OR8BK7+toztJKPm53TQoOlWGi
	 Zq627NXmj1WhscB3iuEiKDFeviy7Oxsv4O6GC4qFlGfSXn3mNy1BSAWsHJjYct92G2
	 t15nTOKT/VK5StVn/10JMRwdHXNL0PcBmDNTBoqjrEYxGSb5b/kb2SBySi1asW8lZq
	 4NQe5PyzVO11WVKb7+sTljiVSdfGyCr1sc1iVMSUEiTJAHJRnqVwZ44XwQnm+z5ai6
	 yuFeYjotM646A==
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
Subject: [PATCH v6 1/6] phy: realtek: usb2: introduce vstatus/new_reg_req variables to driver data
Date: Wed, 20 May 2026 22:57:23 +0500
Message-ID: <20260520175728.720877-2-adilov@disroot.org>
In-Reply-To: <20260520175728.720877-1-adilov@disroot.org>
References: <20260520175728.720877-1-adilov@disroot.org>
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
 drivers/phy/realtek/phy-rtk-usb2.c | 68 +++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 248550ef98ca..bd9ee895b9f9 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -64,6 +64,9 @@ struct phy_reg {
 	void __iomem *reg_wrap_vstatus;
 	void __iomem *reg_gusb2phyacc0;
 	int vstatus_index;
+	int vstatus_offset;
+	u32 vstatus_busy;
+	u32 new_reg_req;
 };
 
 struct phy_data {
@@ -96,6 +99,9 @@ struct phy_cfg {
 	bool do_toggle_driving;
 	bool use_default_parameter;
 	bool is_double_sensitivity_mode;
+	int vstatus_offset;
+	u32 vstatus_busy;
+	u32 new_reg_req;
 };
 
 struct phy_parameter {
@@ -162,21 +168,21 @@ static char rtk_phy_read(struct phy_reg *phy_reg, char addr)
 	addr -= OFFEST_PHY_READ;
 
 	/* polling until VBusy == 0 */
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
-	/* VCtrl = low nibble of addr, and set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = low nibble of addr, and set phy_reg->new_reg_req */
+	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
-	/* VCtrl = high nibble of addr, and set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = high nibble of addr, and set phy_reg->new_reg_req */
+	val = phy_reg->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
@@ -194,25 +200,26 @@ static int rtk_phy_write(struct phy_reg *phy_reg, char addr, char data)
 	int ret = 0;
 
 	/* write data to VStatusOut2 (data output to phy) */
-	writel((u32)data << shift_bits, reg_wrap_vstatus);
+	writel((u32)data << shift_bits,
+	       reg_wrap_vstatus + phy_reg->vstatus_offset);
 
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
-	/* VCtrl = low nibble of addr, set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = low nibble of addr, set phy_reg->new_reg_req */
+	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
-	/* VCtrl = high nibble of addr, set PHY_NEW_REG_REQ */
-	val = PHY_NEW_REG_REQ | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
+	/* VCtrl = high nibble of addr, set phy_reg->new_reg_req */
+	val = phy_reg->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
 	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
+	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
@@ -957,6 +964,7 @@ static int get_phy_data_by_efuse(struct rtk_phy *rtk_phy,
 
 static int parse_phy_data(struct rtk_phy *rtk_phy)
 {
+	struct phy_cfg *phy_cfg = rtk_phy->phy_cfg;
 	struct device *dev = rtk_phy->dev;
 	struct device_node *np = dev->of_node;
 	struct phy_parameter *phy_parameter;
@@ -974,6 +982,9 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
 		phy_parameter->phy_reg.reg_wrap_vstatus = of_iomap(np, 0);
 		phy_parameter->phy_reg.reg_gusb2phyacc0 = of_iomap(np, 1) + index;
 		phy_parameter->phy_reg.vstatus_index = index;
+		phy_parameter->phy_reg.vstatus_offset = phy_cfg->vstatus_offset;
+		phy_parameter->phy_reg.vstatus_busy = phy_cfg->vstatus_busy;
+		phy_parameter->phy_reg.new_reg_req = phy_cfg->new_reg_req;
 
 		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
 			phy_parameter->inverse_hstx_sync_clock = true;
@@ -1085,6 +1096,9 @@ static const struct phy_cfg rtd1295_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg = {
@@ -1109,6 +1123,9 @@ static const struct phy_cfg rtd1395_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg_2port = {
@@ -1133,6 +1150,9 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1619_phy_cfg = {
@@ -1155,6 +1175,9 @@ static const struct phy_cfg rtd1619_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = false,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1319_phy_cfg = {
@@ -1181,6 +1204,9 @@ static const struct phy_cfg rtd1319_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1312c_phy_cfg = {
@@ -1206,6 +1232,9 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
 	.driving_updated_for_dev_dis = 0xf,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1619b_phy_cfg = {
@@ -1231,6 +1260,9 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1319d_phy_cfg = {
@@ -1256,6 +1288,9 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct phy_cfg rtd1315e_phy_cfg = {
@@ -1282,6 +1317,9 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.driving_updated_for_dev_dis = 0x8,
 	.use_default_parameter = false,
 	.is_double_sensitivity_mode = true,
+	.vstatus_offset = 0,
+	.vstatus_busy = PHY_VSTS_BUSY,
+	.new_reg_req = PHY_NEW_REG_REQ,
 };
 
 static const struct of_device_id usbphy_rtk_dt_match[] = {
-- 
2.54.0

