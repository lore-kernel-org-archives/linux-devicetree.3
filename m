Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D03DD512
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556187; cv=none; b=bk1Jb4pNohMRFMYTFPbjQ+C4gYiqCdZNh7YCZ+0tTKEy9xJjoBOo1sTtdQ/ZcfUo7em976W0yaZ9zLnGteHnmtlRaPHboPmHsmSWOFpwg28X65qsyWeLEEw27QATmtKnQgJA2fLs6q3SGr04ExrnRycpe026JDgyPxI4b06b2nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556187; c=relaxed/simple;
	bh=mLqNH1tZT4PDvi9JL9X+OcDESHIRxNZrzPbcXi2+FgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gl+Fj+y9u5Z17RpViApP6omdMEeCjsBBpiSziGacp1hXvCCM0XVHwkEtK0V9Zv0uaWwvv9EnZme+l6ULmj/rWlDR7lheJ8ja7syvFsUC0vSRMeJSyiTVb9QI0BvbXZ+mW5kGyhDd/VlP2VjFRef7K4D7ZKoccbBvxwyQsMnc8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wi16XjE3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wi16XjE3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-befd83e0521so303701266b.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556182; x=1781160982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brk5Q3maRfMkheVWKLawYZfMADdxRxJPeRIKMtKkN+M=;
        b=Wi16XjE33SHwDtZy5NufQyaH2maZyqnSMC8knPCY6IqcJNYzwnzP7qHNfttlkVnECv
         c5e81ILS74dc4Co6mWx4NVYRHRwzMXsZXSdakRxwJB629E+ktmrJLyOk6NGzH8kOakRB
         otIfs/rpyZDq89gBK6CjhvlC4b1U5CeD3f10V6ZP9RjHUksu8aSE2/2IiA3KLGAN5Qxw
         LSKcONkSlYbV2IxHJ0OGmCm0CcUvrnYikCHz9YDXAkZmEKyZclAu85+VjFl5510AbbPV
         YiZoUhrZOIABLEakBc799r0zglT2eegFWSL57rsv1ufQQJMWx7V9Wr+EUm3B1BPt8i52
         uVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556182; x=1781160982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Brk5Q3maRfMkheVWKLawYZfMADdxRxJPeRIKMtKkN+M=;
        b=qLPwtA1l3Q88L6x6H5VOqujv4aDM7NsqbgXks6907DancYzOTkWlNpnSjirRQ2bFOH
         pcl2zom+1T/4Wg5ncTy9O0AaVWDnKSK42/b5roF2csX+1bcfng3GZWWieJMLWCYiAQsd
         zj9o0Zd1ao6eiWUB9oaWCrvyk9lliBK2pyy5EJMWUPcEZdvNgzbltW+mJuuCKg0f8+02
         ti9v/x+8Tie1a7IeFsOyWXT21uAbCvffY3MIko1zLHP0bYEqaz+KYpH0HBV5F8y4F9CT
         PYN/Q/bmMOo88y6STLdJ16Fcdad/ZeTuF0MYlBc7aFwerGZRv0d7AokvVOHBd252bsp6
         WEXA==
X-Gm-Message-State: AOJu0YzNwT81vFhk6osjkxTd9JBQtS7CBaZLLxezRpylVwSPSV/J3pxS
	ilqYivl/TwPcJ6Rv0L/PQBoVdA7f90iCD5+yABzoZIznhtXfGzylDuEf
X-Gm-Gg: Acq92OGp5zUSPJezdlQGppH5BaWARf/ns2xlWWdl12ErPHacRk/NorYebZpgJUshIul
	DdpL8RBhPI1Crw2GKLndgHyNEXLxZxwOeSoa8ihu4SDqwLAnf3YhP7xkClGnLj/xNVWOP1HKz4a
	sxA1lPrQBlueOLE2MT0lhLkrsTrGOC/Upx7wGBhebQC5dUFDseI2lCnz5zoZWC0QSSQGXLwTXnV
	BqWlnf2OdKoKR4vQFo7N86E9oCUK4YF12woy0RvBeUh5GCjeii94eR9+xY9BDKLyCneLIWdv/Kf
	dm0TvQGRrrrBbjR7yWrMuS6xqtV4ZKThpw4U57laHwWq/xWK37zEwfwLIZ/lk0pbIRUoedDEDZ7
	Fk+SAwZCVOCMTRs2Jxa0wDR+loJNU8i1X87OyTsXt3h6TsRap8ISDZ1d4yWQ3UKccAOCNJvUFun
	/0hPeYkGsaWczhYVBaUClJukTayellQFYnWQ==
X-Received: by 2002:a17:907:cca7:b0:bf2:6d61:3268 with SMTP id a640c23a62f3a-bf26d707c73mr23050166b.23.1780556182337;
        Wed, 03 Jun 2026 23:56:22 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:21 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/10] ARM: tegra: tf701t: Fix BCM4334 configuration
Date: Thu,  4 Jun 2026 09:55:53 +0300
Message-ID: <20260604065556.137614-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop reset GPIO from bluetooth part and add lpo clock to both WiFi and
bluetooth nodes.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 73276f2aa7fe..e3e0b4ba7eb8 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1300,8 +1300,9 @@ bluetooth {
 			compatible = "brcm,bcm4334-bt";
 			max-speed = <4000000>;
 
-			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
-			clock-names = "txco";
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
+				 <&palmas_clk32k>;
+			clock-names = "txco", "lpo";
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
@@ -1309,7 +1310,6 @@ bluetooth {
 
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
 			shutdown-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
 
 			vbat-supply = <&vdd_3v3_com>;
 			vddio-supply = <&vdd_1v8_vio>;
@@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
-			palmas_clk32kg@0 {
+			palmas_clk32k: palmas_clk32kg@0 {
 				compatible = "ti,palmas-clk32kg";
 				#clock-cells = <0>;
 			};
@@ -2382,9 +2382,12 @@ mmc@78000000 {
 		vqmmc-supply = <&vdd_1v8_vio>;
 
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&palmas_clk32k>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
-- 
2.53.0

