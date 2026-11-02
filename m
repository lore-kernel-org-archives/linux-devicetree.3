Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641521;
	b=B4H1gQAVnapqe4oFyC1igWztSb2cGonqpsKk1XktwmKxYBBRs3gc2IBxb8ZiFs+W4uy5
	 KMwJO1SUwRqiMawMF/IorfqTwfhcUdLKChKSsgSR2BpfchfNAog6a+SzkGVuHqCLhq6Az
	 wIVVKkNlwwXTgjs2EkSm4FHFVKXpb+zRvNN+fdPQVIgzNfxdFsP29aYASEX0UK5oRvVS+
	 nxdw0mNWqRX1MuFe00c9T4X8HYS2tfL4RE9+Bj3xiF+K8lZgPfMtjnDSo0FLEiXBkYy5Q
	 J0hbi/vE6IvsLA5AF5Lc6bTRQb1t1KMDpZuXK+mZTPHUrtPrFqCXSkFDDXw2AIiqdKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
	b=mkSczgp0D5Ah8oGHlM/mAqm30P+EOVs57dthrpOcmBuGsgTyTrKG5K0ixfKN3u4ieljB
	 3MUqX9wAHe1cCuuR/6H1lOxvhZGWXhrh03UtJk7oReXV5iK0NEzj1YWtptMfzTmoRhQqc
	 MKlboM1gXznrmISaalXyg4hkUPkTpaNsNDPwgVWCyW3xMldycUFfszFK/BAWIkDotFmpF
	 en41yDnH1zMedFaZerEyCm6TYLMqOiSI3PeGrk+eVy1peV+Xr/wjeBjyGGeNRot04cqFh
	 dhLhv5ULEUfwrhNUf6yre50+rPH6x0v4AFxqffoXrnIGO2bgTyHCqV7DyqWRdYyjgdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd6lo9yE;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8A60850A6
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 17:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C8A60850A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd6lo9yE
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so3201704eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 09:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793641520; x=1794246320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
        b=yd6lo9yEWuJUMl/+aP8HN/dtgpx5uQ8WW6Bc1IV4WBj+cefC1XxQftpQqCPoWVqBDz
         N40TxHXTAY62ONZLRupG5OGeYB7sO/8Qq3f9wLtCjEvtG3zxXfn9tp2mbxlhCvFOTMmH
         AB+9B4D0Np9BS9YcpbJRVHjoxQYEowFcXJq0iwKxynkx+wxRvDMcEFTptyrCgQi93mVO
         2ZvLeoJN8VVVlIektlJfwSKxSimSqLRmcqO3FFDxX2BthAmXUMTXB84JSStR+RDRVInd
         TdLhPiGDPK9zH/bTfgb8W2f0IpIyrrFUVygHAf7hETB+4t+d2bt1R4kM/ZTGJuFvvXB6
         kFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793641520; x=1794246320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=druvbJvBN6ko55G4pQr8mGOqphalakbTk9dYFbwjgLM=;
        b=M2riGc1pfWcadJKA4x3po6EQ2du0ldEbG+dLrD2XLoednxZ8n0CUtrkWY7ImYFb7Ep
         ypdSPEU1bMMJ6ug8QK4SOkvv1xH0OPVOnHzEjalgb1BvZNRjnhxQ/OYL7A4TOcZ5UIWi
         dOwLPW23j9npnIJwvH1tuIq5cOjA/hwPnffUjMPKkJsarI4Kf8ZAlIzGVq0ZQVA/lO1I
         +5BsGz8k6peymsJP5onfZulsEyb8bXIVtFuqUlArUZlt0fQSiI0aN6dQ8L1RqnhEA+aX
         9Gy8RcyECFz7U4RzilQ0QPMO1Hj096PMIeFrp1WpWD2wE8YhPZOp+EPBv3e7+TBTrLcA
         HDBw==
X-Forwarded-Encrypted: i=1; AKwUvBwSVY04l23DvSW38fGivL7wXzM2OSJhztfbimUWdN6c7vxAJzhJ2L3vTQe+XXGBSdJ3x09nJGXpsI7t@vger.kernel.org
X-Gm-Message-State: AFq9FYK1DOb7IkbO3EG4Lu8/ZYhmYuYIX7kFgm5+RK+GqMCL1GUJCUot
	6rFJ1bdmQ0XupRZk+lcUHm+YcPJfWFwlMcsojrzWpDLFtpHf9Eu5aR+b
