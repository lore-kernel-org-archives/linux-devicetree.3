Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567D3932C9;
	Mon,  6 Apr 2026 18:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499202; cv=none; b=gPIRGaxT/E/HzR1kEQmEhuEIdK1zQHU/sAjCMKDygTjkULnnz3/vwUQ1x6A0K2+7D6EQj1zKd6CdvGZMfHhoDxrx8fAJgaJxtqKFa+ZLlLF2fQOfoeS31qjC/G5DZg+CgJnbwdP6KH6xLtMtMNFQjUgTrnSOcm2pp1LuTQEp0ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499202; c=relaxed/simple;
	bh=5A2ncLpb8vvjigR8O34mpX5m4sWPYSzbApPsYUi+pRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Udpn9nQWl7GEIzBRBcKx2tGlqizp/XaqCTsg0ARMNAUUuqtvMAsBQU+kuGvYy9kFvR07zEewznKd4aFnsNrda/1ATFWFH3yKUiNgFgYgorbPI/vKlRU2ARtNsudNleQLkrMVZix4qqMkBwtApTQz8CJZ9qDq20H5jqVi2GGgrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Oax7lDBA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Oax7lDBA"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DA91F270DE;
	Mon,  6 Apr 2026 20:13:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEbxBC7KUCVY; Mon,  6 Apr 2026 20:13:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1775499199; bh=5A2ncLpb8vvjigR8O34mpX5m4sWPYSzbApPsYUi+pRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Oax7lDBA+ECo3XW9O1L1ThTryL4uE7OKAsNQq/u2niuooLqh7kpX8b6q0im2obpti
	 Ih9kLKWbdKsvQJaC1zfGeY8MuCgNszvuu24EPxdgQN+FjcIBefXGQQqayGgIVLJzg5
	 wIccGaNrlN5qPJYKxl+mb/zoPGTBl/jiQ0cy+UTF7bi5+Miqcuao5Ccyi95xZkL1YX
	 icRgisMzqNUQ2sSgh4lDhkEojKCThcHGaZzaIck1st8xQ5nhqsGRcYCZaomif5WsGY
	 Q8KA2JUlwY5ukci2RNd+RMTjhi9/U7gTllJVmkLJoXeuIUfxXqG/ScDOEG4EgX46I4
	 iJ7dn7d/jvSXw==
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
Subject: [PATCH v4 4/6] phy: realtek: usb2: introduce reset controller struct
Date: Mon,  6 Apr 2026 23:12:26 +0500
Message-ID: <20260406181228.25892-5-adilov@disroot.org>
In-Reply-To: <20260406181228.25892-1-adilov@disroot.org>
References: <20260406181228.25892-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In RTL9607C, there is so called "IP Enable Controller" which resemble
reset controller with reset lines and is used for various things like
USB, PCIE, GMAC and such.

Introduce the reset_control struct to this driver to handle deasserting
usb2 phy reset line.

Make use of the function devm_reset_control_array_get_optional_exclusive()
function to get the reset controller and since existing RTD SoCs don't
specify the resets we can have a cleaner code.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 0facd5f02e2d..64fd42513b86 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -17,6 +17,7 @@
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <linux/reset.h>
 #include <linux/usb.h>
 
 /* GUSB2PHYACCn register */
@@ -130,6 +131,7 @@ struct rtk_phy {
 	struct phy_cfg *phy_cfg;
 	int num_phy;
 	struct phy_parameter *phy_parameter;
+	struct reset_control *phy_rst;
 
 	struct dentry *debug_dir;
 };
@@ -592,6 +594,15 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
 	phy_parameter = &((struct phy_parameter *)rtk_phy->phy_parameter)[index];
 	phy_reg = &phy_parameter->phy_reg;
 
+	if (rtk_phy->phy_rst) {
+		int ret = reset_control_deassert(rtk_phy->phy_rst);
+
+		if (ret)
+			return ret;
+
+		msleep(5);
+	}
+
 	if (phy_cfg->use_default_parameter) {
 		dev_dbg(rtk_phy->dev, "%s phy#%d use default parameter\n",
 			__func__, index);
@@ -1059,6 +1070,11 @@ static int rtk_usb2phy_probe(struct platform_device *pdev)
 
 	rtk_phy->num_phy = phy_cfg->num_phy;
 
+	rtk_phy->phy_rst = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(rtk_phy->phy_rst))
+		return dev_err_probe(dev, PTR_ERR(rtk_phy->phy_rst),
+				     "usb2 phy resets are not working\n");
+
 	ret = parse_phy_data(rtk_phy);
 	if (ret)
 		goto err;
-- 
2.53.0

