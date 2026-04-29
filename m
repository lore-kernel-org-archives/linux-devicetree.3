Received: from mail-oo1-f100.google.com (mail-oo1-f100.google.com [209.85.161.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851F7305057
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777430863; cv=none; b=JDUn5F7T46xwfIOOpSvah+1ppylJ0Snk8s8Pg9Emx3P1gFS0ylU/wvQa8NSL54r1t3I51ihWM2M0airhpuH6hwzv540AYOZefsa2kXA73QolO0G/WW5EEw5rIeHE1LOIpj8IWwcJoQwo21K+bS2N6KsndyA2bHxG5k4v2pLIaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777430863; c=relaxed/simple;
	bh=6WMVx93p4ItMVAYRLpAKRX1hMg55RrIEQpJ0SbB18Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCu6sX7M396rmmS4umHhvVby4E+G6rPowc+m+gjss79M1uHIY0bCBSjlXE4XSzX4+plUfjq3BTR2vzGS41Hhd3Y1wmDVzol5ydqsJ7uVL0Qkn/GT9A5P3o4EfhQbvdh4eUOxcxEQTWkvoXnsyU9WHoscIaigSeGnPuN3kYevhvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=MON6csR6; arc=none smtp.client-ip=209.85.161.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="MON6csR6"
Received: by mail-oo1-f100.google.com with SMTP id 006d021491bc7-692205ca402so4547152eaf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 19:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777430861; x=1778035661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=MON6csR6Pv+nv/t9U4KN7szx/iy/OwhfPn5bXw8ros4Fn8L5SNEoZyyiS5jxENQt2l
         PaC9f1hRmj3d4YYWAZb/isrrOCgLHHii59GLAt1zft6/aNsh2w463xKb8f9gEm9GDt9L
         niOJ/93CMI+DUk7iomF5S1aHLr08lPrcQfQtocpquAW1aTFldwe5PusH/sEE9PA+Jo6k
         nV3flrTMP+eivsECN2TfqY1fHD8XjSyd8AtOiS++ibbIFIEPQ7ut7ycfoujGe83W2WRu
         NhvqTD2tKcBfya3hSuR6iGmwJJGJzHIa6TI5qghjGz7LIaygNU89HqEBNPuN3Pj41S+Z
         EY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777430861; x=1778035661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=Gy890B7AT9wnzf/Cv9AW/pl5LD3T+7tqmePMiBmG9UFmUzTE9IE2sg5FbvH3oN+mUg
         klfM4a+vWnF+WnPWVIAzHn21d9D0kjJ2Quq8jHNJrm96G0uAM8jt/ZQsaIWtZHCKwnln
         hD7UIyHuRWZ4dzCZuIiknxCz4opnMaaBNYFqEtyDhHb3uQs5c+/2rGJ+yxX6ospbDYVg
         DajwJk82FWm/y+EGLPjc+T80FaNiD9KAGh1205mGuRY7UpdVh1tXyRBvfrRV9COY/Bsn
         DeLz1WQTvkCRQffgw/T/2bzG4h8f5pak1B1XzeH98BXXVK7kcyLItPwRr/1ew7YjssET
         9+Vw==
X-Forwarded-Encrypted: i=1; AFNElJ/zT6XMGPYB6slbbdmg5ndDzYX5WWdpDXiIKRMdofOlELvKKzGVUYYNdf+DE4CeW4a8yDC6UemMGNoO@vger.kernel.org
X-Gm-Message-State: AOJu0YzSfd91T4J1cRU8MRtYzcLUavcPbjn4A4Z5DGPoTKERlDiRSBMG
	f0MLQ55vty+MrI8hoX3qSjOgdmL2zf2e8Q4nNSzmFyKojzuQ0zuznjvb07EMXWaT0+fwtzjyaPL
	DNlNgbzv+OldB6OCG91OWjqzHP4BcmPcPBloz
X-Gm-Gg: AeBDiesIDabSwufb/t45WVHyp9LDpfwt8SrlUR3TBNeqiVcql7FFZy1yR0BqVuE83Pg
	B9ZkhwKfpSptremRYAcdGAEGrX7gVpJQH3/ZTREUYiTrZ25566069wipnTsqTxqt5xr6rli+QlM
	52zghdtsp0tCJKTLjbynJFb6WoTTk4RDuWll09HqILlTZb2tJ4lzQi3El0HB2vxjdkXHHG5BgTu
	lCHjwk8nX+CvgP/nygBRGldjTIH0FKMW0HMC6FdnUTm+wq+kg7WpR9Yb+lK45/3ecuFnKIZpaCp
	+V5gGDwUMSmfvmdpeH3NQWydtZsO7zKLJWFe9dfIsVsl0rL+kNiKNjXr9BWgCUR/SlV8V2tKH/y
	cwdYYJ8TO3QNYdPnPCpff4GMsQuGEizcCBo4E6g+OHTE9sfe1uEzjtEw=
X-Received: by 2002:a05:6820:61d:b0:694:8ba4:e3bd with SMTP id 006d021491bc7-6965cb725e7mr2917108eaf.36.1777430861570;
        Tue, 28 Apr 2026 19:47:41 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4340e711c00sm110958fac.5.2026.04.28.19.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 19:47:41 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v9 2/4] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
Date: Tue, 28 Apr 2026 21:47:33 -0500
Message-ID: <20260429024737.544813-3-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429024737.544813-1-dennis@ausil.us>
References: <20260429024737.544813-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi 5, 5B and 5 Pro schematics label the RK806 PLDO outputs
using the pattern VCC_*_S0 / VCCA_*_S0 / VDDA_*_S0. Rename the base
dtsi regulator labels (and the es8388 supply references) to match:

  pldo-reg1: avcc_1v8_s0 -> vcc_1v8_s0
  pldo-reg2: vcc_1v8_s0  -> vcca_1v8_s0
  pldo-reg3: avdd_1v2_s0 -> vdda_1v2_s0
  pldo-reg4: vcc_3v3_s0  -> vcca_3v3_s0

Also update the saradc vref-supply reference to track the pldo-reg1
rename. No functional change.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..fd5c6a025cd1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -274,10 +274,10 @@ es8388: audio-codec@10 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x10>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_3v3_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_3v3_s0>;
 		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
@@ -441,7 +441,7 @@ &rknn_mmu_2 {
 };
 
 &saradc {
-	vref-supply = <&avcc_1v8_s0>;
+	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
 };
 
@@ -666,8 +666,8 @@ regulator-state-mem {
 				};
 			};
 
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
+			vcc_1v8_s0: pldo-reg1 {
+				regulator-name = "vcc_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -678,8 +678,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
+			vcca_1v8_s0: pldo-reg2 {
+				regulator-name = "vcca_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -691,8 +691,8 @@ regulator-state-mem {
 				};
 			};
 
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-name = "vdda_1v2_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -703,8 +703,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-name = "vcca_3v3_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <3300000>;
-- 
2.54.0

