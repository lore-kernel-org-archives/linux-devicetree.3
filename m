Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2A48B39A
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909663; cv=none; b=MwRAq2SwvBg6Xrja+gBVOUS9MlSiND5d7ETEw8sBkw26ZmiQdtFqfmU3SJekLtDFQzypPgM46KtRNG4iC1CMXs2cY7ui+P+qg2kBM5oBSiDBoHczJVHvTf500V/6S7tcOahv5HtmZUZ2O38QqDLf7wHU2XzNO4KCrQT87zKpWIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909663; c=relaxed/simple;
	bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnMFiCFDvnBi9MTYB4N4R1Cy+peXKLNpMTsNSrox9Z2/SRAZHb5RquZ74XpNEwDwAQBo2YaRBTx4RM1sR+m6ukLHjnX0affhWUT6dv7tYGiLKSEE8e0h97B+rSQ3stDnzO8HkOziVmNCqkpOdsDhPtyJMxeTl00Y4viimZCgSPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QdGI88gJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QdGI88gJ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so5454315e9.3
        for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 05:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909660; x=1783514460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=QdGI88gJ6VEbZ0TeHMDLnP1cf393cUXwjNaWyhKFCSBHpVh9EOG2KIauyqicFIfn5l
         IEOuf6M/nmEMLUFAbryJVf+v4Qu/fnSGsb0rMjl/afO9p/6AB3LpGBVjGy/YHLoCgKgb
         g0Y/vHa/ib2L3cODD25f77iEYdNu/YW+CuHHlmT2RMicX40VEXeiFZbX3gIorVXza6uA
         D9DEoC2EvMWzuXVaEpMYKcpi7nZQYIfHsN9urUrBc0qpTVLklqI1/yFk9Ruo5n2nqoL5
         ykaF8yEIvbFg/craeIpR8nBGgxTEdDLbSPFb/rfxwz/+pGJ4JUaboWrUVEhqHWu0Wl0x
         qkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909660; x=1783514460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lqaukFu1EPsm1kXkP/P6lcFJRHqLfOW4xhG2qtptWUE=;
        b=QUSrVhdlf41St5JS2vwDqHIQ356XRelbNrCtSRmfOb8awKqUE5iawRebuZ4iI2EFAp
         dxVKydsVAdRYXFhQAyhmtXzGy3hvP7rsegi4dOwQ2T7aKzcsaDOE0agCqFfcFjg4ImQi
         sp4vgQE0lPhcGFq8OTFByGO/Tjk7uK6k0Vfhra9nfm0oJf5pFB3+tPjOqeJULDK3hIbk
         HTTzoczOsx+/7URBNJZdzlzrTZCO7P85VMLWUhyuPvc3G6/RI8fA+VL8+Uo9O3vPKTuy
         Nu0NHZHB3yemhrRF9VJGFj6ns9xNqxkzrB5RJiOJwESW3OUBMGO5MpKUp0wAwEbah6A1
         nw3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8GqU1DaXjH76faP1CkASxggfO0CSzl0lIDlbc4mRTziLzn1sGJKLr9DAiAZL0nZAga2Irm4qfwDQQo@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1H5+gygegMynxTTo58SLN5L1Yu7NE/JEgsvJxQucA2KzEEDG
	u0wMfE4sxsXFbR6lDIu4KupRvrG9xzfxtEFOnzKcGxYtUa96S7/uoY7rjpyA8MZZRlY=
X-Gm-Gg: AfdE7clNcvX0FqWgD9ae9HbVmDUmkMVzQMwv8kzlLGagDas0zvbyLkEPsWtnWZsq95i
	Jz4p8Xfh/Avd5yWyQqUaPZTL/YHSY1NuA+ufsSmsYKfRRJIGrzBUN3POSjCVuuDE9kgTf9kIC2J
	FFStkR/RT1uvPIzJTNAh/b1HEncb8Rmb/9BwoePPvyfaNvJHPazyoMvoZrMxfBqVSjUs2f29P9J
	BLomSCtW04Di+U7nkj8Bu35pVRF/6pJ+BUZkrzIbZ9QQA+WfG+ev8Ra8Hbi/thUfKb3gKPhscZO
	ypWeUJ4ME+fm2iL9PmGn8TeJEObsBptzO+/qzKUh0gc/6u2a8sGIylxkFD2xZF7x5SyPa6kg0AP
	3ta9irIyNGk+NjdMYF4Zv3MS+aPe9JNTPRkxjztRw5legeVW/olXwu9kK6Ti6ZVFuxfxf5+MVe7
	vS9CQY2YsT8A==
X-Received: by 2002:a05:600c:64c5:b0:493:c3e0:99ab with SMTP id 5b1f17b1804b1-493c3e099bbmr6525025e9.25.1782909659880;
        Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm16706618f8f.7.2026.07.01.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:40:59 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:21 +0200
Subject: [PATCH v7 09/11] arm64: dts: ti: k3-am62a-ti-ipc-firmware: Split
 r5f memory region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-9-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uNbI68quCVhemPUrUjI6ewPk437iJOJNtQjYHPuptSs=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrm2V9Rw2Z3rP77/8pCBdKe/tOcddbSVHbPe5CB/+v
 l5159/zHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRJ7sZGa7/n+/tk6GguC0o
 ZvLfCWzPV95U3Jofu2fT7BsbamzaOK0Y/lee19j38anq1PbuTLeM/QyrpLwC5na7+u2/p266gu/
 5KR4A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 .../boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
index 682b1c9f3071ddf23044c1fde1e88f2b901ec64c..fe10d3e75ceee35f84d34b892f9925efceb7743a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
@@ -36,12 +36,36 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d00000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
 		bootph-pre-ram;
 	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b60000>;
+		no-map;
+	};
 };
 
 &mailbox0_cluster0 {
@@ -78,8 +102,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0>, <&mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	bootph-pre-ram;
 	status = "okay";
 };

-- 
2.53.0

