Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B143B6379
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 20:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779912498; cv=none; b=HAo11EX8hyXYHJFaR10ZcaNtyoHiDkGNJ8dPD3dMo7tI21uW3CtkR1lm38jNz0x0G0P7fXLTIKKg+rMyPPAjIoVHWH1YHpWUdyt3i8BC2gwHQR6b3VaXGJm80mCiL3AU9HZJ0ayCYsd+lSPU/gjronAoUh0DpJXgM7AOBx2YXx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779912498; c=relaxed/simple;
	bh=lXRYxV8BCeM1Ig1y7stIz4NtSN2B115lw5iyl627e18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2BJODdWdrfzwgyCmY6cDE47z57D8KGYhaDJ3zlR1jhjLGE0B/O1qbYrYdvZ2HN9TamsNlhz4UIvZTTBU6Wj1HUYOVlRdq1yovWn/r6aNkEM60h84Tqz9zZYC9Cn6ZGshKI7emdZ5aQJ0O9UyKhlURjlXYnuiIwfTLgUxPvijYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwGgBdLX; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwGgBdLX"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7bdec52f48dso112117627b3.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779912495; x=1780517295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBNDk3pJptpsPFzFd9QbD4p87S9pxZvqzSFC06CbzCE=;
        b=rwGgBdLXHFp7zebT/erRii3FsvQLhRaRFqwvIqUReMM5BZvwo8B87qfwLa8JCOjvkJ
         ERqY93oSpRRZ9sByy6IJwIFSFKmulV4N88yGqWAO3IgemNr3W0S5Mg+pRDEdKYogdpVh
         zrEzG9svV2BV7FwB7/lmFh956Ddni0Aq4UzwUlu2N76Jaok1kXw0Wrn79KUhau5B6VVy
         9VJRkn9Vf8sT/HMVKQ9Ag4vlwvqKe3e8GaHfCSwdCWE3EDtfyGfc9kX6sGb5t5Q3xj8c
         /06jcCeLJWceR58nCp2FaQ45y/XU2OvZSx6hjBIthxBBx4JktZ2IHmYwe3W7RcOUBQvd
         v99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779912495; x=1780517295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KBNDk3pJptpsPFzFd9QbD4p87S9pxZvqzSFC06CbzCE=;
        b=iIDWjomE9JbEUq3i3fJpXH4rvxJc3arMkPj0CbDW7hcd0hU5pCzW94Zok8DPes7CaG
         Ru5JZ6YPiRMbca+kB3vgOBAuqz8CAb3TCaAOUljfLa4hXqZJnMDa2drUIjQekn0ltcLF
         ExaXq3W5VnNi082/7WjlAb1/Aiq0qJ6y/nhOlv+BHl6Pf0RA3SAMIhHW2hvh5veaDo79
         UVUJRn363twn/zCQY70tcYE4w+QZ5Tjrnzj9QcAkQSKlDSmRpj+bNsLxsQskj1ssPyox
         9pUC6Z1oJ8t8QjEFOp7kmHUgnENupVFE+EgVVwTzYmx6XukPbb1UXzAwwx/q3y3k2k4n
         wQ5w==
X-Forwarded-Encrypted: i=1; AFNElJ9BW9cz2QQoNJQaHPtR7Bi/DvR1jtvwKXCktqT8Ha5167qT76hwvW+qWmY1fJ62baq4Feiv8uDxsjn2@vger.kernel.org
X-Gm-Message-State: AOJu0YzQQLgRu+jJQn9VqBdh8kmRCyeuCuZSn13gwFmENV7JLgOW6sBp
	4ZsCm3aUlv/RhjgIXQXr6yY7ofG6tvKQO86iCCZCRv5lNIkfWvTvSvI3
