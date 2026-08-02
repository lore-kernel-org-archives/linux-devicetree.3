Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03251320CD1
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702867; cv=none; b=acvr00w0YEuFqYclgppqeKlzvI1yapPCYD2w205K2BCwAa0c2JQYFIhFnIwRfnuWvTuBetf+JGaGNEUznJhj3wLznTY5ogx+gVk9Mz29OALcOCwjEJXOp9krtQg12D1e9c5wKHuB8sAmWiGJ8kDFABoX/BJHr0/7LmQQkQpY5w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702867; c=relaxed/simple;
	bh=HDB6HKomcJYNmQDMZ6Gdx360Qh14RD85fFKiFafb3J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OxICMzMMQ49RLJiBN4v/q8yXF3/rsEXX+XDgubBEXG8WKnmA0hGNbdZISsODjbXrjfRIrJXjTSMx7m/lTN2cagHHrX2VWbPnpxBH+R1u/Epc51ckak8vb66U7quWEs3j3ObbPRMf5Fbgf9M+Vfv47n6t5I++PYuADiiqHsRBU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnDedOuM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnDedOuM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso1612345f8f.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785702864; x=1786307664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9y/Q4rUmTnVZBD/oVaP0c3pNlAmpBQq+Yqe1RoBhg=;
        b=jnDedOuMPHwtVG3leof9kLWv6RYOraREZhMCs+UFOlQ1tMwycquSZ8cGtQpaBbsUea
         slnvsplabg5nJ5e5kQRMXG+BcZQZhe1chD+tOzVPp900HBf86nWlbLINoR9OI22rtCvW
         /NhahbbKvlMCbeXgG7R1nUh1+Op8zc1PcszMAMRAd+SzApL5hsGvd4R0K0MZA2+qzyJ4
         2rYXYYfOyIxcIZeZxe2UbRxzQamAG7hc5MGz4/AiRNogIPMM0NnkuKPi2W15L0jKv9Wy
         tSQF1XzPKowp8gWeKlz4YcG8pNCV36EYWr6L1x8DYHQKhXfOv89E9Y5PInEHnfWrWwYz
         gJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785702864; x=1786307664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yx9y/Q4rUmTnVZBD/oVaP0c3pNlAmpBQq+Yqe1RoBhg=;
        b=azygNsQhY1Dr2D6gsexye9gYR5jQdF6dqrxB/DawfY576zpndaocoRvZe+TnO9NijG
         uHyHWgrsU8XAYEGi0lcWZVZVVjcnHmZy84zNJvM0M7weK/B9ZZcdESyXPA+EoLzoqbFF
         ogl+9qZxRuME2/No/OzmA8O3g+0KUaBUtdKGffDpQp+D87OINzbQ6uPmiIlocmE0E/xK
         ohJJ3gnr9WIBLGNhsrk2NJJKmVliVgbzmJTBCBwp+T2CCPA/Lcm978kE6OYJgLwC+81I
         8d8vHL3LpUKth5gUL3FizcxP5kX+NhwoHk47AgccCRgq5OIIVoW/3kVWWo49oTPItkFV
         5F8A==
X-Forwarded-Encrypted: i=1; AHgh+RoVkbEPTU3ML7uAJXs+mCVf9LWVPtGt7yr1gxvoT1lrf1FX97i4SfgjmvQ6lyetWjOyx13NBfoOJ2Qy@vger.kernel.org
X-Gm-Message-State: AOJu0YxqaRc3aCJSOvd2hkjQbOxLH5Nwt/JhYtRbgJtszCC4sBJOLKbC
	8uGtwc+vvnh22exMGPOWU0/ewcOzJP+yHB4e0HcFDKHTeWUhpAyVNx6u
X-Gm-Gg: AR+sD11/d9ZgcAN4+rZCChHXLqCIs3+XeXOOGn4HA4hmxQqY9cK+Yue79w4ub9+7BJW
	D7CCAhUvQeWTg+B2oyhcZm9bWhPwSRNIESxrwCW0V3wxsYuw0g1d9NkDgiOBeiNz3uqSfEUeLQj
	NBe7hb2JZDGWJswsplbbZ1Nrh0ozlTK/OrKPSfjzlkW++MYllk/Rm9a6dNjVYi1lu2JOLcSW6vo
	2pgZ3UZcFJdb5g6mFYWyh1wAxH0M82yOYQ0FrljfwEv6xVwP/l3oPrgeCqp898w2kDOEfgIp7al
	HW83sHTHmSzIqR57w+1X+2wd5YSR4Sh4Hwrefw0D5yZgKssYgwfYfu5rQzeZnkLLWWZQygekk8j
	egoNiCZDS215Sc1FdaBlMVD9yjJPMhz6Fj5Ydmsil7Wa/u4NUMJb6o/BNKxW/Ziz+4eHmOXP1b9
	CRxcnMbhVJKGSPlDm+9m8YFj9VjKXpML73ARUl6xmmMXfPG+GyvpNAnV/Ltn98fz1FA6DK2q+I
