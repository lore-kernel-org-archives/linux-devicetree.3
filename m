Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793561395;
	b=aV5pSY8u4GSCA025L4/6Q4EYRoVR9E1AkW0aBexMek/oY2KQWK85RU/pj+xa65JnIyQT
	 ZCnqvoLArLjA62RWp69zQfG6/IcVsEX9EpyLBqEz8YMpIX38LE9u15/vxt52Q5yoZf4Sy
	 9ZLd7S5djtpQ/W8dM0ppAxj/zmox/qB9n28sMy043f5MfSzUqBIRzey9Z78W+EFnZTHdb
	 7KlP09CvMxzPFLtfUc2QONTF3ql8WhGOXLEtr+aGXnKYNEcGUe8m32OFeOR4S0Pgz/Gyg
	 1HOdtNJAhkNnOHBNGPW3ClNHbGFh09/BHFquCRClwDXFgm18sLtvCqOsDQhy/1+2I2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793561395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AmWM5i5bcYLOfgd6JgqgudQuIbo9gKLsDd/ijE1n9kA=;
	b=uotDE2iSyeAJ0K3duC5fn6HP6T2tWF+tTcu/9kOtE9Y7BXGmknmeF7e3Buo9us3PG76o
	 oWzNjlkge0zpddN6Pu/jpy3RYSOyF4sDA33SzzcnGsxgCAIZoU9+36ho038qt2Z3hoULA
	 OR86JC6VPefh95X+pNzWP+8ScytrqT+wPbzCI0AFIMndr90AwzIa/dfg/m1dIJxGgFq80
	 FDN69fGJLWTW1O7MWOOqFNLq+KqUXVlpKTdQOHDI9t12i3y95zt+BO/vX6BJSCdf6RLyw
	 O8MH5nsfZnFiRltqBulxW1taAIp4WG6jDLOExBmQc/mYIzvzmpWDvJT7O4pz5q/Idfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXExrATK;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B9C606A331
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 19:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B9C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DXExrATK
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so3885065eec.1
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 11:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793561394; x=1794166194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AmWM5i5bcYLOfgd6JgqgudQuIbo9gKLsDd/ijE1n9kA=;
        b=DXExrATKhuv2WetJguNn6T+WIyLaHJQ0dzD4VYgImnZt3ZlQUYnYIQSPTA/j5JbPMw
         9kJfqbPAujFTCGQ4RM7W3G3MwPztfRW/t00V0E+Jy7wU7rDRaAY6rJaY1jgZ2ypTgu3A
         5eBTeZlT13S3IHbV3RU/p7KjD47jw6mRGiDBhvioib3fPSPl4q5Tbyoz/EPVHII2yYG9
         w7haRqtHVQvihwGlXhv8sB4IFMfR50bUeNxYAXk3kf4SXTkW45GDup9xMcGcSgDLbpp5
         QCMY4gDVkUiWm8N4aGC9N90dgJIKpSnU0h6CgvuUelmg9xtw1Feab32eSKvJQoTo/bIi
         byeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793561394; x=1794166194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AmWM5i5bcYLOfgd6JgqgudQuIbo9gKLsDd/ijE1n9kA=;
        b=Hv3zGYsOSbyg7rAu/8oldebif2Cl+C0X/79YnCjVIFhZIxdiXxKTiw52Gtwrz9JzK7
         2HfwtVW3gIG8o3hfRLZPUhUIejcdwvvqlQusBnW/taZ1FyjRQ8LCJ4C6clR99s9eKeRs
         49QgCQLdHSHwVZdKMUaJQmK2yjIo1P405YIzoHFSt4Ats7AudYsMwVZUtN84yRVkXpAI
         IvgHvskiMq19XvaYnGfkhoHQGjJSIVn8rd+FyZK79dNf0ASNl+EeQgsHhAgY99ayRLC7
         7bTtsWGCtkUz/Y2oKk/Sw6Jj3ucDAb9O1SEFJaCaUFKhQG4Ar7A75vDaVQRCstXl334J
         i+jA==
X-Forwarded-Encrypted: i=1; AKwUvBzmf/GVlajw8pFhlMKDoXofSXUXydiG5uylY9+6hhulLmv5Ap0SFxGsRLrG92Tvh2zf4D6PmsQBPOvv@vger.kernel.org
X-Gm-Message-State: APuU4Z9pm8KZXGtb8yzpMH8B1aERQOGWy6IKdSeMxf5gq9aMYjqGJG2a
	tZvxU39Qo6zdtordL8m+E50UnAFum3jgnH6MKHZNXCj0WZrtyazjuIqb