X-Gm-Gg: Acq92OF8S1khsUdbtBscsglltMtnlNVSf1Q2lnacBMFa9hB4vH71fMw/I2ida5qVkkf
	2HPJS2gfZfYX+sXnjfHebQNjLk2R39Hy+Mz56a4LZ3qSB4f7K70+Gnq1elYfsSB87SUYT1Vh3so
	uvSDPb7EJEFY+YllDFvV2178jzStOMzJogR5qA9T1OHuxBz1AmuZHLLvgsjBMAM3Q5CstERwUNN
	PZdQXSOvXB133hr45W+ue4sEIL/TtviYBWhbob2e54XSK9ADqfaAnJ9Dn2ENY4Mn4iFRnU4HNI1
	yltgxVuSxm52naRnA2tnrSzJwVne0qHmzVRbZUPNFM6Nw1LcZFhe6befhA3PQwqIUrjsa8LUJZR
	0Fb4l1dYuaiTgXkTZsU0y9MJnO3pNDpCfNSLkh1r4TNxY+L/lHJWFk+AfP/A1rH6K3qOapjuizv
	fRgBgVaMoCx8XPCR+3EpzyNewoEaUCn5+aIQWUO173y28BuhU=
X-Received: by 2002:a05:690c:dc7:b0:7bf:eadc:c13d with SMTP id 00721157ae682-7d20e5dd83cmr235702787b3.31.1779912495505;
        Wed, 27 May 2026 13:08:15 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38be36898sm79065497b3.27.2026.05.27.13.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 13:08:15 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Wed, 27 May 2026 23:08:02 +0300
Subject: [PATCH 2/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add
 initial device tree
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-yukon-eagle-v1-2-98119d64a71b@gmail.com>
References: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
In-Reply-To: <20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Add device tree for Sony Xperia M2 (sony-eagle) smartphone
based on the Qualcomm MSM8926 SoC.

Initial features:
- Framebuffer
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 406 +++++++++++++++++++++
 2 files changed, 407 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 32a44b02d2fa..6b471a346d82 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM) += \
 	msm8226-motorola-falcon.dtb \
+	msm8926-sony-xperia-yukon-eagle.dtb \
 	qcom-apq8016-sbc.dtb \
 	qcom-apq8026-asus-sparrow.dtb \
 	qcom-apq8026-huawei-sturgeon.dtb \
