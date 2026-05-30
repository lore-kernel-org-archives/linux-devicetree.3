Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CCB388E46
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 07:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780126933; cv=none; b=jbs+OrbArqtmayZvZBvxhG4V1Vl9hMxnYLKCfgY3MOGHQpmzQ/mC6LNtPbvgNcJrNbaPmFPBKRKzaXhXawWsf4UAT3ARaDdGX5RD852hGIbsQbePWjgPsLjCJh9tk/7j/OuhrFiaemA4gScd7S97UCy3WjjSa6M/2xG/XuD9TBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780126933; c=relaxed/simple;
	bh=/0z+dMU04rn/b9fAduJq8vrEIO3TDrjwz5iHHrlrSFI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDW9Jfsv18+6XooRB+HWsYp6WUcnAb6gmWqchxxzT009AMkg3kCEiD7rOsMc+UsqNLFBkyMkY/1hDWoY0C00VNio0UPGzzRn00VvKMlt+TiDqNNyAusCVRPDhfPyA7uEtwBCqYB3fh2cn7ybiFfLudTpzIrvo9CsHeKGQ7Kncnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k0mDAuU8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k0mDAuU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=DdpzMgZwFfctrw
	ngS5V7SlOXkXOkNpsU7Tb7EZsldE0=; b=k0mDAuU87QkKfmYs2y1IVaB/qELqmS
	xipcSKAJTHULk+8vHbV3CLj8RLcdgiJPXX+pHQ2zRnbQUexkpB+Qoa0RW1CLDVcg
	wPjUVligPn+iuTzNcw3+GjpRoCmbiKxxXAjudopG2lXXg2b6SdP/kVxfh34fTAhn
	hy6KDJ+/OiWuZc2y5FfwxlX8QG1MnHEG5/swHIeKJtU4IM4gxoBkYycDpMX9bYk1
	Vm1pTBrflV2aQONnpkJjUEgttInM50O0fbtWtfoOT7vResF0WaHLG4arMOV8IuLu
	gqcGUl1zYsJj1+ZDAW9b9OsF32nc35a/EQtxBVGkD66l3+0OdyTQo/Lw==
Received: (qmail 1679564 invoked from network); 30 May 2026 09:42:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 May 2026 09:42:07 +0200
X-UD-Smtp-Session: l3s3148p1@/YUeGQRTOaKSAB1K
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: renesas: r8a779g0: add MFIS node
Date: Sat, 30 May 2026 09:41:15 +0200
Message-ID: <20260530074202.24203-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the MFIS core which is used for various tasks including
inter-processor communication. Interrupt numbers look irregular but they
all work as expected on a Renesas R-Car V4H SparrowHawk board.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Binding extenstions for this SoC are in -next now.

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 82a7278836e5..9779b88b7995 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -603,6 +603,23 @@ tsn0: ethernet@e6460000 {
 			status = "disabled";
 		};
 
+		mfis: system-controller@e6260000 {
+			compatible = "renesas,r8a779g0-mfis";
+			reg = <0 0xe6260000 0 0xf000>;
+			reg-names = "common";
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 916 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 918 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "ch0e",  "ch1e",  "ch2e",  "ch3e",  "ch4e",  "ch5e",  "ch6e",  "ch7e",  "ch8e",  "ch9e",
+					  "ch10e", "ch11e";
+			#hwlock-cells = <1>;
+			#mbox-cells = <2>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779g0",
 				     "renesas,rcar-gen4-i2c";
-- 
2.51.0

