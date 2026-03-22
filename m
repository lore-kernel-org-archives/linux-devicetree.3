Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD779175A6E;
	Sun, 22 Mar 2026 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774155387; cv=none; b=Tqj+c1fYwyCCrJbHcnIzSVU/rDg5fiingNFySyb44R2uEYHvMs339Ori5G65r8OyMQKhwhhXZ10o9vETAOSC3zKJD0YQmO2GElt69n/scUeMuX/kkuAE79W4mkFpwXOxfw8hsJ5b9lvxHStECNkbemuC4ntbP5H2L09sSlzL43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774155387; c=relaxed/simple;
	bh=zkHXbqjuH7xNDRcO/cDCnZPkcfwtiLZWj/z4NWNS16w=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=LpGLq66wpAch3k8cdwGpxITmicqU1EHYExHYCeQA5NJTvfgG/Biroy7phkrYYns6g0YKKjNP9jRWRVa95tjlVQfLt5+WQIussmsgcvh55xpxx3bgZcF4EQbqBOrLG+LWCEDmJ0Nkna7Vd7u5AuzJK+7saVRNb3gkkGLu85fwKrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ISjiA/xl; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ISjiA/xl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774155380; bh=/0ewG1jfRqw2ZDFlfiYehEmV8RlvaqJ8CTQftNgJvdA=;
	h=From:To:Cc:Subject:Date;
	b=ISjiA/xlXtvDOchm3GBM1ejzJiW/vKZBG8tQBKmAo4HlwXCpvyMC7CZaN9OJXOGei
	 pKxaHDKkJJY8MdDNYRCdgVx8Cu8rJB5puNmcDbsuFNE+C52cfzT9f/VKVAnsNDGRn9
	 ltDTTOT0URIaYJv6FgKuPHQny96B2wZWHgCwXc7w=
Received: from MYJGMC.tail4697e5.ts.net ([122.195.139.226])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id DC48220F; Sun, 22 Mar 2026 12:55:04 +0800
X-QQ-mid: xmsmtpt1774155304tsg9q12a4
Message-ID: <tencent_043BCD1F1043957E96ED022D75601AF05505@qq.com>
X-QQ-XMAILINFO: OJYupdf7O4Wt0641tOobxNTBtkln+0Eu/XjveXCPwXzVp1wSRhqRdhDie0MBcK
	 0tmqWCPqiMGx27jp62QZ80nzUo4BS6WMbTq8eWuMPYpHKmwWK9UeQCVBEI5bCYglGuQWLrwVVu8s
	 gKtFkjHzdzLs7k+P7ideEbAhVhyvfZop3YsbGK0BzOLu5jeA33YwWz+vnlcli72b1MxfoYPJfyU/
	 dhGCakzPxPUrPK1RfJLXQW2MUE6lcOD9xJDmau+kbgZcYjkQtCRAoojUL7hi8PZ/CUoQAv0SFCIv
	 dqD2zDCPc8H3l2WDT5C6/NUKCZ7mrtlwFM9Y1mOAkgVFdPSOQxv2EoQVguoZzp1XNfWWFObQPLZw
	 YBMooyl4tXCGjN2qLipeaKDjeLMoi4Ts6ciwmx22mTCC+4ul1UJ653PKBJKo0XweEfntrZvTt3oT
	 Bu6ejGKzRE1E9YbBOFlWXTXclWptbyd31TwXK04A24yN4RXhwOfhRW4aw0ZtzFr49LczObHgsTic
	 IVJkd3XZHcdbmqGypna3a9x+gUBhWhS+EcI28vZO3QGePU8SNg8idhEZrzEjF0zTCtsVTynP8EC+
	 hMSOl+kpgQ4IOhp4ToK7TWnPUR+Ja5diPMWsswo2MSG61pbzjxSXBC7AkBUdQa00iBKIbr0qPHEx
	 SDQV9bG4C6SLGSpk3wMv1Skxl6dwk3viTWiNKuIvfCHSKtXAXaeF82Pb5QPO11wCAfKAJ5hOAAW3
	 bRRawYt+Cgtt+trt851VBXi7SAycyDr1k/XazL9NG9HH2+2nZZis+A0hD6StXV6fGN8bR8mBVrwC
	 +3XyqsSfG9y5YcRxUbEMNklUENZaknCFoTGquXZMKf/yTqrHho7ZAXk6NmLbzaFc0Yan8HoKk7ns
	 8AXGVwnzIYdraHelrhEUTJGV91iOeS6C35waLJfFIuRLjcfmyb1NNpByfJdnCAuVvWU62DaPEIGk
	 AUh01mLntvNUjxa+AewQEFU6IloDwYfqI0LYYDWQTMnZrcX48BioLewn7ajen/jfLOpIMY0pYVLD
	 bu1MwjO39J3uIqEYz4ZsmLGwy1NLEn6nb6T9VaW0qO9v8Xu7ukGrph+Jp7gK99KbyvBZpbLw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: wjjsn <wjjsn@qq.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	wjjsn <wjjsn@qq.com>
