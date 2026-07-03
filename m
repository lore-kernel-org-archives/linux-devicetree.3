Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31203DDDCB;
	Fri,  3 Jul 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089460; cv=none; b=GRSZ2pxuNH+8Z4Nh3QyVaQHiUM7wGAx/lYZVQSc2EZDuhr2sCoTNX0o0qH92h6bRWc5yKsEFvZmlqv1MJoI3LA3ZinICYwIkqBZj4XnOdhyJZ2xsi3hjrWvuRqhFT7ru0guvzA8sbrGM+zg9Nd+7pHJydEb4Z3u2fo+5B07dNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089460; c=relaxed/simple;
	bh=c5ZIeweBZRj8x1D0clp6vRI893uAYTgKeNyqtL1IaI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9deGEEBiCN1zd4vElkXQLUWK8OELHjfi8ozsw62OTLqUM0xOdS5zh/j44BIfTH6nycx+Xyn1dtPM8wbEr4H5L0uN8agadWP/69VAYJ24uWF2ZGLCqX4w9UTl0lXzwIDKMJZvJYZdDb8P0O3Yv8Ta8tkRtGSSZhd4fIPWP+Hdsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y/UyREk/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y/UyREk/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7325D4E40C6D;
	Fri,  3 Jul 2026 14:37:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4782B60300;
	Fri,  3 Jul 2026 14:37:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E53A0104C9567;
	Fri,  3 Jul 2026 16:37:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783089454; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cW7Fd/zXKSLTJkK4T39T7hjSqOADybqJhMd7UKtGv7M=;
	b=y/UyREk/u0SoVDr2S2H5auEfhqVxI7WGB8eVHMN7SQoAsAf2eKsVHzM5aKiB8j3r7yBrf5
	zqeVF+iIt0PhIo8fFIwo8IHjQmyA608bfuLMYAcEccWj5IEKlG27UdfexZzLUDo+JFAuJm
	jDvnwHWpNDvhWeTn7EVzVcrTQFeE8ZgsFMNOELNUI50nUnrYFBcjWAdNYuab5Q4Vl3CLZl
	wgKxB5FVSoOMRflFAACgMKVUOS/xj4rQeOxNWpBnn2Y4TNCpquBO4a/F0UYbu7+MctqENr
	NlcbZguVhJAcdyNDH0SLLo3Cy1qKtwcef0z4skFgjhO78eKOyRPLNsx7g+GUxw==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Fri,  3 Jul 2026 16:37:15 +0200
Message-ID: <20260703143717.177362-5-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703143717.177362-1-richard.genoud@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Declare a carveout memory region to store LPM metadata on J784S4.

For Jacinto devices, this memory region is needed for saving ATF context
and the certificate information of ATF and OPTEE and DM image. This LPM
metadata area is firewalled to be accessed only by TIFS.

U-Boot R5 SPL/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image (which has been copied in memory at boot time by U-Boot
  R5-SPL)

At resume, U-Boot R5 SPL is executed and detects that the board is
resuming (with a flag set in the PMIC), then it:
- brings out of retention the DDR
- retrieves the LPM memory region from DTS
- authenticates certificates from LPM memory region and applies firewalls
- asks TIFS to restore TFA and its own minimal context
- starts TFA on remote proc
- loads back DM image from memory and jumps to DM

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

As this is used by U-Boot SPL, bootph-pre-ram is added and the device is
enabled.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
index 81b508b9b05e..1c0c1533f0a3 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-ti-ipc-firmware.dtsi
@@ -17,6 +17,12 @@ c71_3_memory_region: memory@ab100000 {
 		reg = <0x00 0xab100000 0x00 0xf00000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@ac000000 {
+		reg = <0x00 0xac000000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster5 {
@@ -27,6 +33,15 @@ mbox_c71_3: mbox-c71-3 {
 	};
 };
 
+&mcu_r5fss0_core0 {
+	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
+	status = "okay";
+};
+
 &c71_3 {
 	mboxes = <&mailbox0_cluster5 &mbox_c71_3>;
 	memory-region = <&c71_3_dma_memory_region>,
-- 
2.47.3

