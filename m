Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729497;
	b=nSym6r6pc7nts+DjiHhBF/9nHlHEmVAcrJpHIkc155IUPyvOVCapAYiury3Z0MEGmfkB
	 bArcO8CqapR4sAWkb83BvARe99TfKETwZcHq3KrCwbGu+T6c8uFTeJs5HQkCVXvqgs9g8
	 QTlWbLQ8RSlIbFuVqk9L5b1wrOrX2qcHMeIVciwAGssNgvBZqpfdBAiwGNRWbrJlW+UlQ
	 gYqjBDSbAJroSgx3CJmZK+igJDU7OJxsZhgok8NhGBiqje05tGu5xYuKe6vIzqACDQGAy
	 E3BAZNlSV//5IxXGdZzdXx+tEynOHFaw4UMYTy45F2ZXVH/MI8JcFmgkUZK21rVe1iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
	b=ZmGZCQCOAoEPWzkHGVPQ8SN13V0aqfsS/nuaoSqtFc3x9vwpcZBJpxg4mzwyG5QZf/Qg
	 VNIkQDAMPh2B34iJdE2ccNQ8W2WB3Wnp5NObXSU7a0W25bhK7vDYb8J2X4yJRXW5CG3qF
	 sTwdg6gEar1AR1lsOQjM+qUPHllLvu/W916FXiSQUJXpais64CKh51KeCJ1Dom9kPsNxg
	 5IpwjldTL9jk+Y5PfdEKu1Z4FsjDBDwNq7Cnl7kB3pPx+hV4ldjMcJpw3eL0Tl3F+Da8T
	 uMDLSa7iTQp4tJ729LM1C2+Yfx0OlF2jrKJ1sASwNRg7cFlF708hrcq648lNS92nmKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=if2OflbX;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873A5606A6AD
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 21:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 873A5606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=if2OflbX
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4aa5833c263so7192151f8f.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 13:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729496; x=1796334296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=if2OflbXmuyYRo69Gt8pGtCfSeU63GKVpVfStzqrfGvxVvesiVnUccGjkhxUvJqe8E
         xWXuXZU+N86i3ohOWcmahDecGw7GQu9W/xU4+vtJpzOJKX5B4QqNFWYkmvK0dPA6XBnM
         xsNNi4w5DxRKP4/Xav9NwhrxEVUjGktCWkbzcH357qbjmRDKa3H9G0zETVsvWBlvUHII
         yp1lZWZEUEmB7nb10lR5Xoe4d0yykkVuXHL9vk1ZB8iSL7lllcWpRPdepvmFzLw/3zBm
         Qlsnr16KpXz90H2gVAL5W+HR+EMs4lxq1It5Jn2JK/nH54wEpgSe//gfDWfOzuWggbU+
         w2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729496; x=1796334296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rgoIgw35YcjRzBDNQLX8AgVyjJr3fxJKdB7QZhfiyn4=;
        b=MwChVUMsplj8SO59gKR5FUmLXlPXNK+Rf+HZPIu1Y9lESSSEMYvS9Rx5pd6ahsC32T
         T6WzSK5nOQSziK1V2mCS/y7mJR2qIRrWA8K8WN37JPtkQaIT92FcKrNqIMNCWBOkjWnm
         0UTRXtzpA50OulxDxMrJsFLoj3btPSfYI6h3vRpHhSURhPilaU4xAzpWO6WuscDC0+dp
         UFelcJ+aljOkOeX+d5U6A7H12Eq7DVywYaSdBBMLbsFUHYeJiIye0HGun+CU4RKgtZOh
         UdRn1V9TKX3ecFgC90BVRx4cyO00vysTnrdCH1/42VceQRCW6oV227MdvSJY1114Dua7
         bQ3w==
X-Forwarded-Encrypted: i=1; AL+hErGB+IfIL6IJOfmdUsJglXj73tXi/G0DblMphmxtA705NX8el5lZPw6LxjiiUbfgtqMlWcnjUlKZ9qA+@vger.kernel.org
X-Gm-Message-State: APuU4Z9DTan6PLvUxm7LohrfILNOXGRiYzBD5nlNk0ImYr3YDdrUHjaz
	IEM0P2rR7gUgJ9exkkO+wXNLQBjd+8LM0rnFrZhx2Zl3y0wCyJjeD/GJ
