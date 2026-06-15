Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A663E4C6E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525054; cv=none; b=VNXBHevrLBo+1K65gqm4n820BWERxoiWsuRvAdoR5UrxanMvbsmbWIbhbH30TlXzi70EHGd1AIV7ewvmVzwmXaLSEwfSA6WxImy0P/viuv9Ijdtcqdp0DZD0KT2M2kaJD+egBqBNeaO1LW4Em8pQB9DIwOCPc9bMgsnKpbuWxAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525054; c=relaxed/simple;
	bh=iRWUrA+FeoABsmVJudqAy1L3BhEakdG0HfrnY40ToaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHj/7tsFsLSlFbUUPTKfGXXJqBWs5QIdH3TnpcglMRGe4tIpeEDkABqlde74DwhkgtFytBkW74f12QQ4QgkAIhBnp9z1QKW3P94eU9GbpI0Qp7NiI10ufb2YQ9fjVln2YwUxpd/uaW3occ6DF/pDz1gRfsiAnEKMgglMpn5IoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYxQ44A6; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYxQ44A6"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-517863a2edfso26075801cf.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525050; x=1782129850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRwZTT2w4p8NYfNQ0Ipiacgsycn8UzShxm+qaAwvLsw=;
        b=oYxQ44A6hM1V919PqQ3Kk4V+y32PIbqVdVHCz9u11vGzWO7vaqgAhQlMp5iThqTOw1
         nA3YuCvNb9IvTzD+JNhAaQ4Gasdu0WuixHm14iu4L1eKhYOCKYRm11rcx/8cRpMGGmRT
         igoHv44IP8/DoZ+Hi+tV8xGxnt6NexpFNiMAaVm4CPUw3y4DV5Aoa+v198YPAxyOZuwO
         4SjgDlwx0WWwkkMzarsiI6Li2WncAHrAvSdPwH3sman8LvBWB/EVVnSWImsh9QCp9els
         007dP/buh8nxYHmnujQEw7nUeT7i4rR7lQEKKLbtUDiC7iZoa/4o3GBpp2MGbc0pU/1S
         lZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525050; x=1782129850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRwZTT2w4p8NYfNQ0Ipiacgsycn8UzShxm+qaAwvLsw=;
        b=Gav3TpFq4DSiWSbLdmR7Lf5u4i1jEGbUjkSm+2I4T4aOe5snoc9be+9NXSDfLwfu0q
         +Tov1dbHc6nmfE59L1D89oja/ATQEAYMfV8iO82QwsXckG+Y77EeQI13pYBXKsCJp114
         Wftdz5G6m7Q7WA0sWcNsq9RJ1MLE3AqrgimvkJbnwfR9QVwmbOcvU48hygw7A53mLh4h
         6Yx9Pp9rYamoLObS1UkrUYZ5rcmSdoOi8Fz7Wyqc/9B/YbAuR5XumfD92A0JERXH7x4z
         u0oRfD+hEMYU4DDIGrQ8+Adx9GJrKmutJmRkw7oFwXpk/7DIy6UCfIbbVqDGRP1lSH8I
         SkJA==
X-Forwarded-Encrypted: i=1; AFNElJ95Y5RGbOhXSGgx2dn4VWF4KNjOVBDT0hLisLPg8x5M+wo5Ql1VQKy1jOQFwjlKe9Pqifk/KTn32VxS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9AddEeEmSxzGlzj0cVJXDNKcDtaPWo5ByvwSxEfoKONHFiWTk
	YyMBRHl9d7fGm3FJlXbDu5TKVTmLtK2RDZCZ1WpxSpVuNPnxEIu6JANB
X-Gm-Gg: Acq92OEN65vM8RvMyqSzZKM4KTDZD/8qKy65Hsr4Cx10FFdTOlG0xcCr4fCpPjaTx6c
	2M8YkeJFo6kQPVNqCaUx/TAm+jp0Ie8ZPYpDr1PEEqj0FAxD4RPo/ONFFX+tOUgQCLVaUdZRK0+
	zUpe5JjuRAVasvnh3+Hciyi8TMESnbCQh60jdX1jAeuXsmtuNsxw7gf6mfxESshTIn6xCYrhbvE
	5o7xoQBQYIoSj1cIiaSRhM/v9b3Gy76f5Bsuriy1/gmt9OL3IT+n6b4kOQkiX1y4BHgMiF0Gtpo
	gTUHJSq3pYpJ1GQi5WeGPl8/r4SJhHWPI7pN2RkC91BTjEMLBjkUlTSAsLHoR/QCwrX68y7vH4N
	dz6H9/+5KcgZCT/SfVUNaDfxqwEQ4+n8kbeftNckEHg2ayAc6umK6FHYztZgs+LvgJ1d/cQsfqG
	PtP9NGAo/ibJsQcCvwg+CEcIiOPEj8xk6rIbCY+tJlZKayoObmzGbTnXZ9
X-Received: by 2002:a05:622a:1191:b0:517:5b2c:6aae with SMTP id d75a77b69052e-517fe1de684mr198345971cf.13.1781525050315;
        Mon, 15 Jun 2026 05:04:10 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:04:10 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 2/3] riscv64: dts: sophgo: add SG2000 dtsi
Date: Mon, 15 Jun 2026 08:03:23 -0400
Message-ID: <20260615120324.1527881-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds sg2000.dtsi on the RISCV side.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
Tested-by: Gui-Dong Han <hanguidong02@gmail.com>
Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2000.dtsi | 53 ++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/sg2000.dtsi b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
new file mode 100644
index 000000000000..38462769574f
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000.dtsi
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "cv180x-cpus.dtsi"
+#include "cv180x.dtsi"
+#include "cv181x.dtsi"
+
+/ {
+	compatible = "sophgo,sg2000";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>;
+	};
+
+	soc {
+		interrupt-parent = <&plic>;
+		dma-noncoherent;
+
+		pinctrl: pinctrl@3001000 {
+			compatible = "sophgo,sg2000-pinctrl";
+			reg = <0x03001000 0x1000>,
+			      <0x05027000 0x1000>;
+			reg-names = "sys", "rtc";
+		};
+
+		clk: clock-controller@3002000 {
+			compatible = "sophgo,sg2000-clk";
+			reg = <0x03002000 0x1000>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
+		plic: interrupt-controller@70000000 {
+			compatible = "sophgo,sg2000-plic", "thead,c900-plic";
+			reg = <0x70000000 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <2>;
+			riscv,ndev = <101>;
+		};
+
+		clint: timer@74000000 {
+			compatible = "sophgo,sg2000-clint", "thead,c900-clint";
+			reg = <0x74000000 0x10000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+	};
+};
-- 
2.54.0

