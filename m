Received: from va-2-27.ptr.blmpb.com (va-2-27.ptr.blmpb.com [209.127.231.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C5372B5A
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775541480; cv=none; b=j58ANYV0ReWyxoIFe5RxrPpgaQAABF7plUhYL9vxMnNm0CdbTX7I+WAHvwTKWtNveSB1mVtYYmiASXR8AbqtwKYTIi5vIPBfsh6bBcykoIohDYIFyd6G7XlAw3j4Q4Qh7ghC7KwKlCx/q2p0e/rukslP4dov7WBg68hCZoyx0os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775541480; c=relaxed/simple;
	bh=Q8yesp4F/ggS9SyR9uHzgMHBJyuCzAWFVs5/Ec9oJqg=;
	h=To:Cc:Date:Message-Id:In-Reply-To:References:Content-Type:From:
	 Subject:Mime-Version; b=MsB4gD+v36mGPEPEkiSexlIQ4vXlZuMoJaVhNIOPyKh8LXhnVRcoMqWPpkgRLXnYGoCdoxUJ+2jvobzIJX6lslsfWVXqcBHt69gY19eol4kHlCobwn9vSPCd66BiUKgoCz6StCHGrKHa27cImq0TiVfdrrfMM2jTfXjT0GNZOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=AXFBaGRH; arc=none smtp.client-ip=209.127.231.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="AXFBaGRH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1775541473;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=UlMDOCf69ohHLGRXWTyVugkc2fbCsuKOv08q0JkhaUE=;
 b=AXFBaGRHkdlMjDZsbAGX5wV4JAvkZTO32rOX0ge4eca4sle6++tu7lsElcz10vlujVLuIz
 8Bv8MSfGEZSJWZJ/wODl0FUeKNxQnrIRGFDC8G1e2Hw/JejkRpbfT2PPi+YBGUh059cfF5
 VGQuZgqqYGfxjG695vxZtVCfiWhszk+ed9dojjzd+S4V4dBldqi5wo3aGZd8vIITphKZlP
 di3upjwsYW/lKS99FNjDvRt/nFreRGz0mgZNZXBy0rS7AjRAfMMl2KSi5R5tYxQaSSirpl
 Y0YaiEA6/56nw95FefECfH78qgHu+k9qVjtl8HiHA+qtD9jFusMKp180AuJ4Lw==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Tue,  7 Apr 2026 13:57:38 +0800
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
Message-Id: <20260407055738.1202750-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269d49cdf+6caf1d+vger.kernel.org+sandie.cao@deepcomputing.io>
References: <20260407055557.1202713-1-sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Tue, 07 Apr 2026 13:57:51 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>

The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
which has (Framework) SKU FRANHQ0001.

The FML13V05 board features:
- SpacemiT K3 RISC-V SoC
- LPDDR5 16GB or 32GB
- eMMC 32GB ~128GB (Optional)
- UFS 3.1 256G (Optional)
- QSPI Flash
- MicroSD Slot
- PCIe-based Wi-Fi
- 4 USB-C Ports
 - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
 - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
 - Port 3 & 4: USB 3.2 Gen 1

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 31 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 7e2b87702571..acb993c452ba 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-deepcomputing-fml13v05.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
new file mode 100644
index 000000000000..783066fc7ad7
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 DeepComputing (HK) Limited
+ */
+
+#include "k3.dtsi"
+#include "k3-pinctrl.dtsi"
+
+/ {
+	model = "DeepComputing FML13V05";
+	compatible = "deepcomputing,fml13v05", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_0_cfg>;
+	status = "okay";
+};
-- 
2.43.0
