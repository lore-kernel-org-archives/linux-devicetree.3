Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A73388E5E
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436141; cv=none; b=EEuFvYxgPvIgDWSolu+9jFzIW/KKDysdd588UXai+EO/soVzZo/e6PcvkZ82vuaYD+loDcyauq+a8CSBx7IlFpkJR58ugRIEMGyjVngK5VVAGfZAyRzDtgwhTubJfsbK9akE5EPAcf3vyAr2z/FSY3P+/zZ3GkdNnbZG+mqpmKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436141; c=relaxed/simple;
	bh=c5u3tQmKQRP5OqvEAVk1Zbo39EXKJ4EsRIzIvILoCK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XPA3FSsf2I/niwpCYHrG293CaqcddtT/Pah8uUC6bwP7OboZKVkwbzAgYwHq2ypXpZ/OBon0sLbFNpWBwYPzi3WaYzzTHIB1tiP4HwZA3CLxP3f74uT5bRPNkAIJTdX6buXKDXfZxW62NqAy9dbdrcjxWrRJ/qrH0QKqRUyAP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=b6ik6n1V; arc=none smtp.client-ip=209.85.161.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="b6ik6n1V"
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-67e0d3f288aso7369947eaf.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436138; x=1778040938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x93/l1w2YfvuQmLZ4l2/nRL+2Tpf+p0vaW0AsgHcapU=;
        b=b6ik6n1VuHTDSr7xREnr+4+8cWseezKJuWV/Y/NHDyePKuGoCqOfVyGsKYB3xVzfQj
         0ElA8lJvgFpulRm2dDOcMP/d032OjJ/Ns18mgOJP5vkIRjw6zDxkzO33BsiWOpkiHzkB
         eeKErA5mkDrty9bDaTJeIXbbrMnQYXebN9tHinosJbkhGf5c76r2bPCeOraOLGJnKPW3
         BdcWU/upizbcTIn6BjNx6fhwbw3zQYHk/W/DJRhu8S6R74ZEO2qnae2YaE+pplwDpkT+
         k2yUBpO5Iyj5tAwuIVUjfre2lBlBeSJBgjZ5UDAE9Eg5lofPBWmajNjzQi+6pnBbTVwT
         Ck4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436138; x=1778040938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x93/l1w2YfvuQmLZ4l2/nRL+2Tpf+p0vaW0AsgHcapU=;
        b=jqgbON9OB/OVEK456e/DDcJef5gnGp/FqjY9/8pYrXE4+ashPtoymqEYoghQRvWXBm
         KOgPbCq3rcb2zcPv+HUBWiAnS3LRM6rBy6iFe5NhxqiejGxyXY/X4D3OgCJGonc6VzMt
         JREZKJDOK94wvrlE9gqagEbX+NtGw9FN33bF5OD2ydq55m4Ts4kYB397oza0bgNkXgkM
         2busRDfelsOKqV36m4rpsA3jEoTO5TftY5jpVsW0xZqHChWXQOQXAW/mRNSxY3JV8YED
         lilb88b7+JIMPSvKiaOLIuvJlINWY+f2H7sFmS4I91trNQ7x5j4la1tv35QEz9Dr9oXo
         5/eA==
X-Forwarded-Encrypted: i=1; AFNElJ/eSFoddJTrhxm4iWCufhzjKDq/+2R+pg0WTZOvk38Ofr0uXuwizvJoP0QLseEJdc9Jd3eLOM9ZpmMx@vger.kernel.org
X-Gm-Message-State: AOJu0YwoCybMhWLfiU67m3CMIMQHH5tBqxgqKI2Bbicdft202B87RiuB
	4MFFB603OpWNgHRMO6rStGy+TdvKKmmOtcacfCMaT3Vtl/6UDER8sVrGBvxfzZRH5YXGteEV+wk
	0+3vMmcfw3xCg8Iif63LyqDGB6fiuaFuY77vf
X-Gm-Gg: AeBDievRdo6PIg1OQf3k2VAfZctisaABQwiz1XeTE1pBKWnQsUcpXSILxU5k8a8g4br
	LpVs7R58bjL+yiatA2CJBvv9U9M1MuRriVAxmx+ES7rIvahmh5JZpnpkafetB0Wfjq2lD9ek0Sm
	KC3mqe7Y6lTHprP+jPz/C0r8exw33RzXzPqeNfsWUIMrkRlmx4ek6PSx4aJwMA5EQ7QKCYUGbp/
	jBPptmEOHh/m3yOrTGkD92it0egCswY49sFsypmrAL8Rwzeu+ZriK16umHVkOS6JOVPOUWQtbjB
	ruq1+nCwk7L8DajEBXloiUG0xj90aV5kwr+Bkjw6x7+Gs9jOXyrptH0Mqh6B8ZiNkkYWz/ovmB4
	owlti20qQjL2GG6qo5OpblMatRJe7Ocsad3dHayS1pk0zGOc7sLeWqXU=
