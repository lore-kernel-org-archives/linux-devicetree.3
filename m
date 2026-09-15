Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD233939D
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 01:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789435892; cv=none; b=c1ypFWUMoyxgM+ZtI9y9N6NxcwMrcxtk5eI/u9zSZnMHIVGSg1y2yKNmvemtfHeKg6hlotVyYA8fPIUpw8aJ0ED6S7UEDF8AawM5JI4Hr2Qg3/rvt9PHYDlFE2X5JGhvMuKM2MJj3F08+gtnbeq2gy7Ob6JVTLIQWoX2vXDC7f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789435892; c=relaxed/simple;
	bh=7ZuWDTyVtYOS4pkIw5SaiP6xmGSq0q9bUORFGHg+iOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Der7VrRPymoWj3LdZGpYjII8FV+WLRiXg4AqCm5lDo1Ksf+Z7OMd8XR1XmwlTfKw7Q5LP3k7x34uNki7/0RcdgyDmGBWz0KEprbW4rGQigo3w3vEJSMmXOZQ13gpCmpJGVW1Gl9RavMucQfKVrozjsycF7oOzy13LV9Ocvlzr8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9qUqobW; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9qUqobW"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b128dd0cb1so2799416eaf.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 18:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789435889; x=1790040689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mca1uOiT/+sfyymmOrDVbqr5tpDJZhJUUk2kbexgAZI=;
        b=s9qUqobWX7Tv+a104gULBtcbj9SyzpEMYRCn4Bn5Wr3iIWvwaKwkxP3dsBlFurFvr5
         kajYM/FfMieYbQi7VbF65QKFlTYgKktXfClVBc6MSVQC/O68T+A5tIXTSRnsCxuXnPkz
         94RO9+AYv0PSZQ1k/vYUI005m9VZyuoahAaVSepxe+/IMDRTtAmMhVe5JJVBaLwcCBel
         ZocvVUUKz0Trs9+2HCjsp5jMnt8NVE7N/3SXMzBJNgeXrSheXA4pkEAQwipaleRv5fa6
         xVgz2fdeYGwTtGV+GqACu7L76B+1k+5M3H4sllrUVpVcPML311zittGcYKtZSDpOAzWA
         C9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789435889; x=1790040689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mca1uOiT/+sfyymmOrDVbqr5tpDJZhJUUk2kbexgAZI=;
        b=ewRJdDJ6TYBQYOdhzuN5/K1bAYmTlE2hefaWiT+4DENyxtxoom9GOIE06XT/4rghDi
         SMa+2Fd9873Wv5HtOIDJsTE3EOzdOyZLm2ccCfrP96UqAINqY4QRVjk75ndhtzUG+ckz
         SNUvVcsLlChFFqv19oYeh2c9ao5SvPMHOkD85sWpVGU040JKtzITPcIp810aFe9lUjzz
         KXarHBYaWySXcsGmuVUxj4kSitavSvIRD89Vi8N8pBNrzcr7kT8uI2a2egDtGK8kz7tQ
         0psJOnJC+Az+z8vmVWpnm6S41LQGxfjPrgPSbtwjefxXOdPWKvXpFzH84aIE0hn9vs2I
         waaA==
X-Forwarded-Encrypted: i=1; AKwUvByBg/NsXwWf6ehRDaPRohn71sCb5kOCmbKIbI2CciqQJPuHuTpW/MEjfEGOM+DtcQTQLb/rwfW0AL9g@vger.kernel.org
X-Gm-Message-State: AFuF++k3EV9JucPrAgPYBey7V7p6fL7v/lG4OrAA/tyrUXMARzKhav+j
	t8wKQpJAKd7/gdbbM+8PsiLefDlDMOlryplxLOnXynMUP0wbb9hRZ7Qy
X-Gm-Gg: AYBFou1zhJEnaJ0vFxhH3Ok/ieexf6tMRryKF9ynHjOUWtqUSTu6dMObo1KbkQcr5Tp
	szJG2e3eE2AaTEoZVHB1FrjaPdti3iSFSWi4arJWqrAlEJ4brSj6AAbOxp2dB0vsHvRIDPrSxeB
	JDyv+gOKkYguCwLNoC7ab7ndyx8eReM/pBC9o/XHaQvfUZGiWv/C+i+n4NWQWnu/qYc4lXRFgC3
	mtt1aYhNk2Pn2OFkyGPSl1y+6aXtmSGZgTdcm0lg5oIzCtn3fJoQExrkw8uuMfvNjJZMI+2gnos
	fOxOgsPWV/EADcfc945DUMEBW7/zg5ZHOhizjKSsmTZIUrWzZv6kbee9h636bRhokvfpAdFc3sa
	EsGzw/ZTqYp8SjWDHKeynqjN2yCEMXXGuG/ZfXW5c2srotspcmi8FpzYzM92ii0mfX9wUFODW2Y
	CIOss1RYsIQl6QljRi9pOqGyH0PMLLXsRqcPYDwYbJkFnlCk8c6O1Ksu5DcvMZR+ZJMq4Uk7eBx
	vhZ8Ef3Y/qpzXXV
X-Received: by 2002:a05:6820:1694:b0:6b7:83d6:2920 with SMTP id 006d021491bc7-6c542342bffmr3288896eaf.35.1789435889379;
        Mon, 14 Sep 2026 18:31:29 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm27111575c88.2.2026.09.14.18.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:31:28 -0700 (PDT)
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
Subject: [PATCH v5 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 15 Sep 2026 07:01:10 +0530
Message-ID: <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the device tree for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

Describe the BMC memory, SPI NOR flash layout, UART console,
GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
connected to an RTL8211F Ethernet PHY.

Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.

Configure MAC0 to use the RTL8211F in RGMII-ID mode.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 120 ++++++++++++++++++
 2 files changed, 121 insertions(+)
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
index 000000000000..6585bda56a4c
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,120 @@
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
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gfx_memory: framebuffer {
+			size = <0x01000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+};
+
+&gfx {
+	status = "okay";
+	memory-region = <&gfx_memory>;
+};
+
+&gpio0 {
+	gpio-line-names =
+		/* A0-A7 */	"","","","","","","","",
+		/* B0-B7 */	"","","","","","","","",
+		/* C0-C7 */	"","","","","","","","",
+		/* D0-D7 */	"","","","","","","","",
+		/* E0-E7 */	"","","","","","","","",
+		/* F0-F7 */	"","","","","","button-reset-n","","",
+		/* G0-G7 */	"","","","","","","","",
+		/* H0-H7 */	"","","","","","","","",
+		/* I0-I7 */	"","","","","","","","",
+		/* J0-J7 */	"","","","","","","","",
+		/* K0-K7 */	"","","","","","","","",
+		/* L0-L7 */	"","","","","","","","",
+		/* M0-M7 */	"","","","","","","","",
+		/* N0-N7 */	"","","","","","","","",
+		/* O0-O7 */	"","","","","","","","",
+		/* P0-P3 */	"","","","control-power-n";
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
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default>;
+
+	nvmem-cells = <&eth0_macaddress>;
+	nvmem-cell-names = "mac-address";
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
+
+&i2c7 {
+	status = "okay";
+
+	eeprom@57 {
+		compatible = "atmel,24c128";
+		reg = <0x57>;
+		pagesize = <16>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			eth0_macaddress: macaddress@3f80 {
+				reg = <0x3f80 6>;
+			};
+		};
+	};
+};
-- 
2.47.3

