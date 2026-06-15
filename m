Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00E3E5A36
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525059; cv=none; b=bZWg5FZO6GyvSOxZDMhdXceD3Kk8T28Cufb7ps0AFbNZio0qtY0Mwkve9i54tL+O3RsWBC7eKAQdCnNcseV9kQSsEUd+OsYdDTVfAZIOMDXpwo3zv5/o17eLRqdsfwh4l2mCw1BRJ4VSsZOmEWvRGlFngTAa+QZ6yQnLoTXIZnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525059; c=relaxed/simple;
	bh=44TbCxTVIe/FzBA8wmIEoz6YwN5izDWzxpNkbmfbrho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5QZf1LPGxHYF0A8K/AVUc5O+B/ilAn4k9mRyJdyFkPSrCm3AHCeB83tGk+DLNLArRYWCsFiOtpa11FFoWzf5eRmOd4ILeakWgZ963Ly/wpqNLcDq/6oFSid+tqKkIFXju2h7JJUHAEBLu8mk3pkl9XWUesBj2FH85myl7tLfC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqZJDb1G; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqZJDb1G"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51788280e71so37663111cf.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525056; x=1782129856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaaLk3EgsloTd17mTIl3bCyAeJenYIahR3avArgMblQ=;
        b=rqZJDb1G2/Or0d9vCbl7JFcQu0+hml+QF/+T/kzWAk4QHplnfN1kibspWeF+gfe7W1
         hH/khRyZf8dKuXHPa0uDJNkWukXfHDBVko8eL1ErtEBYnUNALeIc1VAXtKrm9uTZJNkF
         GBcMHP8mXK2jyvSJJHOq6uJdPHk8W1ltj4zf3YMzW6pxf8YdmxQ+ZdBmt0FhmE7UsdNV
         A8kytG7babWQcI8KnLPNJXp4IfAutS566wPQTFlWRR/BkKz9sun0QxdG4yIDAmjkA/4i
         sTbMm08A/46fKaHMdJH5Eg/Gsum3gd2bD7D9DCvRoidn2RCgnrQt5jrloasVjw0QKQUy
         Du6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525056; x=1782129856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaaLk3EgsloTd17mTIl3bCyAeJenYIahR3avArgMblQ=;
        b=HWiczv1CxNRzYgMWIh1yz1uFoXKZjsvKCDpM7Ugiyv3e3TlJucXefK7g1JB5XwZh5s
         Nhl9AqL3KsmA0x9F4H1ryl973y2hlwqXn+9GEiAXwrPwA/sPK8H1jtzerQ8bD/tkZY8f
         RHBpwdXneTK6uqpOqvSrZy50u9eLI7udUJLaJMlsejJihkQa2idE/CioB7rpAosqdOFd
         l7fbnjb3Z5jdY+3hso65VkSOhvulw6sHRNcqgXf7c2C+GqtrzOoF84SZq90d+kvrj5Qc
         AsOU3Ua9XAJXk/sjbH1zxuxdul7OEF7J/5vW9RPbQedUMKLnbf9nZET+cpN6h+HvaPSQ
         7C2Q==
X-Forwarded-Encrypted: i=1; AFNElJ94MHvTuBNFgOrF71gxdMLR8nz19sUEWyWDxkmQjNNPgpy4O1cP0bCXjuqh0mTv0UTwXMAidsodDHxd@vger.kernel.org
X-Gm-Message-State: AOJu0YxHm0hLIhlWu8Fz4lMr7MEF+BoAkSo1sy7CHuSBaMSY9JvCuj9j
	HjTknJxqdMLUSnH/5i9JKGigIqMieNF1RoVGJxuvA8KH1EiWZl+mvtDI
X-Gm-Gg: Acq92OEYlzky8fnkdfoXI9ZUNiDUn98QWDJDy1bSTtIgslaIMOX4bEqCk4dVPVmcaSu
	yFSkvCA/JjV3IBE+x73pLeYsQkMAqX/h3dL8CO6arqusnOfEMUIcP6SCeBhXnoYOfx6BWiXmf2W
	MbIZhAAkfiU9cTUx9SmmsAco7gkBvdP2JCparsV8EsH49+P3C8rexq5oRu/3VAklqNu2qxAa6Et
	oDlP/xVrEs3aG3J6OiXu2pEnyW1eVDt0PwEDdRf8OstWLJWfLLLQx2mdAPveNxA21EQiJBuILNJ
	RovUZt/fPGjKnosPjYxcAjgGb+s+EhLZpt6DGH9+cRps4fZ0kZ2AcpvZ+VUMdiXfvYU2FM2OibW
	FD7/QwsFs0oThtZkBK3kdiDk/BRQo29VAydN+9Kjfzao+FVAixTa2Lc5mqkWZddIOOjBl+6Q/DP
	5WG43PzXbk+IP+AgTDehUs7RhaJmyKMDuSEOZqco7IUDWUMoKI7ZbLfVPI
X-Received: by 2002:a05:622a:229f:b0:517:8242:5bc1 with SMTP id d75a77b69052e-517fe200008mr205748761cf.15.1781525055524;
        Mon, 15 Jun 2026 05:04:15 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:04:15 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Mon, 15 Jun 2026 08:03:24 -0400
Message-ID: <20260615120324.1527881-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..58cc6b70d8de 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 000000000000..f56bfddeacc4
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		mmc1 = &emmc;
+		mmc2 = &sdhci1;
+		serial0 = &uart0;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
+		power-off-delay-us = <50000>;
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	emmc_cfg: emmc-cfg {
+		emmc-rstn-pins {
+			pinmux = <PINMUX(PIN_EMMC_RSTN, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-clk-pins {
+			pinmux = <PINMUX(PIN_EMMC_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-cmd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-data-pins {
+			pinmux = <PINMUX(PIN_EMMC_DAT0, 0)>,
+				 <PINMUX(PIN_EMMC_DAT1, 0)>,
+				 <PINMUX(PIN_EMMC_DAT2, 0)>,
+				 <PINMUX(PIN_EMMC_DAT3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+	};
+
+	i2c4_cfg: i2c4-cfg {
+		i2c4-pins {
+			pinmux = <PINMUX(PIN_VIVO_D1, 7)>,
+				 <PINMUX(PIN_VIVO_D0, 7)>;
+			bias-pull-up;
+			drive-strength-microamp = <4000>;
+			power-source = <1800>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci1_cfg: sdhci1-cfg {
+		sdhci1-clk-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXM4, 1)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		sdhci1-cmd-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXP4, 1)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		sdhci1-data-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXM3, 1)>,
+				 <PINMUX(PIN_MIPI_TXP3, 1)>,
+				 <PINMUX(PIN_MIPI_TXM2, 7)>,
+				 <PINMUX(PIN_MIPI_TXP2, 7)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart4_cfg: uart4-cfg {
+		uart4-data-pins {
+			pinmux = <PINMUX(PIN_UART2_TX, 5)>,
+				 <PINMUX(PIN_UART2_RX, 5)>;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		uart4-control-pins {
+			pinmux = <PINMUX(PIN_UART2_CTS, 5)>,
+				 <PINMUX(PIN_UART2_RTS, 5)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	disable-wp;
+	no-1-8-v;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	cap-sd-highspeed;
+	keep-power-in-suspend;
+	no-mmc;
+	no-sd;
+	non-removable;
+	max-frequency = <150000000>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	pinctrl-0 = <&sdhci1_cfg>;
+	pinctrl-names = "default";
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_cfg>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.54.0