X-Received: by 2002:a05:6820:2908:b0:694:92fe:54f1 with SMTP id 006d021491bc7-6966854819amr1134201eaf.54.1777436138476;
        Tue, 28 Apr 2026 21:15:38 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:38 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH 3/3] arm64: dts: rockchip: orangepi-5-pro: Add LT8711UXD DP-to-HDMI bridge
Date: Tue, 28 Apr 2026 23:15:28 -0500
Message-ID: <20260429041528.558254-4-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429041528.558254-1-dennis@ausil.us>
References: <20260429041528.558254-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wire up the second HDMI port on the Orange Pi 5 Pro. It uses a Lontium
LT8711UXD high performance two lane Type-C/DP1.4 to HDMI2.0 converter,
designed to connect a USB Type-C source or a DP1.4 source to an HDMI2.0
sink. The bridge can be controlled via i2c or run as an autonomous device.

The Orange Pi 5 Pro has i2c wired up to i2c6, however there are 10k
resistors left off of R9 and R17 to enable MODE_SEL, and R27 for
I2C_ADDR resulting in MODE_SEL going to GND and the bridge let in
autonomous mode. As shipped I verified that the bridge does not show up
on the i2c bus.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 88 ++++++++++++++++++-
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
index 895d954a9f23..67363709c4ca 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts
@@ -14,6 +14,44 @@ aliases {
 		mmc2 = &sdio;
 	};
 
+	hdmi1-con {
+		compatible = "hdmi-connector";
+		label = "HDMI1 OUT";
+		type = "a";
+
+		port {
+			hdmi1_con_in: endpoint {
+				remote-endpoint = <&lt8711uxd_out>;
+			};
+		};
+	};
+
+	hdmi-bridge {
+		compatible = "lontium,lt8711uxd";
+		vdd-supply = <&vcc3v3_dp>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt8711uxd_in: endpoint {
+					remote-endpoint = <&dp0_out_con>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lt8711uxd_out: endpoint {
+					remote-endpoint = <&hdmi1_con_in>;
+				};
+			};
+		};
+	};
+
 	analog-sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
@@ -72,6 +110,19 @@ fan: pwm-fan {
 		pwms = <&pwm2 0 20000000 0>;
 	};
 
+	vcc3v3_dp: regulator-vcc3v3-dp {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio3 RK_PC2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dp_bridge_en>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "vcc3v3_dp";
+		regulator-always-on;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
 	vcc3v3_eth: regulator-vcc3v3-eth {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -116,6 +167,24 @@ typea_con: usb-a-connector {
 	};
 };
 
+&dp0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dp0m0_pins>;
+	status = "okay";
+};
+
+&dp0_in {
+	dp0_in_vp1: endpoint {
+		remote-endpoint = <&vp1_out_dp0>;
+	};
+};
+
+&dp0_out {
+	dp0_out_con: endpoint {
+		remote-endpoint = <&lt8711uxd_in>;
+	};
+};
+
 &i2c1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c1m4_xfer>;
@@ -217,6 +286,12 @@ bt_wake_host_irq: bt-wake-host-irq {
 		};
 	};
 
+	dp {
+		dp_bridge_en: dp-bridge-en {
+			rockchip,pins = <3 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
 	ethernet {
 		ethernet_en: ethernet-en {
 			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
@@ -350,9 +425,16 @@ &usb_host0_xhci {
 
 &usbdp_phy0 {
 	/*
-	 * The USB3 Type-A host connector is wired to PHY lanes 2/3. Lanes 0/1
-	 * are connected to the LT8711UXD DP-to-HDMI bridge on the board.
-	 * dp-lane-mux routes USB3 SuperSpeed to the correct lanes.
+	 * USBDP PHY0 is wired to a USB3 Type-A host connector via lanes 2/3.
+	 * Additionally lanes 0/1 and the aux channel are wired to the
+	 * Lontium LT8711UXD DP-to-HDMI bridge feeding the HDMI1 connector.
 	 */
 	rockchip,dp-lane-mux = <0 1>;
 };
+
+&vp1 {
+	vp1_out_dp0: endpoint@a {
+		reg = <ROCKCHIP_VOP2_EP_DP0>;
+		remote-endpoint = <&dp0_in_vp1>;
+	};
+};
-- 
2.54.0

