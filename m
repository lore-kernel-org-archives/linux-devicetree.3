Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B06940B37F
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811625; cv=none; b=Wd5dFGToVumRhYexez7Fyu2uy2QFPAOqV6aMOHTAG8rOEdU+mKoZKAM+OEI4KJksQoywsX3qoeu3O7Iw6xMZGHpnYcgGq7Aagz3ouNk4l8Oye/FrjH+83dx+05BqXhoduR1n5+UAi8AaVV8bsO57/nowpSP8hIeYHcHZgTlEOlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811625; c=relaxed/simple;
	bh=R7p0EC1MJExELMNko6n8EU7bwP08zWcgCr3KfDmFr5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5BuCm7Q+9Gwa1Hgc0vwBIIEa1HI3gnWIe9jS2pByWX0j261KLQed+hrQGMksA6XeKl+KnUYstyZ5UqcV+Rp7dYpitRf+v6ytE+zu++yGLqt6hojBOtUgbRZ3t2+6Alld2p6rPaFC8PUQSBaZDAGN5dNxkQp27CjePieUWMT9wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eoI4ghYO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eoI4ghYO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4759b4f0897so257733f8f.1
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811621; x=1783416421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=eoI4ghYOShKCKcoBAhpn2xMBwo+KNKrdrVtXkH0Ua5sb6fblx99jngNouC0DLygLQU
         P2ZHLutBugV45dO3SVt0gRwoZkZBM35XphGeUhFH4uzEMcJxPUY/V3S+S+r3YEJ0gzj8
         tqdYH1cfJb/q5gstSUHCjtXJjl8CKzWYjYJVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811621; x=1783416421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=bsynMuXZNPT/bm5jX44T+lcxrAABMZUJpp0uwqclXP6oEpySAuh2AorqLH/98C0Zux
         Sx/0+RzNOUwMQGDatEzFMA9YTnrUaI7wzFaPzLtg6NERY+HQYqrb0A8TOEnyEbr3IQju
         L9li27QKViR99B33NTb6TSzRmSEEtCfoPYdDpRMwbLS8x7/1P5WLLa/+Ga83gAQtXU+G
         ZpLltPlrjFTdt2wqYBtT/Ix90uGrYQnOJpfVTsViqIGq7jUxJC3xvgntWX5+5MpFUxzK
         Z7/r4Kkrx1GL6uCtMA1R/1un2zQ7KIw8j03IXP1nFMJ96vBlVoo6wrgSQfZmEd16xHqh
         iIqw==
X-Forwarded-Encrypted: i=1; AHgh+RrCVER+ePto4ZIwZJKD8QQVbORYSMWjLvsTo5SIsS8vpmSdi4Y5Jf+3A1kafPMn2fDiOMZhCPP5qbpS@vger.kernel.org
X-Gm-Message-State: AOJu0YysAbiZw5NCXHamUIpcM/GOPrUmwzcHNZfgUyQjdmZj/+td1x3b
	MF17fbt6T1bQRkHgIt+n0PF6OJfHg79meC5XuGvXIKxRce76scR5UdEkw8QMKuHh51U=
X-Gm-Gg: AfdE7cmltljk+9bO0p4leSnauARBZgFdmyjNetcEuIXuhSOUBjcj/NSaDZYf8GeAS8J
	dR2Um7Bwi3w31gQj5FBBOSdhvIamN13es50wV1SNGkv8jpiGgIM3ynrkpJiFCmUqcYiYocT7Fyg
	jLH9mVYjkr56XnuPD3g0k1NOfR/uoOrlEXCDUSwcg/H/stVbY2BPD/pnywVycHbDw83y5v1wXRA
	/9MhD7SGGJQ87/Zclzj/ilQ22vIHVl7TWx/Nalass3/4lcHtHIy4nWfCtrHewTy6v2nERkTYSGS
	8KAu/5m43B9Ds7ZnRQCmf1/xOFUWPusx6vIt5vRL3B9cOlc3KP6Hwy1dq+bjYFGKDodi8cF3rS8
	QM465HQQ4i/OnOLRNXk/NlRxzRIHooBKmAtb9jdb4+6jNR7VIdFcw24Hn30Vq/Yu75+0Pj9SPdA
	7Xtih0rv3oHYHkPEYGpmsnF0mcYHNCRvrMvdwMpJesg/9HdF+4rMvnSd3SNpwIlEor/LN35dgyl
	EFhToZY7fZoU9qoVpF+Rhow0g38uatvN4k9BpxVLZ5NrHwa6kA11b/1DdiQ6PfVLobvPy6nfaQU
	X5XsLweuHzts2g==
X-Received: by 2002:a5d:5f89:0:b0:46d:d90b:bbe1 with SMTP id ffacd0b85a97d-47550ac1b77mr3711275f8f.14.1782811620996;
        Tue, 30 Jun 2026 02:27:00 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:27:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Tue, 30 Jun 2026 11:24:43 +0200
Message-ID: <20260630092628.1695560-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
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

