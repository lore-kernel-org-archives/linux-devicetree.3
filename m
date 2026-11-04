Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753023;
	b=4dx/gGBVuM1Aqfzlu0MQcvrfxJeWQL6vtbrevB2uwCu7N2dN0WTg64IRH5KAtP1s0Q5Q
	 FzfrvlgB7U1tLa5xY00x33jBd+qHUmYFqSjcKRTuQT0zS3+WGYkf9XR7j0tyJ5zDXrOCo
	 eBe2CoIvNknfKr4hMS7itzXmZGVxd1PndAITPkpoK+WnjTKcMEc7nZnvkikDau/rsuDvI
	 22peL01qYhhaU75tpEWjKhLU78oSxj3O9pLxuHivbkpoGZJ7Bz41J8ZJv+oRyn0B5ynNW
	 zxlOjZZ5YS1jCTED0wGqtfpnFM0mYZPlvFm3AKOy8vjD93iVRqKC6/w2S4kVJafS7iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mn2wlSdrPtoK0AByt9kcTtRpjsIkrlwZCuclbUIlP14=;
	b=Jx60LAqrSE5wMQRrq9kxwYeiZGg2VuqP1j36VcrKOB2xYfEk6piAlIAwhYMVfGK3Se/J
	 cWoNVGDo+yjTAB5Lr7ezNoG1abeXC6ssswhJyi5p026FNFspbx46c2RkZ4dQVrBI9cu2o
	 7NTh9hcxT0lfM4JE0oXRqrkc9FzFdTgc+LUJhkgc4D0e/MaXfB4ea8jd4Lw1i0hNGM0dB
	 nEjRLKSv94R/8VwXoBV7uUEMxdhVtopyDbvWTrvqOg79/ggfuMGkdIodih65ZF4yQRNu0
	 LbNgGAXIWfPBA86XaXIPEgyb5B7hCCNVs2d5v0l2E5y6f1dO92riTSGmkwFnjSRDFIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fn64p3nq;
	arc=none smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D91C606D80E
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 00:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D91C606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fn64p3nq
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4ad4072943dso439fac.3
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 16:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753022; x=1794357822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mn2wlSdrPtoK0AByt9kcTtRpjsIkrlwZCuclbUIlP14=;
        b=fn64p3nqZkIa8eTNuJucSsMoBbKB/0azNq7XEud3shqMTmE4MFiz3b5L6WLwNqSvFP
         4cwviZIUgerwC7gbp64S6VDw3t2sTHlbxl9cmbyLJEoFBQaTu3IBtKYqLSNXiJBT75B0
         6u+QkT374/x7ssPeFmMvVdztmuls9r4oC8tAd9kFOrDHxiTSmgwcIBShPwcOOj3YSgPX
         RaKBdGbptDyObkA74AuDKxkchXPB0dDgKWZNzkIAUoepJCma1PtXExsNdvyEbM43gwsF
         32ak5xzsCzq2hwzu/13RiStbE+FVhEwA8GeDkW0+4l7ZydwOOVA7N+t1k+vSlm9D3gbc
         qXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753022; x=1794357822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mn2wlSdrPtoK0AByt9kcTtRpjsIkrlwZCuclbUIlP14=;
        b=munB+f2/l/WZnubnPZrrBDUTUAUg/nUygvohW5ph+3DB78kzNFPwIu6c++UZfhnDEk
         upxOU22/wBEhHuWXoj2WyXlquKgcqX9mOFTmGFVAqyykht7ZI6KADiEr3HpvPFXXrwFP
         XWZack0RT9ujKTU5H6pynLDaxow6SmPoahMn8KtuS8ICq2txsKyuNcPLfoMp17vuhbB7
         Gi6em75q5Prqjlu8d6eOVRMVCQ3+k8poormSAZ/NpBEnYeYCE878V6YgSxXhULwTff/R
         Fp4/vQjObIIeVM5G24V5sJ0T3qkrsEHwd/U8lFIXwL1AhCKsVpa9DmvqA6v6q/pQ3GuD
         lliQ==
