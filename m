Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643BE407CDC
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009686; cv=none; b=f+oxD3GWg/YaBaz0thDbvnYcA5TZTpZfKbzHpJ8RMAx+CbCg+Z5ffrpJFYyZG+GYR6QbwNKXLhkqHrcwe0JLTlG5zIWqb2uJ90YWOKEO2FaEItPA5+YllPJn4CyzWDZNfqNUDEPp6v42L5NTojjINnsKA4hpk7oggpQcHWTGUns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009686; c=relaxed/simple;
	bh=jpAzcsar83RT/yJsgZz3cbdGzD5XuyeMnf3Y+zyOldU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jk+ru91a17Y6HZMbGNLqJyiZ/iUr7+Q9lxPXYdRJcXL2W8whsEc86u616mavGOs6e8q9+GOEsHp6p3Z7x8662azi9IRKsSw+V1udXAQoKYRd36pdgGkgyySnPiOslQ1JIFD25mmYmZa29mhT6SsLHlteWdfUb28ne9ogSevj/O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDfl/XTe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDfl/XTe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490c1915793so36863315e9.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 05:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009684; x=1781614484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZbdhxNRHx0Zryd46XkBMjMtJwqMLavPuhsEZIYoVkU=;
        b=HDfl/XTeZUCD217RLs54Z2TKrKBvaxJreTkz8oicVKPk1NTpon9CGJsmjb2yzoqwJY
         ozoojxieVtq5KZgXDzqOJXERCu2H5EatEowNsGAQ+8a55cBvvgJB24z0Oc+5w6Z6ydsz
         EJUUKjdtxdy+f96ubUCm6InEJkNbLon0lm2y1tbf/KAcnO+PhoiHSyZJ0jAgInQEIsxP
         2+4rds7G2jIfncw4J8yMgmJn4IUamSi7QBJMPL++xqYaGhJbz8cWwAA9fGYXBl1W0LQK
         Et1ThKe/m3U4NojyJz4q+7eYuA/YCe+cJKWdLxq8Ds4Y74mBdZsMyemU8m5OObE0gxqB
         LuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009684; x=1781614484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZbdhxNRHx0Zryd46XkBMjMtJwqMLavPuhsEZIYoVkU=;
        b=ktLypKVw8GdsMnqqtxRf2YENFOnw0LeIXV1/m/bmZvUAzyvY3x7MWious4pW30Bcrw
         BasqYf6SNFtq5/cIcmfksYYLnFMuQZFs2M8P15AV/s+7Ai2us8JidFPVJERLlHJR+Y2Z
         0pOlOlT1kXx8gLB/pzO/XD9lcQi6vh2KuLqjKzDkaqzLa6PbBxPSN5zMeR5UjqzTMXCT
         g7etw18AWgL0QPEwtf6ADSSENIkY+ZMU6Z5tdunpARyLhSkwhvtrGG1haYSmF3QiLPoe
         NEYMdxyubQFJDmKmjY9WXQLjrOfnXDEfG+YnyPEA7PPQplmmuTQyXLIC8TWQXCpfEWDd
         E9Eg==
X-Forwarded-Encrypted: i=1; AFNElJ9RVuZdQx5he1glPA6HLmmk+hfWcc5HQbMOAl95Kpdy8Uo0tuM7ld5aLeWy0LCpnSMfJNX8Fafpzd+L@vger.kernel.org
X-Gm-Message-State: AOJu0YzVkrrqQGa9+b6Yhwto65rB6Wrr4QblGiU0LahTwG2Sa/hFpNJ8
	1N8jWdW1ARkF8WbXOnk2+rD8KKUcrXJYXIsHK4DDCYiCb/udkJPwvlA9Xa0o5t4Q
X-Gm-Gg: Acq92OFpcMcQRPLHES0+PdpoQBHxOyhVmxBfm2l2VHgpGbY44ZxrT5AV+lwV0Zk8RpZ
	e8jAyQCk/6mZ77+jLptdWPiocd657cB+aBiTlGs57CvZcdWL6byUhfXSJwgSuEq8z9K9b99LZWu
	Vb5kwDCTRnLwsFA7Fun/87DH/O172TkCCvf/J+l89ZKwSzbNBxrvVK9KGBogT7bPBz8WllaBc9u
	SzV9NlHwJFsVpiL6ccSA1uWGMhiLk0eXadWsPrWf3EW7PkYgNGTpZ82b41r7wVK2IktIOAll9mg
	VshxMCgrBn97Ql48wi0IMGvLDkHGhbtOFOKfjg83+oWM5yXim/ChfEP3ndEbBaSmc+DBaZ44TST
	XFzhgaXBTlLlcgHj2FtUxatV2RHxJvPFlVNhvHikP3eCFPB8Q5Vxg1g/XxhqachpdXWH5rXSq5Q
	hHvO6QGpJV7TzeJUnz13F62I+7jV4wbCwzkf6aiS980NxKczxB6NoxlnGL9BUNF63BXqXutQ+AX
	x2SgQcCt+0F8pnBV6EJ8Asu1IjCqbWBPGxK8E0lbuuVow8SgTKdWgRiwaKcZS/p32b7
X-Received: by 2002:a05:600c:608e:b0:490:b202:4772 with SMTP id 5b1f17b1804b1-490c25af61dmr321650975e9.2.1781009683630;
        Tue, 09 Jun 2026 05:54:43 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3b5b06sm435968425e9.3.2026.06.09.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:54:43 -0700 (PDT)
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
Subject: [PATCH 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
Date: Tue,  9 Jun 2026 13:53:49 +0100
Message-ID: <20260609125353.401124-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609125353.401124-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..dda7008acdd9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1376,6 +1376,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g077-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g077-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0

