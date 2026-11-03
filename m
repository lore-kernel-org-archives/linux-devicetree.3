Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694826;
	b=IQGbOhayMx5+THwCdy2tC6mg1DmMFExwEfu69Jdv5N1CBrsgyiK12YgKbSwHol35xSiw
	 t2pWpX21H/MlGo8QfqHfMYWdOP4IsJG4DLrx4pefArJi3E9MYycWN7jfChs14iDumh0RD
	 5NQA6hHVBATmYBM+BWgc2ytWXk5vqHIV1dA94cH8F7EMbIJuMJ6t9OY9Z70YB3J11sUWr
	 Am35D1KYAKgciiPBRZsYH3GiG5x8XRhWR6Z+5y9eTNmwRLVfJQMjSNbzDSUSJAzPywwJw
	 dA9TepPrJ8y1bmQMGCu1V2MMpi0PNSyZ6PiOOYAMhI++bj/7gJzffMtA9HWmLc0+UFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=;
	b=l/50zQDCgOC0jUrdoeIAbFL6HM/zOMgu7B4Wg1BuaB+pyTd5cxWePgCCx/0ZeiMJh4Fj
	 0lcNFlFJM+93+IAeYtaz8PxKMwf4euukUQTPqGFRyuN0fb8TDViITg9Pe9QMyoo67z0Ir
	 gUiArtuyMUYW65aLhNURsp4RzKWCwbAYw1a1IfJk6Ni3bQoiLtohhItM7iqPlO4mY36R+
	 Wabvg9YMDzLMemD6RS3tx/XGyRMgNW+VdxTVadSex5GH9utBj2uHUIAwhZ3sUyo15sO8e
	 PYZK5ABeCv0Ia+zJ9DAV29XaBSywn6dOOR72XhlZUnCQu2jiLY7qAWA7LKmRHALY+Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a5xXpInf;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F4C608509D
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52F4C608509D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=a5xXpInf
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso232893a91.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793694826; x=1794299626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=;
        b=a5xXpInfP5DfQ9YZv81fq0aJONuhM1RgFwxvF/rDiD4ZGC9Q+g8GMAgrYumB30ZlqF
         vSpMvBI0sdPWTnYydzEnJhXWQUXhZk0BPghcJLcpZfrQGfrkQhmFju2wMx8MmmMasdWs
         Lcg49OCaDCkeJr/+Xa8irGXGXBb3AqJAwGiqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694826; x=1794299626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XvjTZ7Fkh7YhTLnNMHtgICr7hgWUxrshozbF4pg48H8=;
        b=B3lemXedb9/0OKyfb1pM9+fQzG5rAaxEhDAvPHyUsYIZp8Y/taTVdIWFtWVni9+EQt
         n21/Zbh30cbglPZgRw3hiNZ4IRssN2NGpwgOIxdjZtJtMP7BZKn9kjPkTdgyahYf4r/N
         epASuLka6lw63lbKE4ccKfMNlzTle+emthHOKPoPlZYyivNv7PK8D7gHtFYh2ajv5Dpp
         dGAkwzGBr9ceKuPscOWpwDsHUebJV53FoAcBSXHFB2WhllKT+jgX1uvAusG4YC41m8Mw
         uqADkJHBVewK/hZ2a38cz0fXvCBOvUqEZA942Wi+MeXlRXafPC/otaVz0V2pAXCq6CAL
         z3fw==
X-Forwarded-Encrypted: i=1; AKwUvBwAQtcyKLcxIeOi6bW98q1+f3HKHBpEvPw0Kp67HrxonyR75ejUUq+e04erKxWnO6wit8ZfUZ9SCskt@vger.kernel.org
X-Gm-Message-State: APuU4Z/h/CzsGNV3WBihCDXF8TpmrGD3ZcgWtEjInbyEvmnTM6R73vcn
	CGevjVe/5Hn6qRuGH2zRUZtozyb2x7xW79xyXEGaAzz0u/psM8yK/VCjuDwBPA5ztw==
