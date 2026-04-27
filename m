Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989F3101A0
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305817; cv=none; b=nWc2BCTquPUloYUpIB4R+ydOmVhj2dYftxxb2GdxG/ExepKFh6itsyKWuN3SjDD+CAVIfiJIKaH6pmIN8DQlnMVZ8A3LQ+LXiEKP8rgfD3YsRInj+hpKgSdLLGZckAR2DdSkTw0pcyRX7lWYPxD1P2vUtoTOU6OopdeUpQ6/lfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305817; c=relaxed/simple;
	bh=pLeNzDhMEOO2CZWAzWOP+UIqLLYNlLEunUSqwAdvX0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPK7mjNt57F1sNQaNZCXBQ+w5qcFV8KhWjSYX0tWuQ+aiCvW0GPkBMRjmQ1xzEwfB2fMyINvTKTsLLJDNIHRU/BESDRnEtCRdGZlufrjmJGesoBclr1sVeyi1OrE8OBLyXrizfMah9c9FF/rxNDXm0dgSiKxL1CxzoM8P+c/qXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1P0ozdcM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1P0ozdcM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 48D674E42B37;
	Mon, 27 Apr 2026 16:03:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 193E1600D1;
	Mon, 27 Apr 2026 16:03:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02FD71072824D;
	Mon, 27 Apr 2026 18:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777305813; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=R02gxqAxqSPh4eHU4MZSfI68JyjwnM/7FRMfSq/2Nzs=;
	b=1P0ozdcMjP0HCXShmqTe2NE6OuwCmj9pMs0vaMJaOnF9L2oMkubeoQwJcSCvwUGBY1GiR4
	cyV5Te2F2nntzKEQQsYv3P0N4UYkFtuXYSNuQJhMSfWm6pSmyr0Gn/riTWSHjAVvMi+Vtu
	PHwRJ61/7Uy2NXx2xoonMBQISUpZBRU8MuDa4/Ns8uHG8X678GnrToTqVMpHpmIHf7SYJP
	o/5TTTe00WGigqe0ZUJ1BaMWNHy7xvPqHoU7i06qT7GHxIVRQeFxDU8h/3tD1gQqP89RaF
	9r41jwm7j54erBPeZIM71gFqge0rsBGx8xu5li9w/khwiyHeUf+LOW2EkJxCBA==
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
Subject: [PATCH v2 1/1] arm64: dts: ti: k3-j7: Reserve memory for LPM meta data
Date: Mon, 27 Apr 2026 18:03:26 +0200
Message-ID: <20260427160326.370415-2-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427160326.370415-1-richard.genoud@bootlin.com>
References: <20260427160326.370415-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Prasanth Babu Mantena <p-mantena@ti.com>

For TI SOCs J7200, J784S4, J722S, J721s2 which support low power modes,
a chunk of memory is reserved for LPM meta data, which is needed for
saving ATF context and the certificate information of ATF and OPTEE and
DM image. This LPM metadata area is firewalled to be accessed only by
TIFS.

U-Boot/TIFS will use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

U-Boot has to parse and retrieve this area from the device tree, thus
@lpm-memory node are used instead of the generic @memory.

Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi  | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts      | 6 ++++++
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts     | 9 +++++++++
 arch/arm64/boot/dts/ti/k3-j784s4-evm.dts     | 9 ++++++---
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
index 5a8c2e707fde..756928a2d411 100644
--- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
@@ -40,6 +40,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@a4800000 {
+			reg = <0x00 0xa4800000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	mux0: mux-controller-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
index 12a38dd1514b..ceab8f057640 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-som-p0.dtsi
@@ -42,6 +42,12 @@ mcu_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@a9c00000 {
+			reg = <0x00 0xa9c00000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	mux0: mux-controller-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593..eebc5cc7d4cd 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -63,6 +63,12 @@ wkup_r5fss0_core0_memory_region: memory@a0100000 {
 			reg = <0x00 0xa0100000 0x00 0xf00000>;
 			no-map;
 		};
+
+		lpm_memory_region: lpm-memory@a6c00000 {
+			reg = <0x00 0xa6c00000 0x00 0x00300000>;
+			no-map;
+			bootph-all;
+		};
 	};
 
 	vmain_pd: regulator-0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
index fcb7f05d7faf..d0752c8a6b37 100644
--- a/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j742s2-evm.dts
@@ -23,4 +23,13 @@ memory@80000000 {
 		device_type = "memory";
 		bootph-all;
 	};
+
+};
+
+&reserved_memory {
+	lpm_memory_region: lpm-memory@ab000000 {
+		reg = <0x00 0xab000000 0x00 0x00300000>;
+		no-map;
+		bootph-all;
+	};
 };
diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
index 6c7458c76f53..114594f37f0b 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-evm.dts
@@ -23,10 +23,13 @@ memory@80000000 {
 		device_type = "memory";
 		bootph-all;
 	};
+};
 
-	reserved_memory: reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
+&reserved_memory {
+	lpm_memory_region: lpm-memory@ac000000 {
+		reg = <0x00 0xac000000 0x00 0x00300000>;
+		no-map;
+		bootph-all;
 	};
 };
 
