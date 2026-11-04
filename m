Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753020;
	b=WdNCp+evrs7RDrqURmeWNzYKdci9yDcw7zNVJPeQZYkAHY+ao58u7db7GhriQf+OqKaD
	 8iRtdACRYRJFP032pwwJ1VlEDa/ht195rmJutDS3EmQcihqMNdrvNRe3rHms8cHehDzkP
	 cjnCnQFQ+ZJjYKfxiedJ2s9Pt00jUbmNCaC8NiHUmmjUq7CkeXWg1dZ9UIwOd7Uc8opS/
	 t6yTbTQhjCP4erOlvY89fXThbEgQqHlAcRNq44iGJB2mGM4JA1nqAzROKMki15exz7c3L
	 X7GtpbsLBrz3WUkCZ0gw4IltcbhiwfLguoGCRhui00eVOARTQ84QwS3WWz3pKMVTrVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xkPjnzri3LVX9+FqhrXEcC+RPdNLfDsUOpeTfPUBzi4=;
	b=Rsr27Qz1QoYRYd5LgLVwbS6hiJUmVz84NQFB8JA18YaXttrqNbNbO///AWT0rtSVaGgh
	 z+C6TuEGbxAmRgD8X0dTHowt2v0l0mrkT+gPxNgGQ0KV2JlcvL5hMX1HzJ1E0XtPAN0jG
	 9u9a8HIbBu92KWFqMs7j3gEdn2eSxqtd7fm25n79BVgDuxq3lzM3pKU57RCyCs+7iVvCR
	 JVbCJrWqMvdZhLswuyeVtk80TXsHlc/3j5hOMGVZsb904z90GuxFOUfFpZQ1In/LurR1o
	 XcPusgOT6zd9W/Bqtmhb7ZCdPIfxydSSyZ1IU6IreJxYkdAiE7xgb5BmjljfdUh0M9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KWK3XuMX;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD30606A333
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 00:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD30606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KWK3XuMX
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-49e1251674cso91131fac.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 16:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753019; x=1794357819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkPjnzri3LVX9+FqhrXEcC+RPdNLfDsUOpeTfPUBzi4=;
        b=KWK3XuMXQ8W4uCZD+je8QaoQeIPXxP00bQKLEv9CtpgbFTTK/7vXJtV9zFnaxouzr4
         S5XAsqG2x2PLiRtbLJmmzK+YhUwM6oA6X12z06ag8yidBc8vBMo6EySplTKAHjHngOVC
         jkuxtBTKv7bUwGuSX+BRD/ghD2+sPrG8T5MagqoHMMRQPLEvh5zyYcfBFqEaw3KDTmA6
         3EHqwScSuBwC4cf9LWIQ4+2cwOse0iLnl4wBS821TXtLcZfRhTIEWWMGmy40H6kb9guV
         nWjyEnCYFC7aJlVdQRGJGfKWQFvq8IgsM3fGhGFkLXo0SlS74e/oA/NxJxxvdhygbSqL
         8H2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753019; x=1794357819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkPjnzri3LVX9+FqhrXEcC+RPdNLfDsUOpeTfPUBzi4=;
        b=CXiNdoyYtTqz9m9RMBnsbeSsfAtJT2ttL+D9K7EVqBcwOQiobHAnEO/wIWqQT2avGf
         nXkG4P7B+k/oMTSBWUJ3j0fdQO8H7ZIb+lQxJAkG9kizVQS51Q4V1JyA6wJEZLStJk48
         lg+Im640OE/7ZVZbZYLJ+WRv2FtN0iHfe2AsFtzPYNsNCThv1G3j+6oHxtCyJz5dHIGM
         IBNzWx38n65ZbFF2JZdPZYEVbnROoBElmMqSVJ4nUdN4zGw/TANOlZTeyIEqBLSdar72
         oLmEy2XCeaX/71twKHNTcE5TpOr7dgqylz933xUReSlEKXcoKwM2liSqy12kQF93rPgd
         8oog==
X-Forwarded-Encrypted: i=1; AKwUvBwREtBgDtnAprfwG+CVFdz1arNzJQ0vnppBOnobvrxyC+BYmzG5PFpGhr6E/Q8AZJ4dGth6mRAR7q9X@vger.kernel.org
X-Gm-Message-State: APuU4Z/qi5kU2GPrTWy+7r+YgxeBGphs8qPazvwgbxfhZr1KlniKfV+e
	RJU7XRiefzyMcliCbq5WQaDTSm5QxHsIfTzwRxuNX09DVJcqqB/GIskm9c8uGXKmRCg=
