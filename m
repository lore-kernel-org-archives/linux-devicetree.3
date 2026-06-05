Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021240DFA7
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640972; cv=none; b=kNzc8nGTJIFJRzG9Lt7x22I6exNMP2r6cT8Pwa7PM6d3FHtdKnHFQDIX793kVvC6AcdCe9czp+3NUxLRabF6cmflFtS74AS5aGtr7SI5Ds7QrwY9+TFSzs8/ZmgtlMvN7X2BkOrJVDCfOvu4kjAkkOx7Fkde4Mf9mRWKgN7KXmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640972; c=relaxed/simple;
	bh=xtNM89rtJQ+/7mpEoXGRfWZLOkGhzco0rN4pEvdsp24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I6Q9xUuTTpmcFKt243uzwNJl0epYemTuJZnOFgxc56CaXrV43sB9AVhF/fRhDIy4ZOKMYBpL5zVNEwxTuRPSqGtFGGIypSeMQSYUR1I7CAliAaHQq/IIhw/nqO1Sy+ZcYTubAe0ww1mOUuUTeU2lzJmBVBuumhTRYhO9+PjaquA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bMvBgj/p; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bMvBgj/p"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1666902f8f.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640969; x=1781245769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mclTzGDSUSSOxUF84WDRq2fQHJYlVhvXl7S+nUy/YMg=;
        b=bMvBgj/pGZtdcTUXDiQ1saVOyomEZ9m/Zw8ThEkNA25noByRqDsHipZW6m5ax3Czns
         /VxFt3d/GlXKy9AS2FFqKuu9e2up5GZA8nZk6mvL+5VkzoTRplJpc/6QwNC3/gfZ9wP0
         qC5T6lqFb1zkbuxyVZ5K9+/vZw6T1jS7MXDAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640969; x=1781245769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mclTzGDSUSSOxUF84WDRq2fQHJYlVhvXl7S+nUy/YMg=;
        b=bjMwSsDdVSgAAWBsFw2ALsbxs+ARKaY5fTdATdqFyKefl4Wlsq9cdYb5TTY3+JsW3Z
         v0PlH/lamay4hQ6hqODn255WXviKgMQr+j/+WMoAVWw5g1LbXfCMNxYCpVY7X6vPZ88F
         aMZ7Q+d7FnVtNawNelFYwSovnncTWxX9clnSwLnvjhnew+e8CCpZCAddRK9hGc1at71s
         SqfqhzZSKsWI9EoijyCOb17tHDSmAG/8A840mCj9K+ZVS4XGrk8anryxujcBVu12sGbR
         ESa4wiq4Omx/jUVBGKUdQVvmg6i90sDYRex7orVlUcJLacLO/zYBueoCPXzd5Awdqqdz
         5OOw==
X-Forwarded-Encrypted: i=1; AFNElJ95U+0ucRPfeZedhF+kOtODt+gpjud/wbWsyVAj6KErcVlBSIywdvl+irr/dtxWioKcI5oz2ty2XM0c@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2LUsJPzO3VVG2N4Pryt+gCNe0fvn6lGMA1vKjw9k7AP2VaN1F
	MzUPoFCk9weDBG8qHGrDhoy2F325LjPdY++OHmH6f0KB1pLWCh6r9g95mP2Mvb+jn5k=
X-Gm-Gg: Acq92OFyxrRdK567Tm1DV5xR3ImgcxbkUyimu0fHRR68oKzO8AuEBdmVL9nsQ6k6ixe
	EK2LdaFIUYLE75W+SOCrzhepQxRblvxfAFgnvtc0aNrA1xdwPH71oV+qKFChMmJ2TGY2BtrckK/
	9A4mn5Jj1uND93+xmAyfKfE4u2lWf5sXp5Fn2hKh535rhP7UBeL5vgycS3nstT4joQbvqpadcrw
	axrEm7KHVey1gdOPXBUzl8vYSdI3aTHk65ONfFP6CRSDuD+GJyraprsKrp9OYYlk6RMoKlVqSeY
	LDoe9Hvv0sBklD9eLFnirTupK8UdJ3Ofn9wDp3uTN6K1alP/6n9ruDXkGdn9AUzkgIAHk3KXyIX
	yGTYYO/gTfZHHX40mZIe4QLTH2yIdY5j2rv6/FcIy5oETIXn7Q1N9gFu0zbUYpMK6rVIzWfQBv0
	hXIsv7zlhbM58rBzFpnu+2hcR7EYoMISN5JjgIgK71T80tKVr9ySvSw+sCAd5+ATP/sZYrG0ktW
	qdie3IbYnuQkDsOO3LoIlT6lmuAwxC2wxj3nja8I/+df7C4M1jWwJyxVzKs82y6W9zvfvuzgvH3
	1h/kieSMMMjbtIJi3R69oC5Y6sihwOGpRaY=
X-Received: by 2002:a05:6000:400e:b0:460:18cf:d49b with SMTP id ffacd0b85a97d-46032dabbc0mr1671442f8f.15.1780640968980;
        Thu, 04 Jun 2026 23:29:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 12/14] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri,  5 Jun 2026 08:27:40 +0200
Message-ID: <20260605062900.368376-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Fix a typo in the URL

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