X-Received: by 2002:a05:600c:190f:b0:495:39aa:1359 with SMTP id 5b1f17b1804b1-4980c66b43fmr121883265e9.3.1785702864156;
        Sun, 02 Aug 2026 13:34:24 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.226.155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807bb45ebsm118499905e9.4.2026.08.02.13.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 13:34:23 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 02 Aug 2026 23:33:36 +0300
Subject: [PATCH v9 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260802-zx29clk-v9-4-d05530d85d28@gmail.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
In-Reply-To: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8132;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=HDB6HKomcJYNmQDMZ6Gdx360Qh14RD85fFKiFafb3J0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqb6mysk8ZAIRhyiWgck/Nf3N8sNG9hqDSp4efE
 iQp2GBhrR2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCam+pshsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKk+RAAp4FsiuVXDePHeCuEUimSugNlBdbsE6X
 r9DohvSpZN8c3PYA4atJj1AsgPChWzl1c+SMOdsEZCi6z/TyLE87mSYydsv9n5XzOoUdRMP05yD
 Qo1Yb6iQj53PB4SLYNLjEpzmuYOv+UTK4sZND4EoS8EHerOeXwF2vtJSXlCAfR8IYyMuXFwSEI3
 Ix46FLYJMvgqJNhHpglJpD09s9/slj8na6RI4sEjkTOBNFWJRhR9QxsNzpyZQAmixdcTfZHiUof
 g1gBC/eZIbMRJN/OOH3HffTLJ5nmrXr22oKJ9znSH/NyzjbH/4RMtmKwvUgxUf52PkgECFoXvmu
 LCd0SKSKKN2eXJmyZT6ZrxjPynsiETtnDjEEqp1dG7yTJ9bqCvOY8hutiS3j3rSpT6HZ1MLIpFA
 +cnr7gHGvztxiehgniyx6OsM2AidmnEjoa6J1xwfV02LkYVgvJ9y68nXBeSmC9qfCSpTpTcjUIq
 CXcXV57cmOpAVKkr3DHf6jjbmZpvPRUe8DVnyFLfXab9F+/jr7tvqbfScod4n9iJIK8EZD5DePt
 VZfhRNdRPLzLrweY88LEX3TNawe/+hrDO/j+Cx2bBLGgwNeVXgA8+W70yNjE9R3Z8/oF+KaJtUk
 9mJrMconBf35VXu1/Y+9AlotvjPa92q8H43Oe4XYdK8VqCi681dE=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

What I am still unsure about: How much sense does it make to have this
module-capable and able to unbind: In practice, the board doesn't work
without this driver and its clock and reset children.

Changes v9:
Deassert the LSP reset and enable the LSP pclk here. In practice the
boot rom needs to do that because it prints to an LSP-connected UART and
reads the boot policy from the LSP connected flash chip.

In doing so, I migrated the match data to an enum as mfd.md suggests.

Changes v8:
*) Remove .of_compatible from PHY mfd child

*) Move to drivers/mfd (Sashiko)

For me either soc/zte or mfd/ is fine. Note though that this MFD parent
is very specific to the zx297520v3 SoC. I don't expect this to be reused
anywhere else. There are two more MFD-ish devices in there: soc_sys at
0x140000, which I plan to handle in the same driver, and an i2c PMIC,
which would get its own host driver.

*) Use PLATFORM_DEVID_AUTO (Sashiko). NONE was intentional as I only
ever expect one instance, but I don't see any harm in doing the standard
thing and use AUTO

*) On the suggestion not to put the link to mfd_cells[] into match data:
I see that it is spelled out in Sashiko's mfd.md, written by Lee Jones,
the MFD maintainer. I would appreciate some education on the rationale
behind it: Putting a pointer into the void *data is a common pattern in
the kernel. I don't understand in which situation this can possibly
break?

Both structs are static const in the same compilation unit. data is a
const void *, not a uintptr_t or kernel_ulong_t, so it seems passing a
pointer is the intended use. What am I missing?

Changes v7:
Add phy MFD child

Changes v6: Make the ZTE SoC driver section depend on HAS_IOMEM
(Sashiko). The entire MFD section, which contains MFD_CORE, depends on
HAS_IOMEM even with COMPILE_TEST.

