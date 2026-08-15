Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1D43BB9EB;
	Sat, 15 Aug 2026 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786785292; cv=none; b=tnkW/PDWkT4vV5lvth/VAtNuaRrtBgJItrQua01FAADs07XRJdkdY+2izpm+utA2x7/t/IzwNk0dQCUvMiod8J/ylPptrEl8MlzwSnh6upQO09qiekhnKSuXkC9+rv/I4+x1XbFkEnJHDzKwEUtNmB9dQ1FDpXF/OyZB1KDmEl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786785292; c=relaxed/simple;
	bh=rpnTVB2lvy7vaRGEwYc4n2Ueim6D21MwthwfXOQ60pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTgwF3j8Qug/YwGPynzzdxh9Yk1lcNZZU0UaDLL+DCI217abDSaVxMWzB9Mo05q/50rT/u2Ob+Jducid5sInxyUGyAWn0apg7wJTfnOHGVSKMNlF5hSNcU0dbLP71/sUcKhwkbjaB9SW3wqlj8vrxR38dddAXPbV4P5CHaldLzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Hfzo6tyF; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Hfzo6tyF"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id B361588362;
	Sat, 15 Aug 2026 11:14:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MecjSrzQRqm6; Sat, 15 Aug 2026 11:14:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786785283; bh=rpnTVB2lvy7vaRGEwYc4n2Ueim6D21MwthwfXOQ60pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hfzo6tyFEiG9qHwaPL704zRZjdFDIzzvw1IZ+eJ3XUEjr1onl/zTZt8HuX3Rs32GU
	 QlYiYou/THgNmckhzjG/7ku0XXEd7m1TFLm/S4jTVOxZjOU3fnTnXU1KcRJpZWye82
	 dSiKn8xsRzPj6JN/WRPswfhyXDQ16Y6oQRYyrZRz3swYv66azW/v/nQJiyCzyUq7Qf
	 AX7HSPczSv2JEnTgXOdKFIKG5tgbESu7ZCinr0ls/U2VPiCyAgfyJqL0UrAJ9ZfMsc
	 7T7AbT86+HTDh6W71gTsq5AuBSeFs5r8tfQTwW9nfa0T/u6eJlYkI8f2hzY4U54is0
	 +CYJy/0fF5mjA==
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
Subject: [PATCH v7 4/6] phy: realtek: usb2: introduce reset controller struct
Date: Sat, 15 Aug 2026 14:13:38 +0500
Message-ID: <20260815091340.26910-5-adilov@disroot.org>
In-Reply-To: <20260815091340.26910-1-adilov@disroot.org>
References: <20260815091340.26910-1-adilov@disroot.org>
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

Make use of the function devm_reset_control_get_optional_exclusive()
function to get the reset controller and since existing RTD SoCs don't
specify the resets we can have a cleaner code.

Since the vendor usb driver developed by Realtek doesn't assert the reset
line (or in their case clear the register bit), we can reasonably assume
reset_control_assert is not needed here.

Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
Signed-off-by: Rustam Adilov <adilov@disroot.org>
---
 drivers/phy/realtek/phy-rtk-usb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
index 5e483c853f02..2ddad7be7353 100644
--- a/drivers/phy/realtek/phy-rtk-usb2.c
+++ b/drivers/phy/realtek/phy-rtk-usb2.c
@@ -17,6 +17,7 @@
 #include <linux/sys_soc.h>
 #include <linux/mfd/syscon.h>
 #include <linux/phy/phy.h>
+#include <linux/reset.h>
 #include <linux/usb.h>
 
 /* GUSB2PHYACCn register */
@@ -128,6 +129,7 @@ struct rtk_phy {
 	struct phy_cfg *phy_cfg;
 	int num_phy;
 	struct phy_parameter *phy_parameter;
+	struct reset_control *phy_rst;
 
 	struct dentry *debug_dir;
 };
@@ -676,6 +678,15 @@ static int rtk_phy_init(struct phy *phy)
 	if (!rtk_phy)
 		return -EINVAL;
 
+	if (rtk_phy->phy_rst) {
+		ret = reset_control_deassert(rtk_phy->phy_rst);
+
+		if (ret)
+			return ret;
+
+		usleep_range(5000, 6000);
+	}
+
 	for (i = 0; i < rtk_phy->num_phy; i++)
 		ret = do_rtk_phy_init(rtk_phy, i);
 
@@ -1055,6 +1066,11 @@ static int rtk_usb2phy_probe(struct platform_device *pdev)
 
 	rtk_phy->num_phy = phy_cfg->num_phy;
 
+	rtk_phy->phy_rst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(rtk_phy->phy_rst))
+		return dev_err_probe(dev, PTR_ERR(rtk_phy->phy_rst),
+				     "usb2 phy reset is not working\n");
+
 	ret = parse_phy_data(rtk_phy);
 	if (ret)
 		goto err;
-- 
2.55.0

