Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9BE391831;
	Thu, 14 May 2026 18:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783736; cv=none; b=cOBKpM3TfO3OwkoIyMB+5mvUjNj+H5FAFgr4+54zSguVQxBE+G5g78/T0xvSheQOkZRsgp7KBuoehyJEWXxKXI1EFCZjzKA790SGWn9G7TWcFjM/I27H/nW6GAr4XzN+7S9pUJr1fvQ/bwxxLB9WQqLhOFb1aPCN3h5GQuaB044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783736; c=relaxed/simple;
	bh=dpl/85Ko25UPMf0qQId6AnBpvqXa7NfGhALOI+cTkNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gXoEgobntgaFfbAbQ66XxBWj4/ieY8NukkWsL4jQUcxTFO00f5YXWBTCzy008bR7jV46HSRjwexXfiAycPZYjv1w7nJXCMpHb5w0sulUsC0IfR+syhZORxBfEwEb6OcWQnIk3o3f98sDTHDJCMREy1BqeNyQ7kJrB6/APd+KzV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de; spf=pass smtp.mailfrom=muenchen-mail.de; dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b=aDVXlKfW; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b="aDVXlKfW"
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gGfCF2JMmz1sR8H;
	Thu, 14 May 2026 20:35:21 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=XXglz8NDVCPkzw8Va+eIypN3Yb+XLWz+om1xtqeF2PQ=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1778783721; v=1;
        b=aDVXlKfWvLGPS11XQ4WjwZzB9Hztqqe4CGxcOUa/okrMtMhCN/LprK8W5pjSwbsY
         IPg+My3UP2AWgL9KFnAbk7NQHiHE3jZwSXIGof4TqcT5evop2x7pmlMbzvFFeSqi
         79rwrbpb3qzNXQaHAXOe/oZaxpHs73H0dHTtSuzEnErvDXczv1Y/BItnANFBubnK
         rNaKv6KadPGWUPPCQeAtB2IfkxPHSGWF0KTMg8vMJOU+8TjjpQSWgEcuGzQ1EEbC
         j+pij7jqWuVJmXznOIn1D1yETrABShbPEf0UKGc032DzIfGlwWtZ2Mt8ai5oBFxV
         SpUWit0A+gg+0fl2eHhiEA==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gGfCB25mZz1sR86;
	Thu, 14 May 2026 20:35:18 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gGfCB012xz1qqlR;
	Thu, 14 May 2026 20:35:17 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id 0LJ4INDL6bIW; Thu, 14 May 2026 20:35:17 +0200 (CEST)
X-Auth-Info: D3v6/zNXsCMoiky4CO6wY+Q1wyQjFeOR5YhUYxzZj67afQz+tXrfbbSxZx/TCGL1
Received: from wiesel.intern (aftr-62-216-206-65.dynamic.mnet-online.de [62.216.206.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 14 May 2026 20:35:17 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:c250:c287:2f42:db51])
	by wiesel.intern (Postfix) with ESMTP id CE57E79A03CF;
	Thu, 14 May 2026 20:35:15 +0200 (CEST)
From: Thomas Gerner <thomas.gerner@muenchen-mail.de>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Subject: [PATCH v4] riscv: dts: thead: Enable wifi on the BeagleV-Ahead
Date: Thu, 14 May 2026 20:32:01 +0200
Message-ID: <20260514183510.234063-1-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BeagleV-Ahead board uses an AP6203BM WiFi chip from AMPAK Technology
Inc. connected to SDIO1. The chip is compatible to the broadcom wireless
driver.

The AP6203BM is a dual-band 2.4GHz/5GHz Wi-Fi 4 (802.11a/b/g/n) and
Bluetooth 5.4 module. Bluetooth is not enabled by this patch.

Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
---
Change in v4:
- follow DTS coding style
- use generic name for pwrseq node

Change in v3:
- consider further issues found by sashiko AI review

Change in v2:
- consider issues found by sashiko AI review

 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 91f3f9b987bc..e16484a47653 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -86,6 +86,11 @@ hdmi_con_in: endpoint {
 			};
 		};
 	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 31 GPIO_ACTIVE_LOW>;	/* WL-REG-ON */
+	};
 };
 
 &osc {
@@ -239,6 +244,28 @@ rx-pins {
 			slew-rate = <0>;
 		};
 	};
+
+	wifi_pins: wifi-0 {
+		host-wake-pins {
+			pins = "GPIO2_25";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <1>;
+			input-enable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+
+		reg-on-pins {
+			pins = "GPIO2_31";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
 };
 
 &sdio0 {
@@ -247,6 +274,27 @@ &sdio0 {
 	status = "okay";
 };
 
+&sdio1 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&wifi_pins>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	non-removable;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	status = "okay";
+
+	wifi@1 {
+		compatible = "cypress,cyw43012-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <25 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "host-wake";
+	};
+};
+
 &dpu {
 	status = "okay";
 };
-- 
2.43.0

