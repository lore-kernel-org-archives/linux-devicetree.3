Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791A8352C2B;
	Thu, 14 May 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770148; cv=none; b=K6MwXBKHalvSPWW5ifoQtHnZQl/oD/2oxCuZPO8PP6VPGurK6iM88rr9MB4iaiuFndKJVs+5WNjfsLXZa4MlXQP+WasmXro5gr/OOjUQqmKKlc/CCHhZlA0RbRJ8TfyJNqm4UMik0ZKvV1cs4+b4aZiJuCJKMY8m1bUkedl4U8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770148; c=relaxed/simple;
	bh=dUJOBrGNyaBaS+f+GwKjU0is0XDIeGuBT4NBGljSka4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WXSPutw4kbWMi+a2ha0KyhX1GafYFp6OGbh0COMXIGO6WgW6+blv9nsOFPxdSrysuvolmYxTW6zZW0CnFwIV7JKFt7qZHElHx6nuPYGsbwboGS51OcWbPe3iL0EvjCr51G5YXu22Cw3jJaliN8ybKb9AvD0JkWki0wnIvzD9INI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de; spf=pass smtp.mailfrom=muenchen-mail.de; dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b=XOIodXdK; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=muenchen-mail.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=muenchen-mail.de header.i=@muenchen-mail.de header.b="XOIodXdK"
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gGYB40F7dz1r9RZ;
	Thu, 14 May 2026 16:49:00 +0200 (CEST)
DKIM-Signature: a=rsa-sha256; bh=EJ6PtimWkN5xpJhACBp9c+AkdbNaDEVLQdiF6gajTdM=;
        c=relaxed/relaxed; d=muenchen-mail.de;
        h=Date:From:To:Message-ID:Subject;
        s=r1; t=1778770140; v=1;
        b=XOIodXdKHKLPLarYwfI5FnGCzTBfvE5/5doN6PFxUGyAVjgjHcLeLBxOzE3NMAxk
         2J7MmQRRA5Qewxbzm8LVT8zjJq+TMKjTXdegzyLWJaDxq32dLx651DP7cnAtG6cl
         1se2PBTBIfWCwYX0OuTAVq/GzqOuo66Pwn739p5wyiaaSbJvTq2sFVViK/XNIQBG
         F6MKYOJ3ut3A1cF/2dWk4LFgdOgSbMQ/XVRyy5vR/RuSxp6/EWmeF64yoz4Xy6s4
         bc3igVmIYIouBAql23nUgzr3qe+5KgBNSEgPU4Rzi196ZqduKbTsK4xgnh2bqIXq
         sPhaaJVFse5Ev2K/ycDNbA==
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gGYB21c1Gz1r9RS;
	Thu, 14 May 2026 16:48:58 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gGYB201Ftz1qqlR;
	Thu, 14 May 2026 16:48:57 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id RqQzR5Go5WUT; Thu, 14 May 2026 16:48:57 +0200 (CEST)
X-Auth-Info: sv4+CwxImubGKkxTuhBFuWEWkQooRkWsMzw5r1jAoWdr/hG0Idz6DrWM965wp3Ac
Received: from wiesel.intern (aftr-62-216-206-65.dynamic.mnet-online.de [62.216.206.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 14 May 2026 16:48:57 +0200 (CEST)
Received: from murmel.intern (unknown [IPv6:fdea:9b79:8984:1:c250:c287:2f42:db51])
	by wiesel.intern (Postfix) with ESMTP id A644879A038C;
	Thu, 14 May 2026 16:48:56 +0200 (CEST)
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
Subject: [PATCH v3] Enable wifi on the BeagleV-Ahead
Date: Thu, 14 May 2026 16:47:17 +0200
Message-ID: <20260514144836.50101-1-thomas.gerner@muenchen-mail.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
References: <20260512173440.163179-1-thomas.gerner@muenchen-mail.de>
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

Change in v3:
- consider further issues found by sashiko AI review

Change in v2:
- consider issues found by sashiko AI review

Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 91f3f9b987bc..f13a2d1deefa 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -86,6 +86,11 @@ hdmi_con_in: endpoint {
 			};
 		};
 	};
+
+	brcmf_pwrseq: brcmf-pwrseq {
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
@@ -247,6 +274,28 @@ &sdio0 {
 	status = "okay";
 };
 
+&sdio1 {
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	non-removable;
+	keep-power-in-suspend;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&wifi_pins>;
+	mmc-pwrseq = <&brcmf_pwrseq>;
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

