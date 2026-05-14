Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5B63F4100
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728603; cv=none; b=JFbxBLZv6p06KIPoDpOZ2QD1RGFugsbSUGnBbGNs/kIsEKGs/rUBzZhihDcqMooIOWi1PC8HBW5ec1ijJCotTZzd+yb+FsXcZ8zS2ROEBBbJt809vAVYfqA0vdxKIw8vFoyecLbpNmZKskJPFf2PgRzHXzbPDtIWbc3oPkC8RnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728603; c=relaxed/simple;
	bh=fyTONGMVpH5RgE3uAr2v1MluBj5VqbkSslK5IG34aAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVbK8Me2i1W5bom6UllcMh6Xn467/c+hCq421L2aypj+yr2XA4poaZLLG3n8M0VI5nuZRrsbs/X/oLWr2QcrvOZAWrkQw0J8VEcB3/IE5p41IRYpl4F7d6CEos1zR2tBJAZCgaD6H3DCCyCdH5VNoeYCWC8d+ujmDaAawGb2EMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBMqAix1; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBMqAix1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3692bf38290so208910a91.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 20:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778728602; x=1779333402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhXaZyjR5wnfmrnw0I8RLf6r41iRHOPfxchv5M6XoP8=;
        b=HBMqAix1Y/CTDaJsUEJabphQLFTvowTUWllhtJDC+7K5aX4RuhETcwJ+oHB+3/Fi55
         RlpawQwSgJS8WdHwzxsI3a1GBzUImR9nrgrO73yrOLiQ+KVMWx6hyWQkBBaePAxP8esD
         krlyceV+sIiRuUOByNcoLCHEAdz/49WarHXfKDaCzpuMYuJlVRHh0EMDRRMyGwoHvHH2
         9Bklkeoa92A5xaRpGYnl94uLKf8KUGuP2QY+PF/dK9DJKJPjYyHPnaN/BdyxvHxUTtut
         4eMQLw7Q5TS4OtH2XOv10fDOjMVjYhtq6l0GNilxavu4cmItqy/gr0rgo4oHo1qYQpnz
         tuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778728602; x=1779333402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mhXaZyjR5wnfmrnw0I8RLf6r41iRHOPfxchv5M6XoP8=;
        b=REbaigqgxXuF3LTjEC2r+99VMmf6j3eveFVGJZ3g4cldGbTK+/D5/b64OEwJxzd5FR
         jZEpcobXcnlv7/ZYIKkXi6YfNuIPaxJhq9uRT/hiE2RPq0E8dJF0xqtWwU7DQw+YG4Sy
         C7RhBgsEZq89tveXdsvvt6ibmXWtz7mWfB8AGmdA+Yms9FOk9+ay3RAWB5d1yuSdM8wS
         HTZWdaUKO+p3qImzkX++n+MswVZLx71YgapTk9rEIQsequy+iJqJwiusmnLWqk/kOy6X
         Zk5EBowbc0zSAvWNXXea/E1l8G1vPZxnqLVbsVpoyAP4BUdQu+n4OIatJL6Zy8ubG5L+
         xAlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YNaNj+FYiNh0/nEl6eKOKNeSLwTQZg+M7Jv1h0Th2aItIkEfy20HXsGmwffGLoBzVigaMR4HkLfqf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvcvvljym0wSJ4+zubCIdgXdeAQqxmIGMxFZiMhN39Jc3l6+B3
	PLJKuZ9uNp9nY6tHzgy3QzvN0QqjWN5C9FYBOvdAWciHQq+oZDH1/NYj
X-Gm-Gg: Acq92OFr9iZfuSNrjr0Ol2vITHvYNGpO7RqJlJd54HJEGulOQOgyfO+VsrF9jWpzTBh
	0LAA+1vl/kAmq9rEu+/9wUpkD5CjFaeI0eVkD0JtL/0Do993gk3fM3+ECvqZyZlgOyNe+cc2Z4x
	0XZDpyndUYvB3QPktCDZQqDS77uioupEuK9qfXJJP40xVYE3tlRnxrDPVlL/EdriBlrj/Kg68yg
	PNt2s6SjS6ZVSE+dYLH0R2iOi8JPyHWc3Pz2V9uUgAvxwmf6ttQJby60JvXdSl8il/F3ily627r
	WWGCkxyNFYcMvFZqCwClU5dqGRoM30TbLiOPOCouQKV1YK3+xhYNbGeq7XKuXb5PcqEygq8bchC
	HthY1WeMutuMm1GHNUT6Qsu38YeFEZagN75DpD3ksYher3NRSlkhihQ5bE9PN3dy4ohzEGIEnYF
	RTevS6nhvMQbp7sQKjQhgMBO2VAYlzjbquRsK3UJ2N
X-Received: by 2002:a17:90a:f946:b0:364:edd2:812 with SMTP id 98e67ed59e1d1-368f40a23dcmr6192258a91.25.1778728601594;
        Wed, 13 May 2026 20:16:41 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692a94205asm320047a91.7.2026.05.13.20.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:16:41 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Thu, 14 May 2026 08:46:22 +0530
Message-ID: <20260514031622.1416922-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
References: <20260514031622.1416922-1-prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the ASRock Rack B650D4U BMC.
The B650D4U is a server motherboard utilizing the ASPEED AST2600
SoC for management.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index c4f064e4b..124d4f8f8 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
+	aspeed-bmc-asrock-b650d4u.dtb \
 	aspeed-bmc-asus-x4tf.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
new file mode 100644
index 000000000..130b7f3e0
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
@@ -0,0 +1,71 @@
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
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+};
+
+/* BMC Console UART */
+&uart5 {
+	status = "okay";
+};
+
+/* SPI Flash Management */
+&fmc {
+	status = "okay";
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+	};
+};
+
+/* Dedicated Management LAN */
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+/* I2C Bus for FRU/EEPROM Storage */
+&i2c7 {
+	status = "okay";
+	eeprom@57 {
+		compatible = "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* System Watchdog */
+&wdt1 {
+	status = "okay";
+	aspeed,reset-type = "soc";
+};
-- 
2.47.3

