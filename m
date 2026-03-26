Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E463A1E96;
	Thu, 26 Mar 2026 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774553705; cv=none; b=uWLZ77z9bSl4UebqjyktClK64b52lnStYXNuzIxzAYrrYo3H5u9eZI1yDJw6kab57ULl4MYAfVjTvJjVzIKgpVS1dkA/NExVMViB3TG3zvJ5MP+bgDN52pXQdXZ72JWn+DJKpvy3eO9G0fpuLiWcvjvmxxGvb9OzMQ2Cg79YDmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774553705; c=relaxed/simple;
	bh=vOZf6eE42IzDhkHYxccK5Q1lOSa6x6I72x6AYuJTPuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lprV5U+SLtkhUEdMO3AaILDxcJ6V8rPEPyeQ6EosEUvMc+Q+manPdJob7P2YGXmQwi6KWwDKQMWgSJj8/HrWA2j7vlUV3GWuCWvmt9UOMV+euDn5xcdEfMsH8Gish6jJHCrX32vIODZstNv22XF0aTzKr5tcuUTdojt/yGgUYbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UrozqLWt; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UrozqLWt"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6EBF0262F5;
	Thu, 26 Mar 2026 20:35:02 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlgneAx83vLb; Thu, 26 Mar 2026 20:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1774553701; bh=vOZf6eE42IzDhkHYxccK5Q1lOSa6x6I72x6AYuJTPuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UrozqLWtWrC4HYdJFVg8zlwd5WeuQjjoGIXlTQ0R3vqt6kFoPbtjoZkhS5gWyk6CZ
	 DLby+fvxY2L+0vAqVL632kBixCMlRuF2L5Fuk/KnQomy5aTKczUWXcmpY6MR70B6Z3
	 Pak8wN0KVeRRnGqcunEu86mYTEXH6hY+imDcSXTrWfSWAu7OqaPWSHGYtivFjkhc0B
	 gBCcU+uc3tZMxpFLTTdZ35/I5UreCvTS9WGXf4rgor7aKhmJKeXpGsScveapBEt+u2
	 ynyD6s8qJMC7UgIcu0o1F9F8OPHowtTo6C3aumdkLHEfIcPgsPQO/G8XiJlLrb1g+b
	 yj35yLnir8Zrg==
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
Subject: [PATCH 2/6] phy: realtek: usb2: introduce read and write functions to driver data
Date: Fri, 27 Mar 2026 00:34:15 +0500
Message-ID: <20260326193419.48419-3-adilov@disroot.org>
In-Reply-To: <20260326193419.48419-1-adilov@disroot.org>
References: <20260326193419.48419-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTL9607C is a big endian SoC but has little endian USB host controller and
thus, reads and writes to the reg_gusb2phyacc0 should go through
le32_to_cpu and cpu_to_le32 functions respectively. This doesn't apply to
vstatus register though.

To handle this situation, introduce read and write functions to the driver
data and create 2 variations of reads and write function with le32 function
in it and without.

Adjust all instances of utmi_wait_register function to now include the read
function as one of its arguments.