Subject: [PATCH] loongarch: boot: dts: Add Loongson-2K0300 support
Date: Sun, 22 Mar 2026 12:54:32 +0800
X-OQ-MSGID: <20260322045432.1280912-1-wjjsn@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: wjjsn <wjjsn@qq.com>
---
 arch/loongarch/boot/dts/Makefile              |  2 +-
 .../boot/dts/loongson-2k0300-ref.dts          | 34 +++++++
 arch/loongarch/boot/dts/loongson-2k0300.dtsi  | 95 +++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300-ref.dts
 create mode 100644 arch/loongarch/boot/dts/loongson-2k0300.dtsi

diff --git a/arch/loongarch/boot/dts/Makefile b/arch/loongarch/boot/dts/Makefile
index 15d5e14fe418..4a096608cfad 100644
--- a/arch/loongarch/boot/dts/Makefile
+++ b/arch/loongarch/boot/dts/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-dtb-y = loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
+dtb-y = loongson-2k0300-ref.dtb loongson-2k0500-ref.dtb loongson-2k1000-ref.dtb loongson-2k2000-ref.dtb
diff --git a/arch/loongarch/boot/dts/loongson-2k0300-ref.dts b/arch/loongarch/boot/dts/loongson-2k0300-ref.dts
new file mode 100644
index 000000000000..f85d2caa94b0
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k0300-ref.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+/dts-v1/;
+
+#include "loongson-2k0300.dtsi"
+
+/ {
+	compatible = "loongson,ls2k0300-ref", "loongson,ls2k0300";
+	model = "Loongson-2K0300 Reference Board";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@200000 {
+		device_type = "memory";
+		reg = <0x0 0x00200000 0x0 0x0ee00000>,
+			  <0x0 0x90000000 0x0 0x10000000>;
+	};
+
+};
+
+
+&uart0 {
+	status = "okay";
+};
+
diff --git a/arch/loongarch/boot/dts/loongson-2k0300.dtsi b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
new file mode 100644
index 000000000000..91062b388e77
--- /dev/null
+++ b/arch/loongarch/boot/dts/loongson-2k0300.dtsi
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Loongson Technology Corporation Limited
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/loongson,ls2k-clk.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	interrupt-parent = <&cpuintc>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "loongson,la264";
+			device_type = "cpu";
+			reg = <0x0>;
+			clocks = <&clk LS2K0300_CLK_NODE_DIV>;
+		};
+	};
+
+	ref_120m: clock-ref-120m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <120000000>;
+		clock-output-names = "ref_120m";
+	};
+
+	cpuintc: interrupt-controller {
+		compatible = "loongson,cpu-interrupt-controller";
+		#interrupt-cells = <1>;
+		interrupt-controller;
+	};
+
+	liointc0: interrupt-controller@16001400 {
+		compatible = "loongson,liointc-2.0";
+		reg = <0x0 0x16001400 0x0 0x40>,
+				<0x0 0x16001040 0x0 0x8>;
+		reg-names = "main", "isr0";
+
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+		interrupt-names = "int0";
+
+		loongson,parent_int_map = <0xffffffff>, /* int0 */
+						<0x00000000>, /* int1 */
+						<0x00000000>, /* int2 */
+						<0x00000000>; /* int3 */
+	};
+	liointc1: interrupt-controller@16001440 {
+		compatible = "loongson,liointc-2.0";
+		reg = <0x0 0x16001440 0x0 0x40>,
+				<0x0 0x16001048 0x0 0x8>;
+		reg-names = "main", "isr0";
+
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <4>;
+		interrupt-names = "int2";
+
+		loongson,parent_int_map = <0x00000000>, /* int0 */
+						<0x00000000>, /* int1 */
+						<0xffffffff>, /* int2 */
+						<0x00000000>; /* int3 */
+	};
+	clk: clock-controller@16000400 {
+		compatible = "loongson,ls2k0300-clk";
+		reg = <0x0 0x16000400 0x0 0x2c>;
+		#clock-cells = <1>;
+		clocks = <&ref_120m>;
+		clock-names = "ref_120m";
+	};
+
+	uart0: serial@16100000 {
+		compatible = "ns16550a";
+		reg = <0x0 0x16100000 0x0 0x10>;
+		clocks = <&clk LS2K0300_CLK_APB_GATE>;
+		interrupt-parent = <&liointc0>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		no-loopback-test;
+		status = "disabled";
+	};
+};
-- 
2.43.0

