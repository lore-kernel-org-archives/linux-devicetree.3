Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733771;
	b=dUKlnfNGxbIL1WLGa2x0jIwQJyMM3SnuVnXoAVNF0yZfF9DhwrchTFsCT9cFGpT1wLCf
	 iM/Hge4eOQutDXveYiztOLN6YQ5mOxOCCW/GDtvrAvFFWtL+0MuXQnfgByVrpAc4TP5GA
	 UK+5LanaQN/LV9cW3+M2cUahHvznIoMZLIn1kPTTNTYkA0i6gaB/w+TXbBEliNHyAZWuN
	 hWVv5RfyW+ZH0r5oNmmRu6J9HYH7R/t9FUS/9rb1GXG0J8yL1NoO3OAEkwDkVk2gu9DZ9
	 +SJqvSQBs9EVAey3TXMxoIH75S5QOKDB+XHx04N3qhhhwp9Y4zCfGChMXhURg8A/j2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jh545y0wDFW183BEmadwWulwvIdvWJn8yox2hQi9PPs=;
	b=hpuDx3zzN/R/6JzYHRjTJeqb8y5MQhaqCiDuKdn4CdXLTdIEShqZ1xITYeCFx0gm9ZBV
	 rC75Fh4IjMuMno4M+i+rtHKbxyKiJu4QTRxIQ1UMJGoc2bkQngdA51eJhgwFFH8vu7oUt
	 axSmpNy9nSDMul6XLlNzfCobtnK7fMHhYx81r0aZQJKJ+cFYUuBQU/bSxeJ2aXrT8jKk1
	 Fm5Px61cAHo4XnStOb/SbDBgw/DtcspSU76QH6IQDHAnqESbWhv3hsMXBw0OlvYDPHTeA
	 OdgZErXGUncc1WOulPsFEV8dv6Vy/0kPMf2li1J6XIC9WLmCuVkNaTNDvUDzah2w7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eb94u7ck;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56985606A319
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 05:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56985606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eb94u7ck
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3663e04e9a8so694883eec.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 22:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792733770; x=1793338570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jh545y0wDFW183BEmadwWulwvIdvWJn8yox2hQi9PPs=;
        b=eb94u7ckADLrQZXDNm9UpuaxIoZyHeFlxS0KhXYM2y03l5cn8YttkU6XouizJDSa/R
         KUhrwC1hRGUiYO9ddVCxpOM3pgFusdjyvikhcR4m0rgP6DnfbJ2Y/q8Mr0pNzf8YAkgl
         tZYu/M+fh8c2aqCywKzOc3+gItNLQYsx4CSs3WggSA0bINBc2xLB5Z49KkuoU70F87q3
         W8S6qj4X4EHKXkgvpK6xuQ4uVoiv/FIlN00ExLxt059gH20kQfiD+1VIIS5SinpRhgK5
         Tm9ZBhYFevD3qCr2WftxrboXFcdonzo62A8Nk3afnkMe6yzx4XCWPWLJqY1NlOvJXaTn
         LKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733770; x=1793338570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jh545y0wDFW183BEmadwWulwvIdvWJn8yox2hQi9PPs=;
        b=22BRznEJWCcuzT45YPEX05+pyRtR4+py4dljtQJulMFJNOwAKaTtvY/WGf6axB8hGz
         fPl7zll3q+XqtYE2oEgQjOtHZcBplOrlUBBdyANxTFeSE7ufWo2J6RLz5SgYQ7N5H51T
         dyO0EdXadK6AO87ZVWbOkZkK8aEtFfaOGG7+UUmyxQhfWK+OUm1aeqa5MkYtmANHXUrj
         8S2iFsJ/bpJOANPfygz4OfiMk7wTr8pVvYARM/RNpmPrujwb1zVI33FFC4V9iRKjyn/H
         JMyudWfL7bQ0Ef/Vd/U3G5Un+shQy6Q96mRDYKF/dnOTgHf3iJGi0nvXVb2Xubyhgn0r
         rmIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBlKedFkn3+D0ca8uGc1bCAOwfuK2xEoIwGFY32/WOtSIMJ87oyMgGUCj0agq/gyqGFfpjw+vqfm6a@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3D4eoXhhutMJOPuWcjlbz8JhoUEWELcP0zO9VZpAaSP5kVQfG
	RlOmNKbuoLukFvMR2kkfQKFHwotf1VyaMSyW/tE5sEktN0pU1uZXdjPa
