Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767FD366DB5
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 11:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497888; cv=none; b=Iri2T90oT/xo+uLuEq4zdShd+iOCiLFZj+Je9euIllSzzUS+WaqwUrePz12sFu5BRsWXvdzaG0YCBPBkzmFQ3DMWimkHN3UPQfA89qENQAVmiqlhFWBZ+KztPKJl8lmE6WgEZJXWVJ8xq3oCyPNEMpNWketBEK0XyocehMxPhJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497888; c=relaxed/simple;
	bh=5v3roHgyxPFWJERolB69r03uiYR/bdqt20byUWfycz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnzPyVxXEk0EGk6P4T35+9tpnbPpeLvR2DprHiM7/c9f7xjNA6/B5XvoAE7KaCii+T075iW1nU3L1DPTvuj3Sot8qiPhtlYb6jGUWQ/9PI0SwOuXzpVlfSCjXxhSUNfchf3K1kmfD7VRUGkkfX75hy/AVNsO8a7PVmZHHnifYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1jr8cXQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O1jr8cXQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7e23defbso2370606f8f.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 04:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497885; x=1779102685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuhQgbnX07N+cc+OsxTKWXB812yLSeaSn+CoDTYEUU0=;
        b=O1jr8cXQNNupEv+jG2DvAW/CPO/Sd+5dAqL7QxRZYbpp8RJTgsUDUbS2vDcrvLQREC
         1kvCpurHA7tOX/2xUMQsvscFu5thnVZNl+KSYEYLv3lMbt7dUbYXRAOaWaxtj6+MKsT3
         RQMUzRIucMpH0i8Jdse3eJMQGEJRVbvilzE/sU9qPHvqqKjiMHklhGFbpItROalo3PbL
         433hk3C2/updFMVI19AqdYHaODTbkWcJQizpfZRQjDoV3EasguI3WT68m6fQEk/FtyoU
         yQZ0q7DhYsgjrbEbxk3RdnJURTclEHEup+epyZBzCFMMqmMjgD1nrqblo7Sb1rU0fyEb
         EuqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497885; x=1779102685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uuhQgbnX07N+cc+OsxTKWXB812yLSeaSn+CoDTYEUU0=;
        b=DuD87OkclxbYfGE0OWdf50V4qtWDjgAKgwj48neoPJWwGAp+H/cGuSx2ZZpeSzW9M+
         ap8DsT9RNLPGkEvDppdLikFbTxRoIC05cjzqQCoRKi/El5Zc5SF0gZXXFCzdPUg6JWQR
         Usi3BlVopXYM5kVxI9CFjv9OmZV2Ma2zLuuizlnW5IrTlaRiwjZl+i47AHpR2az6DvbN
         +jhnvjVzcG9QllZWPULoptBuIgocGm6wnT6iB/9o2M2Cs8U89QJ7LVHirx9ceyrWPsFx
         YTZwRsuKY9HWdYU0D2TPEBnjipWNebQ1kG+SMk/j6CYDYngUyGw5P83UxdnfTNEMwtO4
         aPHA==
X-Gm-Message-State: AOJu0Yyhn6OF005G9mQHuyvSIH9YIFpi399ISiKLQJXrCHq668ajbuER
	c0HEnXL1CnXVBk640EF3XFhKcgsb6bc6wXvHdyVc76q0bHhbHlkGUIQg
X-Gm-Gg: Acq92OEqoaN7awmxdw0lpod3AxFpCK+gYi3715draX3rvmsGfOxs3xxospLIWM7lEPM
	inWHrYtbchDXsLxhbaCKqT/ZJ6Fp19AqplBeo3xvPxMc5zKFkPI9rwYWq1132kTOuQYXPMAtQFz
	FhXoVzLh2D7kPTUJ/DFtHtPz7+8zCpdSdvG29VBkzQAwA82+v5lekqlbDJxiSE+T0in7BJM5XVd
	Mv7B3dwcQq4P3mJIjbbv9Y5B5MEZIeAwucjD0xl+rM5MT8zhHyqHuSUzgnDH0mj0yo0w4ofy2Kw
	drpo6cS7FS9OcShbaS/dkGEVs5rv1D3v4fJMtJc2p9mcD9I+0gfC4Yejut6p7b8gMZYmOkKM3ey
	o3Lx4GEJnlmKl5po2kjoaF3oaEi0IOA4v9nAonCW5H5bfam8FTluYWR8iMxhk0gjmEE8sqK5csM
	HFO5iPMNHQBsjNddcUO0r0lO3YYgFpTerwZWIK+4W310PIl4vT+PfHMtWfi+R2UFGlif8823dio
	qOh
X-Received: by 2002:a05:600c:5296:b0:487:219e:42d with SMTP id 5b1f17b1804b1-48e706932d5mr140407925e9.11.1778497884730;
        Mon, 11 May 2026 04:11:24 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:24 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] riscv: dts: spacemit: k1-musepi-pro: enable USB 3 ports
Date: Mon, 11 May 2026 13:11:11 +0200
Message-ID: <20260511111116.1109643-5-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the DWC3 USB 3.0 controller, its associated combo_phy (USB 3 PHY)
and usbphy2 (USB 2 PHY) on the MusePi Pro board.

The board uses a VLI VL817 hub, providing four ports.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 7ebace0e46edb..9c90c2817ecb7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -54,6 +54,28 @@ reg_vcc_4v0: regulator-vcc-40v {
 		regulator-always-on;
 		vin-supply = <&reg_usb_vbus>;
 	};
+
+	reg_5v_vbus: regulator-5v-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "5V_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+		gpio = <&gpio K1_GPIO(79) GPIO_ACTIVE_HIGH>; /* USB3_PWREN */
+		enable-active-high;
+	};
+
+	reg_vcc5v_hub: regulator-vcc5v-hub {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V0_HUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>; /* HUB_PWREN */
+		enable-active-high;
+	};
 };
 
 &emmc {
@@ -66,6 +88,10 @@ &emmc {
 	status = "okay";
 };
 
+&combo_phy {
+	status = "okay";
+};
+
 &eth0 {
 	phy-handle = <&rgmii0>;
 	phy-mode = "rgmii-id";
@@ -295,3 +321,31 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_5v_vbus>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&reg_vcc5v_hub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_LOW>; /* HUB_RST */
+	};
+};
-- 
2.53.0