X-Gm-Gg: AYBFou2ZK64C88hL30khnEIcT9DANp/roNJXlyUeb5e2CbUZPFR+7TeODZJCU0i1e+P
	236qEN7ctKrdupmvs4st4qfp869ryq4RBcOvuk1W+oHzWyeRSB9JzftX+a79BcCwuAEdIt7oq+R
	wncXBDlysMXR9YoNH1l4poheE1E0Ap+F/SA9v0YbZNos69hFXDQRva+0O2tszC2xW6fZfYPw32Z
	/1pBK61b2p5LRUVlAbvr2WEYnDDLKlQj+KbPigfyM9ckeFHBcXKMrW4YoLP8IG5AKhffODSbT0P
	vkudx7NKgLW1eUMn8RQ76u8Ld4XXrdiD2ltBtDy+EMXKupA43/rYod0h53C50Im3vju5mnM+95C
	hi9lvPTRllZTWjIkILIlnF3w4PxXoy7Jyn5QYJ85P3XMFJxWbFpbmXDU2BZMsxL3xe8DtIzqzHx
	SkxhgiY3UpPut/ECTpaIoNOL9mbeKplV30UEPXEvqj463+wi55Sy5nDIzzb/pAbPxDQ5IUom2ty
	JJ0wl+3S8ppmcQ62nQb81a6ePOaS/lcDt+0EoBTwDfL/24K0693FPw6deFJd52jMTMGGZ5DTIB+
	5kfZAcbJShFno/PO7dTmQrEKvGU=
X-Received: by 2002:a05:693c:6316:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-36a7bb74690mr123492eec.34.1793641520162;
        Mon, 02 Nov 2026 09:45:20 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm53290803eec.16.2026.11.02.09.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:45:19 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Frank Wunderlich <frank-w@public-files.de>,
	Peter Geis <pgwipeout@gmail.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Tue,  3 Nov 2026 01:44:49 +0800
Message-ID: <20261102174450.3000397-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102174450.3000397-1-coiaprant@gmail.com>
References: <20261102174450.3000397-1-coiaprant@gmail.com>
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

When the Ariaboard Photonicat runs on battery, the USB port has no power
output and attached devices are not detected. With the external supply
connected, the same port works fine.

Per the schematic, the 5V_OUT rail that feeds the USB load switch (U12,
enabled by USB_HOST_PWREN_H) is the OR-ed combination of two sources:
- VCCIN_5V (external DC input), OR-ed via D16.
- 5V_BOOST from the VBAT boost converter (U16, enabled by BOOST_EN /
  GPIO4_D2), OR-ed via D5002.

The 5V_OUT rail has no enable pin of its own. Since the regulator
framework can only model a single power supply dependency per
fixed-regulator, add a regulator_5v_boost node for the VBAT boost
converter, and a regulator_5v_out node to represent the OR-ed 5V_OUT
rail. Bind the vin-supply of regulator_5v_out to regulator_5v_boost to
ensure VBAT is boosted when the system runs on battery. When VCCIN_5V
is present, D16 takes over.

The USB load switch (vcc5v0_usb30_otg0) is then supplied by
regulator_5v_out. This restores USB host functionality on battery
power, matching the vendor firmware behaviour.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Link: https://github.com/photonicat/photonicat-hardware/blob/main/Photonicat_rk3568_sch_20221116.pdf (Page 15,18)
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 49 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 7e0a2ab829209..290e3ee97c709 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -59,6 +59,47 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	regulator_5v_boost: regulator-5v-boost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&boost_en>;
+		regulator-name = "5v_boost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vbat>;
+	};
+
+	/*
+	 * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
+	 * and VCCIN_5V (via D16).
+	 * It has no enable pin of its own.
+	 * Model it as a fixed regulator depending on the boost converter,
+	 * so that VBAT is boosted when running on battery.
+	 *
+	 * 5V_OUT supplies:
+	 * - VCC5V0_USB30_OTG0 (USB VBUS via U12 load switch)
+	 * - VCC5V_HDMI (HDMI 5V via D5000)
+	 * - J53 expansion header (Pin 1)
+	 */
+	regulator_5v_out: regulator-5v-out {
+		compatible = "regulator-fixed";
+		regulator-name = "5v_out";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&regulator_5v_boost>;
+	};
+
+	vbat: regulator-vbat {
+		compatible = "regulator-fixed";
+		regulator-name = "vbat";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vcc_1v8: regulator-vcc-1v8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_1v8";
@@ -148,7 +189,7 @@ vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
 		regulator-name = "vcc5v0_usb30_otg0";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vccin_5v>;
+		vin-supply = <&regulator_5v_out>;
 	};
 
 	vccin_5v: regulator-vccin-5v {
@@ -446,6 +487,12 @@ pcie_pwren_h: pcie-pwren-h {
 		};
 	};
 
+	power {
+		boost_en: boost-en {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc0 {
 		sdmmc0_pwren: sdmmc0-pwren {
 			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.47.3

