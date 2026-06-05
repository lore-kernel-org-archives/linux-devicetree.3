Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6843CEB9B
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662028; cv=none; b=c3/sDeU1UczAa64rZAKUe+MCJmJbgY3+7KcHynvprDXd9FTnzS4YUfeZXaiU9m5iZlxcSgTnCQs9qX8YRpns+VfYMgqfY9LieFbNLGwZUgS4IKuoRZZ60QraSK9d3psEtyroFscwMaDEYkFA2OVLvcuyglIf+UYnJ2p5DaSuC4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662028; c=relaxed/simple;
	bh=nrUmNmS2cqNUpeioG1YefNM9DTR1Z5DYJiGiTJGLt4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OCZ8MhL/927UCfb92fXv4JAbC59zVq1gOlYCG2RhTSZvEpagGlIugKsnGlZW+05TJYPhlhKMQhQPDWGkyzeOXAhmOnIrrysgpBEsG7hyzEDvyt4R5bfFZw1qzzsK/HwmPzON0wh30pCGPkHqPBnrlbWQm+2FT0agvIl2WdX+xjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LyyP2WTo; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LyyP2WTo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49068493267so13931925e9.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662024; x=1781266824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GanFEAB/EXFN18ke4KMogfaho+mkfI6VO/zTEp1k31k=;
        b=LyyP2WTob/LQ9YNkEJd9nu/zE3paTf/E5OcbFP703UMnClxEpp8H31blzd7k219Zp+
         /J9WpWIvX3M/a62GlH4qPpKasX0EXiEDf0btP5nhffBV6A2yPPG2zv4tHSqb8RwS/g+C
         LZVzJBAbOQZbvMu+NnKcTGI7mTpnvgfP/yaHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662024; x=1781266824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GanFEAB/EXFN18ke4KMogfaho+mkfI6VO/zTEp1k31k=;
        b=Cea+T4NbQRzPhANYt7fRisDpe6Gw1jRhVzGsU7ubLKthL/dpZ06TQTBn3134o+rkCk
         qrlrlpVkXcC0Gd1mHq4St/rymJrqHYkH7NIRFTxcaxQ1n0fuoXcfaNxbyCCmKhJU0u3Z
         CscWuRcs0p5UPZRRY2f/gB/LLQmM/LRHof9GVXp5P8X1NIB88y3iWkABqZRvWy8V54zb
         L3VR0w9gCecvaOxxuxk0Avr7y1Y8Gpr0tZjVH52bjY9gujRv/aW11mTLZ6//frx8TQIB
         d7Wkqx4MJW2GsziR6t3+/teNxV+r1uAVl6uoni5NpvvrguCrZ/fpo7nA2Ax71/GCWnDS
         MXqg==
X-Forwarded-Encrypted: i=1; AFNElJ+C+D7/BbJCSeWOvXi6gVJjWc3PBKy57e0Xh9/xcubk1rQAOO3hhFy1FMvYRe4OWPpYAZwxvF/6GLx2@vger.kernel.org
X-Gm-Message-State: AOJu0YwoagiPZQsWw7c6EyYPM1jvyn/QZQ2iODyPrNBToKSkls70urmv
	jJOzQHUcRpxjaTvcZ+IHyiVIQV4abjyyh9mbu+G0hRI5sunX7s/IX9SjiUawl27ySI0=
X-Gm-Gg: Acq92OFoG7XRc102VD4dLADMg2+oonG52mJBWd7Z/mozSUfP4sKumnKBMhYeB1r/IGY
	ntWOnBgef8JvwY9dzxW+Uv+3o5YvzYuxMlmK/PV14aAbYuWge6CXtKIQ6PaYIJuo7RystJ64pP/
	FQ2JzrjyeAzCICa0opVfxKXk9NenMS0LHhQHWBNC7o2ZiTorC3E3UlOSIIXQeDRt2KqSxEpHQz4
	yIakkEB8leEtHKdw40jU5e0O+ueu9NZB09A1IedGK2M7ffpdBVI74dbJOabxA3dYizgq+lZZ709
	CVuP2d/IURX6g9RAL3iKA47ivclbWAQeOLoQvumE7MBb9DSNVa+uIByR5cZOJghow47SAeayz/Q
	tQ7bhfLe1sr2HUpCYyzDoR28FPGN0dcojmwXWa2aMzGW+mmxphSAcjD0zEK5jnNxlQNp+iVbrPE
	FpCylrE9bjN2QILqEi9dSU/WQBooznpgDos2tdHywy8LY9D+n6dIH3F85XHTIoV8T5EZ4hQrCrW
	p+P3nAwWFVIV5uYOwf7xpc+YMU6OHiEurw9zN3bY6dIklKOznlxpcl35R6gbO7h5VnGqL4Xj0y8
	6/VWXUFh+PLZqDGFVepRDrAdL2qA9Hxv+iI=
X-Received: by 2002:a05:600c:a012:b0:490:b9c3:6c49 with SMTP id 5b1f17b1804b1-490c2610c3bmr55729705e9.29.1780662023766;
        Fri, 05 Jun 2026 05:20:23 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v4 12/14] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri,  5 Jun 2026 14:18:23 +0200
Message-ID: <20260605121957.78409-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
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

[1] https://www.st.com/resource/en/errata_sheet/es0598-stm32mp23xx25xx-device-errata-stmicroelectronics.pdf
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi, we are using stm32mp257d.

Changes in v3:
- Fix a typo in the URL

 .../dts/st/stm32mp257-engicam-microgea.dtsi   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
new file mode 100644
index 000000000000..5b4287e86def
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi
@@ -0,0 +1,63 @@
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

