Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CC3A75B1
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485793; cv=none; b=YRs+j+hxFE4yQ6tr7cL7620hllEYmws6qL6jGMtDc1Oq7jtQA8iZ3fsrqfj6E5nvV3GsPih3ycxQn8BwWeCmaB+9nFhT+ksJlKcYew9hIaOhlByKXa/+4r3HV/XXeYPcGnjgDVS8EqPWU4W8bbsbvnVBI07G0pma3fOhHr4wcIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485793; c=relaxed/simple;
	bh=6aWC3dFXQ4/33G52UZnUQtWD/ZRkfe9fBbp8bFxNryw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PXS+QiIm2uaOddaEzgnCNfwrXJbbU2Umd+vdxmuaAQZ28gMfNvWtg5yxJz0Ue/bA5Cv5KG96L2LgEHNJiv/hHl8gJaTx7N8Dx1flqMIZogvCJ76Wqifyh1uEkGDfgSqth8+2CrskyG/VngqzzEmfv2OP1EQ1j/9nPZJcq6FjTWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtonUzBE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtonUzBE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a10d130b37so3576659e87.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485765; x=1779090565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CYj/tCyiCEUxyQOP2HHnd+Hrau3oPbG8Ne1C/lnyZc=;
        b=QtonUzBELFdH7FEphXJz+8UhfIYN9BdBPFh2uvtUewzDQUnVtYxV5QymNM4fVmvIy7
         9Gy3/4FVBuz7tLQgaDtUepEODJXnjRgmLNOZLFzUIJXt9bNSfl9oFw9uCZKHUYw+/FKA
         LxNVKmgj4AAsSLSTmM/wq3im5zlAo2/rtgrlBTWg411Iwog4ncIDmKajphzSfo+m4IaA
         36S1nwsztSHyJW8FR3iVYoAsfiIivkOo1ZIRCXK2yuuYdc9BPFVpYHw3Ff31H6NLYkFv
         tDznE59T9A+XW+uoUs92dajrMOlIS6U+626Au8tggQvUWXKMFzYXOYk013T7YOHUrjRz
         EfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485765; x=1779090565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1CYj/tCyiCEUxyQOP2HHnd+Hrau3oPbG8Ne1C/lnyZc=;
        b=N6H1O5tCfrHFYCmH2+IeBqL/7XStrE/n2zJUHWK8eg7qgazB824J2m+29kT5Z5koZC
         iKVxAuJuVzefIV/09JnedHz3ycr80QyMIdHckLcJ3o7OQnsvhRu2FTGVqrriK60SwT2k
         xZjQ1klXBSw+FbcAmS+EE673VemmFlpheMxnrunAcwOxiiceWLFgxdoXEJ+q4kmNlirm
         H/YnkHJHIbd0rzw8btkC/+xxMzeDgX9LtLpQHcaNVbCpa72akj763wyaeT550IehHzGQ
         WzNqZhnLxOHu7cYzdFIWs5AOINkIBNhHpDGO9QwaqQl3SOuulS5dqtstJp2UikBZCx/D
         HQKg==
X-Gm-Message-State: AOJu0YzcwIwPrFPcGN3Q/F+yHiFUdXxA3aTY4KcIwbZT4ZckduF/AMP8
	yBvHrUlMjOKfFwyYajIkyMCgzw/2zxN/2GfFjba+tnacPeZnMgkLxuwt
X-Gm-Gg: Acq92OH1RHyJhyXI4+WPsYgbvqYVl0SV2wlyRsdp/iVoaSG8FodMThEaywLZMakIZFS
	2FbjTE1GtlX5s3kf4+zV4JDCA4PJf1YRMxkeHTY8TJUvvv7ftd/3tsuf/JfokxTnO2fL6FtT2Z4
	26ruVYLHa7eZ82PTht5yfdm+SaONqn//gACv31m8nd3LG697CpmSZZKr4JTmjyQrSnj/RTYl0d+
	OhUavWmpkfIWOTZlgDou4lcE3ttIZSVZFIclzbb0G5uzTSrfDnJa5yeI7hNFgjgA2iQ9wBwhNUi
	UIlpfbTbEIWz5I6IuqIjUHT52mXQn+oWI1pwb1JYZvEK9oQB50WmGbZFoW+5zklC08SSFc78FDl
	vW4amvwM7sDN5xVfdFB8cH/i44kx8f1hbfp1t8xEdh2PWKPD9ewooE6fZ/S7Rv9FGE4Hv4PUsIx
	t4ecKmYWOzoXjr
X-Received: by 2002:a05:6512:3ca2:b0:5a8:7007:8346 with SMTP id 2adb3069b0e04-5a899bca566mr4378323e87.23.1778485764582;
        Mon, 11 May 2026 00:49:24 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a94cac4esm2507271e87.0.2026.05.11.00.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/9 RESEND] ARM: tegra: transformers: Add connector node for common trees
Date: Mon, 11 May 2026 10:48:56 +0300
Message-ID: <20260511074859.24930-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074859.24930-1-clamor95@gmail.com>
References: <20260511074859.24930-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All ASUS Transformers have micro-HDMI connector directly available. After
Tegra HDMI got bridge/connector support, we should use connector framework
for proper HW description.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra20-asus-transformer-common.dtsi      | 22 ++++++++++++++++---
 .../tegra30-asus-transformer-common.dtsi      | 21 ++++++++++++++++--
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
index 73c7ee378865..fe05cfd2312f 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi
@@ -79,9 +79,11 @@ hdmi@54280000 {
 			pll-supply = <&hdmi_pll_reg>;
 			hdmi-supply = <&vdd_hdmi_en>;
 
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7)
-				GPIO_ACTIVE_HIGH>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1029,6 +1031,20 @@ key-volume-up {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	i2cmux {
 		compatible = "i2c-mux-pinctrl";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
index d4a7bae51830..76db928b53bc 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi
@@ -166,8 +166,11 @@ hdmi: hdmi@54280000 {
 			pll-supply = <&vdd_1v8_vio>;
 			vdd-supply = <&vdd_3v3_sys>;
 
-			nvidia,hpd-gpio = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
-			nvidia,ddc-i2c-bus = <&hdmi_ddc>;
+			port {
+				hdmi_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
 		};
 	};
 
@@ -1701,6 +1704,20 @@ key-volume-up {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		hpd-gpios = <&gpio TEGRA_GPIO(N, 7) GPIO_ACTIVE_HIGH>;
+		ddc-i2c-bus = <&hdmi_ddc>;
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_out>;
+			};
+		};
+	};
+
 	vdd_5v0_bat: regulator-bat {
 		compatible = "regulator-fixed";
 		regulator-name = "vdd_ac_bat";
-- 
2.51.0

