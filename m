Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792961659;
	b=LS52MRvAUbA1ttWb9d2YpDldjYzyaEPO8zTZ85GW7vXtQsVkCAlfAV0fNLgbPgtZCouP
	 R/KseVudoOPpMxaWBRruHB43ovKfN/jwOctN4XiNVBNzv3PbHBndkoNkaak7I2kZu1kuh
	 cBEDBS5T3DWuAo7EiPBGWddR6yVkv/EuRatXDxzkuhm9R6IR4R5hV2g1Lv+jDRSSd23Fn
	 sN3UIYRTC0J34vWwLY3bFS7WQ8zRuINoEl39pc/hmbSy23PwBcabpaWA8p0IUu4jbgeEz
	 /M3Aq4eshYqxN/gJt7rvQCSeGqKYCeJ7SQjvJoUJVqW5DLWixCx5s21WtEnTbWI3ILA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792961659;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Bar:X-Rspamd-Report:X-Rspamd-Score:DKIM-Signature;
	bh=v5wUyzr+DyPRm9u7hQz3ABD0SUSnHt3iQOyUP/pLhMk=;
	b=jvNQHz0b2RMEk2rfqIobSwa0bXc3QYS7aNHxuOtvd9rd3CKy0gTenKVlFKqRF7nwDyfV
	 ZELg9YFUvdm1HSl6hSXKwdyR3wupTpoJ30kS+pu2MquYmYwi8RufiVJXmz3sok6mfMXfX
	 BTRx9w+egkADy5vWnewMHAbjtY/gPGPxVJigkOOUIDZ9buuYGeIFeNtCuz1Eg9s94rU/b
	 MDgDgnHOk2pAaQZMuFag3vuVQ8rYFdgTrKK2PYrlWUmhRjTH+7K8l6Rj/YLW5ruLAyZiE
	 L6HFHgMw03kDi5U4xrpv6S1eQYQMjFaRNfa3gdeI0mJZHdB2ERsHxamVEsQcpu1p5XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b="ph6/xYnr";
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E1606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 20:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 132E1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=ph6/xYnr
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 073EF61046
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 21:54:09 +0100 (CET)
Received: (qmail 25742 invoked by uid 990); 25 Oct 2026 20:54:08 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 25 Oct 2026 21:54:08 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leonard Lausen <leonard@lausen.nl>
Subject: [PATCH] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
Date: Sun, 25 Oct 2026 20:52:48 +0000
Message-ID: <20261025205339.14539-2-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
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
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999799) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=vZp7WOiFDniDGGPVB44BCfmjNLNKpcugqLlTg39BwmY=;
	b=ph6/xYnrrUxOCAl6qoRBXpbH0JRaj0GL9p69gDqEDI9uZ2+N1Pk/Qp5rXwxKv75BLb+K+wUfHc
	ttxdkc4ak71hq6vAdf1xp2R5T08BgrX0glv4CeV2jb0t2f1lm0I/4fmvP02wSc+OUdkucDW0gA6H
	HeopSLDqOk+IAHX1IOT6ODedzzQ4dc3sjSIWHAjIbsgeoewnx41tbkTAICtBp2kNXM9zxBad2wxT
	WV9Yvbpji2KSfrWcug4sTc65mEMra8Q7IunNLTpGfZ5UERBkqA05eGOYN6IPp3V16DFzc1x7uUtU
	aknRUf8TkdpoowDJgmysVGbkJBIpKRCtFF7n8FHdRK7bg/tMKRa8wysHhJGRxKvLDo5cOYbwvXQM
	kQUbewTE4MwAgvHSV2IVgfuhUAr5iOtq6T3TxJKAka1zVxb+sYkfaBhKbxL0yO43CNbkMk3vj6Kb
	HAOnPJNwHwUjKTSoaHr2nhrNhoebOp2YQE1631GDhGgR96vLPLYlzEBPd0m6WB8pfcSQpWkxjUvf
	duJcssmbBWWECTPTKSLqXikRAq02ksLD3LxW5eVbQmSTvJAqxY54rFBOXTGXzuMIYyh54sXk1owu
	3Bz07OAOrwyK9ldMTmLyrCnmFB8XxbNkfsay/z6O4mxqN1P/SBifh5BVBPJU55SjjtEhobB1EtvB
	k=

The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
RTL8822CS-based AC200. The SDIO controller is disabled and the module's
power sequence is not described, preventing the card from enumerating.

Enable the controller in four-bit SDR104 mode and connect its 3.3 V card
and 1.8 V I/O supplies. Describe the active-low reset on GPIO1_C2, the
200 ms power-on delay used by the vendor device tree, and the external
32.768 kHz clock from the HYM8563 RTC. Keep the card powered during
suspend as required by the rtw88 SDIO driver.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 3a305408fa16c..bfa18de1ae1af 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -23,6 +23,7 @@ aliases {
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
 		mmc0 = &sdmmc;
+		mmc1 = &sdio;
 	};
 
 	chosen {
@@ -212,6 +213,16 @@ vcc_3v3_s0: regulator-vcc-3v3-s0 {
 		vin-supply = <&vcc_3v3_s3>;
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&wifi_reg_on_h>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
@@ -855,6 +866,12 @@ pcie0_perstn: pcie0-perstn {
 		};
 	};
 
+	sdio-pwrseq {
+		wifi_reg_on_h: wifi-reg-on-h {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc0_pwren_h: sdmmc0-pwren-h {
 			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -890,6 +907,23 @@ &saradc {
 	status = "okay";
 };
 
+&sdio {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-sd-highspeed;
-- 
2.47.3

