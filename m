Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8783932DF;
	Mon,  6 Apr 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499198; cv=none; b=FkWU1kAGvy9x7konuEhY8B2AVJUVB9gB/EtUEgSiEyu3WPDL4x7pyOSGppFwY6/KAv/ZOFUJKXGA5BSpREppDspc5mG4r4phudXCguDPYJvclCFWUb1XgCZcaapuVMSY7A9s/vPzVeCpfrB6d1aDigrG2LtkW2kLasZU+3QBQyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499198; c=relaxed/simple;
	bh=gIZeKQ/pICKwWE/VdqKZ3JQLiyrx2OmNRFtpK70fdEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R2of2SOrB59r44LhIakdgFQhBvF9MT2RVvIKoBdujPtSMV8Kyo75Odr4v/TQ/x3dv/Uy4Eb9gvZLYHfq89lKPTN24r6GPDfx0mwd07JJTHHnnzTAUcczQ9i+FpsEuEmfpvGlz1Vo6ltCeXH7B1NAimaFJxQlcFSQFN8s4pmnYaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=GxdQSGAh; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="GxdQSGAh"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 279FD271E5;
	Mon,  6 Apr 2026 20:13:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with UTF8SMTP
 id ZVndUVLmG6Zn; Mon,  6 Apr 2026 20:13:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775499194; bh=gIZeKQ/pICKwWE/VdqKZ3JQLiyrx2OmNRFtpK70fdEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GxdQSGAhezM8aD2UjxZlu1rMnBzMqmzBVYZlcCl02luP87wStfgnZ232G5P79prji
	 QUpTfPllcmdofDcU8Kh3kmjn3AvzQN3odqe9Jh17QgGPiqflfSIaOo9eObxxbmnw9y
	 rUTXnMmneRoYQO31LwfcawNHLvktM2taUnsgbj9dBczpZD2gn9k7U5+ldYetokZ2gr
	 z6zNjBeSw2CJQyLm7qj1vAnLH38wNEd1Xa2sryXJ7Qnp6BcVh6nfnPWtsOumqCbVbA
	 JwIS3dbN47kx12ZJZ6yv5FmeE/H3N78kPeAmgW6AAg+jyLFLPpl+VSsioGPrrN1jsS
	 xC3Mk/9oRDypQ==
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
Subject: [PATCH v4 2/6] phy: realtek: usb2: introduce read and write functions to driver data
Date: Mon,  6 Apr 2026 23:12:24 +0500
Message-ID: <20260406181228.25892-3-adilov@disroot.org>
In-Reply-To: <20260406181228.25892-1-adilov@disroot.org>
References: <20260406181228.25892-1-adilov@disroot.org>
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

The reason is readl/writel functions, despite the supposed little endian
byte swap, still operate with native endian. The __raw_{read,write} are
also native endianness. And so wrapping them around le32 makes a proper
byte swap from big endian to little endian.

To handle this situation, introduce read and write functions to the driver
data and create a default variation of read and write function for the
current RTD SoCs.

Adjust all instances of utmi_wait_register function to now include the read
function as one of its arguments.

Assign the existing phy configuration for RTD SoCs to the default read
and write functions.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 63 ++++++++++++++++++++++++------
 1 file changed, 50 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index f5d2f0c3376a..0facd5f02e2d 100644
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
@@ -128,6 +134,16 @@ struct rtk_phy {
 	struct dentry *debug_dir;
 };
 
+static u32 rtk_usb2phy_read(void __iomem *reg)
+{
+	return readl(reg);
+}
+
+static void rtk_usb2phy_write(u32 val, void __iomem *reg)
+{
+	writel(val, reg);
+}
+
 /* mapping 0xE0 to 0 ... 0xE7 to 7, 0xF0 to 8 ,,, 0xF7 to 15 */
 static inline int page_addr_to_array_index(u8 addr)
 {
@@ -144,12 +160,13 @@ static inline u8 array_index_to_page_addr(int index)
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
@@ -168,25 +185,25 @@ static char rtk_phy_read(struct phy_reg *phy_reg, char addr)
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
@@ -202,23 +219,23 @@ static int rtk_phy_write(struct phy_reg *phy_reg, char addr, char data)
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
 
@@ -984,6 +1001,8 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
 		phy_parameter->phy_reg.vstatus_offset = phy_cfg->vstatus_offset;
 		phy_parameter->phy_reg.vstatus_busy = phy_cfg->vstatus_busy;
 		phy_parameter->phy_reg.new_reg_req = phy_cfg->new_reg_req;
+		phy_parameter->phy_reg.read = phy_cfg->read;
+		phy_parameter->phy_reg.write = phy_cfg->write;
 
 		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
 			phy_parameter->inverse_hstx_sync_clock = true;
@@ -1098,6 +1117,8 @@ static const struct phy_cfg rtd1295_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg = {
@@ -1125,6 +1146,8 @@ static const struct phy_cfg rtd1395_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1395_phy_cfg_2port = {
@@ -1152,6 +1175,8 @@ static const struct phy_cfg rtd1395_phy_cfg_2port = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1619_phy_cfg = {
@@ -1177,6 +1202,8 @@ static const struct phy_cfg rtd1619_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1319_phy_cfg = {
@@ -1206,6 +1233,8 @@ static const struct phy_cfg rtd1319_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1312c_phy_cfg = {
@@ -1234,6 +1263,8 @@ static const struct phy_cfg rtd1312c_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1619b_phy_cfg = {
@@ -1262,6 +1293,8 @@ static const struct phy_cfg rtd1619b_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1319d_phy_cfg = {
@@ -1290,6 +1323,8 @@ static const struct phy_cfg rtd1319d_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1315e_phy_cfg = {
@@ -1319,6 +1354,8 @@ static const struct phy_cfg rtd1315e_phy_cfg = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct of_device_id usbphy_rtk_dt_match[] = {
-- 
2.53.0

