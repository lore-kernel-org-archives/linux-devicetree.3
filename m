Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB73D412C;
	Mon, 27 Apr 2026 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777300180; cv=none; b=aX7Tsy/jXI8DEfOZuSvwpeiQoq81r+6HjC7BguBV9KuOCFzIJXLl2GtfdZuyA94RDGZ8SRoevEy7f34i8LpKCdbRog2Bj8WMLuSJOA5V0rlSNzZCB3clpuqTuCsW5QVeAi3pXbYbE6V/FIfZgAVviL1FfjPzl3027qfsyXFn5lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777300180; c=relaxed/simple;
	bh=3V/9SKZ4S8nUFTtk6kBE5/xeopXltaEBrAoBh7EHQxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9IMlTtmqkIg6fvrNlmNk2h8EOdRwZKrL8Gmbtf/wLc0hk60YJxxklwa7AVpsnlM9O3JPV1viG9MobAPCzYIpJoTo38XZmGDF9c8vo/HoNjvxlsABQ7NL06cXhNTiHv0PQIRUm7S6unAyeuXHQUjbNsaaggZLcgUwhfBCXTptPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CK7EszMO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CK7EszMO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B5CC1A344B;
	Mon, 27 Apr 2026 14:29:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CA69D600D1;
	Mon, 27 Apr 2026 14:29:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF47210728234;
	Mon, 27 Apr 2026 16:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777300176; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=NKABeUwlf/uAaidZSS4m3XCnFnS6ujsftdUmNohI/TQ=;
	b=CK7EszMOccVo5nr3hn5/qWJcmikLNo+rbkSPm3rrAtWNbXM4Bbn4lGq39bDphI1EItSxrd
	ZaJiKNzkX3ldyYpre9LgWh1iT0m2DO4d+RaD0xlpFg7Zo6nKmBJRRRycR0fwcuodcPG0uX
	jpxGVnWiYYNVZVd1lorImPHtUo11IEfQNMwf6LhMWXAyACF4hngOngfFRjoB0bz+qVHcQr
	Jvgb6Qw6fLurWG3kMzWkbeAYQ2E+XOrkcJ+9jUN3gN38FcHIARZd2XPOKkLvzY/Qo5iOYA
	zazUjtK6X9Od03EyxPMHl2rlA7thmfoWmxjCA3t3Dvs5Ag4AAKnpOEEZ/Sjcbg==
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
Subject: [PATCH v2 2/3] arm64: dts: ti: k3-j722s: Add mcu domain peripherals specific to J722S
Date: Mon, 27 Apr 2026 16:29:00 +0200
Message-ID: <20260427142901.341861-3-richard.genoud@bootlin.com>
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

Introduce the "k3-j722s-mcu.dtsi" file to contain mcu domain peripherals
that are specific to J722S SoC and are not shared with AM62P.
Previously, those nodes were squatting the k3-j722s-main.dtsi file which
should contain only main domain peripherals.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-main.dtsi | 10 ----------
 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi  | 15 +++++++++++++++
 arch/arm64/boot/dts/ti/k3-j722s.dtsi      |  1 +
 3 files changed, 16 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
index d14caa9d8619..2a8aba13bd73 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
@@ -430,16 +430,6 @@ &main_bcdma_csi {
 	ti,sci-rm-range-tchan = <0x22>;
 };
 
-/* MCU domain overrides */
-
-&mcu_pmx0 {
-	compatible = "ti,j7200-padconf", "pinctrl-single";
-};
-
-&mcu_r5fss0_core0 {
-	firmware-name = "j722s-mcu-r5f0_0-fw";
-};
-
 /* Wakeup domain overrides */
 
 &wkup_r5fss0_core0 {
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
new file mode 100644
index 000000000000..ab43a7e49f37
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-j722s-mcu.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree file for the J722S MCU domain peripherals
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2026 Bootlin
+ */
+
+&mcu_pmx0 {
+	compatible = "ti,j7200-padconf", "pinctrl-single";
+};
+
+&mcu_r5fss0_core0 {
+	firmware-name = "j722s-mcu-r5f0_0-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
index 1b36dcf37925..ad477dd66963 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
@@ -238,3 +238,4 @@ cbass_wakeup: bus@b00000 {
 
 /* Include J722S specific peripherals */
 #include "k3-j722s-main.dtsi"
+#include "k3-j722s-mcu.dtsi"