diff --git a/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
new file mode 100644
index 000000000000..a203f97aa86c
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/msm8926-sony-xperia-yukon-eagle.dts
@@ -0,0 +1,406 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Erikas Bitovtas <xerikasxx@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "msm8926.dtsi"
+#include "pm8226.dtsi"
+
+/delete-node/ &adsp_region;
+/delete-node/ &mba_region;
+/delete-node/ &mpss_region;
+/delete-node/ &smem_region;
+
+/ {
+	model = "Sony Xperia M2";
+	compatible = "sony,eagle", "qcom,msm8926", "qcom,msm8226";
+	chassis = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1;
+		mmc1 = &sdhc_2;
+		display0 = &framebuffer0;
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		stdout-path = "display0";
+
+		framebuffer0: framebuffer@3201000 {
+			compatible = "simple-framebuffer";
+			reg = <0x03201000 0x800000>;
+			width = <540>;
+			height = <960>;
+			stride = <(540 * 3)>;
+			format = "r8g8b8";
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>,
+				 <&mmcc MDSS_BYTE0_CLK>,
+				 <&mmcc MDSS_MDP_CLK>,
+				 <&mmcc MDSS_PCLK0_CLK>,
+				 <&mmcc MDSS_VSYNC_CLK>;
+			power-domains = <&mmcc MDSS_GDSC>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-camera-focus {
+			label = "Camera Focus";
+			gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+			debounce-interval = <15>;
+		};
+
+		button-camera-snapshot {
+			label = "Camera Snapshot";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_CAMERA>;
+			debounce-interval = <15>;
+		};
+
+		button-volume-down {
+			label = "Volume Down";
+			gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		framebuffer@3201000 {
+			reg = <0x03201000 0x800000>;
+			no-map;
+		};
+
+		mpss_region: mpss@8000000 {
+			reg = <0x08000000 0x4d00000>;
+			no-map;
+		};
+
+		reserved@cd00000 {
+			reg = <0x0cd00000 0x200000>;
+			no-map;
+		};
+
+		mba_region: mba@d100000 {
+			reg = <0x0d100000 0x3a000>;
+			no-map;
+		};
+
+		reserved@d13a000 {
+			reg = <0x0d13a000 0xc6000>;
+			no-map;
+		};
+
+		wcnss_region: wcnss@d200000 {
+			reg = <0x0d200000 0x5ae000>;
+			no-map;
+		};
+
+		reserved@d850000 {
+			reg = <0x0d850000 0x3b0000>;
+			no-map;
+		};
+
+		adsp_region: adsp@dc00000 {
+			reg = <0x0dc00000 0x1400000>;
+			no-map;
+		};
+
+		reserved@f000000 {
+			reg = <0x0f000000 0x500000>;
+			no-map;
+		};
+
+		venus_region: venus@f500000 {
+			reg = <0x0f500000 0x500000>;
+			no-map;
+		};
+
+		smem_region: smem@fa00000 {
+			reg = <0x0fa00000 0x100000>;
+			no-map;
+		};
+
+		reserved@fb00000 {
+			reg = <0x0fb00000 0x280000>;
+			no-map;
+		};
+
+		rmtfs@fd80000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0fd80000 0x180000>;
+			no-map;
+
+			qcom,client-id = <1>;
+		};
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	accelerometer@f {
+		compatible = "kionix,kxtj21009";
+		reg = <0x0f>;
+
+		interrupts-extended = <&tlmm 49 IRQ_TYPE_EDGE_RISING>;
+
+		vdd-supply = <&pm8226_l19>;
+		vddio-supply = <&pm8226_lvs1>;
+
+		mount-matrix = "0", "1", "0",
+			      "-1", "0", "0",
+			      "0", "0", "1";
+	};
+
+	magnetometer@2e {
+		compatible = "yamaha,yas532";
+		reg = <0x2e>;
+
+		vdd-supply = <&pm8226_l19>;
+		iovdd-supply = <&pm8226_lvs1>;
+	};
+
+	light-sensor@48 {
+		compatible = "sensortek,stk3310";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_EDGE_FALLING>;
+
+		proximity-near-level = <1700>;
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 22 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pm8226_resin {
+	linux,code = <KEY_VOLUMEUP>;
+
+	status = "okay";
+};
+
+&pm8226_vib {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8226-regulators";
+
+		pm8226_s3: s3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8226_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2200000>;
+		};
+
+		pm8226_s5: s5 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
+		pm8226_l1: l1 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l3: l3 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1287500>;
+			regulator-always-on;
+		};
+
+		pm8226_l4: l4 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l5: l5 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		pm8226_l7: l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1850000>;
+		};
+
+		pm8226_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		pm8226_l9: l9 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8226_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l14: l14 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+		};
+
+		pm8226_l15: l15 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8226_l16: l16 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3350000>;
+		};
+
+		pm8226_l17: l17 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l18: l18 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+
+			regulator-system-load = <200000>;
+			regulator-allow-set-load;
+		};
+
+		pm8226_l19: l19 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8226_l20: l20 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8226_l21: l21 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		pm8226_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l24: l24 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8226_l25: l25 {
+			regulator-min-microvolt = <1775000>;
+			regulator-max-microvolt = <2125000>;
+		};
+
+		pm8226_l26: l26 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l27: l27 {
+			regulator-min-microvolt = <2100000>;
+			regulator-max-microvolt = <2100000>;
+		};
+
+		pm8226_l28: l28 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_lvs1: lvs1 {};
+	};
+};
+
+&smbb {
+	qcom,fast-charge-current-limit = <1500000>;
+	qcom,fast-charge-safe-voltage = <4250000>;
+	qcom,minimum-input-voltage = <4200000>;
+
+	status = "okay";
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8226_l17>;
+	vqmmc-supply = <&pm8226_l6>;
+
+	bus-width = <8>;
+	non-removable;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8226_l18>;
+	vqmmc-supply = <&pm8226_l21>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&usb {
+	extcon = <&smbb>;
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&smbb>;
+	v1p8-supply = <&pm8226_l10>;
+	v3p3-supply = <&pm8226_l20>;
+};

-- 
2.54.0

