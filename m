Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27F531F9A4
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 03:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075302; cv=none; b=UwEqHEybo7qi7nor37ihz8AHEGexthLJ24XMJyS0bhPHWKb1t/M9gSaZZIqPVqV99HHKoYULo05fmpx6xWBk/BIQ5c4NC+UrJzXMjmakKK/OmGwlDbrkoNED18ns4dpSzWz/rBYun0VlWcU7u5rk0KrpvlPs2xxhKM7Bjgv8Has=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075302; c=relaxed/simple;
	bh=yJ1s2+4ldIGo/oIahVTwP3z4hri1FlAZ0UnaqMgfvwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbnPLxV/BUUBIgiG8kPthbklYm3hZQjsBE4rwMk+jp343xc504QWgFwCovtI1s3z0pgrnVNVVz99QXPAh1bmxJQlur6egU4lF5GCudk01fErZwSUmvOIftTb/5BunPcGh9KQYGw36WF3PyDiJJT0m3HBnGlfvgyFEWiNi6e1mpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXbce/MF; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXbce/MF"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c801b30188dso697925a12.3
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 20:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779075301; x=1779680101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jXpVG+8ZsYwGlksykpzEGGE3bxY9VynddkEfoK9K2I=;
        b=eXbce/MFEry5Fyq6jIMR5ndnWf5/m0CWQwiWH37cLpn/Fx6Uvp8VgJac3n0bx6Sa7e
         ATa9DCmbEr/jJw9P4H4HrHTK058YV3Ve+w2UFYZHP4ODvfZ+womk3rbcYa+41zbuRmZj
         u4+drc938QlhiZEF6cX9sRgQfwMkeqN8YLPb03uFqJtsxROHoIdgS8nGSKhVM/6HQj6v
         a05k5OUta2FHRmk6KG5ozfYlCet0eVYrnV5eYIO3JGOcfdFFZC6l/IfWDFiDDuKwFghz
         lHPaABIomZgrH3D/SqOocjFPvpq7avshxURqv3JkWNkYxStXAT7vO51rX3KYOHN8zQ6q
         LDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075301; x=1779680101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jXpVG+8ZsYwGlksykpzEGGE3bxY9VynddkEfoK9K2I=;
        b=LcaTjd1OtonfJJ6ZGVFpGymqWDX7TS0lCGCnzz06mafBmGaayEN70OtEcnSPF5Yhbg
         2Z2AqTO8eN6FuaGVR/cTz1nMjXxi78UuMvKm1xz3mVwvu10cc3dWwFjStFUE9KYop8B8
         +/8inlwBzAh7L13XxC4hVbfzbEREsEZyxoBubIou+F6/vCrDde0HSRzwH6UezcFZRBNZ
         POS9ESEf3X1futOigKWpD+cmFLYsyTa1cjrcXb8Nia9Og208nG3EuY5nPPfARB/S9ZCS
         HjWmeAN1pHeZSC2iV29ZNgAGYhS3i72huPq0UVErvRJpF7zjMeWOwLKGac0gTlDb3YoY
         GB/g==
X-Forwarded-Encrypted: i=1; AFNElJ95biYn6UxYndy1QWcvM5kjE60x74tt+nbHHlMfaFn9WlfbB1a39c0X0lqE/C1hGgBlScEI/qti3avy@vger.kernel.org
X-Gm-Message-State: AOJu0YzQGRjVH+WSLeZ9xaY8Vp6OO7x3n5D+3fwsBVCdMnhtHQ5D/JJK
	dPA46sqLZeme0YQIaWvh0BC2cvP4GLuxpAHL6FLSBMoXVLh/CUhdIrd4
X-Gm-Gg: Acq92OEC5nULA0C4yy/qyOVOl5NSuCNsQ/zc6AqpnkOSElM3IxmZqvG3ZRkmqHFYISU
	DrFiTY2seGL1Wcz+E6pppLopm9lFsG1kzdM57nGmt0DGTvLG7thpzhaPaSp3BLZNKRuWZpYcIGL
	SZ99uCwGjUBjyFA34xM1qR2M1aK5TNcnHKufOlZynU9zuCRWxfaKAAeEq3AKFGRjSAD4Rq763q9
	VNXTrcgEmefgdFaFAWr79XC5qU3RGefg+XCr1ogJ3rIIQAUAmFFwS+M74O3aycf8QK2MmU780Rq
	YMoOdBjweYGOet5rxlxVFgAorVxeMrIiJc/qrdGEe/V8uqPW0b3D3nierbTKYSVaINQPbUEp00b
	9wTF1Z/mhrbIiL39gwLmVCPhmaxHbM8Gdn6DAd7xqIoV68MUCFCBV5glZ1vqcTOGMLcpuQeRuRH
	t7DFwraAAwdpWCL+l6aVGqcK9t1L2iRDgWD+RiwoTe
X-Received: by 2002:a05:6a20:7d9d:b0:3a2:ebfc:6bf5 with SMTP id adf61e73a8af0-3b22ecf95f5mr13854841637.52.1779075301001;
        Sun, 17 May 2026 20:35:01 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.201])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82c4031662sm11183717a12.16.2026.05.17.20.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:35:00 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v3 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Mon, 18 May 2026 09:04:40 +0530
Message-ID: <20260518033440.17569-3-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
References: <20260518033440.17569-1-prasanth.padarthi10@gmail.com>
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
index 000000000..daa8b25e3
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
+&mac0 {
+	status = "okay";
+	phy-mode = "rgmii-rxid";
+	phy-handle = <&ethphy0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
+};
+
+/* Dedicated management LAN via on-board discrete PHY */
+&mdio0 {
+	status = "okay";
+
+	ethphy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0>;
+	};
+};
+
+/* BMC Console UART */
+&uart5 {
+	status = "okay";
+};
+
+/* System Watchdog */
+&wdt1 {
+	status = "okay";
+	aspeed,reset-type = "soc";
+};
-- 
2.47.3

