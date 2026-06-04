Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3243C3DCDBC
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 06:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556185; cv=none; b=ohj1yh1pfV+lqBwWRd/x7oqrMbkvMp5vfz9ud4wXWDRucV6H3S7V+hJT68B0WTHIHcrMxN23qo5XbVv7RrEuq2MQnno508j4SAPAybR6bYzUaDAMXY2oc1mJh8NVN4cfzKCQsa6xJudffXBRG09h62py7PV8jLmO3bQlez2ELgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556185; c=relaxed/simple;
	bh=74c2+EdyIjHTyeZ+NFsgiYzpE1mENWj5YYqu9FDW5XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBqUgsVWjGm32GHMkyOD7fqMc/osye2Plg7UewWVoJlSm6ci5AvcenjFqWYFDv4FSqkCn3gDDgF0Vap2J0yQI7anDwkYm6vhIsC423v3YThNkZL9aMFH0Hc+TnlgE3aVbqbq2q752d7nyy0hYMId5VpcRDlF5JFWBgZWkToLzVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq53YfVp; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq53YfVp"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec354815b9so29538066b.3
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 23:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556181; x=1781160981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhqotlkyoOnYDxs8tXDl3w5aFlnumJhN/b8jC9ZAfX8=;
        b=Aq53YfVpdGSA2APa75UF6SCoG64kV34B4LTI3ULqx99eKf4///AJeXlIK7iHjYV56v
         zJ8pRbS540eDENGWW/TsyT4iIvGQW/OXgT2sfU/uPg45eEtQix7jgkGDy7cMUVmkDFyg
         CpkhWgJphVlJjZo8Ic+osHGLNAsCo0DWJenFEf9FK2ZqM6dkp0K5Ag8Ml9Z4vQrwwLBt
         Gtsgndu/5hJp7oVTshlbzxbLe/2N5JMPbS/+n5DGWJQRKkp39+u91BGANbJJGH0rJMCZ
         Hf9UPYOuTdZ6M4YgXufb5JuIytBMiqQD8xvqrvzwJz2Og8hvAHTXmuIfKilnBVqbRA/P
         apJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556181; x=1781160981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhqotlkyoOnYDxs8tXDl3w5aFlnumJhN/b8jC9ZAfX8=;
        b=U+33GUcalr0O+Q/DsUYUEO0ooFHgpt06xTe+IOEe8rZwNzRgpaDPi03sp18QrVHAe6
         Fz37r0KWoCcY7hurB+eIVOTPvHRpQterOeXBzvG181xbjMCEozSVxuoUUfpGkMyDr5f3
         rnYM1u+W9kVfW9iLu7YKdbaOndO18btBpq6L+oqtuFD0ZXIMYpc5n8qmG0Nk71gX9wj0
         HnFz6GliNnxKUijY35Kf7J6+tg9rCK1zwwrPU4I0N54zU3nfnQTN2oEbmkC4YtLLs6cD
         OR13kiWGMh5MD/LFOOlWBv3IOVBYMK5VZA6JzIm8R0m6MB7qj/VoNttrplaxfO/IHP6X
         5i1A==
X-Gm-Message-State: AOJu0YxlEQxJWodB5PaEG2atsH7kpolAY+X2wTAKkT9mKsvj8JyNsp3H
	fAWYF3jfXf2tGxiWRSzBhPyTFUTTQkxot01LelwRUXUCFAFW/V2k2ry4
