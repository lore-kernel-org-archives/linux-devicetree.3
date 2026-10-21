Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570205;
	b=1bTmbTEBL3+FHIwBsDlKT0tU7BBN7zTcN4iEa0AxxFkw26Ab6HKDotoLHUJ6AbjHc5yP
	 OIMzGL1SzaqJ1rqS0DV0c1kvo3h9PWdfJ0Mkg0pF3kE0tYeUcQ8b79kb4Nln2/oKpMTlu
	 REgHt0RMJYsECYejK3NiEWd4b0+AR7fUanLXmioL0XOcwPAR611G/28SFKIBPTjpEXIb1
	 KaSnD0iTq8HEaWCYeWTCTofFI5Jy91cAG+s+qNiiQFuDzSGaK8PLJJnbk/Sr8EwerCHWW
	 vCelyGAodCYZ0VojtDKFXfDtIP7WDooPRlTydEfquEav3Xc5L/pjCKP/WDFnq+n04Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570205;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Kd34s16xr88MTUSbQq/3ajw1gMPQR0dHBf/8zGvlil0=;
	b=a8CRTcxL25qv5SWJGwRTR/Sdn4oHFsvzvXxdbzYmxoLNGRtskh1N7jW/sx0cE73VDlGc
	 vKT2xxFjGEm9B8fxrpx9t1SRbhxASgkfof6o6aLYy+kJRKJ1zXHM/Wioo2g01Q7G/Xpl+
	 sM3PFjHRIKxMH7Y9pEtngkW1b35+AbyrCECXzvmptk5k9sT6CnSTRzOp0gP9YI/o4lP0x
	 TB9R11FuskBwqxIaMsRO9d1+XF9uxzqZ7/SfVIJDGkHUs/rH9lI3SSv6XiA/tBNQ6EPdd
	 RJpr0wOzpFsPHuhdYjzhMrDkmAFnhVWe2BPnCApuvqgnMLskGbHgq3d4L3ACS1hJMIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=awk6iBSk;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB66606A31F
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB66606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=awk6iBSk
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7777C4E4125C;
	Wed, 21 Oct 2026 08:10:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4A91A606E3;
	Wed, 21 Oct 2026 08:10:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 61C7210328E44;
	Wed, 21 Oct 2026 10:10:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570201; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kd34s16xr88MTUSbQq/3ajw1gMPQR0dHBf/8zGvlil0=;
	b=awk6iBSkHMfhKE/ifjr5GHE0Sxg4okRqqu4A9BfxbjMlbRo9Tk7eyhqnayqv5FDqQGrRYT
	XAWA4QvminK6k32lA1flsXkA1x3RzKK19AGdlzX6uPiYQcyKvwYP5nEGGq1QS99m81G+rf
	NUStX1Kbzi1UDHspleEY1GFSXL3iiava+jc7K8BpJpDh3/RcaU+lJ8eRIPMx+ksil5fYC/
	3lVPv0tA3VAbC0EQizy7imZa+ubzcrxJ85H5v92rUXquzDg9KW46lgxranmVWgj6m8PjZz
	twLaEA8L+TTHdom+grDIHBawJiSboOd9wWk4pERt3MOheF1ol2kgJjMcdVyxnw==
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
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v5 5/6] arm64: dts: ti: k3-j784s4-j742s2-ti-ipc-firmware-common: Reserve memory for LPM metadata
Date: Wed, 21 Oct 2026 10:09:46 +0200
Message-ID: <20261021080947.3747284-6-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021080947.3747284-1-richard.genoud@bootlin.com>
References: <20261021080947.3747284-1-richard.genoud@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Declare a carveout memory region to store LPM metadata on J784S4 and
J742S2.

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

As this is used by U-Boot SPL, bootph-pre-ram is added.

NB: This memory region is not part of DM memory (which is not retained
at suspend)

Suggested-by: Udit Kumar <u-kumar1@ti.com>
Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 .../ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
index d08fd3ff8a89..51b2d11ab5d6 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-ti-ipc-firmware-common.dtsi
@@ -6,6 +6,12 @@
  */
 
 &reserved_memory {
+	lpm_memory_region: memory@9e500000 {
+		reg = <0x00 0x9e500000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
+
 	mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa1000000 0x00 0x100000>;
@@ -261,8 +267,10 @@ &mcu_r5fss0_core0 {
 	status = "okay";
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0_core1 {
