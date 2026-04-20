Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804273C3434;
	Mon, 20 Apr 2026 19:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776712818; cv=none; b=VLiMEL0O/KYF3aemMkqyneKPZpt0TxxPm58Fyj2g/8lqmgevll5qVc/oYccZVrKgJeG8dgmbvQoJqrGJ1YudH8FtwWF1FCZ30uOLpT7vChnqKo7r/KL74Hu0JFcKqw9b0oWiUTEU7JEnCblv+6whusXybbEz+Por1J3XitN3eeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776712818; c=relaxed/simple;
	bh=ROOlVgUrHHP+HI+NTgDLFYkShVeEFMmEVnBVofPqvSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tk+dzt83o6QkEle6c0uwpKTqRcYh32qWyxEqqhhUioNvJsPbsuDsNnsrQZ9U5twWIuVFlSbvXK1RVLdcXbX4dxHbSBukg5nBApZ51ZBtOX/I3GsPZwat3eIJDopRtWzRU0iWVLjJdzVnEKBO8bKnaDon1aAhmYEjsBoojJlI2As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gK/SgyTz; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gK/SgyTz"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id A1CE426E4F;
	Mon, 20 Apr 2026 21:20:12 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpVIoUe0qFPW; Mon, 20 Apr 2026 21:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1776712812; bh=ROOlVgUrHHP+HI+NTgDLFYkShVeEFMmEVnBVofPqvSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gK/SgyTzgbWIRdC61cf2FeHn59LGd9z4NX4hcN5f66ABVstKFe+vbNGDI2wV4CuyB
	 GRI0WnLT4e4TH4fO3v0FWzgvSmQ+d8/zoWYYExwBttgpgRBmxeV8Mu+ywECiIIyQQ2
	 0KXQemW4ZmaOgIxsp9XnOFIhr3M3OIJk0PVpWD7uactsXxKiSP8D60aaTtvFCmDM8H
	 WPW7vRQeEnSwAgYtV0Za9xPRfGCW9Rg8XesdwMmktq51vCFBwLEnevrO32H63BVwFJ
	 XR1nQMhwT7VBcxjsVBstNrKRKIyzLj/L0lc1Q9b/OPwsZBX91yvREnnqQ9GHcmbJsJ
	 uHKj4W4Vcfwfw==
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
Subject: [PATCH v5 2/6] phy: realtek: usb2: introduce read and write functions to driver data
Date: Tue, 21 Apr 2026 00:19:37 +0500
Message-ID: <20260420191941.81834-3-adilov@disroot.org>
In-Reply-To: <20260420191941.81834-1-adilov@disroot.org>
References: <20260420191941.81834-1-adilov@disroot.org>
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
vstatus register though as it is in the different register region compared
to USB host controller region.

The reason is readl/writel functions, despite the supposed little endian
byte swap, still operate with native endian and this is because RTL9607C
is MIPS and here readl/writel are native unless SWAP_IO_SPACE is enabled.
Enabling SWAP_IO_SPACE results in boot hangs so that is not an option.
And so wrapping them around le32 makes a proper byte swap from big endian
to little endian.

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
index f5f943518d4f..19297a42a841 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -67,6 +67,9 @@ struct phy_reg {
 	int vstatus_offset;
 	u32 vstatus_busy;
 	u32 new_reg_req;
+
+	u32 (*read)(void __iomem *reg);
+	void (*write)(u32 val, void __iomem *reg);
 };
 
 struct phy_data {
@@ -102,6 +105,9 @@ struct phy_cfg {
 	int vstatus_offset;
 	u32 vstatus_busy;
 	u32 new_reg_req;
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
 
 	/* VCtrl = low nibble of addr, and set phy_reg->new_reg_req */
 	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
-	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	phy_reg->write(val, reg_gusb2phyacc0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return (char)ret;
 
 	/* VCtrl = high nibble of addr, and set phy_reg->new_reg_req */
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
 
 	/* VCtrl = low nibble of addr, set phy_reg->new_reg_req */
 	val = phy_reg->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
 
-	writel(val, reg_gusb2phyacc0);
-	ret = utmi_wait_register(reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
+	phy_reg->write(val, reg_gusb2phyacc0);
+	ret = utmi_wait_register(phy_reg->read, reg_gusb2phyacc0, phy_reg->vstatus_busy, 0);
 	if (ret)
 		return ret;
 
 	/* VCtrl = high nibble of addr, set phy_reg->new_reg_req */
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