X-Gm-Gg: Acq92OHkEw8yaswGoTs6pxjRwq2dNO8EDvSkqR+FOoP0jFuzG/750WWH+ycNi5UMP5x
	uXav2q9b43RHoNvlZdOGqPvRyJqg+JJFBfND/X1lsKonQQl2TfC0IowH/8IwpPv6P0tIBl4/s9H
	K+dfudImrP0j6yltKX2dNrIASNEAe+zLcxRD0Lz4optBaqKKA8S+ipR0Ant4siWuNBSlWylT7Vt
	57KS3wD29gzboXDm/EKfV49ErWTO2q7fSKsKJ1ww4z2tuZRs/X9JyLYMTiUFFzngn4EfJPbWwQJ
	oD278eYZdnOPy47pnCbDUXBrJ/yiu5rgLfrumxwRXAmaArM+JWyPGxaYeVWZwD821OxT17wJG8I
	Wxk+6v8G2AyeJTg0LUPNPbhQMUJenrHZhlfQidVo+dO9Ei7DWHQYpv2IqI/WWKbnuBJKnlna23K
	bNQfgE73ggX7dEV+eKzEjPtG4=
X-Received: by 2002:a17:907:7248:b0:bed:8f7e:d85b with SMTP id a640c23a62f3a-bf0af50a2b0mr329317566b.42.1780556181344;
        Wed, 03 Jun 2026 23:56:21 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:20 -0700 (PDT)
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
Subject: [PATCH v1 06/10] ARM: tegra: tf701t: Tune MMC devices
Date: Thu,  4 Jun 2026 09:55:52 +0300
Message-ID: <20260604065556.137614-7-clamor95@gmail.com>
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

Set WiFi sdmmc device to SDR104 and improve power sequence. Set uSD sdmmc
device to SDR104 and reconfigure its power supply. Set eMMC sdmmc device
to HS200.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 36 +++++++------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 3e2bc611e2f7..73276f2aa7fe 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1645,9 +1645,9 @@ ldo8 {
 
 					vddio_usd: ldo9 {
 						regulator-name = "vddio_usd";
-						/* min voltage of 1.8v is not stable */
-						regulator-min-microvolt = <2900000>;
+						regulator-min-microvolt = <1800000>;
 						regulator-max-microvolt = <2900000>;
+						regulator-boot-on;
 					};
 
 					avdd_hdmi: ldoln {
@@ -2350,9 +2350,9 @@ brcm_wifi_pwrseq: pwrseq-wifi {
 		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
 		clock-names = "ext_clock";
 
-		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
-		post-power-on-delay-ms = <300>;
-		power-off-delay-us = <300>;
+		reset-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <100>;
 	};
 
 	/* WiFi */
@@ -2371,11 +2371,9 @@ mmc@78000000 {
 		bus-width = <4>;
 		non-removable;
 
-		sd-uhs-ddr50;
+		sd-uhs-sdr104;
 		mmc-ddr-1_8v;
 
-		power-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
-
 		nvidia,default-tap = <0x2>;
 		nvidia,default-trim = <0x2>;
 
@@ -2396,14 +2394,18 @@ wifi@1 {
 	/* MicroSD card */
 	mmc@78000400 {
 		status = "okay";
-
 		bus-width = <4>;
+
 		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+
+		sd-uhs-sdr104;
+		mmc-ddr-1_8v;
 
 		nvidia,default-tap = <0x3>;
 		nvidia,default-trim = <0x3>;
 
-		vmmc-supply = <&vdd_2v9_usd>;
+		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vddio_usd>;
 	};
 
@@ -2413,7 +2415,7 @@ mmc@78000600 {
 		bus-width = <8>;
 
 		non-removable;
-		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
 
 		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vdd_1v8_vio>;
@@ -2614,17 +2616,6 @@ hdmi_5v0_sys: regulator-hdmi {
 		vin-supply = <&vdd_smps10_out2>;
 	};
 
-	vdd_2v9_usd: regulator-vdd-usd {
-		compatible = "regulator-fixed";
-		regulator-name = "vdd_sd_slot";
-		regulator-min-microvolt = <2900000>;
-		regulator-max-microvolt = <2900000>;
-		regulator-boot-on;
-		gpio = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply = <&vcore_emmc>;
-	};
-
 	vdd_1v8_cam: regulator-cam-vio {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_1v8_cam";
@@ -2661,7 +2652,6 @@ vdd_3v3_com: regulator-com {
 		regulator-name = "vdd_3v3_com";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
 		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.53.0

