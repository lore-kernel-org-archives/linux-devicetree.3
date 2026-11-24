Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511557;
	b=kyV6A5wiQL8qxdEMU3vnR3HmN2lztq57EryRD/nx8AZjadbj6fp59CNURYW+K/+Tya7a
	 UYEyR8koXivuxeoE3LyXZNJ8CfJ2cTMvGakKQ0DNg7iVpVXLI9SmT+5fpG5mQQi0fZNB0
	 NKg1elKnPIkWhNZce/o6gvLgXrJtfVuXD/s3Tri+deXR2S9WYXtuQDP/vEzbF7JX2LVf+
	 RCAM2a9pl9XMKr1zMz1Wm+4cBjY554ot7Dy4Bt3FRcf75W3GkwQKqYzWjvuVZCAp1WOWt
	 54ffOyeIR2xdagbqqQI1HefHmTvfvIt61bcCbD3IIW6cB0jOfxNTeU1VadK+Do0toGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511557;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=UAVsxfMz3/e69OooPsZPrKI++x1O0xtoJW4/SbuMi5o=;
	b=y3E24CxqCRdIhws0Wk5wcAMdrHMWegz5P/zRNb40YuxP41ujLhLOWo8bsFVauWrG/0J9
	 xpEkJZz1EIojwRdex1G0HTT0Gpxc0hB/JtQgg9anXoRoiyWtzqI65RmDTxehTKDEM1/FN
	 IY4mTT6bCV09CNaCBW7pQS0A2ti7qG94+eUmW452oGZKJgkJxZBkfjIviqH4FGcvdkFam
	 PFJ93z4m9RXm7xX78S4ZHIggs9d7RgbFST4+MXH3yNZH3kKbEFD54EsB3ATkrc5gP7EcZ
	 8MlFlUtEsZMl94gjF5t+jw97DMdgRS1YsSh6DHs2DpbmIb1JiWNsyAlLtv9Brc7jPQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kysLkPoq;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A83606A68B
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A83606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kysLkPoq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D291B1A17A9;
	Tue, 24 Nov 2026 09:12:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F9F8601E1;
	Tue, 24 Nov 2026 09:12:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 28E0F11E6A790;
	Tue, 24 Nov 2026 10:12:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511553; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=UAVsxfMz3/e69OooPsZPrKI++x1O0xtoJW4/SbuMi5o=;
	b=kysLkPoqYoyohxCfqRl0TJqCIOaMxHqZwk51RgQgexqGvOg+FWHM1oAXGyFpxolVWxvrNg
	wCeqitqKvaoRWRg/UL5jqk5M6prF+qiLt/lpxQizwaP/RrDTjWDbNQhGm253tsHVj5UpZz
	L+y7iFnOT/F2LlXhd0L+PqVdZQ/vzJT/NQuVmyrWewIJZnTGQjtgJPC15DuzCAsHtVBVya
	afssUN12BY4QmF/6Zvxikm1u6pnSEEVlwg0tOs1Whm4MyJtB1NqzG5XU4zoWlo1q4u7nOU
	tDUi6mzkUATUkmqIN49tRP5jEIN6lmsjsvTz7PY2oxstz6POq7u1JXbkycHS8w==
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
Subject: [PATCH v7 4/6] arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Tue, 24 Nov 2026 10:12:19 +0100
Message-ID: <20261124091221.2593576-5-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on J721S2.

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
 .../arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
index 5253d028da09..6e52c0821fcf 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -6,6 +6,12 @@
  */
 
 &reserved_memory {
+	lpm_memory_region: memory@9e500000 {
+		reg = <0x00 0x9e500000 0x00 0x300000>;
+		no-map;
+		bootph-pre-ram;
+	};
+
 	mcu_r5fss0_core1_dma_memory_region: memory@a1000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa1000000 0x00 0x100000>;
@@ -189,8 +195,10 @@ &mcu_r5fss0 {
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
 