X-Gm-Gg: AYBFou3sU5PWpUKA67FsQsUs4SnU5hJvV81qTqTAnxsaM47XiOumhPJ9rEYBhwoHTFh
	EOv9IQM7+Bvzhh8iyreKlj47ld9MzJYQ57pkD8S9MEUFyLbAWyXgm7nZBCApEwxttJC9FHZevbw
	a40XVtfdl6pJ8wvPHiSC2hQkndGkSXX3HR3GcIfxKhG7iHxLgubrxD9NZ8gqLG1/b7o2jPdaTc0
	vNXe+a1X/vdKsajdk8QLhD6Hy++1ru4hCIxDuCFZfIaZNGovOJpuj+aQbE44vhgu4QkRzoxIRGW
	ixJJrOWQOWHQPY92aNcOyzlqzhUYAIowLrbZcpTnb/727EKqWd2Kyp6eDrirlrVawJ+rdyyMipd
	Xyx/pjnHab/o3jypzdGpV5JogpYk790kduclc3Ca7s5okNUVx6krVxZvCSpWItIeTHxXRLrByKq
	mnrLlr4VnGOEcjmfPTATKprMckY4ow9rfkHmlWCe/QYKIurac+Qr3iWXXAdyciFVUkBLhe9QaD6
	SaajH2LMMPVoNXLfmdA5uhdBfZ8Udkpddacbgw7CiFEiWKb4KfQWd/8Ta/vXQzecJcv+cI/7rkC
	jo2HXQqGt4vVqHd1ffEAyA/pYKrR0K5IdesEmA6d5khlgkGQa5EDC8I=
X-Received: by 2002:a05:6871:284:b0:475:e235:8fc with SMTP id 586e51a60fabf-4a9076716acmr8645005fac.26.1793753018893;
        Tue, 03 Nov 2026 16:43:38 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:38 -0800 (PST)
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
Subject: [PATCH 2/4] soc: toshiba: tc9564: add a new syscon driver
Date: Tue,  3 Nov 2026 18:43:29 -0600
Message-ID: <20261104004332.2141282-3-elder@riscstar.com>
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

Introduce a new system controller driver for devices found within the
Toshiba TC9564 SoC.  The system controller manages access to an 8 KB
region, and implements controllers for a set of clocks as well as a
set of resets.  The region also includes registers that indicate when
initialization is done for the chip's two Ethernet interfaces.

The SoC has a single 25 MHz input clock, and from that derives clocks
of various rates used by functional blocks within the chip.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                         |  1 +
 drivers/soc/Kconfig                 |  1 +
 drivers/soc/Makefile                |  1 +
 drivers/soc/toshiba/Kconfig         | 12 +++++++++
 drivers/soc/toshiba/Makefile        |  3 +++
 drivers/soc/toshiba/tc9564-syscon.c | 42 +++++++++++++++++++++++++++++
 6 files changed, 60 insertions(+)
 create mode 100644 drivers/soc/toshiba/Kconfig
 create mode 100644 drivers/soc/toshiba/Makefile
 create mode 100644 drivers/soc/toshiba/tc9564-syscon.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b1b29169e0e9..c25ee6e0f1c68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28345,6 +28345,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
+F:	drivers/soc/toshiba/tc9564-syscon.c
 F:	include/dt-bindings/soc/toshiba,tc9564.h
 
 TOSHIBA WMI HOTKEYS DRIVER
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index 483cbdcae1534..f655d368e0fb6 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -29,6 +29,7 @@ source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
+source "drivers/soc/toshiba/Kconfig"
 source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/vt8500/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 5a3efd68355cd..150f7f4f05560 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -35,6 +35,7 @@ obj-y				+= starfive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
+obj-y				+= toshiba/
 obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-y				+= versatile/
 obj-y				+= vt8500/
diff --git a/drivers/soc/toshiba/Kconfig b/drivers/soc/toshiba/Kconfig
new file mode 100644
index 0000000000000..91adcbe71905c
--- /dev/null
+++ b/drivers/soc/toshiba/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SOC_TOSHIBA_TC9564_SYSCON
+	tristate "Toshiba TC9564 config system controller support"
+	depends on TC9564_PCI
+	depends on MFD_CORE
+	default TC9564_PCI
+	help
+	  This enables support for the config system controller for the
+	  TC9564 SoC.  It implements an MMIO regmap to manage access to
+	  two pages of I/O memory, and serves as a clock and reset
+	  controller for IP blocks within the chip.
diff --git a/drivers/soc/toshiba/Makefile b/drivers/soc/toshiba/Makefile
new file mode 100644
index 0000000000000..18dc03507b320
--- /dev/null
+++ b/drivers/soc/toshiba/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_SOC_TOSHIBA_TC9564_SYSCON)	+= tc9564-syscon.o
diff --git a/drivers/soc/toshiba/tc9564-syscon.c b/drivers/soc/toshiba/tc9564-syscon.c
new file mode 100644
index 0000000000000..0d0e2422b82d0
--- /dev/null
+++ b/drivers/soc/toshiba/tc9564-syscon.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static const struct mfd_cell tc9564_config_syscon_cells[] = {
+	MFD_CELL_NAME("toshiba-tc9564-clock"),
+	MFD_CELL_NAME("toshiba-tc9564-reset"),
+};
+
+static int tc9564_config_syscon_probe(struct platform_device *pdev)
+{
+	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
+				    tc9564_config_syscon_cells,
+				    ARRAY_SIZE(tc9564_config_syscon_cells),
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id tc9564_config_syscon_match[] = {
+	{ .compatible = "toshiba,tc9564-config-syscon", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tc9564_config_syscon_match);
+
+static struct platform_driver tc9564_config_syscon_driver = {
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= tc9564_config_syscon_match,
+	},
+	.probe = tc9564_config_syscon_probe,
+};
+module_platform_driver(tc9564_config_syscon_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 config syscon driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