X-Forwarded-Encrypted: i=1; AKwUvBw33UVwk2UDjMSKQb5vosI9MAPMfS8uCyzdusiSIwNrHq8q5PJ7/ER8swug3Eo19HMadHnyCjcBqO/5@vger.kernel.org
X-Gm-Message-State: APuU4Z9kRjCHelvttPH9ZkJPuhKtSkqSLscW/JcgZ1Vahngs1eQbmhNU
	HEbgh3y6Thh1LcnCBq50mrNXmJG0+I/GoyXlsxBytiwzxKvuiN2G4bzYh4eH1DDpaAE=
X-Gm-Gg: AYBFou0V5Rlryjpis70Ua2xxdVaFSOo0EB5XKTLrLvPCaKryFFi0RKmWa5SVDi+Exjh
	fxHwxH/hzdhBnLeqLKnNsaWUQddnEERHQQJ6c0MmHh/v5ATSmjweAAybei8DITpGyD91vuLtApo
	E7ppIJmsQQ+iFKhb4mjo7xvrbXNRYkObviQsMRWkUmKO7+dgzOXDg5UczDTUtmAzNv8bNlr3A+b
	NUo5pL6xyLprQOwrO9/ANrfdBgFs5+UPUsnb7fW6kMbAPZvH3UJS+Mo1buCIajA/pkQ6TFx3eec
	l0GKjoUhF+/i60rt2MqkzLcRS+xvoygaWRUAvOkGLMbHL3+zzCxv+vUr5E/srNGbsud0t8PZSHF
	pSa7cXGR6OhdarPG6wVSv5vB0G7LyEpFOr7TVTtTXFbl6nfPcE9fUcU7hZL1bSScIV5Jw/az7R5
	YZnVWDPsw+0I9+YkOWH+7wTqQsmv3lwWKGojmE3TdhMjjll5BIjcmt16KrjQTEAQjoq8TA6udXd
	TbnRtUQrBzO7cfZp1XccockQiwhJmtzXv3/rnT0obsho+Vy2V11D8sx9ulot9vwDS3wVxqrRjun
	v1CZJFsVnUSaOQ+s4plVqZDRVhxXoK2i5iU=
X-Received: by 2002:a05:6870:16f1:b0:48f:e0f6:c45e with SMTP id 586e51a60fabf-4a907722e6fmr9609953fac.44.1793753021390;
        Tue, 03 Nov 2026 16:43:41 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:41 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] reset: toshiba: introduce a TC9564 SoC reset driver
Date: Tue,  3 Nov 2026 18:43:31 -0600
Message-ID: <20261104004332.2141282-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104004332.2141282-1-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a new platform driver that manages reset signals implemented by
the Toshiba TC9564 SoC.  There are 13 reset signals available, but
currently only the resets that are (or will soon be) used are defined
to be controllable.

Two registers manage the state of the resets.  The registers are
accessed via a regmap supplied by a system controller.  Access to
the memory region is provided via a BAR on a PCIe endpoint function
embedded in the TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                  |   7 ++
 drivers/reset/Kconfig        |  12 ++++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-tc9564.c | 135 +++++++++++++++++++++++++++++++++++
 4 files changed, 155 insertions(+)
 create mode 100644 drivers/reset/reset-tc9564.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ee01aed56508d..8389b11fe6e1a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28355,6 +28355,13 @@ F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.ya
 F:	drivers/soc/toshiba/tc9564-syscon.c
 F:	include/dt-bindings/soc/toshiba,tc9564.h
 
+TOSHIBA TC9564 RESET DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	drivers/reset/reset-tc9564.c
+
 TOSHIBA WMI HOTKEYS DRIVER
 M:	Azael Avalos <coproscefalo@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f3..8c1b08f4eebe6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -358,6 +358,18 @@ config RESET_SUNXI
 	help
 	  This enables the reset driver for Allwinner SoCs.
 
+config RESET_TC9564
+	tristate "Toshiba TC9564 reset support"
+	depends on SOC_TOSHIBA_TC9564_SYSCON
+	select MFD_SYSCON
+	default SOC_TOSHIBA_TC9564_SYSCON
+	help
+	  This enables support for the reset controller embedded in the
+	  Toshiba TC9564 SoC.  The state of reset lines is controlled
+	  via MMIO to a region managed by a system controller; this
+	  ensures access to the region is coordinated between this and
+	  the clock and XGMAC (stmmac) drivers.
+
 config RESET_TENSTORRENT_ATLANTIS
 	tristate "Tenstorrent atlantis reset driver"
 	depends on ARCH_TENSTORRENT || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3f..6ddded26309ef 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
