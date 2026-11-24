Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511561;
	b=HY/Aez+9ivcpIQJ2I/2Z8ytNcqS+zul1vNEqMmUylFWjd679dF/L2XCVB9rAabwex3la
	 q6h3yF9yNw6U5HWev3l6xWPYbWr/u0i0dkwYYAJKPp8p6iVhNhlWY3MySi8nmnqmqr6CD
	 dUuRsLksaEmeMM5IFVTKgC+EOO5H7OMH4cvGtk/CVATmUVnYAm5esvXf4+Ni8pSnnbHFu
	 cHNhVDcg+jU80Ir0pMbxiHoD+rLhlWYFMIChlmng1nNCYt6wYGQ+mmIdd6J9pUZ4JY6we
	 xcyafirRR8cBsRYgR/QIhM32yr6U8y5bgNamQpZRkjY4TlX/swXrsxi2hno4tT/xJKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511561;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=PRJi50mtDkCTYBP7NV+RqEIe0+Z58cVBzstfeiDJZnI=;
	b=ONOD9SpNnTzB07lBy6tycC0HP2Z+SiA4nS1i/OhPSWuBmED/42gseedlH++TrCwiKMQ1
	 Se2mfR1HsqlfbIMdWQ3KZDz+/GCMAzqgPlt9h1mdPrCPwIawymkLY2zNtDODrQzKQXm4x
	 gcYw3v4+CYsT6dtwEtJwu6N4+h8Q/DyrWHurqtUAxtnJSDBmZX2hPnEgytK4dxTm3Kud5
	 lCVHgJ1xsaExmbT9oP2U72Z7IJ/0IPvBhH1E52OxH6HVqqIGbhn8EvZPosKvkWetFfN2+
	 kLei3C9hJbuXJRC+RBVbsR8TkiLn0N2nihJC6VsUErMaIhUwhTatWXbutcBfAAfVH/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="X0uqcui/";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3664C606A32C;
	Tue, 24 Nov 2026 09:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3664C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X0uqcui/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F3BBF1A17B5;
	Tue, 24 Nov 2026 09:12:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C884D601E1;
	Tue, 24 Nov 2026 09:12:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B957611E6A5DB;
	Tue, 24 Nov 2026 10:12:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511558; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PRJi50mtDkCTYBP7NV+RqEIe0+Z58cVBzstfeiDJZnI=;
	b=X0uqcui/Ml65OSyYJQaLGypiGdIoRdWNPw5kWVCNKPfVlp1ec2CWFhlsqk+m+qJXzeH5oH
	8yPk1DWegx37vHbg8LuEQ3HX5YIfyYH1/bW3v2tZUeVh/s2JbtbJourRvvJVVsvH8rCBqk
	2bTDNiHNW04GriJPhXJxLXlEtzAHQGlLxhlxYwgYyTS8M8lG+AOJQozyuSJLPayM1Ap0hR
	GHgsat/X7LeqRZAphzuxD6ZY9Y2egaT40DPOd/QimisCildOF3xK+uJejysN93ActLrWSW
	xW5uXlgHhc4fEUBIoK5a4aqdqt7cIIk6Cd6mXwCWef+8hJNrKtwY2Rayd6ucpg==
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
Subject: [PATCH v7 6/6] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Tue, 24 Nov 2026 10:12:21 +0100
Message-ID: <20261124091221.2593576-7-richard.genoud@bootlin.com>
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

Declare a carveout memory region to store LPM metadata on J722S.

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
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index a59c3648d805..9b7c3c8df427 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -6,6 +6,12 @@
  */
 
 &reserved_memory {
+	lpm_memory_region: memory@9e480000 {
+		reg = <0x00 0x9e480000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
+
 	mcu_r5fss0_core0_dma_memory_region: memory@a1000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa1000000 0x00 0x100000>;
@@ -122,8 +128,10 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_wkup_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_memory_region>,
+			<&lpm_memory_region>;
+	memory-region-names = "dma", "firmware", "lpm-metadata";
+	bootph-pre-ram;
 	status = "okay";
 };
 
