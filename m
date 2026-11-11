Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395245;
	b=OGyKD0PWokRRfu/6+1CtYgH0R5eqSvDLJLyZXdYJRBox2T0P23Ymxl8QtWGkoPQy/9oJ
	 mQkOmCS2+2ekqiUxtxFrgDQQ7WIEvMwbMew60ZRBm01G4tLq3pINnH4CBwKKjWgclV6Q9
	 Z13DuchFBlbpSNaNaM+Qmae3+AG8Oncw12mF8RU+4ruUA1rvtsvnBAzYmFOWjBaQdiYzk
	 +VrybzXSc3ZDngjqktuZBSH0DKX8XBGc9SkosprKwBNLssdfQTxvMcm0nQHDwH2Ocm0DF
	 ccF2Z6ePqpuodX27GYCj7DyGm1j1uTNObkScn6TpJi9O9AgW4nWIRkyBGn2od01bxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
	b=IDSWVyoIsqZK/zg8X2o06c0kONpxvBVS7ihVXCjZGsaXq+2nfGU5yufi9SVEXS8oabgC
	 Mlz+VRKHxVHZ04c311xZubp2PwrOJx/FSGsl1A1g564wJpTCVFP/3Ydl8JHImqroybz3d
	 0ggup9DjguvGinmqyGFaPYGapRZmG9GTeOczQ9kGtUs8WTwHdJCqCnfZUmB3NH+7xyI6e
	 Qc7tDp0uTPjHXHbBp1MmBpSfm0uyzk686rbqUHNjv3I4AqWPIjcIoZe2kOZ/JHznuVCmd
	 tfCoYYOapxdzVelEveng1TsMuxgZwQHuu8nGXpjKRQr2Dp5XuZhxeW2OX/vLF4hTnPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7164B606A899
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7164B606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hZbazZ2x
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so34372345e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395244; x=1795000044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=hZbazZ2xx1xzRrcV2f+dFJ2skZ2Lu5V8v37Yd3xAvwy6+zV3qt9jdA3Y51aNt8JDqm
         GB3STnUMinZtNkXoIyPF8xoVeX97EPsffn4uNE82NmBLDRD4aP5P0ZdqCIqzlJ/po07W
         JI0EJTonArtRGK/2hss6Oy5v4S0jOZfaQG4TF/mDN/CFY0IUR5kvAJU1SzPUgqgyhOSt
         1AlzMu2GjwleFEAw7pmj/Gs27zS2/hbN0O1lLNWiU90tiL2wehYxPCWopVqPLPevXmeX
         pTkEmOetKS3TYYcbXr+IiLbI5czzgttJSokxjR9OeQetqaDWVkpM82qBMB7cbSQi4Rof
         jAjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395244; x=1795000044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DKdyJESssw+eqxRBb106Pb/gP3e4B2hJY3u/Tbu8Oo=;
        b=OlRcqCxqnGQc4P35Chad10u3Q/FOjX8lAhGR9wXqIPRJi5tGc1ognWzVlAqr5cVscX
         Xy42jVJzgAqEspwZN9pWsM1gBNA1CrmFB2pbhzn0IVX6z3ujAtLySflYPtNn564hC8wb
         vXa1Z5OPU1J8JNgE+V6yaEFGtlzz0HkqiAZQ+2vnmOJ/4f+JfMlF5WGalLfVj+A/J1+V
         xKhTzy+Ei8e/I61FKaeTU1LNUeIvR5BBZrgcGYweW0Ol8SZpLrnOIL6Pm6o2bWW1eQeS
         glB7bR/lTraaEDj2oVhEfxLBB1BugpNJ+wrPwWoioFFLkgHSzGKW+wnynJvIbpVjsm/B
         9iqQ==
X-Forwarded-Encrypted: i=1; AL+hErHss70x/Ro78HYueLofQwyzgZkpiqmi8crxll3zhkD1T0+PnHKkaH/x7rZsbAZLN7QLi4AS5cvlEafA@vger.kernel.org
X-Gm-Message-State: APuU4Z+9UUlIGwvFyEjMgVhkfhmQ40ZKX+9m2wqhfYI3ej1HklPWYj09
	JZpFwAyAa9JCvilRnR1BN7gHBVx9NY7elTaZV+1Fz/IwoMwr2Lhn/+Mw
