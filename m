Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF6F3B7769
	for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114065; cv=none; b=P/l7ocr39Y/9fK5qh5V0TtKNvVzz9ckkDxPEmjUHUZf4rFku/uxDpM1aDy/lPyJpXz0HYDR1j7bYF8ipHipvV8Q9APTEwHdbMZsLMXMGqO56dVK+iTMk+kvFw0vM6lh1Fd35tf48s9lALQ1p0GnwBIcXefL83HH7zJgRhGjWvXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114065; c=relaxed/simple;
	bh=2JIYF14Q93avKZHdVMTlY5UdLr6Jwx5oSbgDmxdxKI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJV/2GqF4Kj2e9XC0qhlOmIaDXkzD5L2ROnirBC/dlb3v3/pDVIWy9k/q+NvlSvCRxrbRVB87WySRbnTDmM8lZdYIMWdXsrEJMTStoKbDosthpN+3ViunoY8wXWtWeIyrNd45J7YcBNYGC/UO4gVDVVr26KJgzakLyIr4l0NHZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MevNldj6; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MevNldj6"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso3500033a12.3
        for <devicetree@vger.kernel.org>; Sun, 30 Aug 2026 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114063; x=1788718863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c4U0BNDYU2UB4eOhplmVYpzX07XscyKMmjV+K/BC4jg=;
        b=MevNldj6QzGX/uLuZazb88Lk/640FYCw/tnXHsxdnmCiuHDdesHiMwo9XuJ3ewJlP7
         swxkC0OzFeHI67zYoGNlrD0FDLmpfJkmUgFJaDbxxVSIwwsogZCEUhUGeKnHYtNraOY6
         KsYBUbUsyVI9UP7jPVFwu0JMLsGEF23D5sSi9E8N94FI1N480QAtq5TMbkpS41+IL5k3
         0JJ6Ba3qqeIYyVKYV1xvoOoLST+6N7Fp9HYCMKH4l6C0xKhxSnWwVfxJ4/HDScEwpFF/
         eC6FY+92FxsVWpCmohwp3HrrLpVW+1d85Qw26yBQ764T3xKSlwsAZjoTiEUpmxfuOcbo
         Iq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114063; x=1788718863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c4U0BNDYU2UB4eOhplmVYpzX07XscyKMmjV+K/BC4jg=;
        b=bEQsxsOtZQrFVmeSPRAVsKfbZiudaf2gGw58fsqdahf9gXlhcClO/rjnWbeqB8bww9
         RffMXWR/uIQE99bnp1Ev79D+OHgYJcYgscLcjoqqoIRcKP4QHblMOsZT9bg6Ni6K5o46
         5hOKbM1hKikvjV3DTeGlGHUr2TxwGEiLlsZNrfz/zJ4Ds6/y932qsW3L0gPx8OOUia3D
         mv4Ks+Xs5EC70thE19lfayN+2yMExcLtrp5fQPs3W407XvhD56mNLcrUM2Q3ri6U/vLO
         GFBCJF3L1ZS0ZcvJDhZBE91TlpQ21eFtW9/hKUIa7oagAx0cQmgKYBhiYxzOuJbD8V37
         1BGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rorx8aGwZAw4fAf5uEQ8buJcO8LJrMgOYAx6GC1zXc+DepMtw91O3ZwVjoZBW4sxYLKVThH0t7H8IKL@vger.kernel.org
X-Gm-Message-State: AFuF++m49iZYsY07NW0ae8AkF7vXVWKB1eUNR0EiMmxUpd0Bcw0wpQcP
	x6jZpnxB5Mx7EVE++qJAXM9GaMQy8+vNfMZukYx9GP262TUIEecfuDC7
X-Gm-Gg: AR+sD100hCcbJGKyjeVEaN6B7fj6VYL37ME1my1aILaScmquDS5AVD31+f3FIa6uCDN
	yNwIMkErHdGlhL9ziRhG/5Vxs6FQFCs75DC8HryErAe3o70mgUCWk2510Cnoj8+DZujTG6FfIFy
	UDJ+MYGjbI9T4WYyixVES3UgLXXfwBlXxEQUgXN0WsZhwWfphiKxXv2lXhG5sO16qejq7+pbiRL
	pZhcaAC6QZG4dg2jzsrjpsu+nOELMe+m60MY4ZgeA2/0Ny7FLX44+eh9QCHRXg4y0uSWMrODYQw
	TWeQp+Ns2uRI/6XxIwZ9d3hWesW+4zISVAYktRQF04Lu7F/YI9h2m3tsZin5LUXIj0r4jiijbi7
	WkcHp1YKuOKThKboMQDb6mrF8ZneTMSfB/+nWbvVevO9y6btmvd3S//2xPH1a8E7sUvxDxv4DQ6
	i8oIjarC78vJC3+0uW3pR83d7UffKGN5H4LqAB08CKWAf+5jrzpNB3tHto3EP61lOYTcscO0G5v
	RIi2c52H09d9G0cIA==
X-Received: by 2002:a05:6a21:4784:b0:3d3:ae50:97c8 with SMTP id adf61e73a8af0-3d3ae509971mr20102216637.21.1788114063191;
        Sun, 30 Aug 2026 11:21:03 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:21:02 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Sun, 30 Aug 2026 23:50:36 +0530
Message-ID: <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console, and
MAC0 connected to an RTL8211F Ethernet PHY.

The MAC0 RGMII RX delay configuration was validated on hardware.
The RTL8211F requires its internal RX delay for reliable operation,
while an additional TX delay is not required.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 6b68671f9379..b109491d5c8f 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-ampere-mtmitchell.dtb \
 	aspeed-bmc-arm-stardragon4800-rep2.dtb \
 	aspeed-bmc-asrock-altrad8.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asrock-e3c246d4i.dtb \
 	aspeed-bmc-asrock-e3c256d4i.dtb \
 	aspeed-bmc-asrock-paul-ipmi-card.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000000..aa623f0ca36c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+
+/ {
+	model = "ASRock Rack B650D4U BMC";
+	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "bmc";
+		m25p,fast-read;
+		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <4>;
+		status = "okay";
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			u-boot@0 {
+				reg = <0x00000000 0x000e0000>;
+				label = "u-boot";
+				read-only;
+			};
+
+			u-boot-env@e0000 {
+				reg = <0x000e0000 0x00020000>;
+				label = "u-boot-env";
+			};
+
+			kernel@200000 {
+				reg = <0x00200000 0x00800000>;
+				label = "kernel";
+			};
+
+			rofs@a00000 {
+				reg = <0x00a00000 0x02000000>;
+				label = "rofs";
+				read-only;
+			};
+
+			rwfs@2a00000 {
+				reg = <0x02a00000 0x01600000>;
+				label = "rwfs";
+			};
+		};
+	};
+};
+
+&mac0 {
+	status = "okay";
+
+	/*
+	 * The RTL8211F provides the required RGMII RX delay. No additional
+	 * TX delay is required for this board.
+	 */
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+};
+
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
-- 
2.47.3

