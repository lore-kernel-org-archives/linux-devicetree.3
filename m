Received: from mail-ed2-f23.google.com (mail-ed2-f23.google.com [74.125.228.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7599A3A2543
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760649; cv=none; b=rOCLQHbVV6lA62pLJRR3DWqjccHAkHhm3UrasAidTMkkJ10g5XnCLXZygDV2ekfucp8inrGCsKkyrATUCFfCB3jRKweXlgw7EnqgVhdVSUURqi/tq610v4Bv36En+3dI2O00vb21pv6+r7kHhbFuuTbZ703O84H48n4vAWuZAvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760649; c=relaxed/simple;
	bh=QtaCvtB82nVMHgqJpRLty7FgR+XTbYY1+IELklBAaFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufFvLt6x/TAoOIes/rwByYwg+qRcsUgKUfSR8mAnDZyLel5CHsVdYU3XWzER8y+U/+ZLFpjJWxPqQD23a5F5UINV9WnsYZNQD5qw3Kd5qRAQidGkdGKeEaHGxXwZmedaaTRaWOK4aAhwgHLZkYerhrWhaZ43eYy4aQRAh1wNi8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN60qiSL; arc=none smtp.client-ip=74.125.228.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN60qiSL"
Received: by mail-ed2-f23.google.com with SMTP id 4fb4d7f45d1cf-6aaf8415866so6809150a12.0
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 02:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760643; x=1791365443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xy3iOEWnL0tHwimE1DNns8Vy695o1slJtCha6gEPJ2w=;
        b=ZN60qiSLq7qyqFaG7CoW2kCEMDZNLbg1JoJsegoPZtKthtyPfu0Ntj7Iy1aQEIOj2S
         9dYe9D+DLaAw8KDxnfYB14CPIlJBgBYOLJE3X/0oC30uacDnob3o4B2vijWdxwgGjcYA
         EfCSbRhneduOU8FW4H3KaAhgW+Scz7xR2TI6GpnBnac/zlsuJrahLcOfaI8GLwmMuD2w
         iMHP8/QJB5v9Nz5gtyh3JTSAWPKUFvwDGWA6GLo2QOo7/4xFefkmDSbeNAdC+oNQ2i9h
         PifjParERI8Fc71539rYtz/Iry6yGgIWgcTPhp3nE7AHNCOsTFG74WVTaU2F+VPmm4Cr
         F90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760643; x=1791365443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xy3iOEWnL0tHwimE1DNns8Vy695o1slJtCha6gEPJ2w=;
        b=jNtczKpcJW/kqOOmtbAytUZ5nsW5dyd2b2rwwVZau6FypCkgpc9HOvzu3rGmUePwWG
         QorKYQgwMBjD7QTfG+km2WZQvJCxeky3cPkaJ8/wKXiVLllT12Ciux12tpUQCcfa0LFK
         30c7RIE2rJzAH0UhXj7XTNAxzu77QxNbtAtz2bz1xL8sT18Mr0gxHVWq5MEPpagnrKVW
         UbwGAgNTov2hFE5hwBmxNhQrchyAkv6OaPq+BRvpZ4afFWXC+D1FWZ0GpWjOUlJIMy5t
         SItKrT8+W9+Ina7eQu1iIFKg2QafX3lxSeBjNnKLOQP1X86uPgPscuFPpHGFnr3yX+8D
         jR+A==
X-Gm-Message-State: AFq9FYIwyZdcy4Mt01OOLd8IHdY+EXmjxdjijRDk2HEiP9+l7+I51/Zq
	JrFw3gXCA/+96/R3lAHJDCYkO5JYDEdPhDPdBWDGW1Y/wPBCOX56tr/k
X-Gm-Gg: AYBFou1cOwX+mtaJtrN/0RWlEnn6ZjXtxCfByKkO33D0fIsMh1wKQOrapaDIiVvKENk
	skf5EvyXFEbJBrPGoIIU6dafSKJV9o7YyaQW3VYdk1abg/XbYAGSjuhUfYFuWdqbsgIxLYzH4tT
	sHMpp4w4Ol9YllvZMjZehdKKczHRCbKjXho7YtNGjOW+QTJVj/K6G9rbIR3yx0gBodRNqMLUNml
	b7BuPh7aXP/AuobQoiM+3C45cNFy4/MBAO3ZLV88U30xaDwFksU/9z4Pe5OwQKkFoys2T0CutlA
	m15YmVqaZP5BpZpfNTApdeiJiMXNkHAWJ0UDp0r/RWg5SS2ahiWmJIte/46aDKEC/5NIz9lbPYI
	NzcFL/LfduA4deISEU8F1t/mtNzvIN9goh22VHwVNlqfpNsZkfCmMNY4ch/JXYEakOPm91mXgHP
	JoQQfvevfkvSAbf8R4j77eZJWdV0TbWf5iinpoS7WqMJD+1yYD9wRfDp1swmcqfuFHwE+BPfSS6
	UimlwnarQM=
X-Received: by 2002:a05:6402:24c6:b0:6aa:f1d2:ddaf with SMTP id 4fb4d7f45d1cf-6ae1992a5f5mr389769a12.10.1790760643233;
        Wed, 30 Sep 2026 02:30:43 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:42 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:07 +0500
Subject: [PATCH 4/4] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-4-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=2276;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=QtaCvtB82nVMHgqJpRLty7FgR+XTbYY1+IELklBAaFQ=;
 b=14smWAzHi2xRrXpAi13KJaNbjx0ttZoWTFTNLI/D7Q5zDrRvqa5emJFRD2xr8nDIQxXywPHPT
 +IVUk/ck9r+CLpAB3/8taFFhgxzFtu2slMMBjccsD5WGzHH/SqcCadx
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=

FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C board
and allows to connect SATA drives to the device.

Add overlay to use combphy2 in SATA mode.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile                    |  5 +++++
 .../boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48c83f79f83b..45e94a44107e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
@@ -275,6 +276,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
 rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
 	rk3368-lion-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtb
+rk3568-ok3568-c-fit-pcie-sata-dtbs := rk3568-ok3568-c.dtb \
+	rk3568-ok3568-c-fit-pcie-sata.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
new file mode 100644
index 000000000000..474488ea994b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C
+ * board and allows to connect SATA drives to the device.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie2x1 {
+	status = "disabled";
+};
+
+&sata2 {
+	status = "okay";
+};

-- 
2.55.0

