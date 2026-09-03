Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7A64F473D
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455303; cv=none; b=V5/gjXLEQwlqmokeDnTVJOVSS9Am6IeiIsA4FT1Sqy/lXIaXOWbIzLzGzFlyMQiKbnl087iCfYHutIwdjR5ljciZI1LyPU3J+kWsRD7nVwA1ubqbBGoxUZfiOEokOwvdpFapGnM24WHhNNP7LLg8CdOdXTb1h/B64g2/DVQan90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455303; c=relaxed/simple;
	bh=IVoujA+C+M/kei9eyCb8PbxU2gqfAVemANW0Mr7KYQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePSQBX4O+8w77ZyAlu2eBMWHis7MCoaIWk6ZU8xD0FYZhjfztfnqAx//DkeWtoqrJMMQeNGV8crV8iGT1oSWHGOzEYljclginuPtzW6GdSerySJOH0r6tlYyaGmR7wENL2fYz+8QQe3C42O7FPyREdbc+zsQkgYdWeIpBjEqZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTFEh7yp; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTFEh7yp"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso1111965e9.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 10:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455299; x=1789060099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=VTFEh7ypJtqezN1xOZG4LHLbfpdzKofzWHViAaNVB7BIUoBuzr6SB5DjUcKObyuNo+
         t8E2jGUhRz70+iOgyCL4eN8c6sY7AuBMvtZvR7PXFfuhYe34yjl34fkpesGMHti/uQVn
         pe4JoUQ6r21G1e/DCe7NkQXv30IARtBio123uQWlVgTog0j04ANltEm0G3kC0XLbeGnA
         AUSLe5jSBsYUXCHk9H9OTMJO6g8r5UtXRsTIWZjxkTFqonzzwu8hk0QH9AondF7Ny4FW
         GOg7QNKcziWJ+u9Ebx8yxM7vc2tYwynhwweUkO7skwnuj/VB/qGs4Qz6apXUMF5mjq0B
         35ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455299; x=1789060099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NF+0Eh+B7CRrv91L1LEQIL8RYBdIoY5OhO6aCb2cgjw=;
        b=ADMX08CrjIKGSy5mOUvigKRxBvBZjYhOlMLenoskCrJmsYPnfsqwdAXXHJgZPwE1EX
         q7oHNZ1BM4cABSRMWDI6p0GiFnP0pJ9woGyjsr7ZtGb74HOkljtXb4gBkDhoEk4OXePm
         apc9ffWJE5lkI2RaKHix4Qusg2EwwfwD8q7FST+f4A+AiZfaS+0qUCGwdrIHhCJE4kPb
         2VnVnbUffB20GgJEnFHPUPV/sxI8ltHFu9uEAx1FyBBlk6ZIpNrHc+Uz53gWhSgYoGWJ
         lh2O3EVpjFsaqLXQ2Ui+A/piios9rP3gqFuRUauYhWHoC4a3DTtGtxL/Y+kI/K4FgIb8
         1Gcg==
X-Gm-Message-State: AFuF++lp0OicTDH3kEQpxjMjxpGH8JQLqL11MosI2iq4InrhRQjPJzTL
	4ezIdeE+jb+DNT4JFGXq62z4eK5KTTNsvKNV64G7txvuqIM1MJ+b2GlB
X-Gm-Gg: AYBFou0kQbLZKf+vG9NjS5+CxrFMlKh56Q5Z4NYxkvkOyZKSNlSVjqguKViWJrToOpj
	7f18ffdJk7TYtRMO4ZbUGD4f0T4cGqj8j/zKSRKJ167ucLkOmgyKqOvIkqYKKUyHA5V7LZSSowg
	j+MNX4H1tgEMrRY+bP/HC/r+rAmN7EhSMMvL7az59Fcz8bUXmV/gmAe5DGSsbfmiVDFDXhDLRuj
	aA9eCfsMnM/8HfF3RsVVt6iK845r08N6XCzmx10sA3ZKGk1bXIiGSG2ukMJm/ADJfEeXV98VK5b
	Wl7CtsRyXk4xzZcYMyMCh0yLR1BKCdIu6X6eWAo03cnq3dd8FS9oeiZHD9wioQ86vLMsi77p8dW
	Djcom43liMKKWKbSwk0TRmDCliAJIm27zLqv0oz6uqod4ulCzV68idQBckjQr8KH1ezoVH+gKlu
	tWQKQRXH0bCqo6zAV0c3SDwI0YYqHEfmOSaXr2l3BVjxFLU0qXPOByoxSwK3s080jOrQOM3iJaY
	96v/SH44CES/6R7m05wJngRik7LAMnAqA0qFiKKrhPdfjxklDMsdy6sCzedHGPUD7CYigSrb34t
	jKij1qhEGgLsAKako8I89pukTxT8AMEmYrJhuA==
X-Received: by 2002:a05:600c:4f87:b0:49c:d293:70c8 with SMTP id 5b1f17b1804b1-49cf4f9dce9mr56543595e9.3.1788455299039;
        Thu, 03 Sep 2026 10:08:19 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:18 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:01 +0200
Subject: [PATCH 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add ENETC
 port 2 in SGMII mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

