Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FF3239567
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 13:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976082; cv=none; b=b9mwI7Sdh1L9J0m2DvKEIflZpSirvENXHwsKKHU7bF9d3VL2kXQ7NFw77V0cB/RBJwt3OEgOMOyROYjkq4OXcz6PeR5P1ssIUH5Qe45x9j2igykB7IVaSmrxtlIsWopESWP7RU5/58jWo0nP7tQjGNm6cHefeZe6BYNTz0RNvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976082; c=relaxed/simple;
	bh=OhT5XTdCnmZPwjUqMASPcfbQyEP6D3JJx3ZVnZSOBMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l737iz9xdLUNvSZGGG/nxo4ASFaZ9Unn2pRNFMMBX0W5m5i9ag9pvtZSTvNDFIYuZpgKdSWiGM6ysdBzJfx71WrSGGoXwYAuffKMXMWQDjWh7ndPOuimXUONC0BKr1d81KtWH5XKACjkhtnEIsTr1atx8W3+X8fQlPaRJt6r7tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJg16ENh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJg16ENh"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4908b92904fso10598245e9.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779976079; x=1780580879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6a/KOtv5cuojKiqvq5Aw3Jx8xD/OEeudcBYxVCD8BM=;
        b=EJg16ENh8yuAjYsdlmtNpTBijsABg7mhsJgOiCzd7mgu2l7swiLWVhuCQvsgABRG3v
         fu44KWkioWD8K15ZUKFhIqjw9XYBWdqw9JMU981OOTkfkVCiM4aUxsbBCCk89wovJHL1
         fK7FmaKaRiTXKusz+M8vR9MLxsWDngUfdkpgclxBUiHVj4+K3ZEy+1inPFVFjtuCS/iJ
         6QJ1DNGcV+bdC7pQr357u3jCeEkAqvvgkSSh3ZsairMtR3IPyR54XE2XRHzDWTG/O/2N
         EefR+SVxrldvTagpW3Gx9S3pmQwrBDI7GLVih28o0gpQQ2lXqfIHVNBS1xPVJV48vG6H
         csng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976079; x=1780580879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r6a/KOtv5cuojKiqvq5Aw3Jx8xD/OEeudcBYxVCD8BM=;
        b=sdkbVIewHlU76y82WU1TS1n1zyXvSv/O13O95c21HqBpKU5bqI2cG5hg0WRKc7dRah
         d+Q6BvOiHXJ8XOYQ6fgXKzcAHgSMO72BVRb6U2m/ZJNG5gID8B6tdaBiMKmbhwYE0wCw
         m6jKhv8mA2q1cGwmI2ERT+PebIvsvuEftdQyRDWUODXeOQ5g/rm/cKRFPcT109kakdRv
         HOKahfCKlydVm6sntoooclpx/Nj0HJfnPYz2bFiMO+rQMa2ivkPKmf+YSfghPBLggPzl
         GldadeLZFy6Dk4mcRbUfg9vfOU7znGkvReSzmIIdBepGX5ugW+YZTzoEGR1kwC7Hu+DM
         9m7g==
X-Forwarded-Encrypted: i=1; AFNElJ9sE/kAeMUgky84ztDdgXIY0oEzNlZCDZUdMkFoVqs18gnu/xHNpH95LYTwTaWeVyhD3gXg7duMG4lW@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVrnxlKROZNkzZLkumcJhRcQsnzZqjM9hUiumgPaBCDc3bXQQ
	KHTHaXmBcBV5cq645C55Te6JYVaberVpf0pMf0mcsiOz67EmHutiUvZA
X-Gm-Gg: Acq92OHaeMXQeZ54BRRP8sUnuGj/M+fxS0mscgH19nmrvd90ND9ljVixHx1ar+ECvmf
	oUglVtfgk7TVBrjf5i7F1BnNs4ClktiNAxrM3DaUyZb5fXmm2N7TmrqnHbG3qXKqH54pBlfSCss
	4Bt0Yt1EIs5BFqgcJp5eQT7jlPf34TKMfLwuiOPlJLam4yqSOW76g7f8XD4jMX5Hu43TIKa+HIf
	QYlO9ECrCCIs0IgA9rE3hGXFl5vGf1C/LJ2GBPzyiAnXWO2IghxJMCwhKzh0CjFCfyWdehyEj1y
	jLBrz2ZBy39gzOBVZH+aWESc+A767pUts/vyEhSV45UeluDc3eeEDcy2hW7DCztVaHeXQsKcS7B
	2eCOFU3wJs2pSp2FBQqNkx9lGBkwXaCSuJr6CIxQBOgrQrks9+g10DGCYosSWgj0HYSyrBA9yG/
	MSSNVNPkU7TuN0BAPf+Wi/QkBRarZmDKMq6CuUt9z0EbHBJk+cs9bAg3+H51S25mCEfldlkwqVQ
	B6s0cVu5OdNruTYRU5cRfXVQRz37kIkg2i7NroLAzdPhhg=
X-Received: by 2002:a05:600c:310c:b0:490:53d3:4753 with SMTP id 5b1f17b1804b1-49053d34968mr367864985e9.31.1779976078562;
        Thu, 28 May 2026 06:47:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e50f:a16:236e:f9a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb54903csm14013775f8f.6.2026.05.28.06.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:47:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
Date: Thu, 28 May 2026 14:47:50 +0100
Message-ID: <20260528134752.79813-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260528134752.79813-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the unused TXER, RXER, CRS, and COL pinmux configurations from the
gmac1 (ETH3) and gmac2 (ETH2) pin groups.

The Ethernet interfaces on both the RZ/T2H and RZ/N2H EVK boards operate
in RGMII mode, which does not utilize these extra MII/GMII sideband signal
pins. Update the board switch configuration comments to accurately reflect
the pin ranges that are actually in use.