Assign the existing phy configuration for RTD SoCs to the default phy_read
and phy_write functions.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 73 ++++++++++++++++++++++++------
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index f5d2f0c3376a..e65b8525b88b 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -67,6 +67,9 @@ struct phy_reg {
 	int vstatus_offset;
 	int vstatus_busy;
 	int new_reg_req;
+
+	u32 (*read)(void __iomem *reg);
+	void (*write)(u32 val, void __iomem *reg);
 };
 
 struct phy_data {
@@ -102,6 +105,9 @@ struct phy_cfg {
 	int vstatus_offset;
 	int vstatus_busy;
 	int new_reg_req;
+
+	u32 (*read)(void __iomem *reg);
+	void (*write)(u32 val, void __iomem *reg);
 };
 
 struct phy_parameter {
@@ -128,6 +134,26 @@ struct rtk_phy {
 	struct dentry *debug_dir;
 };
 
+static inline u32 phy_read(void __iomem *reg)
+{
+	return readl(reg);
+}
+
+static inline u32 phy_read_le(void __iomem *reg)
+{
+	return le32_to_cpu(readl(reg));
+}
+
+static inline void phy_write(u32 val, void __iomem *reg)
+{
+	writel(val, reg);
+}
+
+static inline void phy_write_le(u32 val, void __iomem *reg)
+{
+	writel(cpu_to_le32(val), reg);
+}
+
 /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
 static inline int page_addr_to_array_index(u8 addr)
 {
@@ -144,12 +170,13 @@ static inline u8 array_index_to_page_addr(int index)
 #define PHY_IO_TIMEOUT_USEC		(50000)
 #define PHY_IO_DELAY_US			(100)
 
-static inline int utmi_wait_register(void __iomem *reg, u32 mask, u32 result)
+static inline int utmi_wait_register(u32 (*read)(void __iomem *reg), void __iomem *reg, u32 mask,
+				     u32 result)
 {
 	int ret;
 	unsigned int val;
 
-	ret = read_poll_timeout(readl, val, ((val & mask) == result),
+	ret = read_poll_timeout(read, val, ((val & mask) == result),
 				PHY_IO_DELAY_US, PHY_IO_TIMEOUT_USEC, false, reg);
 	if (ret) {
 		pr_err("%s can't program USB phy\n", __func__);
@@ -168,25 +195,25 @@ static char rtk_phy_read(struct phy_reg *phy_reg, char addr)
 	addr -= OFFEST_PHY_READ;
 
 	/* polling until VBusy == 0 */
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
 	/* VCtrl = low nibble of addr, and set PHY_NEW_REG_REQ */
 	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
-	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	phy_reg->write(val, reg_gusb2phyacc0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
 	/* VCtrl = high nibble of addr, and set PHY_NEW_REG_REQ */
 	val = phy_reg->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
-	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	phy_reg->write(val, reg_gusb2phyacc0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
-	val = readl(reg_gusb2phyacc0);
+	val = phy_reg->read(reg_gusb2phyacc0);
 
 	return (char)(val & PHY_REG_DATA_MASK);
 }
@@ -202,23 +229,23 @@ static int rtk_phy_write(struct phy_reg *phy_reg, char addr, char data)
 	/* write data to VStatusOut2 (data output to phy) */
 	writel((u32)data << shift_bits, reg_wrap_vstatus + phy_reg->vstatus_offset);
 
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
 	/* VCtrl = low nibble of addr, set PHY_NEW_REG_REQ */
 	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
-	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	phy_reg->write(val, reg_gusb2phyacc0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
 	/* VCtrl = high nibble of addr, set PHY_NEW_REG_REQ */
 	val = phy_reg->new_reg_req | (GET_HIGH_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
-	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	phy_reg->write(val, reg_gusb2phyacc0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
@@ -984,6 +1011,8 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
 		phy_parameter->phy_reg.vstatus_offset = phy_cfg->vstatus_offset;
 		phy_parameter->phy_reg.vstatus_busy = phy_cfg->vstatus_busy;
 		phy_parameter->phy_reg.new_reg_req = phy_cfg->new_reg_req;
+		phy_parameter->phy_reg.read = phy_cfg->read;
+		phy_parameter->phy_reg.write = phy_cfg->write;
 
 		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
 			phy_parameter->inverse_hstx_sync_clock = true;
@@ -1098,6 +1127,8 @@ static const struct phy_cfg rtd1295_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg = {
@@ -1125,6 +1156,8 @@ static const struct phy_cfg rtd1395_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg_2port = {
@@ -1152,6 +1185,8 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1619_phy_cfg = {
@@ -1177,6 +1212,8 @@ static const struct phy_cfg rtd1619_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1319_phy_cfg = {
@@ -1206,6 +1243,8 @@ static const struct phy_cfg rtd1319_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1312c_phy_cfg = {
@@ -1234,6 +1273,8 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1619b_phy_cfg = {
@@ -1262,6 +1303,8 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1319d_phy_cfg = {
@@ -1290,6 +1333,8 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct phy_cfg rtd1315e_phy_cfg = {
@@ -1319,6 +1364,8 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = phy_read,
+	.write = phy_write,
 };
 
 static const struct of_device_id usbphy_rtk_dt_match[] = {
-- 
2.53.0