X-Gm-Gg: AYBFou3TxWc/zPU4PskwB5TuKtWsWm43UiKKjaLf54AQhsv4Cb6Vgj0kl5U+y+QtcUD
	nxducKriTqvdMKYa68EnOBUWkxBWQoYS4zHwKD5q3OCm8WFmQ1mgFPePDGCJYgLcjrUoZINzsRk
	w2MAZYiUHOH0oSSZrW9ypmQeSy2DyiVv4TB6aPRYhryhZe7MkYcoBBYEP7inJiYx4WTJYQrBr1v
	3Afj0CwG7erNKB2UKvVzoz/Ug6ZDHi3cfwwzE6equS3PTtji7Jpj+nV+TPyP0kF5FHa/G92OTOm
	M0KoYk8kK2HaJDYDTwt+/YqDuA4NWY8sNC/BQWagFTCpKN/Klzh+nIuHoEJzfwkGM2dgNCjKtrw
	7LswN6L+fbHgYPewn2gAbm88+16IbcBFvZMCCfkoMHLStSaqyG2SbhQS6Vdq5NGEtSU6f9NlPQJ
	cDcPTc1hUpYZUsRaCRPV+jh0ogoH642Bt4rHHqGWq7XwV0Z2CgNyg7vgxNwheLtdhMNZiD0A7T/
	Zm/i7F5lqx/p90N7eKXTgeBC1AUIWvXiqS6CfoSdynky0vEknqCPQ==
X-Received: by 2002:a05:7300:d0a1:b0:368:74ca:1c5 with SMTP id 5a478bee46e88-369d9858845mr1511194eec.37.1792733770371;
        Thu, 22 Oct 2026 22:36:10 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9c15883sm3542480eec.3.2026.10.22.22.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 22:36:09 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v12 3/3] arm64: dts: rockchip: rk3568-photonicat: enable SGMII LAN port
Date: Fri, 23 Oct 2026 13:35:48 +0800
Message-ID: <20261023053548.1595033-4-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023053548.1595033-1-coiaprant@gmail.com>
References: <20261023053548.1595033-1-coiaprant@gmail.com>
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

The Ariaboard Photonicat has a Motorcomm YT8521SC Gigabit Ethernet PHY
connected to GMAC0 via XPCS SGMII.  Enable the necessary nodes to make
this port functional.

Enable the xpcs node, referencing combphy2 as the SerDes PHY.

The rockchip,sgmii-mac-sel property on combphy2 is not set here.  The
property is tri-state: when absent, the driver leaves the routing
unchanged.  If the bootloader has already routed combphy2 SGMII to
GMAC0, the link works without the explicit property.  A follow-up will
add rockchip,sgmii-mac-sel = <0> once the PHY binding lands in
linux-next, removing the dependency on the bootloader default.

RK3568 has three Combo PHYs that can carry SGMII; which one is wired
to the XPCS is a board-level choice, and Photonicat uses combphy2.

Add the mdio0 node with the YT8521SC PHY at address 3, including its
reset GPIO and LED configuration.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 12ae9159bea87..22cbfc95ff2ce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -261,9 +261,18 @@ &cpu3 {
 	cpu-supply = <&vdd_cpu>;
 };
 
-/* Motorcomm YT8521SC LAN port (require SGMII) */
+/* Motorcomm YT8521SC LAN port */
 &gmac0 {
-	status = "disabled";
+	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>;
+	assigned-clock-parents = <&clk_gmac0_xpcs_mii>;
+	managed = "in-band-status";
+	pcs-handle = <&xpcs>;
+	phy-handle = <&sgmii_phy>;
+	phy-mode = "sgmii";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_miim>;
+	status = "okay";
 };
 
 /* Motorcomm YT8521SC WAN port */
@@ -342,6 +351,35 @@ &i2s0_8ch {
 	status = "okay";
 };
 
+&mdio0 {
+	sgmii_phy: ethernet-phy@3 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x3>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PC6 GPIO_ACTIVE_LOW>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				default-state = "keep";
+			};
+		};
+	};
+};
+
 &mdio1 {
 	rgmii_phy: ethernet-phy@3 {
 		compatible = "ethernet-phy-ieee802.3-c22";
@@ -606,3 +644,8 @@ &xin32k {
 	pinctrl-names = "default";
 	pinctrl-0 = <&clk32k_out1>;
 };
+
+&xpcs {
+	phys = <&combphy2 PHY_TYPE_SGMII>;
+	status = "okay";
+};
-- 
2.47.3

