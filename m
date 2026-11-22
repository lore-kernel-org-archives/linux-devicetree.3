Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378484;
	b=vkgTcWu3EYiVuPhZbrZmbNXAVsvi5UIef7O8vkmEAAbADJBJKFqQ9P/RHqFUGrazCk4q
	 6wwZmOGxnG4PD27a+ODt96h5skMkJ+N3OYpw+CImN60qPuXcFF5ul203TTVAcTXd9Ffp5
	 ni42JjoKUfJ4+8acoagIQtOFI2Hl3MDbYZFsqH3OYOGmHbPxJ2EgCfXsoW8ZuEbpm3PFr
	 q6MnP/u0GxmY3aiyd/oe9PVL9z0DFeMJ+I85YX1tLku8dCNJ+fpGy2GdZsgiBBDyfX3b4
	 DjQOfsXKIEgtMgt0WTXOd3hjZR/AqK3Gvxqf01k8LR3wkL3UQKAYn2jjvLnr+VjVIIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
	b=STngBQYuMvVxmGeqTaAPhDbUdBM1vf3G2aMt6JrD41MZAzrkMNVzyczGaR/uZLF5wLvC
	 XxGCW7drI9yTl0jN2c4PJo50rtJVHM2efmAlctm3G6HbTXKru278glDYRHkCG256Gts0L
	 c0D0PCoE4rosYKVgyMAFVgJRLY0qHn9G8MWZkCUn35uBuVLgeqpYICEV4B0g7pFxlSiTG
	 4Am+52qUDwQQIwgQ+ya1QCnJmg94WVne3V/bM+DEfR4+9UJd2eGo+xUok+zkAEGIyA9bO
	 7xfyqAT10+pkghysRuSPxskWvhiyHI2RVEjF7pp4GPjTe92TBVeWJPaYoquitLYQGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5v0tZRI;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2F4606A337
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF2F4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q5v0tZRI
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so3218256a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378482; x=1795983282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
        b=Q5v0tZRIUKu5FfuMA0WHjv+4y7OME8e13al3F655WqumlxdAsuBho9J5fjY9oSETzn
         u61qF89lyEUxgkv+HMDUrf6fQto1lWNA63NNwHinVZq5upgD4tw7cAR5sVGrCPlDIKi+
         0zHOHOBnoXNBpBs5YGKDjZff/L6aQdsKI0YXrIZQlE+fbob2+hmXPCqjQvFHGYe6BLhy
         FF3iUj6VpVVxKhOtqmE5aap2FfW+FUT8AAEBdxBtERTlWrcM2nUA/XMDFEyH1QpnbMkK
         L8H9o5YsPcs6eJWgBDZ4J78O5w/M5DB9fXOEwClUCWUVmzxwZolWWl0Dk+JsnuS2rnP8
         GQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378482; x=1795983282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFXSMcHcVJkmYFbJzBFz4HPTepM54SZHk3SlIxX3SZk=;
        b=jVWHi2S09UFQwxsiszaF6n63PKcL/VrYljITcnb0vMpwXxp5oW7gMy8GL4+/m8Zf1j
         VRDt2jZ+tDO03CgwuwDGRdBXYmTydRoAYpsHERrqH/UgN4/VkFs3B1FE3qlNHrz9Pbu4
         IZpcNPp1cELfi1eSW+0tnSqXWrjMSMF24YHEd++5b/xpFmNPNNrQ9h2KapBBM+GsgG6l
         y1kJS0bqwuNe7XR8XlTQIZTlE+L4UEwZTUt/iBAhiC97kKVoJG0WkSVo9UjAiJndWTVv
         P/kA9FEQcpA3i6dkBio8z9pOpiLtK96BgtDX6xG4AcfBSrssA0HVbu2lfwCNmuzYsYnf
         5SEw==
X-Gm-Message-State: APuU4Z+LMSGqmY++ABaVbmcB0TkWgz9EHOw87IP8NG8e1b6Sr7I5YEQA
	y4ekyJiJM+tdVsMAgpPEg2Oxbnvderx+36YyYdbZqqbyqq1qU3hqaHT4