X-Gm-Gg: AYBFou2Y4qgOmJORGVg6NtwutkxHca6T30uXAYptLdTW1HC3bWm88nWnF3JKAIZ6WD2
	Gh60BvEHXRP+BqJ/lZXZskTNkxg1KmD+LuRfffyfN24WnK2rjtAdhrsEAPF+wpqOsRTQQx/qvll
	stsflMJ7cQUxBXbqxx4eDmY0PVmuPab1YNssdO8TBgnGbk1aJKgcv3MBUCTMdCi+TIN2ATbMX8g
	CytxxCdsJafkbmev43XaMMMfnKzOXIbFZG7Y8r24XOOVK9MsJhivt0Lk4CpGtbRbUhXC/YYNMQ0
	RLrg75Eov2jLPRN2BhDP+mm/onc6fuF6fUdOfT8jgCJ0lLQCVaaPdk+1gENAbMsfgcHfdwueKTs
	C7tJBPsM5CaPx7HD9GVqG4djmQDnetBANKbMPGBv19cA+qc+qMDNMGtlqDFVXVOXwNEiGe3Z9sT
	arREaq9TBhUQGCf8Sq4crW03k/lUafI9AJ3Kh+5IN0jX64z2lLgklderIRUDWiEP1Vs/Kni6HVC
	JTV5zbndSwvsYvbs0mv3Ow1h7IuO0HEKkfHo6tdREZmyBzgd7mlc4WCAsrp94jKYGGEzI91LAna
	Mup0+jZV8N0mSRu0BEp4Q4yTT0rkFPdaOVmk+cfkw9M3NymGE5FFKneiDjjSREyPyzLxMSqauaP
	i0Gw56P/hoicb
X-Received: by 2002:a17:90b:528d:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3ae896d8027mr6639826a91.13.1793694825657;
        Tue, 03 Nov 2026 00:33:45 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm3192790a91.8.2026.11.03.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:33:45 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8390-genio-common: Fix type C port mode and connection
Date: Tue,  3 Nov 2026 16:33:32 +0800
Message-ID: <20261103083335.2944847-2-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103083335.2944847-1-wenst@chromium.org>
References: <20261103083335.2944847-1-wenst@chromium.org>
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

The USB controller complex ssusb1 and xhci1 operate in host mode only,
as it is immediately connected to a USB hub. The user manual has a block
diagram showing this, and a USB usage table showing port 1 as "host
only".

Change the controller's operating mode to "host", and drop the USB role
switch property. Fix the USB type C port data line connections to go
through the USB hub, as shown in the block diagram. Change the data-role
on the type C port to "host".

Fixes: 1afaeca17238 ("arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Compile tested only.

Unfortunately I don't have a board or the schematics to check which of
the USB hub downstream ports the type C port is connected to.

Also, the order of the USB hubs might be reversed. In my previous
experience, port 1 on the XHCI is SuperSpeed, and port 2 is HighSpeed.
---
 .../dts/mediatek/mt8390-genio-common.dtsi     | 43 ++++++++++++-------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 669eaec662f3..821dbf9d3fc5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -512,7 +512,7 @@ rt1715@4e {
 		connector {
 			compatible = "usb-c-connector";
 			label = "USB-C";
-			data-role = "dual";
+			data-role = "host";
 			op-sink-microwatt = <10000000>;
 			power-role = "dual";
 			try-power-role  = "sink";
@@ -539,14 +539,14 @@ ports {
 				port@0 {
 					reg = <0>;
 					typec_con_hs: endpoint {
-						remote-endpoint = <&mtu3_hs1_role_sw>;
+						remote-endpoint = <&usb_2_0_p2>;
 					};
 				};
 
 				port@1 {
 					reg = <1>;
 					typec_con_ss: endpoint {
-						remote-endpoint = <&xhci_ss_ep>;
+						remote-endpoint = <&usb_3_0_p2>;
 					};
 				};
 
@@ -1528,19 +1528,12 @@ &xhci0 {
 };
 
 &ssusb1 {
-	dr_mode = "otg";
-	usb-role-switch;
+	dr_mode = "host";
 	wakeup-source;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	pinctrl-0 = <&usb1_default_pins>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	port {
-		mtu3_hs1_role_sw: endpoint {
-			remote-endpoint = <&typec_con_hs>;
-		};
-	};
 };
 
 &xhci1 {
@@ -1555,6 +1548,19 @@ hub_2_0: hub@1 {
 		peer-hub = <&hub_3_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_2_0_p2: endpoint {
+					remote-endpoint = <&typec_con_hs>;
+				};
+			};
+		};
 	};
 
 	hub_3_0: hub@2 {
@@ -1563,11 +1569,18 @@ hub_3_0: hub@2 {
 		peer-hub = <&hub_2_0>;
 		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
 		vdd-supply = <&usb_hub_fixed_3v3>;
-	};
 
-	port {
-		xhci_ss_ep: endpoint {
-			remote-endpoint = <&typec_con_ss>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@2 {
+				reg = <2>;
+
+				usb_3_0_p2: endpoint {
+					remote-endpoint = <&typec_con_ss>;
+				};
+			};
 		};
 	};
 };
-- 
2.56.0.385.gac671c819a-goog

