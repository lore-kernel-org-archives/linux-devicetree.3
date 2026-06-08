Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06AA3DEADC
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928575; cv=none; b=ACgjZwkJQTHBAz7dUIh/jKnxpFQHdbDg7LXCO16jOgHYctxNq7gY4h7JSiBMw3/rj71VH6dm14Td+GNLIf7AWG5qCwVDn5fvBB0Lq++i+eKaxWVVClfETpY8yr32z9oSzn1qh8DgpGE09wGKjRGbklb72o29CrxIQlfHNEi1E04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928575; c=relaxed/simple;
	bh=R7p0EC1MJExELMNko6n8EU7bwP08zWcgCr3KfDmFr5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tv5YdX/8z4hRGyYr2Wdc80zz6Jg8i8ZLP3ckMmK9vGGLgfSWVKKkftR6y+aGlRHhF4dyyWpbQoljyb+pNciykrUpiSU2os9a16IfOOZoNCrTvcxM5sMQENPSbzNIopPTxN8ltITnli/9Tu2o+5NIaHSD9/pD/B6iuP0i0ImN6z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cET3owKk; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cET3owKk"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6913fb25322so2808351a12.1
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928572; x=1781533372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=cET3owKk2SEcMdg4RCskJgBbZYWCkrTbGj0CiFGvSEsdJ4wRV00bXOuNXRrZwOdmqh
         7oNpJQX1v8XFg8P1UmjP0tDbQCIq6Hw6U8eD5wFoRFdDrMwwvlMa0UtLfnMAmjshf/FH
         oXHRHWHq0QCSqXNsYt17cAb93ahdb5GS3oryU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928572; x=1781533372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=bCUDa9GGH79cyTOHEMlOTI81Fy4HMDpBwYCwP5yitrx972EJCgvsBD4GMKc+EzbfJ4
         0v7mZtteyjAj0R+56x7daW/HG2jmwqDDNCsWt+Dr/x4ZeOt3zo4FM/WywEzYSoCy8L6z
         QCyhAar1OQIJyOAccHRvJCpHHK0h282I752GzOVTiOHVfV+3akzc4/PQudatPOnpM6NZ
         2IJDHJcJ6wIdMhm/Cxz7d1ypp0iNv8kL9zCeQILIOFcTUzaM0kDcKYyE8/+eI2OopdK2
         /9qOI9GTf0tGxsjKDczqzjvA9Ruy5n1qNkjaTC8nGNOmngHsSxaR0FPQC27pJUtyK+eG
         AkLw==
X-Forwarded-Encrypted: i=1; AFNElJ+vY/k768Q2DL1/ByroGcOTlIELryRli502orzrBq+OWqQWM/u6fg7SDjZyA3jWAxpxJe2GEdQa8Krd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw200XRWlHSMig3CnDXpz0U72zOzuiKQBzVz5Kah+2KgMZyuEUt
	7igxHarbZQom2rI5YxAxDed/BTOQ5hVhRfrT0TI9A13YbHkAbZTOtBGXc+Sqf6KsOpQ=
X-Gm-Gg: Acq92OFyXGNohWfvMtQ/XS7FTl7d3gtheL/SCHM/rq4GvgiFWcBN1qaH0MNdQzoix+A
	wKI85hM1WLB1dsb+ZyGIHU4Y4/Nv32/cN7mpJOXUuXWVW/uundmQKPbd2HGkRkIbKMzYJdCcmln
	+W165khmpMoGahCg0fAgPUroW2NVKb/pNC2ERQ4ihhT0D+z4Ct86tF4B4aeXDlm6dKR7EiKyBV/
	+mx3IJAXCFMMsu7N+aGIoqby3wmEX9n/ee5YiHijQt6dkXLXS9oc68ZsTeS9S622TflNE3NrmXD
	2ukj/IveSWQF2U4AXK/+ixmiBBIMf5XYb8iZGu8II5i5lWVEj8rgjg11VAiOnK3ecuoS5tckqvH
	o9S1IlCMLvj03+pBCwbEQvG5sfRO91ZjV88i8AWQo2U1O4eno7ViofWhm0KajxtULvBd3kBxggn
	V398fec+6Qn+eNqmSrWVmo1fBzwnGN+huO1z5cErVy3xnqJuzOrZdCl1jppjVK6ysdxedgsM6rK
	yQsFGnclN+c2qfBG2N2jvliOEoo/bsZl8T39hcKK+JjEt/Pcq4+iyq9XPs=
X-Received: by 2002:a17:907:2d89:b0:bd4:4593:33dd with SMTP id a640c23a62f3a-bf372b2ce9cmr731057466b.34.1780928572008;
        Mon, 08 Jun 2026 07:22:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v5 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Mon,  8 Jun 2026 16:20:31 +0200
Message-ID: <20260608142221.952245-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
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