X-Gm-Gg: AYBFou3aTM2o87lt9XTS5mbJkpRin2mGpzHQWl0KQCsQQcQ3Atn7eNMyl6DCM4baXpT
	F5Oy5M526BoGWf3xkZfLLt1HceIVU7Dk129vsHxbOYuWn18s4g2X5R5FmoqkGPqL/KlEHKSpw0R
	Cu3l3ka+ml3fYaDD1ATgD1sPt0l52Bl2y1FSsRVMPitLS/nirB3RC5ynRH4+OiyNfLWSs6H9jLD
	SEXviICLPh12Jtotfib7QcvjboyAJZjJyjOGCfd10ov8PhkQU6R6hR/UTUMt6/nMD3lIQfDMdYA
	Fs2TPwuIDUTxHk3gNaDV1aQwgYIrthL3qM/jilp6+1TTsmUKJkB3fKCY/EF6euMh7hncukuB94A
	dVv1puF6Wusu/tbI3WNLAGO2eKZxeFgQ0M2Hc5BOnMrhRGiF+17Jw+zCNQt9se5luqRaAn8Iht3
	9iYxmQHz4ilg9RakAe7Tk/HKEZVHy0eg0E1XrSnWiCe+b8fyc456QVtc03meFjRFxi+36MAtrfD
	1+/mVhvNZP0ei2+9NirMY6AG4Ndtphu5zhjJUhlqSpppLAIfCbPoyqKjYlqjmwRCLlk4iC3BI7n
	JOQUDU4CXECMeTtAVdq/kSllsJI=
X-Received: by 2002:a05:7301:710f:b0:359:2edc:e1d8 with SMTP id 5a478bee46e88-36a422039fbmr11538413eec.5.1793561393990;
        Sun, 01 Nov 2026 11:29:53 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm31471861eec.7.2026.11.01.11.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 11:29:53 -0800 (PST)
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
Subject: [PATCH 5/5] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Mon,  2 Nov 2026 03:28:07 +0800
Message-ID: <20261101192807.897562-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261101192807.897562-1-coiaprant@gmail.com>
References: <20261101192807.897562-1-coiaprant@gmail.com>
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
connected, the same port works fine. The root cause is that the
regulator feeding usb2phy0_otg (vcc5v0_usb30_otg0) is only available
from the external DC input, and there is no 5V rail for the USB PHY
when the board is powered from the battery.

Add a vcc5v0_usb30_otg0_boost regulator, gated by vcc5v0_usb30_otg0,
and switch usb2phy0_otg to use it as its phy-supply. The boost converter
is enabled through GPIO4_D2 and generates the 5V USB VBUS from the
vccin_5v rail. Note that vccin_5v is the actual energy source, while
vcc5v0_usb30_otg0 gates the path; vin-supply is modelled on the gate so
the regulator core enables it before the boost.

This restores USB host functionality on battery power, matching the
vendor firmware behaviour.

Link: https://github.com/immortalwrt/immortalwrt/issues/1534
Fixes: ba124e06ce7b ("arm64: dts: rockchip: add dts for Ariaboard Photonicat RK3568")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../boot/dts/rockchip/rk3568-photonicat.dts   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
index 7e0a2ab829209..bcdfe76000c46 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-photonicat.dts
@@ -151,6 +151,19 @@ vcc5v0_usb30_otg0: regulator-vcc5v0-usb30-otg0 {
 		vin-supply = <&vccin_5v>;
 	};
 
+	/* actually fed by vccin_5v, dependent on vcc5v0_usb30_otg0 */
+	vcc5v0_usb30_otg0_boost: regulator-vcc5v0-boost {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_boost_en>;
+		regulator-name = "vcc5v0_boost";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_usb30_otg0>;
+	};
+
 	vccin_5v: regulator-vccin-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "vccin_5v";
@@ -460,6 +473,10 @@ rf_pwr_en: rf-pwr-en {
 		usb_host_pwren_h: usb-host-pwren-h {
 			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		vcc5v0_boost_en: vcc5v0-boost-en {
+			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
 	};
 
 	wifi {
@@ -617,7 +634,7 @@ &usb2phy0_host {
 };
 
 &usb2phy0_otg {
-	phy-supply = <&vcc5v0_usb30_otg0>;
+	phy-supply = <&vcc5v0_usb30_otg0_boost>;
 	status = "okay";
 };
 
-- 
2.47.3

