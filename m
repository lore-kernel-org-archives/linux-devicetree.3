Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511555;
	b=Zkv82LS1dznivzmDs+Pp11ILoRawPSK7hOYJNCxLsgo267PrskgJygTkzga/BbEJgAVU
	 D5FWQNUX60fU7fVrw1k2CmVBhO/75SMUp2VrYKeTN/2BNHu+8f/oKwtEMPY/Te4xSSjLm
	 ZYLArqF/WfwvAuHkJkEKZ5R82ZD9JtChxEfHXciBexc6hp/TDarmRnSxjDpRTmPkBFHlm
	 0s8PM6UtT4Ns2le4VY7AfzDUSrl2IaYeY0B7cKych4ysvE5VOJXbBHHMka8gniZYDWS3y
	 KXDLE1v70WFJdVd7lcFgWqrQwvtJHDwWCPelLTRhJ7/f6tDJ+XCP8ebrwzJrletGPgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511555;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=fEXjbUD3amkNKeHH7e/GPwXDSWv2ghLrxMI2EJ9KtIY=;
	b=ORvdECUcW4KiDxDZyG0sr65a8SYK//feGSZYlMlSD/Z53d08NpJ78eXu4AZJPI9rTNOC
	 PWXgIJEF0IPZqqDX4u7TR8pSkF+tX0jpfnAqkD0eW1kG3Z9CXGR/mtsG3MIrZ8tJHCpL6
	 09o8ncq4GUBnXvakyXa8uXx5gr5drr/zS5I8y7Z69FPdp+dJQhMI2jnPUwNsM56R/KY23
	 PioRC+Ghw9KYm4auaovG5yiOmsPSIe+yZ0mvmBlMgfH2AIFxyQM2USlFvHEhvDi3gmtKd
	 cVwOtngwVP8o9aRXFGXfbKqjM3rOogNlx+zn4Yel4kaZd6FnVe7ohMMc5M/eFneQIvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ErCqjUPf;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B834606A68B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B834606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ErCqjUPf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3C5AF1A17B8;
	Tue, 24 Nov 2026 09:12:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11D47601E1;
	Tue, 24 Nov 2026 09:12:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26DFB11E68A4D;
	Tue, 24 Nov 2026 10:12:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511551; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fEXjbUD3amkNKeHH7e/GPwXDSWv2ghLrxMI2EJ9KtIY=;
	b=ErCqjUPfACITRAZSHcE1Ki8qfrmP7+DRQOfB6IVHGiPiDgmNxrKsypKo5cKWBi1ivnHQ7w
	dem6dhSjFSn2mI7WHAhJUPuUl5Yyvbpj6CiPJCuAYBWzcdc5EMlHeDxuZymVLcvC8BGOGV
	UCF2JXK3dAMZ+u7x9mTfnDisBd4cgBuJzWOtTBqg7NkdOCF7vL/kFjLniGK44AIa1sMZ2D
	i4h0l05JoNBHBw/KgcLevzctnQBrfvPIIxx10a61HcEkeuzFmBK/2Eb3SPdiS1Xv/2bsMq
	+w0RjNiah9u+QxWao90Ju3IkbZUL4NyYRrF1NOOM9MfqH9w74zZbw6L7eztStA==
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
Subject: [PATCH v7 3/6] arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Tue, 24 Nov 2026 10:12:18 +0100
Message-ID: <20261124091221.2593576-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124091221.2593576-1-richard.genoud@bootlin.com>
References: <20261124091221.2593576-1-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on J7200.

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

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
index d65f68c7d432..a6043970715a 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi
@@ -47,6 +47,12 @@ rtos_ipc_memory_region: memory@a4000000 {
 		alignment = <0x1000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@a4800000 {
+		reg = <0x00 0xa4800000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -99,8 +105,10 @@ &mcu_r5fss0 {
 &mcu_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_mcu_r5fss0_core0>;
 	memory-region = <&mcu_r5fss0_core0_dma_memory_region>,
-			<&mcu_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&mcu_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 	status = "okay";
 };
 
