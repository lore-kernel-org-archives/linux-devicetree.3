Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A7947ECFA
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628680; cv=none; b=ltdJl+Tze4x0chuN0Wkh3KiS5B9mTYduwRU4qcqk5eDIwPEPey50EtSTge4DcDQuwIRz6WAVxQ95cttdc7ayMMHriR901hRv1Nua7VRmG0KIvVk/tR5FQkD9rDmR0Gn58C/VTvkQn8J5BzRG+lJZjsdFhSfhSXn4Z9WjxsPBZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628680; c=relaxed/simple;
	bh=AZr7Hy5Dvd4AJYPHEuGqOYmHE9eiYyIjHiAZBGllOuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5+uUMI7MQt9SSFSAPFdMlm941NyDbc8h2WPMYPLouhXDfgo2sJ3pufZYf+xaQzB+Jwkdro38jlmmKC1tj8/QOIY9eYknJtWgXj+pt/bYObw5gDrJHFcLYMIu9v/idJm1Y8EYCNtx5oD+k0AxkjQgQkRWopl1etNBwtiMbbQN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE7H3Qsl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE7H3Qsl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955158f26aso18258645e9.3
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628676; x=1785233476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAgwoWwkIIG1Kj8iDE9VCQiJWOl9R1aqW+zmWKY/Vtc=;
        b=PE7H3QslC90xmxaBzAtuFrFiaOj52v9bZTsyB074HGLSpJzg2q2+0nz0/su86nMbZY
         vrvLxkmZUB8yP99+8gT2Gtl27G1e2dwBvQxMgGmf+Hh1DVx5sSJvN+Laa+7GL4b1QjYQ
         ITfm+VYaYAC8QzRudghJ0kzIkyW1wWl2WafHX2UX7K75/tNbVqtQChtxX91m4mf/SevI
         +0UU3xbTxGf3akKDXL6fezS663B/vJ0SAUKNBfxY0oX8suIg1mJA9pbg8PlfeQCzaGET
         P8sZS5BW6eyCjR96mGzMWx0cbJUbl9jA+6yVtt2FshrDoC2Df4h5b1bnPLCnzXecxfYZ
         9/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628676; x=1785233476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAgwoWwkIIG1Kj8iDE9VCQiJWOl9R1aqW+zmWKY/Vtc=;
        b=VqBSZJiHIshyjATcpGay1v9SsJ8TwT6wDMC38aFlH1Hd1bIA80yUrF1DLnrQWi7JDG
         9AJiSLBukCwjEgJEG5H1fH4j/SP3uBqivOtZfQkVOuMtEXsMxZxeRxYh9W6avdgzmCtQ
         TZ1Iaq97aUv2D8zyTs0kxIpIJ4CyXil7bdwAf2alhgsf7ykD/2Mtec+Y/tMLQOG+a1pQ
         NeIfCfc/YT7MfW93hk9DYhrQBzi+QZ+yCNCTgF7KV7TMUipI27nIWBKcRB2BVTbGef76
         aa1WAeX6zdmAh0df6dGo56LMMgBCP2UJk+1sdQi6ddUIGeE2l/JTt9v8HGp7j29s2ZKh
         KJ0A==
X-Gm-Message-State: AOJu0YzDsqYReHgDpitzXqxDZvxRtNAdFqq2ahAdZhyNVcZ+G1KGRSgS
	KC30lawX7f8XYxKXjx8HBiuqAXbCxL+fk/0bnWM97eXYzhzlkP1k3y4nec+i8Q==
X-Gm-Gg: AfdE7cldZE8+EAZ3Bi4qAcf7ANBb/j33XHs7Z2NuMmf0I+hD0jZD4FcJ12K7DRhyWnv
	JJIFof1l9ojr0qdhTtfE4McZu5o7iPaZ2oqu9BjB7LVpKWEHT6spFTVsUrDMbmU/LHxZx+wd1wj
	TLfInlFblUoanYaUWEKhhmr4UU0vVi1X43J1bMzm+T9vKMvDMWoDNm2CbMoMJKtspN8X+4bDbH8
	mPIyKGFffCO5uJaPc7yFOBcRSK+DlhT5RoiyUvrCJVPkmnAOoOdnuc8/9x2GcxDVTDyzxgnqj8W
	iFh0mhRO0R789xjakk3a0i6N+qQDdzJCtpwdl2rFTGK7IMGt8Lhhngg4uQUcJ1PuJJkXMNu1Q9k
	tn5F1zIozX7ypDb8teKnVio+QdASCuGGqkMOcgUDioscuhLBEbNOHka2aGEDHgpKpway9fdsl1k
	fyc26gf8X3Ovd1+0LMmDfvPdgriV60tYwfOw==
X-Received: by 2002:a05:600c:6287:b0:493:e79e:da63 with SMTP id 5b1f17b1804b1-4954a51319dmr200118385e9.34.1784628675953;
        Tue, 21 Jul 2026 03:11:15 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:15 -0700 (PDT)
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
Subject: [PATCH v2 06/10] ARM: tegra: tf701t: Tune MMC devices
Date: Tue, 21 Jul 2026 13:10:55 +0300
Message-ID: <20260721101059.451699-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SDR104 mode to WiFi SDIO and uSD device nodes, remove mmc-ddr-1_8v
which is eMMC specific and improve their power sequences. The uSD card
refuses to work reliably with fixed regulator and 1.8V IO supply. Adjust
configuration to mimic setup proposed by the vendor in the downstream
kernel. Add HS200 mode support to the eMMC sdmmc device node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 35 +++++++------------
 1 file changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 83f8dd84d28a2..3de5c84d5f009 100644
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
@@ -2372,9 +2372,7 @@ mmc@78000000 {
 		non-removable;
 
 		sd-uhs-ddr50;
-		mmc-ddr-1_8v;
-
-		power-gpios = <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
+		sd-uhs-sdr104;
 
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
+		sd-uhs-ddr50;
+		sd-uhs-sdr104;
 
 		nvidia,default-tap = <0x3>;
 		nvidia,default-trim = <0x3>;
 
-		vmmc-supply = <&vdd_2v9_usd>;
+		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vddio_usd>;
 	};
 
@@ -2414,6 +2416,7 @@ mmc@78000600 {
 
 		non-removable;
 		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
 
 		vmmc-supply = <&vcore_emmc>;
 		vqmmc-supply = <&vdd_1v8_vio>;
@@ -2608,17 +2611,6 @@ hdmi_5v0_sys: regulator-hdmi {
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
@@ -2655,7 +2647,6 @@ vdd_3v3_com: regulator-com {
 		regulator-name = "vdd_3v3_com";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
 		regulator-boot-on;
 		gpio = <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
-- 
2.53.0