Fixes: b272b94fd2239 ("arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts   | 14 ++------------
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts   | 15 ++-------------
 2 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index e9ed2de128f6..987e44d0bf95 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -256,8 +256,7 @@ can0_pins: can0-pins {
 	/*
 	 * GMAC1 Pin Configuration:
 	 *
-	 * SW2[8] ON - use pins P33_2-P33_7, P34_0-P34_5, P34_7 and
-	 * P35_0-P35_2 for Ethernet port 3
+	 * SW2[8] ON - use pins P33_2-P33_7 and P34_0-P34_5 for Ethernet port 3
 	 */
 	gmac1_pins: gmac1-pins {
 		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
@@ -272,10 +271,6 @@ gmac1_pins: gmac1-pins {
 			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
 			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
 			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(34, 7, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(35, 0, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(35, 1, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(35, 2, 0xf)>, /* ETH3_COL */
 			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
 			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
 			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
@@ -286,8 +281,7 @@ gmac1_pins: gmac1-pins {
 	 * GMAC2 Pin Configuration:
 	 *
 	 * SW2[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
-	 * SW2[7] ON - use pins P29_1-P29_7, P30_0-P30_4, and P31_2-P31_5
-	 * for Ethernet port 2
+	 * SW2[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 */
 	gmac2_pins: gmac2-pins {
 		pinmux = <RZT2H_PORT_PINMUX(29, 1, 0xf)>, /* ETH2_TXCLK */
@@ -302,10 +296,6 @@ gmac2_pins: gmac2-pins {
 			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
 			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
 			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
-			 <RZT2H_PORT_PINMUX(31, 3, 0xf)>, /* ETH2_RXER */
-			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
-			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
 			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
 			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
 			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index ef6cc7497c2c..a66502d8d82b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -339,9 +339,7 @@ can1_pins: can1-pins {
 	/*
 	 * GMAC1 Pin Configuration:
 	 *
-	 * DSW5[8] ON - use pins P00_0-P00_2, P33_2-P33_7, P34_0-P34_6
-	 * for Ethernet port 3
-	 * DSW12[1] OFF; DSW12[2] ON - use pin P00_3 for Ethernet port 3
+	 * DSW5[8] ON - use pins P33_2-P33_7 and P34_0-P34_6 for Ethernet port 3
 	 */
 	gmac1_pins: gmac1-pins {
 		pinmux = <RZT2H_PORT_PINMUX(33, 2, 0xf)>, /* ETH3_TXCLK */
@@ -356,10 +354,6 @@ gmac1_pins: gmac1-pins {
 			 <RZT2H_PORT_PINMUX(34, 3, 0xf)>, /* ETH3_RXD2 */
 			 <RZT2H_PORT_PINMUX(34, 4, 0xf)>, /* ETH3_RXD3 */
 			 <RZT2H_PORT_PINMUX(34, 5, 0xf)>, /* ETH3_RXDV */
-			 <RZT2H_PORT_PINMUX(0, 0, 0xf)>, /* ETH3_TXER */
-			 <RZT2H_PORT_PINMUX(0, 1, 0xf)>, /* ETH3_RXER */
-			 <RZT2H_PORT_PINMUX(0, 2, 0xf)>, /* ETH3_CRS */
-			 <RZT2H_PORT_PINMUX(0, 3, 0xf)>, /* ETH3_COL */
 			 <RZT2H_PORT_PINMUX(26, 1, 0x10)>, /* GMAC1_MDC */
 			 <RZT2H_PORT_PINMUX(26, 2, 0x10)>, /* GMAC1_MDIO */
 			 <RZT2H_PORT_PINMUX(34, 6, 0x2)>, /* ETH3_REFCLK */
@@ -370,8 +364,7 @@ gmac1_pins: gmac1-pins {
 	 * GMAC2 Pin Configuration:
 	 *
 	 * DSW5[6] OFF - connect MDC/MDIO of Ethernet port 2 to GMAC2
-	 * DSW5[7] ON - use pins P29_1-P29_7, P30_0-P30_4, P30_7,
-	 * P31_2, P31_4 and P31_5 are used for Ethernet port 2
+	 * DSW5[7] ON - use pins P29_1-P29_7 and P30_0-P30_4 for Ethernet port 2
 	 * DSW13[7] OFF; DSW13[8] ON - use pin P13_7 for IRQ14
 	 */
 	gmac2_pins: gmac2-pins {
@@ -387,10 +380,6 @@ gmac2_pins: gmac2-pins {
 			 <RZT2H_PORT_PINMUX(30, 2, 0xf)>, /* ETH2_RXD2 */
 			 <RZT2H_PORT_PINMUX(30, 3, 0xf)>, /* ETH2_RXD3 */
 			 <RZT2H_PORT_PINMUX(30, 4, 0xf)>, /* ETH2_RXDV */
-			 <RZT2H_PORT_PINMUX(31, 2, 0xf)>, /* ETH2_TXER */
-			 <RZT2H_PORT_PINMUX(31, 1, 0xf)>, /* ETH2_RXER */
-			 <RZT2H_PORT_PINMUX(31, 4, 0xf)>, /* ETH2_CRS */
-			 <RZT2H_PORT_PINMUX(31, 5, 0xf)>, /* ETH2_COL */
 			 <RZT2H_PORT_PINMUX(30, 5, 0x10)>, /* GMAC2_MDC */
 			 <RZT2H_PORT_PINMUX(30, 6, 0x10)>, /* GMAC2_MDIO */
 			 <RZT2H_PORT_PINMUX(31, 0, 0x2)>, /* ETH2_REFCLK */
-- 
2.54.0

