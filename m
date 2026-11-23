Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431245;
	b=kYBM2Mkb1ZrMAL22ZVx/l0QC5L25Yj4YZB+TDq2uFOi0fuIRNGCoTzgaBY8R1PKdqtjt
	 sb1aoyhMYnc2h4o8UtV7X48JFRPKeG6h6az0JS5RyZ9gF6jT8duZsWUYATN0UcHL0sjAZ
	 WaIxgNkO81hiL35X+wnIkOr/vG/JopFwdPsG0noQKHfTrivvDxHEytFzFweOUor3dF/Wd
	 rf6t4miZLAuu6QSZaBcEIKXNRRLnvCwUsOd+4w2uCHZcsTMa4XE4iexIcPxYug+2ldLtq
	 +XoGtfa1vaY8t3auBN+qS23Ar8boAu19ga0oGQFmprxVH1vA++KOOwRp7MGjbZ0YFQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uwx0NG3uKtnrDSAtqR9l2sngz111pr86ksoehzxrkGc=;
	b=L91wGu+giEzN1ip6g6YHjvP4RF3EK6USX//tNsMC7nOivioMAt/Mor9Dgf4yYhIyWZVf
	 MH813TZ394iqmKkiLs620I1+owy/Oy9jwE8bq9s7axgk3aWTjz7CpgW5crkO4fBRjoqLl
	 g6AediiqGkhxNKsfCRKNKIYI5cBUHBsr9j/2pkhG7x6zNtRNixwZR0vtGwn3ptubtPhvK
	 KoNOtJ3+McBnnVOCF6Y6Rr4N7IWtCC2bpkj9mW01OlH1vRiMkZq1sW1WQ+QXOCwSYqtqx
	 22KWm98Kx0LLUD5PlGzbPbQFPKEeC8eCZXgLbYVZ2gE+8aRt186WiegUkY0gBBuCw7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=G2+tVSP9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220DC606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220DC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=G2+tVSP9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so30168425e9.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795431243; x=1796036043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uwx0NG3uKtnrDSAtqR9l2sngz111pr86ksoehzxrkGc=;
        b=G2+tVSP9xudpwfR4/rSgSXEO2Ca/u7xZPqXpNCPi7aq1lkN4bdRNIKHZLuGo2V4uPm
         EP+hMWsPfsxzMkLcREnegGZy65EU0pLqdGhrYmqPngpB74IZ46fhN6PIlojC5TURP5wV
         Ybe9j5f/mCoSb0djBbaG3Cp9Cx6EVmU7eGgSF8MC5WfSXNoG8REPXnNrTu5mnAP0NHif
         C0HW817h/sz/kD7J2O03WbqvoPHvb8LSF+d0RGKQaselNK/twd4n1fZoMU+pfqWZQciy
         yrn4thK6lbsCByWpqXijke76XMMwaLBxAv6DvL1qtxBFLXmORcCAsQ9Yi9hfpm/QdiOD
         sUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431243; x=1796036043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uwx0NG3uKtnrDSAtqR9l2sngz111pr86ksoehzxrkGc=;
        b=S5tKl5Hcj8hgiXJCTELf4zs0L+faJm65Z3++V/6p9v/7CbunzlUJXrG0QaK37kiSqa
         RnyVJAEWpccxD7iJQJFX4W1HYc1vy2gkwMRyOYjM8bVlQ750PTd2qmrI8OVx4Ek2E7Js
         UK1o1WD44SzD0geXSdkR6UgBLmtkRqNxlwFK9y2RNshYgJSJmnds3BXWy1fEakTnBOx4
         Xtt72s106GEEw1Rsk6UfsPiECyBP1Dusymai4AFyJ0b8YUUSWKClFhxz8Gnr+b6PubLf
         vwSkSu1327WwItjBVVzI2YJeRGBsAsauh3pbxU79vYJzXZUyorEOTNhBTGg5v5K78tcA
         NY1A==
X-Forwarded-Encrypted: i=1; AL+hErGeGmIUd1FUYkobsD/MjvyNBbTAOg4nRBRF/L9E8pEbJXfIqJsgCkRkJaxXz8r3lzumGTp6qnn2BrrI@vger.kernel.org
X-Gm-Message-State: APuU4Z951O/Ovd3Q9SPpKct8d5iMpENnpFyNUmlpxarzjYvUI++sRM9N
	Qj6qNBuMndoQ0n0dR1xfYRelXBDO2vpCw1ktgvrDE6G+7Ji14X72I60f
