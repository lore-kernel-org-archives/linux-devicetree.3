Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAC43D504
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066060; cv=none; b=Q5QbmCido37H2q/tV/MIGAAp6ezo7YSE2WL3fN1G87joN0N1lqGW8IQWmVEavuob0ruY8My75Ei+cl/Mg214twK1J7UrW77oCnE3b8PYNRVjc5J1RlH/f1gueBe2mA5vPa7urL6rfSNgkqZbyhyxzdsn4RcqDya4amezILAxIyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066060; c=relaxed/simple;
	bh=qKGFRSvuiN42cXFAmURmIbU2KGhkH6k0xTuWEXt1CMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRzCQEMoNfonlEA0ca8HZBpc3k8WW6vRES59e5yh88+MF4hyFtufjLjzu+3rhxs2fmZbMoIuocPvnL9DDNVs8rTRp1cKOIvwjBlx3Sro8yY+bB0Sg9tFX5lPNY2De0n+iwSc5wecVsT89zUpSp/FY7PyBHwbKoEE0kyT8sprlMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bQj8SxR3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bQj8SxR3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so82878045e9.2
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066057; x=1780670857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F377Fo6uOcwDkhqFQvTWG9lQAWoEou84WBnGGfIw1vU=;
        b=bQj8SxR34Na2dykxleXqkLQCUIhechpNFuXwJ4HZ4HEssMnZoSz6gi6AekFReBpJOe
         a2P9Hzltr4DXy+hl8OULhkCraGPpvKeVTvR8GwJrhOBI/nmLvghlPwuFDrR4B0GNZ7qC
         gzPGaKO/PRYRrKUNwTzlGOPceFGU823os+ZNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066057; x=1780670857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F377Fo6uOcwDkhqFQvTWG9lQAWoEou84WBnGGfIw1vU=;
        b=e8pbjUiYHQUiMsXI/mWKIzHPjuzJrKL+S3T3TQJ7ASpGAMNuk6soWA/VXeKae45T+r
         SJeDX9zGZKXEBBV+Nt//W4W8QDq8VBJyP/VFDbTtTy5GmhPvZefKaaLvxOSJ1fbr7o/w
         kE+8LFh844v/I+uC88hodxWUOdQjFRuj1YBWcLg7aqZx/RbiTdwDSXSrXb3TUoL317er
         gLZDY4xGona9/XHW5NB5Nqhvp7CT6kQAgn7lL0O1gw+Zzl6JV8+Wi2w+tD9bGJ3oJHsF
         KVQZEagpA6gK1iV8yGXV0lnOBy++AVHdL5y5MdcNelk8Bsbdwgz04fuIPt9K9FJsCLSx
         sZdw==
X-Forwarded-Encrypted: i=1; AFNElJ8NIYLAvB4AEc+5xDzFPWeny5Lz8/3NtlvhmgmidXF3CJhk8N3X8fTnMJTTvFpU3uORNDDOF2sN5c+1@vger.kernel.org
X-Gm-Message-State: AOJu0YxWoZZLlzEW9gJ6dyBRnpwNsDtm07M8k8IK/3CR7uBJ1/XQL55z
	lVIBAcmamB2Bweht7LL/O7qyL7kNw6ZFdz9f+6nVWeVVLFBVCongUGOfvFpuOLNMx5c=
X-Gm-Gg: Acq92OGNdWFgo3xFaENH7il3HEzGCP3FJvupx8wa39M9LiYhA5SgdnwchmSbok+kbMX
	8jQD1YrNsJJwFt1IHvT+DQCG3kXYEb/F7cpH2Ard/pn4ithfnlk+y/QMTXR9VpTRlKXWbCArCNn
	EZJ1xb1un7NtqHjPgXoUODvmJ8TRKf5YUEjj04K4P8g8lLcPvU+XAPy8Q0qkXfqQJlSH6UYUBzp
	a0UaBRF/Zs1pc6OLx40wSi3oAmR9ruEQSSv/F3ZfpLi2V8ordw2APDOFwA5KRgEubK40X82PeCX
	PAvtbJNWSNjK87r7KC63c5RoZN7w7KeQE4vIWdyRO0pkBbqrffGkKhEYudiJv6hOSlJkhjqffVP
	NT4ANcoxYq8e7qZwC84MvWNR80/mPXbRoc42dYMvV/76gBiG0MzMPdFqVlB4XDj78o9GXULJns/
	J7qxfdSAsd+/JPVcQBK3z0SMc1S645TvBrlgLZeJry//16hshj8lVzk5VZj5gdgX9rYNQvFi0d1
	fsOGozGCLe6YOS6csYBrdzwb+OOKy71+tcjiyQRELmy4fPJvxpuRSEkuq8=
X-Received: by 2002:a05:600c:1994:b0:490:48df:2793 with SMTP id 5b1f17b1804b1-4909c0e77d6mr57063245e9.26.1780066057244;
        Fri, 29 May 2026 07:47:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:36 -0700 (PDT)
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
Subject: [PATCH v2 12/15] arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
Date: Fri, 29 May 2026 16:46:26 +0200
Message-ID: <20260529144707.3931919-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v1)

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

