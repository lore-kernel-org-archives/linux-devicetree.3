Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088592;
	b=F/ldj5KgNIIXR6zu1eNJWe21kUZKxVwxUomjTdKqFEx66HpnF1z1110VT69GAs6xEwZD
	 e/Wi+LXRS96bMFGDmgL1bsIKsUKxsLL96mE3TWlsuhWAMvddIi8v5WZBpxLGDFWhtpn9/
	 2eNH6LYCgXLfYLpQ6ZB9Pep8PzoPdveTaL6uU7O16f3rq/GnGxaZZ9PxeGYqk3emXkGip
	 8f3KOAmlV9N3rdJh/uaoERtvgogqP5pQj7C+BBtPC4l2WWGPU9o6RVg6OrkECCg9QXRre
	 Zt6ui0gK02zxc4yrnbayP8tq4p2HQmjEtg/sC/4GIp0kQcA4zlymKuyxJle6XTbFneQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6pEeVNLOK1goU4AZirMd91GfBu+dH8WKElFw5XHafY0=;
	b=ywu7CW6tsYWPsVVR/qnOM4K/uUZ1vkyrCO0aXGgIzakV0TCNw7Y8yLkAh+QCbsEzNXsZ
	 x0GwR8UvLoCRBVHTvpXCcVPzj4d1b2Wz/kg/fC/ryI8lDsQ+JKFYjGNbSIX40DS1mvg0W
	 E5f9USKXVh8Usr2iVnoPQJqY/31FFWgk8mrubIVl6j/7DDmRHWMDeDKx1yQbq2WcdCPH2
	 0XgelwsqZHNHEjSueFjUXgjv1ZWXrxZcLBdFjErDkkdQzCTMVmjUb7YxOJJvw6IrofykH
	 J/7Vw7GL1LjdIikvinCHrODIEQjGYBpCBLpD6BFIB3k1Ea/b2V66XSJBfTOCm6rYhTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ct1QZQWc;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7763606A31B
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 08:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7763606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ct1QZQWc
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2002420a91.0
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 01:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088591; x=1793693391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pEeVNLOK1goU4AZirMd91GfBu+dH8WKElFw5XHafY0=;
        b=Ct1QZQWc9ppmj5Wrfc3ETf6E6ZnzQ1m6LtzKDFmh3IKW45ZvwCAmwSQwpv1C40uqer
         MZ9VVCI08vPHXEstpas+9kk698OcHVB45ZhslMAtgBL4ZNZEBCCuJr3XX/gVQhmAjO5f
         kDhiVbDPxbAmpVyNz8SBGQmNS00HAzP4MpMkotfxTCifk5aYiIfHsdhAIpc/Y5aKdd9M
         5HPEPcnxmnXhpjlRqUOaHgInHdYeHyNDBPWBsoNRfH35afQNV9CBlWKEP3ULKzUzX3V3
         O8+SFCJsR9B5ZQwpDxLdseA+3hXUhuriZEh94NduJqGVZEKjS1Uqa5G/xPpocRMbytsf
         ZLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088591; x=1793693391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pEeVNLOK1goU4AZirMd91GfBu+dH8WKElFw5XHafY0=;
        b=oMIM1ZT2UwgdUFoTD1JmhF3B81zsAhE5O5RQ8cb/5Ea5/+HSdZ7ZiVa9s5d4SvvX8q
         WJDKWyKt2rxkHSjlO5KekJ3nRkJTWmtjPnarWNKPQzHculkwuz/lXZFKuJnvmL/I6bBK
         cTlCsyf4LNNoKfVXWegTZlrlfH3Cu6KFXAX/mZ5NMFxpvxEDpiDAPW1ONCDke47ONSne
         Sb3HqugvGhRy2EDAV98V2sTgHKYGO4NjQ9+pyRDv4oTuI3rlGsq6DYkY6DhltLI9VYO4
         jMEB0t/4gbe8hb+3yZznilxr/W3UzWhMz6BjSg+iB3iiKq66lras90RPacMc6BDlScoC
         uHNw==
X-Forwarded-Encrypted: i=1; AKwUvBxJICnhLFqygrkhaOSM7hF10VfTbMR7Whjxx/kvbzWFJYsRYoEbf24rlzCzAp7+N//hwiCYhg3JLX4Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLM3hwAH0sp4fT52EedB3jjuiU4xQu9YWyxUaDnKGpQAcuA23tC
	XADHdDrLxrCydp1ejsihtnbmazAukx5ACb+iqZgdqYlQr0kYiZmCwGnf
X-Gm-Gg: AYBFou1QnQ/Tdo+UhS2J3HhliKDLu2PNxlMWYCFde0lWBMkQJv2PyBbZV87GPinno8v
	oh3IcCrQ/OX9dfwnFmH+ESMTgL7rqRspZE5rzII8WgfDj2pFqfb9uRR3UPjZTHRO6TvEc7+WhGA
	gstR8IDf9zIz8zm/ocv/Z7KMiTgIowmAMs1dUUlLVmF+/eNCjvP7dtDAFrSLSJH/Z9tjOS9GSUC
	CUhJCLJ8fzX+MxTpujQwl2kQVVbEJLOhNGwk/a9GUZD2Uqxb9bm8fIa05Aq6B6hELo4ZFaeyo8e
	v5WiCMIruIOgrqKOJxEE3YZdJQiCM3rt5zcDWGGk6I+P4sXgAV37yFV+Y6OxN+PcME9axbKks8k
	Cb72dcTEl2oCHlz4xtc0AqvhEXvTDcYHEDsfxgW7PIy1lP8151lqkTH5LK2ilCB7fzL5IAxiMiQ
	3y2UI9gMDnxkVFO+/OashFvrivA4+QVyuvRAjInb2kPTG+JBs12kiqlWySpGrrh5gsxGmG/VFly
	7o9fVJ8Jt+0VJ9yh79d0pdyoUdL2qQxwwHCGfw2erdCJDd4KOuiF7iwXMNc4kdJrtRWOD9buw==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr4906429a91.46.1793088591065;
        Tue, 27 Oct 2026 01:09:51 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:09:50 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
Date: Tue, 27 Oct 2026 16:07:54 +0800
Message-ID: <20261027080758.3990418-3-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a video bridge chip LT9611UXC
converting MIPI DSI to HDMI, which hasn't been added
in the dts, so we have no HDMI signal.

Add the 1V2 supply node for the chip and the HDMI connector node.
Enable the i2c port of the chip, the display controller and DSI port.
Add the pinctrl of LT9611UXC's RST and IRQ pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 104 ++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index ad60be5d5..c031f91a0 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -44,6 +44,18 @@ vreg_s4a_1p8: pm8150-s4 {
 		vin-supply = <&vph_pwr>;
 	};
 
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
 	vreg_s6c_0p88: smpc6-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s6c_0p88";
@@ -63,6 +75,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +400,70 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/a650_zap.mbn";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&vreg_bob>;
+
+		#sound-dai-cells = <1>;
+		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_pins>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	status = "okay";
+	vdda-supply = <&vreg_l9a_1p2>;
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p88>;
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;
@@ -392,6 +479,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -437,6 +528,19 @@ clk-pins {
 			drive-strength = <16>;
 		};
 	};
+
+	lt9611_pins: lt9611-default-state {
+		irq-pins {
+			pins = "gpio1";
+			function = "gpio";
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio2";
+			function = "gpio";
+		};
+	};
 };
 
 &uart12 {
-- 
2.47.3

