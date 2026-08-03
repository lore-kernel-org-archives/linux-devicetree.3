Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B1D3B27C3
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742996; cv=none; b=IzD2OzdyAhd26uWHpjgrpPLNgoyxMZF2GOLmcVelkbOLEBzo2u7SCqyuJQ/uiKD+ebDeLo7kTKSi2JTVvsZMri7LN32QB6kRfNHAzgeCmbsohSe/y41zjWArmqe8CKavNTW7FcZRcWVIbDaCR6qm/6QKHwzL+GgpZ8mh+Ylu3p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742996; c=relaxed/simple;
	bh=R7p0EC1MJExELMNko6n8EU7bwP08zWcgCr3KfDmFr5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NalQsqnrfD6dhApe4rKVuXfw5SjLh4WwXHdT5sdD+vtVqNUXXd1jnRuT98Cpsmfss1qnIwGBGGLSDN+SEStgJ1fscueXXmKBUo+ARi09RszjoMn//yO0VqOa/tLDjQqqeo8v/Xr+87FL5Ny5Jf2WqInNwbPIdiW1MNVbrz9fiBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=foePK4Tj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="foePK4Tj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so18223565e9.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742992; x=1786347792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=foePK4TjjrWXl3CScI7TRyF9H42PozNmQ3xLFosB7KYBwOa6tPGA5GSl3B1puPKwoR
         aAWW6db1fDZOey7mVKdfbEVOAgy1Lbxw/YeK7lClSpppYv+U4j0PYijGbrocGYmLdv6O
         l++aCt4FVVlNsmfrZlYa5BHJ7ChFkkxNiCfqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742992; x=1786347792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=aOsWIFgu24RI43wRKLplHofRxUOFF+oX9lQLlfHrm4kfivFSgJDofWvBX0OjOUt+iv
         s0MuIPY6nqd8Dzdc9HuUHBsRQdSmKueY+k9L4wvj5+QfTLF5lrbv46SNX+bYTXBiavt0
         ifyNr4IAuJN0oQSK6v/BDfr8oo9Wbh1idEjZiOR6W1o/e3gQm6KFqC+5ExzfniLYkgJO
         bAWr/6uXs+M+s57dPIN0bCX3EeGt8IN6d3fLTpZO50I6HVANjfgbkTaL8+w7BO1Y8WA9
         SdHRj9GwARDgoXpPHRhaBFLN2h3opgX7gk9ZVGOPPz6eV7Ox422oBME5j2us5J3vTTWl
         FUUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrjs1LgQUDpxTfw8qzcvCuwVapXmOdP1uZKWJ0RhYGoM92pK3B06fLtKeO5l7P+PvSjj7wuG3g9MRjD@vger.kernel.org
X-Gm-Message-State: AOJu0YwTBoTJ00VEcjolLdlihJebjanS30KZzPjnGh+UeKgvvMHn5g7D
	qo+o+vcK/kyjcT4eCNVzXjZ/n4wU61FtkOVcqkO5wK4B95w5//+MEMCJI9Voj+TDJf8=
X-Gm-Gg: AR+sD10f5aBxa3oJ0vkkptl8EL2jLgwp7rkvDxLk1AwF6/24bcXKo5XSX4YSyFYXK+u
	yuTeflNvICT33S51M7AHoxXCltDGtxoh2BJr76MIh8fpcIBamS1LMU/zR7IyOTxztMopUpGIMB7
	TUtIwA3ujjPHmu2xg5FNmpMXhXJ4DyFKvSmVHdr8bCO1QZAwmZl498KLiqn075XAAJGPuME6wtD
	IHhphzVutdvn4WvgAVyqzYUfdVblANGGe3w1W1xoHR/8bD+w5GQe9c98tkbtfTpdpR7fOpxsj5f
	g2C62B8oRcF3ayDCqAeDxCd/3mm4lbD7Mk09tcMKHUU3prI+C2/sMdToJ7QQs47mU+6sKHNrR2D
	xvmStnex1CwLiSzL1Obs3cFCLQRM3gec41JLxFX77NtNnHeUVVDjSh9tEgDmeqQJ7cG6HDybh/1
	6PGhP7ZTLhX6hp5RyhTuQ5Kf9egcxlYzeQbal9ZLFkF+P9HFEUT6C8SlUycGemI0kb49vO89RyE
	LXVKROBKRb5dP0zvbvWGTyHYvbRvyXLBXLOmoETInrn8KqTMf901P7wSsaTyQJgLPdBj4EH5KXo
	+0RCSht+FcwPn8y4Bm+lIIcc+xVpqG6FppXRrRjyLuXp3nceZl9ms5ke3gambg2FiWHbMFabXws
	=
X-Received: by 2002:a05:600c:46c6:b0:495:4a22:d684 with SMTP id 5b1f17b1804b1-4980c674700mr177583805e9.10.1785742991694;
        Mon, 03 Aug 2026 00:43:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [RESEND PATCH v7 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Mon,  3 Aug 2026 09:26:09 +0200
Message-ID: <20260803074224.3821911-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
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