X-Gm-Gg: AZFdTZe+n84gR4R1at/Zc5ZiKHjmElJxrwa6uz5J8hZmDhD+NEi0FL0Zj4fMHBNuLQI
	qEaMthYQoavuf9Utkw45SdK6yNiVy1VVZhVV/c85WaLbsZ2tKpJt5gtvzX7DUGfsCGCHSVZZr9q
	IY02ml1lPfIloSf5pYQnbjbrLMWDMH+l19zPk+TFdJmMI2D6zEHA6qpdu0EzOxeKmiikUpBAXsR
	GXBhBig+jTEPWNk6mPrD8+bAZFqWpWBlhR+j12YyjH5/apnJQEZLZCr4AIeJ/1N7qDFuylH2Drj
	xGM7np6QhS+DbYDkEDZUhCqK+v+hTQJNVkBbPXV/ZcWPGiyBtuJPiFk5jt8m65fVgymwuWEcdt5
	kpR/N9k5RL33hAoV9BC4TT9rssJANK0GHyJ0zxY7yHdC/64uolxJDCj6PwwvK9Y8sjuYOKxdLSe
	R+yAuiqSbqyDNnu9tcwv0p9wqMCPNCirO1PJRnxCfqdxAJime2PueBy1pFXBEJjPx+h8HDlK8zQ
	FbU9d+pZGvD0Bc4laPcnsQiAAlclme4tfbdxT2KTqK+jAwaTAvDQ5Zbg3C6JWOn7AsE9aeio/Cu
	iijBhJvlDvSzfDiUoR6j4JGgtHQHPtIDYSxKHKHjaCf8M+ctocx/bsVfi91nQCIAen6BeuklHei
	rXQLeYIXR6Yc=
X-Received: by 2002:a05:6402:434c:b0:6ba:2a44:8ed0 with SMTP id 4fb4d7f45d1cf-6ba37e97bd6mr6781529a12.23.1795378482319;
        Sun, 22 Nov 2026 12:14:42 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/18] ARM: tegra: tegratab: Configure MMC devices
Date: Sun, 22 Nov 2026 22:13:56 +0200
Message-ID: <20261122201407.23742-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

The tegratab board uses three MMC controllers of four that Tegra SoC has
(the second one is unused).

The first is used for Wi-Fi SDIO, the third for microSD card support, and
the fourth for the internal eMMC device. Configure all controllers
accordingly.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 56 ++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 2ccee3b70aac9..b7a14e24df79b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -13,6 +13,10 @@ chosen {
 	};
 
 	aliases {
+		mmc0 = &sdmmc4; /* eMMC */
+		mmc1 = &sdmmc3; /* uSD slot */
+		mmc2 = &sdmmc1; /* WiFi */
+
 		serial0 = &uartd;
 	};
 
@@ -1254,11 +1258,61 @@ i2c-thermtrip {
 		};
 	};
 
+	/* Wifi */
+	sdmmc1: mmc@78000000 {
+		status = "okay";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
+		assigned-clock-rates = <82000000>;
+
+		max-frequency = <82000000>;
+		keep-power-in-suspend;
+		cap-power-off-card;
+		bus-width = <4>;
+		non-removable;
+
+		sd-uhs-ddr50;
+		sd-uhs-sdr104;
+
+		nvidia,default-tap = <0x2>;
+		nvidia,default-trim = <0x2>;
+
+		vmmc-supply = <&vdd_3v3_com>;
+		vqmmc-supply = <&vdd_1v8_vio>;
+	};
+
+	/* MicroSD */
+	sdmmc3: mmc@78000400 {
+		status = "okay";
+		bus-width = <4>;
+
+		sd-uhs-ddr50;
+
+		cd-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
+		power-gpios = <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
+
+		nvidia,default-tap = <0x3>;
+		nvidia,default-trim = <0x3>;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vddio_usd>;
+	};
+
 	/* eMMC */
-	mmc@78000600 {
+	sdmmc4: mmc@78000600 {
 		status = "okay";
 		bus-width = <8>;
+
+		mmc-ddr-1_8v;
+		mmc-hs200-1_8v;
 		non-removable;
+
+		vmmc-supply = <&vcore_emmc>;
+		vqmmc-supply = <&vdd_1v8_vio>;
 	};
 
 	/* Micro USB */
-- 
2.53.0

