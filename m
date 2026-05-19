Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD74921AA
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189605; cv=none; b=EU3TPKLOI0y9u3voj88MBWL9RUka2hSp4AmEGVo6uv5Qy90fiuBKzZz7ICWo2pKUUrz9F4+1fTcTHqgfxPjFl/owW8unFLGr64HDJkVxiztDBIWRGOnDf9VKSJocTzJpSG+GsMT/lI4IplKK37lbCdmye5WcTcZquI03Zuobxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189605; c=relaxed/simple;
	bh=dLXaYe5diorc9wO0xXPb0VONUhmQ+UNGEUQkpF0d8m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uO+rq3xIK++t8QZPZqvhlSytEqFRdbEpC9k/uj066YhCXsc8+HwVfBFP4Tc12H/Wr6G97KSTRz11YK4UIBKulZfrrjBNmykOwBCkV42xDY7t2rX76HazrzqixOn4Hpb57FzZj9ah4iLRtq7jGUt2nXESJ/CJQkSTAR4yfmP1Qls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7l5b4Y1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7l5b4Y1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-453903ee4adso735516f8f.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 04:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779189602; x=1779794402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nffFNJyJYbclz+zU24Jr2YC2Tb19NL3Gy5lFOXSCZXc=;
        b=U7l5b4Y1yHvvGE3ShWW8bXhetw4Tg9r2VqKDMHZPb0IV5QDr7aKVaMp+p/jAzFMsS/
         9jzJ1JfDDpZcidcAC6mV2Kotaq4U9yb4Vhf9TmyIK8K3sGOum6YJC/qG/BjHaefD8GNw
         UauH+CXnCQQRpfONfj61pFBMwH5uutFnyN7PlZammCicpg0eT5DXCj2NmhHBwaJzX6BJ
         CHnyByQzxFW2dgphtYSmb7ZYesjMTel+cBgTkpojuOJc/fg4Vj/BkZ+foA0cSQLyMdet
         PSVhu7ptReCDH3bFoC+ec2oInNi+0FWxqe0b3vCRV1QfAFEZ1ZsXSFb46CjcuI3woCGi
         YJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779189602; x=1779794402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nffFNJyJYbclz+zU24Jr2YC2Tb19NL3Gy5lFOXSCZXc=;
        b=BvBOESqxp4Ryoy5BpbXxjpafO2SV03Q7ITaTdm+nbNtnKWbDTjwTVn+WSn8aG8Tg9/
         9yBUtL0CVtZmIOOdJv+3WSpcBL1ypiyUIsoQM4zQ7qv5Cc+a5rlF2aUnpeSSgMliRGYG
         0cQI3IJFQQHYRfZ4augCVn59HDLvv5PfBM/DYR+PD/B/s3TuC0LEAeZYIKF9B5pILVN7
         QxmV/B9ufYOT/gJ7f4B5jUPMwHT2c7UVcp1L5sbZi8G/7bwQJ2Cx4D7tEjBPV8dl0wIO
         WnpwZ43LF1ieR8Ce4E0vu+75ap9oNACzlVW388t+9WxKuIG6ybhpMaMz9Tq5DsQnXpd4
         zMgw==
X-Forwarded-Encrypted: i=1; AFNElJ9JFsyXcMjMWhzdaKrmT5s5Uz0ULtED80xo4QifoH/EeHZIW+pwtuTvzgHNvedr1SpQLxfCduaOVQrR@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVM5zpLY4wQkQLvZVbyZYUpkXJTXSrrmqAE/o4wfMzhFdYSXL
	dBgys81GzCuCG7o1MwurAc/R9FbcNDarLFjGLWviAun9l6AE/qiwyUdY
X-Gm-Gg: Acq92OE6XoI+0Kmx7WrmuEAs8/pVFk7uzpiT+2ciIjOCROdn3+RwSf7hxEEp1vq3q/X
	wd/ESwP0MLRz4ouPJxVKFduwqQXaGW8X3MR1jzyiSwV5ama4A3YD8NYekljU5v4gTg/D3LpoD5M
	1YSevvBbdOApntYmvX3PJM/6RwZ02xiRSt+9fGoggmhsHe6vviUrpX9ir5rsgNrtaYxt+cyQmu1
	MK0Gp7Py7W7HmxDbbrssLF8+S/rM00oheS4NwVBti+cYm0RAkV/9grlZUroqxv9OxjBYEvtMgo9
	/Qub0ky8Te/9YUu4cH2LSfj/C98OPogvn74jcmwmp8roRWrz+cGoftRTUMUWKQmr4L0mefsX3uR
	f45KNS0+x6vDLy7qrwWD5iTOuJeP251GDqlcitKzedKcqR7iQTf0/3Rnhqktvy4VMn0eGVrGuYr
	3rZUgFHViQrCdCJleZbr+7BU4O7pNlYctH3s1u9H5fGCZOpC+2PDFs6kKYyPs=
X-Received: by 2002:a05:6000:2f83:b0:43b:5097:6f62 with SMTP id ffacd0b85a97d-45e5c5952d5mr29923699f8f.36.1779189602037;
        Tue, 19 May 2026 04:20:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:4abf:a82a:41d5:6663])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm46066323f8f.34.2026.05.19.04.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 04:20:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
Date: Tue, 19 May 2026 12:19:53 +0100
Message-ID: <20260519111958.233194-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree nodes for the three RSPI channels on the RZ/G3L
(R9A08G046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index a53d579eaad2..1fc409ebdd44 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -442,6 +442,78 @@ rsci3: serial@100f3000 {
 			status = "disabled";
 		};
 
+		rspi0: spi@100b0000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100b0000 0 0x400>;
+			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 444 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI0_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI0_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI0_PRESETN>,
+				 <&cpg R9A08G046_RSPI0_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f2>, <&dmac 0x26f1>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi1: spi@100e9000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100e9000 0 0x400>;
+			interrupts = <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 447 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 449 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI1_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI1_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI1_PRESETN>,
+				 <&cpg R9A08G046_RSPI1_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26f6>, <&dmac 0x26f5>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		rspi2: spi@100ea000 {
+			compatible = "renesas,r9a08g046-rspi";
+			reg = <0 0x100ea000 0 0x400>;
+			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 452 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 453 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 454 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "idle", "error", "end", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A08G046_RSPI2_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_RSPI2_TCLK>;
+			clock-names = "pclk", "tclk";
+			resets = <&cpg R9A08G046_RSPI2_PRESETN>,
+				 <&cpg R9A08G046_RSPI2_TRESETN>;
+			reset-names = "presetn", "tresetn";
+			dmas = <&dmac 0x26fa>, <&dmac 0x26f9>;
+			dma-names = "rx", "tx";
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		canfd: can@100c0000 {
 			reg = <0 0x100c0000 0 0x20000>;
 			/* placeholder */
-- 
2.43.0

