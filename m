Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C807351C1F
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777985969; cv=none; b=pjffrf0bqUaRBaoIoZcsX8MDyyc02stQkMS8I6uDJt5kHRmvGMz1yygW8ycNOt5uvTUBSVNo1SLtRigsF27MyxCW6JHieR2lph8sef/2LYHukDOlFiRhzOjiYApnKe6IrAC6T6I8tM+mZUOzRiMFVEL26HsvY7Q47X1QbiJGYjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777985969; c=relaxed/simple;
	bh=xLLJmmx50oSlGKdUkZVPjs7CGWjZQyika3p/VZELo88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=av3r+MzFCt8s5+MKnU0la51gFm3dLQMdAe/y/6Q8N8vow+iZGq6vnfisVVARBu2fF1wSf5K58uRks6aSvJk0SUjXD4nD6gxWXuIwsqORpxdy/a3jbc64nan13ywbkhH60dR2QYVbWY84/GkY7+2hroDgRFUWjJf8BYVl8i1Vxtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSwjKVLp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSwjKVLp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so45858235e9.1
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777985966; x=1778590766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kS7Uy+MARv0IhyXez5pJGX7FKzDu8eOlfgH3HpZCrpg=;
        b=GSwjKVLpUVa6Zz578R+Yx7agyJnL/OBSkcvkAGjZTLSXdGKOCnw/ofzBPxWyv2jd7U
         M2D1ONVSmTPynxl/YYKYPZYkHyLx2ksKpC1ulxyocwjQvBFNffOQqq8TOn5OeUYzNfDj
         TJHM3x+PaJMWfP8fGLtvfoRwFOztN9C1069rc3Y9Ca7TAvl+SOecs7G7TQrFiJiEUwvV
         ktC5YhDBhYsizIlRVk9+oQoWUn38As2zr0RBpHP1EjPkQSvzi1Y1mQSIsJwJmjYQx/AG
         CGhh9wX1PPCVQ9h1tRCG4UPvdSGfoTsq/vE1rI0lZUAk+AyhcnoE2EVS8i4cwPoqz5xg
         PcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777985966; x=1778590766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kS7Uy+MARv0IhyXez5pJGX7FKzDu8eOlfgH3HpZCrpg=;
        b=MuliJFb4wMKbpJEff7ROU4Aa7XwwizfknpMwv6IIW0r857K9rMcuLFBRc6Fare91cF
         KZxbIDK6N0a0jvptLZ0u/OzeyFUJkZ5rzZ1gYnWJrLXGDewyqFdUst9DLA5mRkY3Zsvv
         bDjK5+Efgt/55c+R9CkCc6VEAYGS/ll7iC/El+556lOeT6mjX4S3orebQwPXyEMAPhLj
         Uwja6znk+Pw3QfSKa8u1jrDElWra4FKdcjeSGOR/TOrDGD6KU7wGqAGbCHEcQgYoodXS
         CWE/Z4Cij6PPbLON9tG72oQVAvbMBsYLWtPgQdmos+JjSATH1xRNoB7jny2yeNzk2lbh
         uPlA==
X-Forwarded-Encrypted: i=1; AFNElJ81gx8PjNZ/eWSmzLF+FZxx7f12C875qQ/RFvSN6MXPnugPTBIY4/EaOWjQg+VmDRlzm191eyz5qAvh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrw8V6p+fA1HhZkGl9+LVecZSPh470DlI+sXO5F0vVAxr78eYU
	QIP/SDUjRCLdKaY9DknttJ2g1JkOCHP9Gckv6J3M+FBOE4fDjMc4WrGk
X-Gm-Gg: AeBDietWAIZfWSmDw4JW7OLbvCYSzhpGlS35BOM1LGO4YyxGS0bGVE5UljlDr6e+zRf
	Pfos4oei+68ioMziF5rJD5HmaP51TN4b093D2vAreny6m0YKbpHAE3I1KIVzChd7+yV2rqQmtKv
	KG91bkswKKn66airrcrFfRN2t3WJ/6SRDD87puvWG8P+Ajyt9VBTBwPFtlMsOUfXeIroR5k7AlB
	k/L7sQYHdr2qIj0+lxRU2XqafI37jEsRKY47ogyKx4Kf/avVw7d5cy3gcVrBasGaiBV1wc3bOos
	LmAVFOyRKcwW2yfToFYD3I9QT6STF+Ls5P2z/Vq9KI+9tgl9pdod0JwR7eOMRs7NXpJrkr36EXS
	u0PlUMSqS1rY+3/Xen0ls55H5TYYjtI4wbRWWFK6SpHerA37eJGJ3/TysiL2oqC+pgJYtLHqkJf
	kS28p7UKvO1WhJbmFNC8Lt5kSbZPd9xKlHPHh641oenTN/eTRy+fwZUHYAVbk=
X-Received: by 2002:a05:600c:198a:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-48d18be8185mr48151255e9.22.1777985965879;
        Tue, 05 May 2026 05:59:25 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm625634745e9.9.2026.05.05.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:59:25 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a08g046: Add wdt device node
Date: Tue,  5 May 2026 13:59:16 +0100
Message-ID: <20260505125921.149682-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
References: <20260505125921.149682-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SOC has 3 watchdog timer channels:
 wdt channel0(wdt0) for Cortex-A55-CPU Non-Secure
 wdt channel1(wdt1) for Cortex-A55 CPU Secure
 wdt channel2(wdt2) for Cortex-M33 CPU

Add wdt0 node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 55cbae6ca8d4..930873ae7786 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -875,6 +875,20 @@ gic: interrupt-controller@12400000 {
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		wdt0: watchdog@12800800 {
+			compatible = "renesas,r9a08g046-wdt", "renesas,rzg2l-wdt";
+			reg = <0 0x12800800 0 0x400>;
+			clocks = <&cpg CPG_MOD R9A08G046_WDT0_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_WDT0_CLK>;
+			clock-names = "pclk", "oscclk";
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "wdt", "perrout";
+			resets = <&cpg R9A08G046_WDT0_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