Add a NULL ptr check for of_device_get_match_data (Sashiko). While not
uniform, rave-sp, rohm-bd9576, atc260x, da9052-i2c protect against
incorrect manual attachment that way.

Add lspclk here as well in an attempt to satisfy both Conor Dooley, who
asks for MFD for top and matrix, and Philipp Zabel, who prefers aux but
at least wants the reset driver limited to one driver type.

Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
extra functionality: Reboot in top, hwlock in Matrix.

LSP clocks stay with the aux bus and are thus not handled in this
driver. The clk driver will bind directly to the lspcrm node.
---
 MAINTAINERS                      |   1 +
 drivers/mfd/Kconfig              |  11 ++++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/zte-zx297520v3-crm.c | 117 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 131 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e01ef014c110..b9f96455bca7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3915,6 +3915,7 @@ F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
+F:	drivers/mfd/zte-zx297520v3-crm.c
 F:	include/dt-bindings/clock/zte,zx297520v3-clk.h
 F:	include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 F:	include/dt-bindings/reset/zte,zx297520v3-reset.h
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 35f6e9b76d05..c0c7e83487f4 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2572,5 +2572,16 @@ config MFD_MAX7360
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_ZTE_ZX297520V3_CRM
+	tristate "ZTE zx297520v3 Clock and Reset Manager"
+	select MFD_CORE
+	default SOC_ZX297520V3
+	help
+	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
+	  reset manager MFD driver. This driver provides the host device for
+	  the clock and reset drivers and is required to boot the SoC. You
+	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
+	  to build the actual clock and reset child drivers.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index dd4bb7e77c33..4f6a78170ac5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -303,3 +303,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
 obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
 
 obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
+
+obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
new file mode 100644
index 000000000000..37cd0c14680e
--- /dev/null
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Stefan Dösinger
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+enum zx297520v3_mfd_type {
+	ZX297520V3_MFD_INVALID = 0,
+	ZX297520V3_MFD_TOPCRM,
+	ZX297520V3_MFD_MATRIXCRM,
+	ZX297520V3_MFD_LSPCRM,
+};
+
+static const struct mfd_cell zx297520v3_topcrm_cells[] = {
+	{
+		.name = "zx297520v3-topclk",
+	},
+	{
+		.name = "zx297520v3-topreset",
+	},
+	{
+		.name = "reboot",
+		.of_compatible = "syscon-reboot",
+	},
+	{
+		.name = "zx297520v3-usb-phy",
+	},
+};
+
+static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
+	{
+		.name = "zx297520v3-matrixclk",
+	},
+	{
+		.name = "zx297520v3-matrixreset",
+	},
+	/* A set of hwlock controllers is found here as well, but no driver is implemented yet */
+};
+
+static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
+	{
+		.name = "zx297520v3-lspclk",
+	},
+	{
+		.name = "zx297520v3-lspreset",
+	},
+};
+
+static int zx297520v3_crm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	enum zx297520v3_mfd_type type;
+	const struct mfd_cell *cells;
+	struct reset_control *rst;
+	unsigned int num_cells;
+	struct clk *pclk;
+
+	type = (enum zx297520v3_mfd_type)of_device_get_match_data(dev);
+	switch (type) {
+	case ZX297520V3_MFD_TOPCRM:
+		cells = zx297520v3_topcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
+		break;
+
+	case ZX297520V3_MFD_MATRIXCRM:
+		cells = zx297520v3_matrixcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
+		break;
+
+	case ZX297520V3_MFD_LSPCRM:
+		cells = zx297520v3_lspcrm_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
+
+		pclk = devm_clk_get_enabled(dev, "pclk");
+		if (IS_ERR(pclk))
+			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get pclk\n");
+
+		rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+		if (IS_ERR(rst))
+			return dev_err_probe(dev, PTR_ERR(rst), "Could not get reset\n");
+		break;
+
+	default:
+		return -ENODEV;
+	}
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells, NULL, 0, NULL);
+}
+
+static const struct of_device_id of_match_zx297520v3_crm[] = {
+	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)ZX297520V3_MFD_TOPCRM },
+	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)ZX297520V3_MFD_MATRIXCRM },
+	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)ZX297520V3_MFD_LSPCRM },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);
+
+static struct platform_driver zx297520v3_crm = {
+	.probe = zx297520v3_crm_probe,
+	.driver = {
+		.name = "zx297520v3-crm",
+		.of_match_table = of_match_zx297520v3_crm,
+	},
+};
+module_platform_driver(zx297520v3_crm);
+
+MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
+MODULE_DESCRIPTION("ZTE zx297520v3 CRM MFD host driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0