X-Gm-Gg: AZFdTZdsAJqs2mefaFkjed5I3ahMM89tY9uHFVgkvcIPKMlCam/zHZc7bW4ikq+UbmD
	UvDju3qHXKS8TUPynZV43XLUps8hURG0/WzARK/WztpxCp00OkyD2q3glZSAKcdGio7RqXu7QvF
	fmJmnTxLI4KSeGphbtmkN5ty4bXJHf8Iew0zsCbD+BzDnJ6AVWg0AhMixUrsaZW27hA2c3/cKVs
	qutrYZiwpbCzurcRwpjDpnd3kbe4bbYPQuyO12Knor69aZS8CE8FL1Q3FbdDHlVTxkZWl41Kz+r
	VPRfLqryoC8bVYEthpVJ1gVfRv6MR0Fej09BGzjYOk02IxsKts7THT5yLH23p6NDvo8rbozK6pd
	HsXaDUYy6arojDOGrwclaZGBTeZtkVkZca9z/chIuL7QrVCE/gbfpqD0Qa6vC0SQDxlUbXejlwb
	cSRlj0BgF/J0TBosbuwbZiYP2Ii+fOHQjvhBx5O2v8GDRZkoA2DDsQEpAt9HJkV3qC/PBo1Z+Ey
	I4yJw52Qocuq3kPBa7mO6HiDIyPAZKXrG8taFRsaKijQIxsJeem0FwvgcoMwGDylGxepMi/+EMg
	QUPabA/nR6qh4gmJFeGoX8AJeeY6UfXY+q7DuQ+tGIj9NPIiFJx+LynrM9NYG3xR5rOK3KlitCT
	E5hcJzztgJPuhnq5UsK/J8e/EXZY9rzCfuQ8itAxWt0gcR2a4FZf7H9UyjlnetsvdUiSuDOvtvs
	FvL/PrXMlNOmsxE5nv5Lr1pje9FE+isnIRgLsrCcwDLGV3EKexi6I4o3eMesogyflc//i8PA1T7
	VBQH9WvTPutR9s9SEFxTn/E16vEd/aOsMQUMjPFPg==
X-Received: by 2002:a5d:5846:0:b0:4a6:4ac6:d950 with SMTP id ffacd0b85a97d-4abb400ae95mr45098156f8f.39.1795729495913;
        Thu, 26 Nov 2026 13:44:55 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:54 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: allwinner: h616: Enable HDMI on several boards
Date: Thu, 26 Nov 2026 22:44:33 +0100
Message-ID: <20261126214433.3562326-12-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that H616 display pipeline is added, enable HDMI on several boards.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../dts/allwinner/sun50i-h313-tanix-tx1.dts   | 30 +++++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero.dtsi  | 25 ++++++++++++++++
 .../allwinner/sun50i-h616-orangepi-zero2.dts  |  5 ++++
 .../dts/allwinner/sun50i-h616-x96-mate.dts    | 30 +++++++++++++++++++
 .../allwinner/sun50i-h618-orangepi-zero3.dts  |  5 ++++
 .../sun50i-h618-transpeed-8k618-t.dts         | 30 +++++++++++++++++++
 .../sun50i-h618-yuzukihd-chameleon.dts        | 30 +++++++++++++++++++
 7 files changed, 155 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
index 7906b79c0389..c5226a427eaa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dts
@@ -26,6 +26,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -75,6 +86,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -84,6 +99,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -178,6 +204,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
index 0d3e761f6466..51c8ebdbdc88 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero.dtsi
@@ -22,6 +22,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -64,6 +75,10 @@ &codec {
 	status = "okay";
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
@@ -81,6 +96,12 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -113,6 +134,10 @@ flash@0 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index 90c25e12e189..0f25b043e020 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -28,6 +28,11 @@ &gpu {
 	mali-supply = <&reg_dcdcc>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_dcdce>;
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
index 085f3e4e8eaa..568de6f57015 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dts
@@ -23,6 +23,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -42,6 +53,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdca>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -55,6 +70,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_bldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -202,6 +228,10 @@ sw {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
index c51d4d9120de..4a1754eeb0b6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts
@@ -31,6 +31,11 @@ &gpu {
 	mali-supply = <&reg_dcdc1>;
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
 &mmc0 {
 	/*
 	 * The schematic shows the card detect pin wired up to PF6, via an
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
index efe0faa252f5..2f09a5cabed5 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the DC input */
 		compatible = "regulator-fixed";
@@ -61,6 +72,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -74,6 +89,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 };
@@ -177,6 +203,10 @@ &pio {
 	vcc-pi-supply = <&reg_dldo1>;
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index 9e275f0217ec..11b087dad0c1 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -24,6 +24,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	reg_vcc5v: vcc5v {
 		/* board wide 5V supply directly from the USB-C socket */
 		compatible = "regulator-fixed";
@@ -52,6 +63,10 @@ &cpu0 {
 	cpu-supply = <&reg_dcdc2>;
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -73,6 +88,17 @@ &gpu {
 	status = "okay";
 };
 
+&hdmi {
+	hvcc-supply = <&reg_aldo1>;
+	status = "okay";
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
@@ -187,6 +213,10 @@ reg_dcdc3: dcdc3 {
 	};
 };
 
+&tcon_tv0 {
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_ph_pins>;
-- 
2.43.0