X-Gm-Gg: AZFdTZd+YrqFAcZlfttR8WVDPFcrMHprsJYI9eT6sG69nscxfFzdohdeOMFQwABLBXj
	w6/zF1JF8Ey8RfCBol2PTnv08jw9XKanQ0572cRRqe/GBhhhj9+ZF9l10X8aea+o4rAwykz2++0
	sJFwCe7fkRX0TIl2b23cFzEFRg7QElTd6/alqxaJd4EDzzKErdAVBfb1h2gVXTsHlzX6oTaN942
	YEEI3eVZPtI3Vvhrh0KzzeDhjTynhXO9RfoslZcS/JHdrGo2kImVCkULncrQ7dXBzTg9yDHnwIh
	gvWIuvDNpIOHlQLK6C+AifA/sd+A4ImGNA6aT3ygyFSDOE26f9CLfvMpprheEd00ocs90WFrBqD
	jN+Yy2138QDhrZ6sLk6ex1mjSAaUwUhDj5E94wOLWYFP7qUNHzDIwknV6OZYbdb+Oz4AYf0GRgz
	3MQnPvw0V/mXJ86AGW5ooePtdpSQjBJJiOBJRgDIA+ay70ovA8WBUKMdDa6fpLnul2+elVcVlEl
	Xlzc2abHwcxn+mf0+zBH4cGT6/REspNgLtowVVSnEg8eU83ROzk+1THBoKfec53m3B3diaWvo1k
	c1uIZeFj2St+efoArhXyQlzyEdVAvsHqMFOU7AfAM4BtqmmSIQVRACO8b9zIT2L7DiEjKO4gfjH
	eCs1DWmAqlKc0x76fVJj621zpDFPC3iiBHt0=
X-Received: by 2002:a05:600c:5395:b0:4b1:4017:c4f4 with SMTP id 5b1f17b1804b1-4bb8880ca2fmr222661655e9.20.1795431243355;
        Mon, 23 Nov 2026 02:54:03 -0800 (PST)
Received: from nixos.speedport.ip (p200300facf0c97e239628f9633b68e4c.dip0.t-ipconnect.de. [2003:fa:cf0c:97e2:3962:8f96:33b6:8e4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399d52sm332544245e9.6.2026.11.23.02.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:54:02 -0800 (PST)
From: Cenk Uluisik <cenk.uluisik@googlemail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: Enable Wi-Fi and Bluetooth on Orange Pi 5B
Date: Mon, 23 Nov 2026 11:53:58 +0100
Message-ID: <20261123105358.640680-1-cenk.uluisik@googlemail.com>
X-Mailer: git-send-email 2.56.0
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

The Orange Pi 5B carries an AP6275P module: a BCM43752 Wi-Fi chip on
PCIe plus a companion Bluetooth chip on UART9.

Describe the Wi-Fi side below the pcie2x1l2 controller. The module's
WL_REG_ON line (GPIO0_PD0) is modelled as a fixed regulator and used
as the PCIe 3.3V supply, and the PCIe reset line (GPIO3_PD1) gets its
pinctrl group.

Describe the Bluetooth side on UART9 with hardware flow control.
GPIO3_PA6 drives BT_REG_ON, GPIO0_PC6 is BT_WAKE, GPIO0_PC5 is the
host wake interrupt, and the 32.768 kHz LPO clock comes from the
hym8563 RTC.

The plain Orange Pi 5 has no wireless module, so keep these nodes in
the 5B device tree and leave rk3588s-orangepi-5-5b.dtsi shared with
it untouched.

Signed-off-by: Cenk Uluisik <cenk.uluisik@googlemail.com>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
index 8af174777..384a70e4f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dts
@@ -12,8 +12,96 @@ aliases {
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
 	};
+
+	vcc3v3_wifi: regulator-vcc3v3-wifi {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PD0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on>;
+		regulator-name = "vcc3v3_wifi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+};
+
+&pcie2x1l2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_2_rst>;
+	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_wifi>;
+	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x400000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x40 0x4f>;
+
+		wifi: wifi@0,0 {
+			compatible = "pci14e4,449d";
+			reg = <0x410000 0 0 0 0>;
+			clocks = <&hym8563>;
+			clock-names = "lpo";
+		};
+	};
+};
+
+&pinctrl {
+	bluetooth {
+		bt_reset_pin: bt-reset-pin {
+			rockchip,pins = <3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_pin: bt-wake-pin {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		bt_wake_host_irq: bt-wake-host-irq {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+
+	pcie {
+		pcie2_2_rst: pcie2-2-rst {
+			rockchip,pins = <3 RK_PD1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wlan {
+		wifi_reg_on: wifi-reg-on {
+			rockchip,pins = <0 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &sdhci {
 	status = "okay";
 };
+
+&uart9 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart9m2_xfer &uart9m2_ctsn &uart9m2_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		interrupt-names = "host-wakeup";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_HIGH>;
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_wake_host_irq &bt_wake_pin &bt_reset_pin>;
+		shutdown-gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
+};
-- 
2.56.0

