Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE81443CEC2
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606725; cv=none; b=Gfw63BcRMxTS2o5cWrkqK2Gja2pb7MfI6oAMW8ERBgBpIRv7Id1u8wqHt8IMN6FvUc4cJ5/i/fhxNnNmTm58b0h/MJOeYG3i4q21qhguQE+CWGkkPiKmCLLD+pRJEGTrCvBj1x0LawE5H5r3oWG2t+QMPVtMUa3IZBdbHc5+y1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606725; c=relaxed/simple;
	bh=/+QxgrEtVCoAJlH780G3C4bNU8LpijH2gKwosk8/UB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qatqrn0aNxhbygMWy4hWE0eKwCIao4Wc5LTmdq+44BizT/fHIPKRP7B+tSyTATTzrCvM3TQ6gX5flJhSioNx1aLPKbYNiggIo4OqAbZZh7vbHcgBTIsnq3sNp++WjG4QuxTlrZIpts/3iDReEzoI3YfSaBKbhYnBiXNlVeahgWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Grgn7EaE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Grgn7EaE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac10e337so29786055e9.3
        for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606712; x=1782211512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghDcckMrsxIgI0PwQD8NgJiWjxevvvKKfOn6FTfcfKY=;
        b=Grgn7EaE+yxMAQH0aOry+yPAb94dpWVHMdYLo3d9FEjDv7f5JBu1HiIWUNTEA3BQfQ
         jiPhn2c72O2PrCCLZbr8cnRiZFN2tlyRoKsWo/Kw0Bm+Kq8DjJOFddyB2VJ1wy8/WrWV
         gJyR5gJSq/m5t93GfED68wASsbV/zV748VmfzxYDhPoHRL5xskuBFpXJCeZXEMGlUVhS
         sLAckfWXG/b8L7cgICmeZ1ejG3+QAFfyC35FmmeChkcx3tDSzi3Od/Vm5Po7ESXHrizl
         y1pG+gVcJ5qiF/Z3d1xY1020dtsPFhgbRTaqBewtlovApMgVj/dmaHzxaVwIWBdJqvdX
         js4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606712; x=1782211512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ghDcckMrsxIgI0PwQD8NgJiWjxevvvKKfOn6FTfcfKY=;
        b=oIFAAcRMCF9tUsnCheBBqpLRxr5IQ06TytroTDcLtLxqiPEQnrLnpPJhEX3wBap2hX
         vhYS0OavMumocBMvJYBN863znZnoYzkbq+DApCDRmb3x7swQE+wreB3hUde0Nc17bDCU
         ROouG2GHjp8myiEZ998+4Y7fGQP8UrUlXZgSnVSssUft9qPqaBrHCckEgMrPRnJVIQc7
         kGXSMnn7dLEGESoWelGWr4yLWsjfNTHKwlLf3HhIo7OhByH8XJtCX+05UQ7zUpBb7jyE
         eDqMGFSS1qib6VsWizGphUXj0HSazzUZ72uIVLWZwO5OQeQ5Ou7jETea3nQwcaNeHQ12
         K7sQ==
X-Forwarded-Encrypted: i=1; AFNElJ82lbT2M7jtA9tJwsIWjcx1CaGLn2EVAe1zp07VU6ODsjvchwx3CwXezb9uHa2xIANCjAuRqjM7X0kk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdrut4OVVhMvsJG3gq2bg4nqI5ESu9Bu+ObSwbhiF6mC34vd5l
	Ub82esYMj5jUByrTyojMkckQpZKyPxfAlA6g6WqDV0XLc0ELyofPg9+u
X-Gm-Gg: Acq92OEhZpfDFan1r5el30Ba8Wf/Ht7O2efptM3jBFyMVaC6/FNgS/4Pu6nlXvRZakY
	GVPXJ7iiTWjcksPii+OYEaGvcteUf7IVdi33akr6uPw+yHUzD4iwyWgOyx+xBBLIlZ+swcpyd48
	Q7Tp4K/ERzLsz8t3T0Hcz4grUeDMjPZjS2mpUuu/FUAIs0V14fFOH1I47tw90LKFvTCt80Ielbl
	Ks5fn7OiwPmRLxtAdQUR5ON2Py1PHGUWft+BuB5yaIB62dSdM31lQJ3SOsdU1ttihxWpz1SFqSo
	S/iEy+EyeKsMb1kBIjrPtEZjbiem1cPte7CPoW4PFSAHQMs/3zPzJ1Vt/wft/wenZZb0h9hU7xp
	u9qvyPSenThabdhl+aRz6Eq9hOjXI6E7VRGJ/XO7O48fXoQy6HtQJY1fruqVwlbtxARAC9OGRnJ
	xS7wCYT1h5rYys/tBoSLfr8q8ffQIo2E/6TWMJ0Ofk9TCk0NuJ
X-Received: by 2002:a05:600c:154c:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-492200c01dbmr209666135e9.18.1781606711871;
        Tue, 16 Jun 2026 03:45:11 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:11 -0700 (PDT)
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
Subject: [PATCH v2 10/10] arm64: dts: renesas: r9a08g046l48-smarc: Add USB2.0 support
Date: Tue, 16 Jun 2026 11:44:52 +0100
Message-ID: <20260616104459.410743-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
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

