Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB1F47B434
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325837; cv=none; b=C0TkR/JfP+lDmY6kQCK07W/bNpncpSyMmK+vKCay5OhbwllLy/QsMdDpr7zKbhX02/4Amuw2GPQ5Sk3ItbuKPDalFGtXqopryhn7m7EiyO7HqiPgVytVG4fVyU1c3s37Q72Hfo9pJxJ20Z8e7daa0AJ8FU25EdKlXIl+zVreMeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325837; c=relaxed/simple;
	bh=ot2ooccPgQduimVTn/sfPlBNaNev3Imd8d0arFh/060=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWRJ40TlVkEGcyz7DYVG+mSWyuorV9m9AsOf8ADioXAqHrdJxMj5Za2/DIJrTcl6KwMOKqGa47EP2UlbPNNpGbwdP1V8cjWyMSmuEP0Ql3Oc3tx2IzOpKSETXSFD/8aLdny7RwwrYmwLMJh1geeiNklBAf4C/1uuyXe5apAr+Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci1pBQQP; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci1pBQQP"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954afac04bso9611905e9.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325833; x=1785930633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0jeyxYmzwaVa+m+94QZq0khwAwHl6AtMmkImgnG3dqQ=;
        b=ci1pBQQPWt7L4/DiPXAFnoJEJZwbNWv8YbFcTuXBJPwtb5dxlR7cibCW5bI/eO6CuH
         tsWcd0Yz7IBovuXRgkem/tkMKsxcoIb55iD+KnKbf0Gud49NTDUbNFmFB0OEJWX0lixZ
         GXYnAg+i/+7YJIauBvjy6t7Q0XGJmKtioAxKRrUK2KnT/4vu3c4961em/Qdv9TgndlhG
         3UFjCe78ponu/1yGS3hqYVKwFDRlH7AwpG/yvXLZrTOFOKIaCUqt2atUj2zm8MD3CeRp
         4vNtLaaRtZPdMoNqOumwEH3ojJ9iGMpSPevnFw5l/yBsjvIcK0BwxUSHjOTnGo+0uZgE
         vTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325833; x=1785930633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0jeyxYmzwaVa+m+94QZq0khwAwHl6AtMmkImgnG3dqQ=;
        b=LJ1C8GjikJgFxWwgc3GVed1vLegV9yWf5NqrPDxXZmpIRB6HClTUl1BjjDc7wIRTZv
         WCpyf1m5m959FdMT1buvgCP6g9ATMlT7sHWAbA4eo2mE6B4OizuyB1lmF1URQRxxp48R
         NnWLfhQ0wPIDVetFcbKpyGZqPeV6Li1GGk2UNuUOeDoloa0RtGBwHShZmiOe8EyMFa/4
         APDPPBiFEiiArtRNGCCzSjSAetFQriZd7wETP0RFBSiaI8VuHRMBXa1s6pybYUrsy+yp
         fXMsIn8OILwI2oJaxSZBKRN+DWq79iyJCbKl16xuvVwKiYoLb/81zDge9RozjlA7in3M
         cV8w==
X-Forwarded-Encrypted: i=1; AHgh+RrfB1St0EJBV66Q5KWpxXGLrRqQ/8VXpSeqaWqLQK8GnOupufloiPx1C6pFlQGpDxBK2mFvzMbfa/zn@vger.kernel.org
X-Gm-Message-State: AOJu0YwdaSb2Cr0HXcri2Dalcc55/sWFNoX6fh2TNNqSiQYIDtONJZik
	7ls+xh44INBKIkcVueS1UeO8jdYrWB7osFNs/HqqdKkcqf60znWSFYSc
X-Gm-Gg: AR+sD104ktJXsOLKb0ViDq9ruOV0A1auyYgKIb+tswjC9wTpeB8JiqHITSNV+l1K6wb
	o3ixFebSGVq0TF/yGDmvm98MgdGAaOqnC19qt277y4xE7OqF8pKdPyncRfglI63ehubB+wtXQGI
	S0eRsVzfRxmX3DI1Bmo10rhBIboJuSC42HqAflQuwWjMeb50UgPwy7g+mzqxPcufzYtf7MUKdNK
	il/PmxuqZ7kDx296g4g6NtGNGFYVVEeoZJA8HVGCKlY3r58ku3X9PwJYIC1GpeBErpFTFxIWVrG
	QKRS18fUmtEL3/PV/zvlvhLkXGWxQQtirDdOAltlUYtTIE+7m+PA64xpn99wtEepehF1sTdxz2K
	XVE8PEWZFJPuuQYvxN9stNzwHj3kwRP0ugftFP1S3HEcE6ZmbZL1amh+8ktmXd+F0VchAaQG1xn
	W/3cxIBsln+J/Id4/JyMO7uWbDfcABusxGkaiu5jSXG8OhBUsgQS4ZvGkE2ymY93v2ZLw6L2TKS
	ZwMS2RioOFWXw==
X-Received: by 2002:a05:600c:5491:b0:495:46dd:e238 with SMTP id 5b1f17b1804b1-496c65aad1cmr84444925e9.30.1785325832980;
        Wed, 29 Jul 2026 04:50:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:32 -0700 (PDT)
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
Subject: [PATCH v5 9/9] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Wed, 29 Jul 2026 12:50:17 +0100
Message-ID: <20260729115022.222340-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
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
v4->v5:
 * No change.
v3->v4:
 * No change.
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

