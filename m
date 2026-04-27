Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4203D47D3
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 14:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300182; cv=none; b=IG4NvzfLRvsqBtbCmOWgFxBfNaLtVUQBvQuY8egwD9vxXdjp0QmvsWQEe0dbyLkl39DLNVetLb+r4RwAGtNgNv4eqFB1XqdRhBv4yRn2wSrTy8/Dp0fqWjgpk+FATQpCNDE5spRY6WSXNpCwfywWONEegBcItpe7XPJ3u7GtNJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300182; c=relaxed/simple;
	bh=E6gql/2C/4l4EN5/t1h69pFCto1sGxSCF4FEJQ95FnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juZxTuQVXF+hEcSarGJ82DUx6z0gJsGk7J4PusDwZTZxQuRyfto/hqHMZjmnlTzYKz0WIVDcYlYRmzh51JnAZaiVY48Tfu57sEBn1ay+1je6u0lJYEtjfIQc7w2nYXfCu9IYngd5cjVBvZLba3dtmKzWH3Q8WUz1wtyjUKu+opU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gww9V30t; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gww9V30t"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F3571A344C;
	Mon, 27 Apr 2026 14:29:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4297B600D1;
	Mon, 27 Apr 2026 14:29:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BABC1072823F;
	Mon, 27 Apr 2026 16:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300178; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=balMn/jeuZMHswKYCtxOZKEwyrb2iAtRjFm5ZCPg5dk=;
	b=gww9V30tXk5X5N+MJIPuGBiDSRXQrjg+DoQ5ekQP4Z7j3o+H8oR2gCJPyZTLJ6HX3Aj2ma
	QOlgIcvoQNwM2CRD1iqZLKdE3ZMNIkehs13FeiXujDZqsPEkgP6riv2WjnDyjmGEEqPJHi
	NeKSEizXykTp6BcZSrq5EjzVKM9I0FQsSqoLz794xbv9OY/IQJ3Ci4GUadBF2Ag0VK+rIB
	OHl/EcPFoelQ7mR7jB8pt625tIYt5Ppwarutd+2ohrwCysnDIVMS/7tGlxj61d9dOy14sl
	16ciqWqMCb/jeE5cMZ3WHNd1O9rrwbRqz1HitOkylcBojWKEDb+u0+6+J9aP6A==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Richard Genoud (TI)" <richard.genoud@bootlin.com>
Subject: [PATCH v2 3/3] arm64: dts: ti: k3-j722s: Add wakeup domain peripherals specific to J722S
Date: Mon, 27 Apr 2026 16:29:01 +0200
Message-ID: <20260427142901.341861-4-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427142901.341861-1-richard.genoud@bootlin.com>
References: <20260427142901.341861-1-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Introduce the "k3-j722s-mcu.dtsi" file to contain wakeup domain peripherals
that are specific to J722S SoC and are not shared with AM62P.
Previously, those nodes were squatting the k3-j722s-main.dtsi file which
should contain only main domain peripherals.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi   | 14 --------------
 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi | 18 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi        |  1 +
 3 files changed, 19 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index 2a8aba13bd73..d1dbf1e24fbf 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -430,13 +430,6 @@ &main_bcdma_csi {
 	ti,sci-rm-range-tchan = <0x22>;
 };
 
-/* Wakeup domain overrides */
-
-&wkup_r5fss0_core0 {
-	firmware-name = "j722s-wkup-r5f0_0-fw";
-};
-
-/* MAIN domain overrides */
 &hsm {
 	firmware-name = "j722s-hsm-m4f-fw";
 };
@@ -451,13 +444,6 @@ serdes_ln_ctrl: mux-controller@4080 {
 	};
 };
 
-&wkup_conf {
-	pcie0_ctrl: pcie0-ctrl@4070 {
-		compatible = "ti,j784s4-pcie-ctrl", "syscon";
-		reg = <0x4070 0x4>;
-	};
-};
-
 &oc_sram {
 	reg = <0x00 0x70000000 0x00 0x40000>;
 	ranges = <0x00 0x00 0x70000000 0x40000>;
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi
new file mode 100644
index 000000000000..1297813f4829
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-wakeup.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree file for the J722S WAKEUP domain peripherals
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2026 Bootlin
+ */
+
+&wkup_conf {
+	pcie0_ctrl: pcie0-ctrl@4070 {
+		compatible = "ti,j784s4-pcie-ctrl", "syscon";
+		reg = <0x4070 0x4>;
+	};
+};
+
+&wkup_r5fss0_core0 {
+	firmware-name = "j722s-wkup-r5f0_0-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index ad477dd66963..ca10c6904b69 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -239,3 +239,4 @@ cbass_wakeup: bus@b00000 {
 /* Include J722S specific peripherals */
 #include "k3-j722s-main.dtsi"
 #include "k3-j722s-mcu.dtsi"
+#include "k3-j722s-wakeup.dtsi"
