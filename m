Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED542A160
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435020; cv=none; b=IolMnPhel+Zt5zLA/BZ+K5R2OSVy6il3vLpf9Udei6+WagCwZDbh9WBO8UR8aM6E57HdKDb9OFSU/xfwqZEaFgtbsC6nrYo/HoRTOn74IbOYcVwb6hW+3bHvIcikX8SeyiCR8eXXSWDTt/2tk1AqXACnwOqSym5AwW5NzlL6lK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435020; c=relaxed/simple;
	bh=aAmzUSZzbLyujEstXd+uWTm8MXYug0fqFUoYKr94RoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUY9eEQ5Pw8g6HVlch2bFY4/MIB0O1LnDbNI+JmhUU16qE+onrI8V5mBbghrqCrT6RzL3c2tCHq0dbcPC3E29DU7EPTDASDgFqoQDQ7j6Ud50UbOnW2POOVUGPRSzy6Lobd77UpBwP0Us2e/msUKpn6Ok5rYVkP3P+qxlqboam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvOT5KbJ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvOT5KbJ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47afb758487so572704f8f.2
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 07:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435017; x=1784039817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAAqUYadKZN3JqyuHZZxZJVuJ9WtVF8Xn0YwNTIAf9E=;
        b=lvOT5KbJDtPls4+xMEL5DNeI3eAdRNqP/5WDKzg5pNehy4AmSUneWGwWRY9iDuUgF1
         2huzkdD4MDddwasRjhvAxwQYVwLqjaLVaSYXHtv/l/SBgHK89eiXYYpaFnCi8WIn/33y
         zbnnB5hG4/vtO44HTqZWF33jW6ndeft+8QQip2DK+WDnVP1NUdXf3mXkR9oRl9Q9fgEd
         JytK/zrXw4ofEDD9lScdczN5j43Hus9+kwtNBpeVsg+6E4UJWKAiuaEW7MBXz721EKpR
         errzxOdakzJp3GH6aAOnmV3FtcT5Eyzuv2Ez6y2a64hogfHXeNdXn75vQbCrEJlFC3aX
         bpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435017; x=1784039817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAAqUYadKZN3JqyuHZZxZJVuJ9WtVF8Xn0YwNTIAf9E=;
        b=M+CjfHvmff6O4Ye59ZdYci8Vf9epEcepjfkHo3wwkWtd/YZCb+qroweU5XiAbksc4A
         1b113od1agtGymHx7jycEhtZk8s/jCS5EMLGOEvc6MbWxrvKXpmhOhW2gILOLzQRDxZ5
         WxKPq2T1VMsCD/F8vWynlwtCYkVdx4Kc0TSOPhcvTAC3ndQxzYPhPKQh6hviMAdXctwd
         VAts6DhFA6zm7hYpQ+jbzj7V9OvQGxOy4QGW3sS2GLMZh0qH0Apwh7T1X2xGM3clkGIb
         jO+FivMpjF9aUEYHfFhtOkoyDqiANQTC5LSoDp1Y4vJK/74JVmijYtERGc8PFBh+tQDD
         g7fg==
X-Forwarded-Encrypted: i=1; AHgh+RpidM9isVsum7Oi/kgCATeb0TmAtA/vsJ/9MNorYeAyFsNjoseH+JLWTqLy3qp1eeR//dxBCIBWbWic@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQBG1PfAbNony2U72diM0o+F1v46wTCVL3symIxBxzHL0Xr+7
	W6trk/yAKVJww6VEXa/JzNxJLhwuP9kdBdEBpkSCOH78BzoCzkWNn4Xl
X-Gm-Gg: AfdE7cm8r+W/munN+0cgF9V8v4vLyFnX1ywXn6C7mPoYklzF8yuUFjAdSYD7Ovkqs4G
	guZJJh/LCpNzLZTi2q2goTp7E9HcUQDLArYSqEuUq2mOMTo9FzpaqbbN3Gkyi0BLocCAGKEt1aV
	wVGW0ZGPCVm6VFWfPWkgw24foISQpUyzYiobLqVOrsDdYRUHN6VOmTEtk3vg5ixexxq8rvLTwyz
	qBCYrCwNmYQwCie7Y1Vzkb3iHOGfuDSkKHd9DHhnylunc8PrdQg5RwvyEULHZtL1eu5goNS69kz
	bgFo5ZLmo1qdbNptrbIhfIkGQzZbgGh2BH6uo9OdcSD4N1o5GnTR1go6kJP1Z04eTOwbrPN9MPU
	NyhDe8MGo9IE63uBM7T53L5ytFxP/kzcYk3EQlTKgiCuHIRfzAUGa9MXRbvedkaOgd0n7m8mnIz
	J5Z7Xa2D/ZwntynaOh8QMpwyI3rNHqFAMt6zPoEA==
X-Received: by 2002:adf:ed0f:0:b0:475:f100:35f9 with SMTP id ffacd0b85a97d-47de66ed48emr4547252f8f.54.1783435016590;
        Tue, 07 Jul 2026 07:36:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Tue,  7 Jul 2026 15:36:41 +0100
Message-ID: <20260707143646.245177-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable USB2.0 on the RZ/G3L SMARC board (r9a08g046l48-smarc).

Port 0 (ehci0, ohci0, usb2_phy0) is configured as OTG with
usb0_pins pinmux (USB20_OVRCUR, USB20_VBUSEN) and usb0_vbus_otg
as the VBUS supply. Port 1 (ehci1, ohci1, usb2_phy1) is configured
as host-only with usb1_pins pinmux (USB21_OVRCUR, USB21_VBUSEN),
usb1_vbus_otg as the VBUS supply, and renesas,no-otg-pins set to
indicate no OTG pin routing. The phyrst USB PHY reset controller is
also enabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Updated commit description.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 96cc7ee46a6a..b189ae8e808d 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -87,6 +87,16 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 #endif
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -138,6 +148,20 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&phyrst {
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
@@ -259,6 +283,16 @@ ssi0_pins: ssi0 {
 			 <RZG3L_PORT_PINMUX(H, 2, 9)>, /* SSIF0_RCK */
 			 <RZG3L_PORT_PINMUX(H, 3, 9)>; /* SSIF0_TXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 0, 12)>, /* USB20_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 1, 12)>; /* USB20_VBUSEN */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG3L_PORT_PINMUX(3, 4, 12)>, /* USB21_OVRCUR */
+			 <RZG3L_PORT_PINMUX(3, 5, 12)>; /* USB21_VBUSEN */
+	};
 };
 
 #if SW_SER0_PMOD
@@ -330,3 +364,18 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb0_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb1_pins>;
+	pinctrl-names = "default";
+	vbus-supply = <&usb1_vbus_otg>;
+	renesas,no-otg-pins;
+	status = "okay";
+};
-- 
2.43.0