X-Gm-Gg: AYBFou1TfzAsKepIu4Q4QNn8puzaWG8mJZVWr+FsolukKdJQKkqm1WtwBXC9vbXB/50
	OdkkIapPqOntirjI7o7bGGduYi8B9LxXCMXdwmpgt5QOFTe0MgnDmpCE/vxOKKuLrggnMkX6a9s
	gJ731rGFASoRTvzbE1ltgdGklfuylmT1Pi3uGTPSe3rpCKS7QIwvlsPZJ9jek1gFn1+IbusnFP8
	df3ueurjrPlcaf5iayeP8KjZDApCY9UZjBVv0MNT+BdJa3ZQ7zsD7UP4WjAueHy6f/lN/f6VBOY
	zzyN+dDW3us95Xh4ILpzAuvnC05QFHLAwdc2LO4hP9BdKziT2rLgP0J3V+xV7sHd/yjKrWFvcE5
	hPUz7HgoEwSHa40B7OZ5sptIemOHPnMuW1T343LHrD/hzz5I1HRX+Z/0OBKCmceBGDBTHmeNm9i
	xcN6kt/lHyQCUoij8PS8rOBnFnRFiIq7OyIkHWA1ODaKIdMK1xAzHUOdd44A/lk4vWGCPCcGDS6
	3Hlr3XTUQ+YNqUnxlu/5F4tJacFsTR3/wpfbethrvepxTWBLCKiAmsJfZJIQnEsE6dCdcVWYRla
	sPllDnU2P7BTRc63cccHR7ZnzuxytTmwkvPoq+77l3va1/rSTdfWEPk7J4dOSWIKE6S7h9jhONe
	zmCv4yxZJ5nJiHvMRqdg1J5JCYbIWsbZq23/nebLloLxYEgeb5IRuxf3xdZcImvl0OBrEAhyAFg
	23JCMqeU1Z
X-Received: by 2002:a05:600c:1986:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ba09377221mr34575625e9.9.1794395243848;
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:783d:786e:fe55:f40d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm146727295e9.5.2026.11.11.03.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:07:23 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 3/4] arm64: dts: renesas: r9a09g077: Use CPG/MSSR syscon for WDTDCR access
Date: Wed, 11 Nov 2026 11:06:59 +0000
Message-ID: <20261111110700.3331225-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261111110700.3331225-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR registers for wdt0-wdt5 reside in the second register region of
the CPG/MSSR block. This multi-function block is now exposed via a unified
syscon regmap interface.

Replace the direct mapping of the individual WDTDCR registers with the
new "renesas,sysc" phandle property pointing to the CPG/MSSR block syscon
node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v8->v9
- No change

v7->v8:
- No change

v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- Added review-by tag.

v3->v4:
- No change

v2->v3:
- Renamed the "renesas,sys" property to "renesas,sysc"
- Updated commit message

v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 258c74c57b75..472cafe7d4b2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -327,61 +327,61 @@ channel1 {
 
 		wdt0: watchdog@80082000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082000 0 0x400>,
-			      <0 0x81295100 0 0x04>;
+			reg = <0 0x80082000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 0>;
 			status = "disabled";
 		};
 
 		wdt1: watchdog@80082400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082400 0 0x400>,
-			      <0 0x81295104 0 0x04>;
+			reg = <0 0x80082400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 1>;
 			status = "disabled";
 		};
 
 		wdt2: watchdog@80082800 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082800 0 0x400>,
-			      <0 0x81295108 0 0x04>;
+			reg = <0 0x80082800 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 2>;
 			status = "disabled";
 		};
 
 		wdt3: watchdog@80082c00 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80082c00 0 0x400>,
-			      <0 0x8129510c 0 0x04>;
+			reg = <0 0x80082c00 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 3>;
 			status = "disabled";
 		};
 
 		wdt4: watchdog@80083000 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083000 0 0x400>,
-			      <0 0x81295110 0 0x04>;
+			reg = <0 0x80083000 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 4>;
 			status = "disabled";
 		};
 
 		wdt5: watchdog@80083400 {
 			compatible = "renesas,r9a09g077-wdt";
-			reg = <0 0x80083400 0 0x400>,
-			      <0 0x81295114 0 0x04>;
+			reg = <0 0x80083400 0 0x400>;
 			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKL>;
 			clock-names = "pclk";
 			power-domains = <&cpg>;
+			renesas,sysc = <&cpg 5>;
 			status = "disabled";
 		};
 
-- 
2.56.1

