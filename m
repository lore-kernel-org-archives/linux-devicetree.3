Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804CD33A9CB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114750; cv=none; b=c2qZP0MI4Q0L6CEawe1uyfq92UJZpL0BMXSUjEGSquf2+8ig2UREKugbYg7+U8vVZDiCcNw98bG6iydJJZMty8AfpWE5hwtxesZ7K0Wu8ybOmWqmT2ugKIy2zJltz/T8BjkrSBJhsGW5jPaWFe6bEnkJ8kTQueZSEsTmMzvAt+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114750; c=relaxed/simple;
	bh=CGY0TtS6GgsBYi1T/QYBCq6DoxGIyFcJkZLo1gMrytY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyfP8pEIHPv/xadajWcwUZZtvciDAYEc5ElJV0IaAVECd0Gi8O/l6099nxiPWrkyDj2NHulJNHbO6vo1t9Rt8ErTJlozwOWOLexlfJNMf/6DwTaDoeARvAlzSfoWkAnlzC3nDeDNpZz9vQEJGQ4g50bfRXkM0cO4Pp2Go+sMMp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fuyoVCdl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fuyoVCdl"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1253056f8f.2
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114742; x=1779719542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F82I1V72Vx7fqVbAKfdEbmQ6SnibYwxzPYzRPk1i94Y=;
        b=fuyoVCdl1yFUj01HFD3CoLdLIwA0UlTKzJvlIbwz9rhnbwxXCx/3N/4rnd4hZot553
         8dwWaLv+ZnR/jxX6J+Jri7JA+0WdFJ7TtFtHw4xo0PNU5KfxS6BxSO7V3mbRCaqLVBPG
         xFA6eBY1HHHz85rWgozfFurvE8h9Dvc6/tdxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114742; x=1779719542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F82I1V72Vx7fqVbAKfdEbmQ6SnibYwxzPYzRPk1i94Y=;
        b=hES/ycuZIC6xAHkkxZbAV1lz3Jj71OD93iNn1p+adoUnAzB0XGGPPEkmkHbZ368O7X
         U4sVn0yPOTFdw51TIzw4sIMMtvvhf/xZtsT+qjW9zbMzJ+6LNBJNuytdr47KpB0ymRxM
         8eVHT/kCdlHiq8oN1LsZqW64xzouCpn6HdPEHXcByNtl2IJWxssODCq4x8YBZ0/iVUA1
         Ipcty/Lxek9HJaoy2pG1g+G02kGMxRkYrAIOFeYGK37TW5CfQ41SCuIJyoEF9UIPkfAT
         DtmwYllr9e3sJ3Vea2wcX8jfXZNC0qJJX57kfDAuqZZJ8DinaaC1l8PmrPcZQX+wvlTB
         hVLw==
X-Forwarded-Encrypted: i=1; AFNElJ9SeRlPpD2RuSoFTP09FjnzetXDz1xThPXA2Cx+oq+zvSY4UVO/GRl6LOy2c+1aeJkm/h25uJ/uCLhQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4VFoSbXZhp7oD/EJu7O2z3mkV691/p5HK0XZj5BQT6bJNyQtt
	8uvFNnNw9zhb+1TqJiu4UJcFwYifY1GBzEPSgUTXzOdvPbfdZV5DhOkt5uTWGO3go9E=
X-Gm-Gg: Acq92OHVVXYLOXsv7jYO7tYeUgIQnDdaSg7qLSzOTlZRz52wSABlpxWRLyuBxIapKhy
	qfV7qkQnt2VFZb3FfB8QSZE4sUqFw6okc9YNQTB2Fw9ZTkP9gSnJak2YvkqXnjUMNT8t6M2Qt83
	MtOc84RN9qQLXQ1gLnKtCtNrI2EPxvQqqvsotqoZA4gNk/1Sop/iBoH2+Z6M/k3FblvI+tQsLUk
	FRcqvPPzaRL9VZ9d1EA8rwJjfbNDOt2z37TSXcZjs7MnZgdllx6WbMW0Mu1ZbU4eY9QXThrLqyi
	7GylYj2jpW75hiN2Wc8P4vTaPHiO/1GwDmWzCcCXKV4OeR0Rnh/cf7A2mSf6Tq9aMoNnd8Gd+Ka
	l6TEmfM0Da7NqqmAEwgNh0jHb2+35owS5IKc4aE2vdZij0N0Qr2tsEaz35OzYtfEo8+cNK2YomM
	skvRu2cz6JyiT/NGDHOb62QVlz5vn4GBlk1TSY8TOWoikzNPU3vPMwevf8KSV/5mDn0ZhYggjgw
	kfLJU3wrjC41iXggUkDipsZL4aLWVRZ9b/f7B66MqV/6DOL42Rt891nEr7njrL6ooAV9Q==
X-Received: by 2002:a05:6000:438a:b0:45e:82b7:c260 with SMTP id ffacd0b85a97d-45e82b7c364mr4097773f8f.2.1779114742339;
        Mon, 18 May 2026 07:32:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 12/15] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Mon, 18 May 2026 16:31:27 +0200
Message-ID: <20260518143150.3138712-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support Engicam MicroGEA-STM32MP257 SoM with:

 - 8 GB eMMC Flash
 - 2 GB LPDDR4 DRAM

The SoM also provides an Ethernet MAC, but Ethernet support is not
enabled at this stage due to a known silicon limitation documented in
[1].

This corresponds to section 2.21.2 ("ETH1 RMII mode could have CRC
errors"), where CRC errors may occur in ETH1 RMII direct mode when
directly connected to I/Os.

The workaround requires use of the Ethernet switch (ETHSW), which
introduces additional DT bindings and topology complexity. This is
intended to be addressed in a separate patch series.

[1] https://www.st.com/resource/en/errata_sheet/es0598-stm32mp23xx25xx-device-errata-stmicroelectronics.pd
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../dts/st/stm32mp257-engicam-microgea.dtsi   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
new file mode 100644
index 000000000000..67be66cd1930
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/st,stm32mp25-regulator.h>
+#include "stm32mp257.dtsi"
+#include "stm32mp25xf.dtsi"
+#include "stm32mp25-pinctrl.dtsi"
+#include "stm32mp25xxai-pinctrl.dtsi"
+
+/ {
+	model = "Engicam MicroGEA STM32MP257 SoM";
+	compatible = "engicam,microgea-stm32mp257", "st,stm32mp257";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&scmi_regu {
+	scmi_vddio1: regulator@0 {
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+	scmi_vddcore: regulator@b {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
+		regulator-name = "vddcore";
+	};
+	scmi_v1v8: regulator@e {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
+		regulator-name = "v1v8";
+	};
+	scmi_v3v3: regulator@10 {
+		reg = <VOLTD_SCMI_STPMIC2_BUCK7>;
+		regulator-name = "v3v3";
+	};
+	scmi_vdd3v3_usb: regulator@14 {
+		reg = <VOLTD_SCMI_STPMIC2_LDO4>;
+		regulator-name = "vdd3v3_usb";
+	};
+};
+
+/* eMMC */
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&scmi_v3v3>;
+	vqmmc-supply = <&scmi_vddio2>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	status = "okay";
+};
-- 
2.43.0

