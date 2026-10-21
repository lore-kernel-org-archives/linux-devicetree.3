Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570202;
	b=SrnP+Ws/QD9wEOpNzO8qHsIGp/nDuK15evqSys1zK/qIUpJ2YQHeAEJRl1F7HHBGiBqD
	 WVrwms2ENYDOr/8k+tmVTssoLmIrPyt+52VW/DHU3y1ZaQ18SMFWvemc06yS/m/uZslUp
	 jyVNorNpGqFA9Bn9ETJ8ONyn+wkGIYHJlwvHOTmZp1/s45tvpZjXhUEdCRJcs+DpbiTwL
	 YYtZtoLbm8E7YioO6AMTn8cvSPPcHDAgNNefha9wWtMyseLOJuF8pKE76YJ6DzwRMvOzT
	 PIVE19AA9wTOdZGMdYjRjp/IrAnqpeuymfl7ZPPodxHdLSo019s9O6M7anr0wrQVr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570202;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=xUALyvtUXYfkbKIvNlqiBzpv7vLH5wP8YCmHD2a1OBQ=;
	b=0FD9IkJjCcR4UqOLVEzWTf17b/fc+Y96OgUrZRkMbXSShrRQtij1d+byQ90DglV4jbNf
	 tNXZK8MmRWvhhdmMD0TSV0hkHSI/XldTm2vv9EqzKX3q1ghb6krO0lCXQy312MdG+lbn6
	 XhTmtgAelf+Yf6fa/rBUHFJ8Kena9/0oYU2siH5/ScHRm8l5OYGoDIpUPZGzZrkXg6Ikx
	 EC/SozUEGPsexbZE/47LHR+oNswMv98nb8HIC1sVkp2qrQOGAM+e5XFYgwqK79vXnn+iL
	 8WIPF4K8GsXsNHsmXSrh53fDFyTtP+nTBT1YroZV9m8aXvyP6mY+4I7DDfWMRU1tVlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XYj3T8fe;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C616606A328
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 08:10:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C616606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XYj3T8fe
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D6DE0C5CD73;
	Wed, 21 Oct 2026 08:10:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 091FD606E3;
	Wed, 21 Oct 2026 08:10:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACA7310328934;
	Wed, 21 Oct 2026 10:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570199; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xUALyvtUXYfkbKIvNlqiBzpv7vLH5wP8YCmHD2a1OBQ=;
	b=XYj3T8feERm2tTvVGFaDfxrHgs1EWxdJJzrU9wkdtHBgOQuKu3dDPE+NPH8LhqT8mcjaHv
	O+jcrh/mYnQI29Xf0CFIZSa9s5XvFOkTC/TKPqXGW09qMiGAv3Ya6bt/8nyBwPEXEeaB2h
	VkFub8Wy0S0GDxdY0fOiCSySBHOdoxmCSe+Eo5oQqPDUkrLhcfKVmCefba5a4HELc1Guy1
	izsBNm3YMgGdVaPYV6/n1FE82PKt5YPXkCMavExdgG9dy4hqKR7KXUo6xoEO+h326Ucll+
	o6k8VSXFyUX04Lm8glxWYYwOF2b9klCLd37bDR26VAq2nEUDdPBdD7w9XQqhVQ==
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
Subject: [PATCH v5 4/6] arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM metadata
Date: Wed, 21 Oct 2026 10:09:45 +0200
Message-ID: <20261021080947.3747284-5-richard.genoud@bootlin.com>
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
index 5253d028da09..010d20d56927 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-ti-ipc-firmware.dtsi
@@ -95,6 +95,12 @@ rtos_ipc_memory_region: memory@a8000000 {
 		alignment = <0x1000>;
 		no-map;
 	};
+
+	lpm_memory_region: memory@a9c00000 {
+		reg = <0x00 0xa9c00000 0x00 0x00300000>;
+		no-map;
+		bootph-pre-ram;
+	};
 };
 
 &mailbox0_cluster0 {
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
 
