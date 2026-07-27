Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979DF29DB64
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785118278; cv=none; b=LtM9GEe4WMBmm0HO8bC8fQvZVBnu7U7PV5gO0L+XCDC4p4ND0oSCDqqBuyAg18Mz8MFQCKMBTXhF5xUbCybpPTGZL2kWnQP94djaWFNhgV/mNAr9l8dwaofFnKJLItfe2TdG0QMtLUTiKWH61+veRr8uW2bmkBYyPKCr7SkTD+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785118278; c=relaxed/simple;
	bh=idqaJ1zW0f6pRD3+LKzzW42z3MhH+7aIMsIbm9yfVyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQjmXJ+a1KBwO+yitNsQe/60HD7cGYhoT0qKHGgInfcTQv72RFW7kRqBD/6Ygt7UYt8XpwLW6qBv7uvc1g89snbZNkYv3L1ztxuU27cu4yUGs9hPLNFJarPSmUfwl8QRrhBPOVR/Et5DB9OCg2Q2RUdjevgtKTKBiSeMhWJHGOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FreEkvKx; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FreEkvKx"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so2247625b3a.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 19:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118277; x=1785723077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JN7LEuMudq1mUi6BCPF5860crqnrJNZXCJN217lSS6A=;
        b=FreEkvKxYyBSh24XgGQnTaPeCALufyAFCQoQMpWWPEv7o8Ln4DNDfoPB+rVNAKnNwZ
         JrKEH3N0smbDvqcvs8zA9yddLjLxXneTNfz/smnkvAT9SKQW3M1knNSLeh6GvmaMRK+l
         yXNbzwfenBBBl8B0puqF/K8cbPY6GDOlTuUsHmZky1703G2MUKPCZf62GmP53gh+/6vQ
         OW5CTUAvEnqTH2MQE/5zSiAiELSnkTJ1nGZaDdzm8hDWhc2NFqAsQA/gmKVZdnAyMHmv
         w+KEDumEfdT5VUAOIpfepwS9ikmDStqTxkmVuur2YayPLesN2LzGVtlUJ60c6kUPX0Ps
         cxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118277; x=1785723077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JN7LEuMudq1mUi6BCPF5860crqnrJNZXCJN217lSS6A=;
        b=JsM/D4Dy2KW8+166VB9Gf3d7H66H8v2xs+g7qqTy0FMAmgmBreIsM7QAI4X/5RvUTc
         3wXUE4Xj/0mBkd+thQW7Ln3jO0He8VJurT1o10sJbhE44fdA5fGzf9PL7/GFaWJUhCMJ
         f4Psu6tT9TZ65gRKmBYU0P5VN9R69DMZW3f8eRYlKC9h4noeXpp+zjQYEKqS45Dmv2qV
         CxoBVQ1c/uWef/L74HDfcMF22JblXOljITriJWILCL+sEhtwC93fu1vrmGpFZdtldWBZ
         nPaRk1/o0zYCQavMxcBN569gxySK05Iofn3iW5aVv/3J1B0pIDOpxZ1yobnpR4/bHfix
         uzsw==
X-Forwarded-Encrypted: i=1; AHgh+RplP2hzpSFvI0XBSFhjW/bw5DHtXgLFAIIcOc4oZCAlxe8A0BGBYUwpEWXpj2sYyMGK7Xj78Ft0D9T6@vger.kernel.org
X-Gm-Message-State: AOJu0YzTXDPZfI93uGekDMNkc4qyjvJbw/zJy1FRGFMNkKM+J9GuMwRF
	ey5L4G05eYNnFbBYml/sssZCwmafKwuXREocXwE+bVBiXxMfK3FqDtBO
X-Gm-Gg: AR+sD11eFIQzTvWq5YHVU55nTg05sBxmvAHQrOQYdZaodEshwIoXrRq6tM7RhAKrnPO
	wgCPoWAdOhF8QEVktHJ0O3eN71kUjnGBeyxLgFLFVh/xXGAB00EcyvTXpo8Tbncfd+TICJYybX4
	cX1QvbcuPtoHCaMZOY/Z77tw6x/mXjnCPRoQ+mePyeCnWpfYkUi01sD3CATRNQ/9/91b96gOWTE
	5qKNrjVq2yA9GLbWu/rsplZksj4Ysfh7nu//AUsIn0f0DR7rH0vnV1lUDTyJ606t93nZwehlYLY
	mj2ZnlkabAiBYv3OodMHnBS+8iJzV2esemjIRyBY1r+HOXn4WO+xvLKKET7brIJVtJz+l7SBlUG
	tAMASSGNAl8LQElPjvK1K8rxjDgIrx2pfieHf711vphePDPrtFVFyDxINEdwFxRbyAWWf2h8LEq
	1x8WaDg+jHQadbEKYraSWRg80=
X-Received: by 2002:a05:6a21:8282:b0:3c0:9c1a:8936 with SMTP id adf61e73a8af0-3c67e131180mr5856351637.62.1785118276966;
        Sun, 26 Jul 2026 19:11:16 -0700 (PDT)
Received: from attina.synaptics-inc.local ([199.33.119.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm19162200c88.13.2026.07.26.19.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:11:16 -0700 (PDT)
From: Gavin Gao <attinagaoxu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	nicolas.frattaroli@collabora.com,
	sebastian.reichel@collabora.com,
	sashal@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	attinagaoxu@gmail.com,
	amadeus@jmu.edu.cn,
	rmk+kernel@armlinux.org.uk,
	horms@kernel.org,
	alok.a.tiwari@oracle.com,
	david.wu@rock-chips.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 2/3] arm64: dts: rockchip: Add RK3576 GMAC 25M refout clocks
Date: Mon, 27 Jul 2026 10:10:46 +0800
Message-ID: <20260727021048.3375444-3-attinagaoxu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RK3576 provides REFCLKO25M_GMAC0_OUT and REFCLKO25M_GMAC1_OUT clocks
for the two GMAC instances.

Describe these clocks with the clk_mac_25m_refout clock name so boards
using RGMII output clock mode can let the MAC driver manage the 25 MHz
reference output.

Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 70e67d4dccb8..f1125c2f88ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1692,10 +1692,10 @@ gmac0: ethernet@2a220000 {
 			reg = <0x0 0x2a220000 0x0 0x10000>;
 			clocks = <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
 				 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
-				 <&cru CLK_GMAC0_PTP_REF>;
+				 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
 			clock-names = "stmmaceth", "clk_mac_ref",
 				      "pclk_mac", "aclk_mac",
-				      "ptp_ref";
+				      "ptp_ref", "clk_mac_25m_refout";
 			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
@@ -1739,10 +1739,10 @@ gmac1: ethernet@2a230000 {
 			reg = <0x0 0x2a230000 0x0 0x10000>;
 			clocks = <&cru CLK_GMAC1_125M_SRC>, <&cru CLK_GMAC1_RMII_CRU>,
 				 <&cru PCLK_GMAC1>, <&cru ACLK_GMAC1>,
-				 <&cru CLK_GMAC1_PTP_REF>;
+				 <&cru CLK_GMAC1_PTP_REF>, <&cru REFCLKO25M_GMAC1_OUT>;
 			clock-names = "stmmaceth", "clk_mac_ref",
 				      "pclk_mac", "aclk_mac",
-				      "ptp_ref";
+				      "ptp_ref", "clk_mac_25m_refout";
 			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
-- 
2.55.0
