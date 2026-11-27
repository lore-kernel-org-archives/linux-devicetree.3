Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795767828;
	b=n01CJYnkiyCbaK0GXkYqdn6KpQ0sQCsZXHLG/8qBd81Ln4EQLZGMwuFVsXCVcntXwtzV
	 tAuVKKnIMoViG56keOz2FredlLOkX2B21FhwdR/FcX2Nf6FEvPRpN5+qBKC6omodpssvi
	 FsFzLCdP6Eq7oasIy4DDhp/bS2XOn9id2F/UFkbRXogdJ4QUTrEcDEOE2tWkEbfSo3pqo
	 csD1wutblYxa42L52tnz5Q1iXHpGU/p+miSVIkdejToIlItk9mXzhIvOIy+fZEhBLhRMa
	 f7ipjZ65Kq1q0mxLLw/tecR1RPVeqruCMrWI09oTy9pJku100aZEX9NNCLI2FU0thSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767828;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cv4+1Xfr839+h7qcIeYZ/jNwJfWC9c1igxZwvPTAJ+0=;
	b=wWp3xZ2UgPlarMLWHQQGxlykrD2jNI4yWlFM03L+SP9/WvQznV/c58nu2kphanPbfpLb
	 /yuL2EtC2JmJluq2mcI/TAwbVmyQceJEOyi1amt5t8QV98JoWHjE9vhoGryk4OR1iPF3h
	 vWSVkIO8jXYO2J0WPDQHRMiPFxHbwhX1rnvkXIZgSLLI0ad+jjEjxmgruQygGL42n5PAm
	 k0PVxoT/EbPjZBqR88zqVZngmg/OObI7wgrvc4Ve6gkj4wZwAj3zkp18ltHD8QtHIcJif
	 NhKNmgvuJC6Iy7yulVGiHuhaC8tVXEwuUW2vc/bzMBsVM4aeOOvRQPGX9gG8c5TLcNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=TFexu2oi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U4SptANc;
	arc=none smtp.remote-ip=103.168.172.140
Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74EE606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 08:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A74EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=TFexu2oi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U4SptANc
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id A582C1380D0A
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:23:46 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 27 Nov 2026 03:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1795767826; x=1795775026; bh=Cv4+1Xfr83
	9+h7qcIeYZ/jNwJfWC9c1igxZwvPTAJ+0=; b=TFexu2oiLqPXqW6iJnEDF8gtd7
	3hkqAn1fPh+i5sLJzaBXdfXqgmjT+X7E9j/CvIJ6gQSzP2oQ1mLcKXorNxKL4L++
	C4IQ7GKDIHWuJ4lM5ek5QEtrEPabJN/xnB0rZn2PGlg4vAzvfkvD5cY43q1osAMo
	F1NKkYcTgrFi7qhvB03NRNQHnpHrUjUkhTrwFDuxk+ihhca4RghR7N9H2XMk33vY
	tons1AJ8Tvi+Rqdsh79CvGehvTFsqYpTpKMKUwreXILIPRBoDZQuUvQCa+coVbo5
	ytzW267w8AcOkvlMlTXVBvmG6gI7//jbIuml0cP4FijqJ5dsjxegXK0lK+mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795767826; x=1795775026; bh=Cv4+1Xfr839+h7qcIeYZ/jNwJfWC9c1igxZ
	wvPTAJ+0=; b=U4SptANclt5YgEsq+wm79HWhRnldb0IA8LPcVX09ywri2l05xIf
	SPSiyGGfCGwV7cVOGl+cZGsh6QMix+64raT0DUyY1EKdZamR2yodGR8+Xi1kmgur
	BZVlUb/GG1psGYRNh0adLwr4WAUtLq1az02W1XzZelAtDbQRV11GXSbFs6NS+dQ8
	zlYJNy8R/riqSfJvD4rFYSF26bN7sgMTI0W4kQUU0bbYCX2QyB4k41FHM4DdBgZf
	WpX2VoZ7LnZW7WdBo9IgbVISQgyY/rr2pgtz/vwmzZf14robRBcgAOk1h275boRa
	qBZLhpcQJWmzV0SgjUdETJh34FhW6Ux0SRQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795767826; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:fyk7VclBDegeut2eVzImay8K7jSZXhpC3Q0iT2faaRvzkB+
	RHCPuv1bptDqFBLJZKJcI8qypF5wbV1yEa0tlhsbEA2nIyFP1xEqkEvy4hv1RsOk
	0dQumunK7dtSBLsXCFYxuxeWmTNotgu1xwDiWNSWMNolpuWPiRATeU7SuvezXoNy
	FWWWPoopOD9yDVvDsiaEWatqsUBEXh9lOUsa7V/BEkaoy7LLo1lFrZ+v2ouewxhd
	uMt6OCQZJd5vZcruXUoojcWIA0XlB0IYCfs4UfFdkSs6Dj6Smw7FT+enR2ojyNwV
	vK7VuyhJ6Gxor+TPOdy4/Ej5e3nk2b2/6DFHHdQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:rygoyZPL1u+UVUmkNGGaiiqQfcN/RqjD9KBaruIY4Fg=:Rn3DoyUg+bNZtxOMK4Zjb7TItUkllrEEKyE8Mqlia8o=;
