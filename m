Received: from va-2-30.ptr.blmpb.com (va-2-30.ptr.blmpb.com [209.127.231.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3512B2C1593
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 03:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774928802; cv=none; b=GgpvKdF3Z0OsA5LfqqfhZaILibDUk9Ucdi06NcL1XMZv6T8kUojXVTjmITukD7qA2ocEumIVUNfg0QaMKEwlx8o51rE23wihv8+E3Q0UsXgL+kncdFOlW1c1hq+nFwlaIjwVoZ5filcamjBePDKPX1ElR64LYJNYhgv5FdJuOng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774928802; c=relaxed/simple;
	bh=Be95sgJhy7tl+MSgMsRMfXH21FS10pz3vyy5Zu2uGEs=;
	h=Subject:From:Content-Type:Cc:In-Reply-To:Message-Id:Mime-Version:
	 References:To:Date; b=VenLO+aGOSOD0T+pa3zxQbUFfvtNAJe8i+xcbunmihDdZ/AELLWkr46FQ44fE4Anh2RbZofFfFATC9276HXwIikONMaYxxrlZfRlHEGdjWjWe5nSuUCW2p72onnhdouuMsLecgyu23pa6K//wsLTbPjhFMLJKITcpPyk0iGZnQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io; spf=pass smtp.mailfrom=deepcomputing.io; dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b=2TbslbfP; arc=none smtp.client-ip=209.127.231.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.b="2TbslbfP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774928795;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=adbwCMKb7Nv+mdDYBK4X6QCJvMGtjE/qyJ+e/ZtD1z4=;
 b=2TbslbfPgJvggZEJYnssijhc8RjZNFrU2dGRNw0NxBxTjdHCUfau4tbOB3GK9tDbG571pr
 cCbF8UsyQr1H+c/+yCmspwGQ4Q3SPtnaTP8e5qlVBpiuXzqwm1gQI52/mb2eMyaDaoba6L
 5ttm7FwGgP/NZr9uNybUhSZF6D8CvoDF7HQ/bJU4P00/XZBWuGykG1fZG61lqB5zB2vOm/
 x+HiegtgzO6Jwhrn3aKxSaKXaxOSvGHWH9bV6aOfXPhuLQ0VnUWBssTpg4cV1+u8ztkwWb
 Cqyo2HSfNaoyi+vDjEhTDdZAePPVTBixpSqeFGS7yRlEmIFeI7QQ2jacfBCN1g==
Subject: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05 board device tree
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([121.34.226.213]) by smtp.feishu.cn with ESMTPS; Tue, 31 Mar 2026 11:46:32 +0800
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"sandiecao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
Message-Id: <20260331034616.67183-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269cb4399+b70b96+vger.kernel.org+sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor+dt@kernel.org>
Date: Tue, 31 Mar 2026 11:46:16 +0800

From: sandiecao <sandie.cao@deepcomputing.io>

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

Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
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
index 000000000000..2343ae3acc2d
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 DeepComputing (HK) Limited
+ */
+
+#include "k3.dtsi"
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
+	status = "okay";
+};
-- 
2.43.0