+obj-$(CONFIG_RESET_TC9564) += reset-tc9564.o
 obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) += reset-tenstorrent-atlantis.o
 obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
new file mode 100644
index 0000000000000..fcd58d5f1962f
--- /dev/null
+++ b/drivers/reset/reset-tc9564.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/soc/toshiba,tc9564.h>
+
+#define RST_CTRL0_OFFSET	0x1008
+#define RST_CTRL1_OFFSET	0x1010
+
+struct tc9564_reset {
+	u32 offset;			/* RST_CTRL0_OFFSET/RST_CTRL1_OFFSET */
+	u32 mask;
+};
+
+#define RESET_INIT0(_name, _bit)	__RESET_INIT(_name, 0, _bit)
+#define RESET_INIT1(_name, _bit)	__RESET_INIT(_name, 1, _bit)
+#define __RESET_INIT(_name, _reg, _bit)			\
+	[RESET_##_name] = {				\
+		.offset	= RST_CTRL ## _reg ## _OFFSET,	\
+		.mask = BIT(_bit),			\
+	}
+
+static const struct tc9564_reset tc9564_reset[] = {
+	RESET_INIT0(MSIGEN, 18),
+
+	RESET_INIT0(MAC0_MAC, 7),
+	RESET_INIT0(MAC0_PMA, 30),
+	RESET_INIT0(MAC0_XPCS, 31),
+
+	RESET_INIT1(MAC1_MAC, 7),
+	RESET_INIT1(MAC1_PMA, 30),
+	RESET_INIT1(MAC1_XPCS, 31),
+};
+#define RESET_COUNT	ARRAY_SIZE(tc9564_reset)
+
+static void reset_manage(struct reset_controller_dev *rcdev,
+			 unsigned long id, bool assert)
+{
+	const struct tc9564_reset *reset = &tc9564_reset[id];
+	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
+	u32 mask = reset->mask;
+
+	regmap_update_bits(regmap, reset->offset, mask, assert ? mask : 0);
+}
+
+static int reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	reset_manage(rcdev, id, true);
+
+	return 0;
+}
+
+static int reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	reset_manage(rcdev, id, false);
+
+	return 0;
+}
+
+static int reset_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	const struct tc9564_reset *reset = &tc9564_reset[id];
+	struct regmap *regmap = dev_get_drvdata(rcdev->dev);
+	u32 val;
+
+	regmap_read(regmap, reset->offset, &val);
+
+	return val & reset->mask ? 1 : 0;
+}
+
+static const struct reset_control_ops reset_control_ops = {
+	.assert = reset_assert,
+	.deassert = reset_deassert,
+	.status = reset_status,
+};
+
+static int tc9564_reset_probe(struct platform_device *pdev)
+{
+	struct reset_controller_dev *rcdev;
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np;
+	struct regmap *regmap;
+	int ret;
+
+	parent_np = dev_of_node(dev->parent);
+	if (!parent_np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	/* Note: MMIO regmap (no error checking needed when used) */
+	regmap = device_node_to_regmap(parent_np);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get config regmap\n");
+
+	rcdev = devm_kzalloc_obj(dev, *rcdev);
+	if (!rcdev)
+		return -ENOMEM;
+
+	rcdev->ops = &reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->dev = dev;
+	rcdev->of_node = parent_np;
+	rcdev->nr_resets = RESET_COUNT;
+
+	dev_set_drvdata(dev, regmap);
+
+	ret = devm_reset_controller_register(dev, rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
+	return 0;
+}
+
+static struct platform_driver tc9564_reset_driver = {
+	.probe = tc9564_reset_probe,
+	.driver = {
+		.name = "toshiba-tc9564-reset",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(tc9564_reset_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 Reset Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:toshiba-tc9564-reset");
-- 
2.53.0