X-ME-Sender: <xms:Ej4Jaw3ySWLz6lqp5GFvyQwH_27JnqMUSdvWK24V_e22x0Awom_lXw>
    <xme:Ej4Ja3qkuyrNP8JefuP5l7oFeo1RgFc4p3253ZQ32nXsczSiHKW5MHUi-OscVYqO3
    Z1RW2k9JVoRmR2lBJ4OBAy4tfrICvU09mirqMy2OyjLLXMk9RLMyPpq>
X-ME-Received: <xmr:Ej4Ja9XcyKeHHJTgtuicRsM2JZKbSDtCqkQO62VQ-8d4h6-ixj-veZPwC9377SaNJWFuDgvd>
X-ME-Proxy-Cause: dmFkZTGjqEJdCCdkToT1ymEPOxN7ZB6H8+j3Xlolm6YU09DyG4QPfDv+eCsmWTDd2bQ4BT
    E8yhE1qvj70nkFTa/nN0PxFDePnjYXlndXvEGJegnV0j8GUf/JjHauMzxhtxqEynQS+fxI
    eOPd9cOsc3bUwvRSDkoPJLz78gey0XShzEjfmDbl+py4vPIoq2fzlgjhguILc5aii/Mg//
    Eiz/xQJx+3CPYbjrOkPO/X28szkIwdeVlJwbDF6EJuJ9nTb5I72UHcZNvHREPUCY4Pb8Dp
    Yjq+STILo7DVsNKtOgm7Q8npT1ZYWUyUzNtF3ZnyR1EPbShfYkmqCmasmanXJNIIwVsVU+
    iLhLkABVUa3DGWpzvSXu40TZHQ9mtUfRvFDsTvCWdyB5s3yFVqcZ5Fmzf+YnTAivMX6Saz
    +3aZLLV8pjRm6wLCQUflKxMtWTgPqC927FPLw+KElRlAiMuvHq7e+4wBfvWwXYdUjhIz5P
    yEB1RIilec+63Givv3DD34Za2tFzof9ozHvc9Uz0O8f8FQooOQsF2mul9AR9HueW1dy50w
    NXQar2IVf+Zj1klAd94Tu+xefgQmue3UU0MnibtOeVEjT7un63DnWF/YnvPXnnBw2vsu5q
    K5fNSh5/l3saF3WKQQ7qpdNfT6/eXxgVvtNLAkKTPga0KsjfVyh/tRI8oNKQ
X-ME-Proxy: <xmx:Ej4JawpmvmHBZiziakneIzj77V8vcW2CgZjKB5-qhgLVqzwA0mP6GQ>
    <xmx:Ej4Ja0BGFMdRcImb25-Bt2q1rsED1EE-_N61H_BIPg8mkQl8g0gMJA>
    <xmx:Ej4Ja8jgwRaIFreKyx2QdgqTxhCaN5bBxIbW86OnLiJlgvxDGGvsmw>
    <xmx:Ej4JaybOoBzIl07ZqOXDpqAUXT4pA0rJ9zyGYpZeXZOq6BX8pqYcSA>
    <xmx:Ej4JawkxbLTSSwHpnadAOiLKV0HsLTxMtr__Z2xkQf9hLjLoK_60Nkz3>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Nov 2026 03:23:43 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Add Bluetooth to ArmSoM CM5
Date: Fri, 27 Nov 2026 21:23:40 +1300
Message-ID: <20261127082340.644739-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
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

The CM5's BCM43752 (BW3752-50B1) has its Wi-Fi described, but uart4
has no Bluetooth child, so hci_uart never probes it.

Add it as wired on the module schematic, with the HYM8563 32.768 kHz
output as LPO. The binding has no BCM43752 compatible, so use
brcm,bcm43438-bt like rk3568-9tripod-x3568-v4.

Tested on a CM5-IO: the firmware loads and a scan finds devices.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
index 71ea11e1f8ce..667e37100637 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
@@ -548,6 +548,22 @@ &uart4 {
 	pinctrl-names = "default";
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB1 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wakeup";
+		max-speed = <1500000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_host_wake_h &bt_reg_on_h &bt_wake_h>;
+		shutdown-gpios = <&gpio1 RK_PC7 GPIO_ACTIVE_HIGH>;
+		vbat-supply = <&vcc_3v3_s3>;
+		vddio-supply = <&vcc_1v8_s3>;
+	};
 };
 
 &pinctrl {
@@ -557,6 +573,20 @@ hym8563_int: hym8563-int {
 		};
 	};
 
+	wireless-bluetooth {
+		bt_host_wake_h: bt-host-wake-h {
+			rockchip,pins = <0 RK_PB1 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		bt_reg_on_h: bt-reg-on-h {
+			rockchip,pins = <1 RK_PC7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_h: bt-wake-h {
+			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wireless-wlan {
 		/* GPIO1 PC6 - WiFi power enable / reset (sdio_pwrseq) */
 		wifi_reg_on: wifi-reg-on {
-- 
2.43.0

