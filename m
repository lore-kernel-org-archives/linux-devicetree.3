Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247DB3E9C11
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217468; cv=none; b=CsDtC3U4YzftU9i54LxrgQWDyGw0cD2QmYAL9mncCawIExGMyTcvttZTWe09UBqt/4GQsm6wKp6VDdZGatHOxqsWbHbT3c+upn2VSrCje+l2sz+SErZSibeNiwNg2ikIK8EEqC70tTnkYS7l3j7QKY/duERhK7m3pvTE6wRcZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217468; c=relaxed/simple;
	bh=R7p0EC1MJExELMNko6n8EU7bwP08zWcgCr3KfDmFr5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R36HPVtSzV7HcRAZdNy75vAYIHj3Q2edOKQzljsSC76yYOzUQ6mQrCw2biV5XYF2teZN0hIgaB3fM046eP80aM3kuZF8pV1Lw602mH90vLEdstJpfCLe/hFqQh3upkca/k+RWIanGHYUAncQpFqBT2dAV+BDXkqaZj5FNN/LRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lIu2b97L; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lIu2b97L"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1695093f8f.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217463; x=1787822263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=lIu2b97LgfRFIvdCDxB7WWC7pkdQuXW0F88e7HBFsfTA38/eKJODS9SoaXVMqIaUpH
         OYjCg7iCDCZsrt57hIqDqloD1JexpmlTMSFeVrR4+ldB+otBSxyfqXtY8NDZXnXBKTd/
         umF/RasugooD900XWbQnywf187nTDiOZchXEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217463; x=1787822263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=eB10zd/eqtd/qdqyzQSSNQ1i+WCz4VijKW8NK2v1PYaLstvH6cqSpJ7gAKwzqBDX7o
         iiDUxWXDzu38eyE4dq4Hi2pxXzuPoUUG6tzaFQjKtr6W9XMoltH5yGhc83yDDvEInYUm
         ZfWKarkG0djGgvOEkezwz0RTMXlQDCNu85O9vApExVGzQDUnFJb+i1vMQrW8MZIvlkec
         ijU9hoIusR2JaJBC1rIYoMBpso4raYSlWz5FOk0erKy54RgRTzkrcqy9qEg2FKPnvFL7
         osjbnPEpbRV8PrUNraRWGZzBSKF+C/KcPRtvaVqfBMuJVyxnlNCmo2DbEVfzc8Q8+Oye
         PS+w==
X-Forwarded-Encrypted: i=1; AHgh+Rozcb852CuatZslqesf2+KG04G6XtuSxYqjNGaoK9U3ZjGY8Zd6lyMIccfo3ncHtP6d/PRnWs+TWt5g@vger.kernel.org
X-Gm-Message-State: AFuF++kVEHhgTaVeig+gs3sF1Q7x7Rnvagu+Q6aeMnOR0kWemlzlaYnZ
	rZt0ZUq/TP6OQked7RV69+xYj4HPrOfrsOFwsQDelQRaU3Z47a72RSRPYFfBQB/hdl4=
X-Gm-Gg: AR+sD13+XJBtAQjmY3kJrSgodb3EmSnx0kBYt9IkYrR+LPhcoY7V7TPr7XzagC9CEPX
	2pUgKefphvhEMQW54JRS11+368FlESGbzJvpvhRdIauL0flHJG7S3RYwOTKpsgDZ7M1lkgBhZHm
	XhwYwj6MvKC1HMgK2zmfO6/LCPYLv/wu3ACh5mBXiD9IsOgz1G0NXv+5nABZFR9sc/rDUWOWCAc
	W2mXM+CWVtwvb2cPma1BPOD99um93q4f1qu8nvAwoIIzOv2waCxyjIlP6gkzL03JEvQsg7NE4FI
	AjZs0fAYOE/HAuqRGffpO1ITjA6E3DFt28GeCWpBY2GjXeL61fKBiXecfdNjIW+aRu3iQO4DpJJ
	wDfPiG/eHAXfC8ATSemiQhIS0uXIGaz6JdkqcNiwRHeidFWGWz7ojAPiOiWatGtRkkT7zqHmPc6
	ZGFmoXYpuZf3qoN1G9EviiLo3wRgCczl6lk2kCxdNenNLavhLROAgfTnysW3Px79kBKsLDviCF2
	AxiI3xSp2BM6rvHs0pgWuNH6Guv3SGHFGyRTXj8AVEOa64SRQ00B7hHPgZ4q4+zyE6aALnzPZsN
	IwT0Vqp90vM2M42oTONdeS9rAskNW8NWCATYSQB06vi/bA65tJpU7Exfr3G5bA==
X-Received: by 2002:a05:6000:2311:b0:47f:ddc0:602a with SMTP id ffacd0b85a97d-482b1fde11bmr17822449f8f.18.1787217462627;
        Thu, 20 Aug 2026 02:17:42 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Thu, 20 Aug 2026 11:12:22 +0200
Message-ID: <20260820091652.43541-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v4)

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

