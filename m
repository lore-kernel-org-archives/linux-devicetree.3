Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE7360EDC;
	Sat, 15 Aug 2026 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785281; cv=none; b=a3XQ9OfY8YUiWwijHT1bGY5L/Mj6PrL8yXmII1DZOHrrw5r6HaOSof589c4+GnzWWi/m/mJtKNk/TSx1kkAdUtavQ/iOw+bCBdrReCZ1Aptg9kljM0qVxhdA+DhGbQBXSNhwFVoCZKdWbNCtcDINezF8nzSxoHTalVFda9Ulj/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785281; c=relaxed/simple;
	bh=qi/gWHzJoMLT99wi33nSAx6f8CFgp+JnA4bNs+DMJnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2erXlZ0cNpm6yoD8sXXp2pzCbFErfly1jmNhUmz/uZ1l4Fg+IcaZjO86cshegYEyUQY2hFAVYUQyw97wkFCrB5AwtulmR5BI0hPTHzI1DZprj9dRyuQh7hPEaT6JOXZ9Lfli6KMFCwlYk7fe5maTl/8ZEl/pE4DtchDJ5oo8io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=HqPL07JX; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="HqPL07JX"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EF183882CA;
	Sat, 15 Aug 2026 11:14:37 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PQPWE5oCTmlF; Sat, 15 Aug 2026 11:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786785277; bh=qi/gWHzJoMLT99wi33nSAx6f8CFgp+JnA4bNs+DMJnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HqPL07JXkgTVdLEbAbaoVMgadjSik1hqNNfBhN5LsZgqc+bDz7X3V14Gc8a2BbEPX
	 ADGLxP7yOTodzKVGWxASzl7ZZ30nwh2wU8LYSV5EgZXdfWJAYQUtf/+YnmE7ugt/wS
	 xqpDIwbu7HPGFAf4kN99Q3+UdJekGEAn8czamdJ4Rq2NGyttrdkwtADcnBPF7f38ix
	 BOnM6lsbe+2sO5loluo1NvB6Do1dauYN4VnOHs2WFDx83T8gz0k0mxJjueLG7hhe/x
	 ObW6nl+liSWQFxsmLDVzyzOQhgHTr2YSg1e2mHfl1t66ZlQkcOHVZeVoE1LItJZqGT
	 NTzvSv3YSd1pg==
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
Subject: [PATCH v7 2/6] phy: realtek: usb2: introduce read and write functions to phy_reg_desc struct
Date: Sat, 15 Aug 2026 14:13:36 +0500
Message-ID: <20260815091340.26910-3-adilov@disroot.org>
In-Reply-To: <20260815091340.26910-1-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTL9607C is a big endian SoC with little endian USB host controller but
vstatus register is from big endian memory region and thus existing
writel doesn't work. It needs either __raw_writel or iowrite32be
instead.

To handle this situation, introduce read and write function to the
phy_reg_desc struct and add a default variation that is going to be
ponted by the existing rtd_phy_reg_desc.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index e8d0f0119ec0..5e483c853f02 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -64,6 +64,8 @@ struct phy_reg_desc {
 	int vstatus_offset;
 	u32 vstatus_busy;
 	u32 new_reg_req;
+	u32 (*read)(void __iomem *reg);
+	void (*write)(u32 val, void __iomem *reg);
 };
 
 struct phy_reg {
@@ -130,6 +132,16 @@ struct rtk_phy {
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
@@ -204,8 +216,8 @@ static int rtk_phy_write(struct phy_reg *phy_reg, char addr, char data)
 	int ret = 0;
 
 	/* write data to VStatusOut2 (data output to phy) */
-	writel((u32)data << shift_bits,
-	       reg_wrap_vstatus + reg_desc->vstatus_offset);
+	reg_desc->write((u32)data << shift_bits,
+		       reg_wrap_vstatus + reg_desc->vstatus_offset);
 
 	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
 	if (ret)
@@ -988,7 +1000,6 @@ static int parse_phy_data(struct rtk_phy *rtk_phy)
 		phy_parameter->phy_reg.vstatus_index = index;
 		phy_parameter->phy_reg.desc = phy_cfg->reg_desc;
 
-
 		if (of_property_read_bool(np, "realtek,inverse-hstx-sync-clock"))
 			phy_parameter->inverse_hstx_sync_clock = true;
 		else
@@ -1078,6 +1089,8 @@ static const struct phy_reg_desc rtd_phy_reg_desc = {
 	.vstatus_offset = 0,
 	.vstatus_busy = PHY_VSTS_BUSY,
 	.new_reg_req = PHY_NEW_REG_REQ,
+	.read = rtk_usb2phy_read,
+	.write = rtk_usb2phy_write,
 };
 
 static const struct phy_cfg rtd1295_phy_cfg = {
-- 
2.55.0

