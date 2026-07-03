Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AB38B154
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061551; cv=none; b=pmrDwBWf71jSpL7zTPQ6TG/Pxa/NHeRjXiS4CdHxcYHvHV1K2rM0NID5H3kmZg8dLJHjqBleYzOyFJzcB9jkGHYSc+gquHbE3+NZRJKJE409bUXgy/HQt6CGS/PEkfj+MO8mtEdpvc80ecOHSx0Ljlckgaw2krAced9LUxeiwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061551; c=relaxed/simple;
	bh=R7p0EC1MJExELMNko6n8EU7bwP08zWcgCr3KfDmFr5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpFRE09avaiWqbtm1KRGbZSQ0PGdz6Xsu59xpB/+fM3V2C7BuMlp+HdaU+G36cFq5BzGUqlTTOehS1PRpuZBuFLrDXBLy1+eADMbwTd27wI/PdB3acAb1kBko7AAjiatzeG/6iwkmNwY2uvjzwFs6GRThxT2RZ7q61AYBQCuLZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=frU8INfO; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="frU8INfO"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6983d3dae7aso2211938a12.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061549; x=1783666349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=frU8INfOOBqtNk76AuGC735bYWL6OmxuzrPHwwFzhTrkd2Xsl0tFuK8sQQ8UMMIrgD
         DhpWpMMTWixUuiz7zuN0FpOQlDQF05Xpeaewup8d+1eDeSHdt3zGRXVAUIGW5CqxkkZe
         L+pUOLje8qYpBgeTOgoIwQhd599g9QYaQNVek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061549; x=1783666349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ehG0wNhXC7EZrYAkm3RwKsx8ZO4vZ8QiozKkc4jo0Cw=;
        b=qNbNc7Mx9Mt/vASxLuTxltV3ts3igwjsT3kZaVEqpxNVh65I4NwNAyPKmpFbU8UaxB
         UIsi47iWPI4jIu3wuGu8LgfexO+w3oBLTEUfkwkQou+dipZVpCuebVvVvWsqboGcWrTF
         Ess14GmWAMMwFCk1ib7cUyARlqrAWM/5b5fvHIlAKtx1j2cvkwtazDlWCxpY2hJRoX1C
         1wwORn0qurHekCLv6tLOMyQTTcZvykJ9r1xZZnjaa7y2ZFE/CFbF0QLOMwvhWkHx8KWj
         XrPlW8QeZYqH2pJZ8QmfyeYsZDu8uDF+CVeTg2HfSvVXWTWhQsrJYNbLMkLyFpEwmRc7
         nSAw==
X-Forwarded-Encrypted: i=1; AHgh+RoXpBypNYVw2PFIUyimyxwd6dfFpXYXo/COH4pAdqc+pQjqpNmm0pHhPaE5G7m6Pi5kCx2f7Qik7Rju@vger.kernel.org
X-Gm-Message-State: AOJu0YztwsTsDAShZFDLNPbnNubzhoxWNbjP1NNROWdAvHwtEL5MY4fH
	5p5OO02naqBYDHSpxARfhQ0yZrxQBDQwRuDVzgIGkvUAqeMW7s+tuLtAu+jzWTiwK+c=
X-Gm-Gg: AfdE7clafQ2DL+v5KTOGoXRdGxVjAJYMLOJffJ4YJt7IharZOW54++dmjMM4P31JJPK
	5dG4PIOef72UKe7v7AYftByFAfbaHz5SRfvjuSuodelAf42hZePR4eH8qEa1coLbJVzhI1MGPwK
	yVqM18GzVUZEk9IXmtA8Vf06PhisVWOppetOH1quYYIw8yFWgTRKfXckTN2Xibe7bjqT6Z6akXE
	znAfj8ObUvYDzi3L8gge03qjicu+8YuCfZkjDXUCD/0rGxUFjFIxWmYkQIRI6BIDfOY0svSjKgF
	nlDy8XKTRdw0DOUe6sUlJh+4j9hJvP8URCP8YIFlrUeNKoAxJ9p5ttoEdiRe0h9DRq9kqDCWTYd
	vieBLPZA9qmxCa9hmbUnlftPzTh1+vXL4ZsupJOV3/OpfuLTzXnZPW77qYB045wD27/a04gZk1P
	um2C9cPCtwAnb1sadsCr66OufEazn6Y1lJd4ILhXmuv6+tz3Op+4yeYNY59ca+Ro2a10x1B+fv8
	Cr1+y3STYI=
X-Received: by 2002:a17:907:a394:b0:c12:5ac7:b346 with SMTP id a640c23a62f3a-c12c9fb521fmr113023766b.21.1783061539868;
        Thu, 02 Jul 2026 23:52:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:52:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
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
Subject: [PATCH v7 14/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri,  3 Jul 2026 08:49:04 +0200
Message-ID: <20260703065110.1433283-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
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

