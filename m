Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166E4B95BA
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963972; cv=none; b=k5hoKgSQ9KY+/Nw+sw5jZ/kwtdTsGLOlhrg5X8PasghM/Gs59Je84pIbr8MOFW4Olg/PA3zc9WaQeZpLa5e3kdsJrt9QWk1ER4NbSXXV7tEV+BiprNIgWLloNoO6hsRPHWjvPBix2uI1M45ByWaR5Kzy8xedj5r80PVhiqy+LK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963972; c=relaxed/simple;
	bh=CfdhSE3liIR+0R6sqyadTRehF8WcFvwZ62bfQk1lc2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhDk+glSBLlKj5NwRzhTKSLvTOMQFtrSY2voOM8FpXZV0jON/zP8gNoYj4YeCKsFDzO0q6UuVlLuvDo+m6V/UU3WGWQMBiynFu3vEJDMrwz3WeBVuTGdM0NaEzM3cBcBkTPMrJKC8fKU3eCySBftrkTq3T6imDW8WvBsn9ghmBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/O2uhsB; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/O2uhsB"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd3310348d2so2707192a12.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963967; x=1792568767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=h/O2uhsB8YOMLTsH5NfWgQyJ200WHtiHWGeJ+wYHfoYR7APMYTPTSr6BOU0mu64BKy
         xWeB6gaUe45Sm6niJ1J9q4Du+7x+ST7I5zMxELYUyh09lzd7txdxkJYu39RfvXj/X1FW
         pqIih4Z3vn5KOp7XROfON0816+LAAX4UgRkMpnkcAdigNpIb/f9Wrp8sp05eR9dLqQo+
         IxejC3sKS1b0Dn/o6spJoVPwxwKqs6crnv9CT9rMFgWjVchngpen7wyqWtDEqvXqDn7P
         n/vj93j7Pr7DFMnmPN1XzSe15GpkchglF8fugWVP9BS2HPhV32MKtBgtQrZ7Ecv58k/a
         UCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963967; x=1792568767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=jE2ONQOmozSzLRHIBi3Cv3BjEgkkaeGIH9QhqUcueVUtwQFcbwx8lOyIxAtOeEOGUw
         bsMdKH8xceB8crn3spVDQ3Ss9l+AKjIxR6c3a1Js1rYMFynpq/qqQcVuP5kE9FtvCriI
         /Wqar2uhViWlznJzx9AJN1J5Mli3K16YCIbuEyW/cdRvVHuAS2hRdZwfZ6xJsesEXKRe
         /9slDG77s5M4ns0QohuWZo5Q6hInTmQjReDdpD80s1ZPNBkKD3FcqUdPEE0Ma7hFMdbe
         Jb04LHXMHafUhxlgu/fKjO5DvdWPv8fsgqUqvKlON5D94Izz6XGJ7BGSaf4cvUR+2nqP
         sacA==
X-Gm-Message-State: AFq9FYJQOIK7m0YGOAzRUBLcPDzVkuLWRE1+rZSUC7V1Xb/WuBYKg4l/
	baXJPwr7J8D8t6BEs32BTv344x3nEGx1Ri4d1X7OY6QEzjLgKyLV3FkZ
X-Gm-Gg: AYBFou0mFjGcvKhlm5B3mbNrplinWo6ictxW4Ij225mI69kzLT7MTuPg6eCJOGm3MdP
	Z00cptwvSwcPnNHtPE7JHW9AcG4jvS7b232IyL/hjpY3ZHPAHf1TjuMuaISU8NmokbwRQJ6ox9C
	KS+OCI4es+CWTwxLkTSH4f8SazUx1PpaXtcIO0GTdjrFNX+RHQD8I7bDKQk3HSiV/gcX0HiFI2t
	BiHVrk8P89/8Z/5Ruthw4tmNTkQRP4EVbhYsGsj65ZS70i5HaY7n4z+AKHQNg8/iqDHM3v+dlnl
	n8ytfiSccjzv5O7/fOqSUpIPvbkQGnKx0Wmoi9iPx4rAhsDLOb7P0B7EZf47P9WFXdI77kHc4Gc
	hmtdcIdKVihhwmfjlWEdWOwuPcq1tmRkXNbLE+BKJyNACd9YN/AMF9tWQ6dp8nzuS5kETR1xhcm
	NY2Y5f7KwJrutquO8f8x+e/Yvz6rWDZWqQGZVYtOxETtyd9c57Neu8iL0deEwHxlZRT/hR
X-Received: by 2002:a17:90b:4008:b0:3ab:3767:65d1 with SMTP id 98e67ed59e1d1-3ab3767b8ffmr7741852a91.22.1791963967512;
        Wed, 14 Oct 2026 00:46:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f1fb257sm3293530a91.0.2026.10.14.00.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:46:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Wed, 14 Oct 2026 15:45:15 +0800
Message-ID: <20261014074516.240247-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 drivers/nvmem/sophgo-efuse.c                         |  1 +
 3 files changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index fed3d9a384a0..1b506972d465 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,10 @@ &emmc {
 	status = "okay";
 };
 
+&efuse0 {
+	status = "okay";
+};
+
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 320c4d1d08e6..9577aae08f7f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -408,6 +408,18 @@ sd: mmc@703000b000 {
 			status = "disabled";
 		};
 
+		efuse0: efuse@7040000000 {
+			compatible = "sophgo,sg2044-efuse";
+			reg = <0x70 0x40000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clk CLK_GATE_EFUSE>,
+				 <&clk CLK_GATE_APB_EFUSE>;
+			clock-names = "core", "apb";
+			resets = <&rst RST_EFUSE0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
index 5f90adaf8e4f..568d17b88ff6 100644
--- a/drivers/nvmem/sophgo-efuse.c
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #define SG2044_EFUSE_CONTENT_SIZE		0x400
 
-- 
2.56.0

