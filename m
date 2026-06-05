Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9997344030
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621295; cv=none; b=DYN/YqsWZ47r1EhFxdBfD3RxTLjSN1zMUy61l98Y5BYSzepUwPQ0OBmukbDwB4qnii0o0nFHjmH83Wal++/m9mCd3D1JJWUJqm+64y5DfWr3oF0Aqa3ECXZK/advLwQDUQnF+fhSiOJYO1TwfruQJiS2YSkphKiJXOZ+o0pDS7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621295; c=relaxed/simple;
	bh=DskkOmkT3L3PshxePtNyn75KTWZeOUxtFBYOtovIgZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQjiQ+Y9Su+JglEDbRC1ErG8FZECCcpqYFtf5y5rrzXLZRkTrltLdj7M/mue18LqxnGAF4mENBSXZRVnOP7gwZO0/IKotkBjbnMhnHraA1nL/a6ClyxOCCKqorORDYD4BgP9hBQuAuwZCtycSui59Kh/TJsX2emCm233Z5/DZZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=tdp+lbVN; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="tdp+lbVN"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4854d5cc708so852220b6e.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 18:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621266; x=1781226066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ5vHkiQeOYKz2ok7U7StyNKqN17UnhE019AHLlCqDQ=;
        b=tdp+lbVNF8ki1pq4WXdgeVYFONHKZ8XjWjtU1CQBWEmnSIQiV4MUciu/1FTYpH/Lb7
         +i56foS6npV0V/gGtOTOiZeA7bl34JMQswqsKg+aU3g7chKTlm408W3miBee40Ijl6kF
         UDkDuK8Jn/KQgaL58zhaAuee+LGchClnfCFPQaTTEzBiGC7XvN3K9769Z6CvyKTAF1tG
         aeFdEBwCA/PQ3DV2UmSpbKJ+70gpwf42pGBPEndP2ZhNop+qd4I8HpXZsxEvZRQ+9/+0
         nUJLcxuSwC8JvcjlqhJCDg+0mKAhNuydz2l0IeHhgdNXeEouRZlC3T1SxixAz8Q58351
         asTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621266; x=1781226066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eQ5vHkiQeOYKz2ok7U7StyNKqN17UnhE019AHLlCqDQ=;
        b=oX97Xa4K4k22lmkmSAwPde+VmY/8Df5fgUZ5lWyTpdJtdeTGsaWpneOu+PzHV/hRh/
         V94S1wXN14je4PoUR/Du/yfmEgSO5xra/DdxI4x2DryTuAu3d517JPTrGPa49FfYdF5+
         cKrG4Leowq1561wfwbR1w7Z/SWOSzfXFuEHeRVSQvVe2OEdYZY9reIz8BpHAroUP0hIP
         aBjebBdiMNYmJHAe8DnBZQN0/Hv1twHbEBhhI0NZOFVolgJkDi4tTlg6KHY5fUnfVDRH
         mWYh1cEu2A2P4dYhZQ7YjbLFqnx+XFhEnhV9upBnZrF0EhrqARY7iz0DRxkWV14XGuj1
         8JSA==
X-Forwarded-Encrypted: i=1; AFNElJ8xVLaNqw9WcmNBpgOR+cPO8uws4q3yQEcJ1d/Rvy2wfKAS743s9otyojbRMqTDJM7tEW60eQY2K7XI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3rnelQGzsGA8vDksm2KQwZUCPzcrb4575rAD6Dh8zybmTiX3p
	ASE9WGbFIY87iMAjIGPWCCOD/we85IjiSEIKFIrZu6T9nX64YCVTyxOA1JRca3hX8Is=
X-Gm-Gg: Acq92OEuVoeLAhbhsitGmp+4aGkMFL+pgmr+aTrRMRfxpmeLEZriAQp3ZS20xJm/0x2
	w86uBe7zBkz2Znxsb8jA5HPgaXU7R3KR6m2PQ/0gOC2qURh23b+KmAN9SmHDEIzXFFy4mVZyMAe
	/WALC2c6ANwtmgItkn+e4F2HOtrSM02q6Rf4P1Qit5eTWS5JRw4rZc4JFhQMU2Y/7hRx/5F53Mc
	n0wBxr9cZvpxi/8LOHB0AG58FzYZhzQ90O/DOWRc5DPaZtKFiWeq+Heo8P2qVUrwzfh5c+TpUf7
	cz2Rn8g5pmn5NpisxZtZAlNJxCJSpaZJ1lJYzZUS9zRhvlreE2na18MYJfJMzZCvIXe9JuVv24g
	Q3ymld8HJKAt2CXJdXdBAaXyMPVTgqAllMgnWZY2eyMpFgO6Dc+Kb0ek1dlOyOJlsszEZr3EXe9
	C7fBbJ0eAm60DKWCXeDAsc56zV5rtB1PLD0Jz+wg==
X-Received: by 2002:a05:6808:c227:b0:485:4443:dbed with SMTP id 5614622812f47-4868dbf7a46mr899700b6e.8.1780621265613;
        Thu, 04 Jun 2026 18:01:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:01:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: daniel@riscstar.com,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 12/14] gpio: tc956x: add TC956x/QPS615 support
Date: Thu,  4 Jun 2026 20:00:19 -0500
Message-ID: <20260605010022.968612-13-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Toshiba TC956x is an Ethernet-AVB/TSN bridge and is essentially
a small and highly-specialized SoC.  TC956x includes a GPIO block that
can be accessed, alongside several other peripherals, via two PCIe
endpoint functions.  The PCIe function driver creates an auxiliary
device for the GPIO block, and that device gets bound to this auxiliary
device driver.

This driver is implemented using the generic regmap-based GPIO driver.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                |   1 +
 drivers/gpio/Kconfig       |  12 ++++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-tc956x.c | 130 +++++++++++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 drivers/gpio/gpio-tc956x.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0924f7ec43cb0..0439607d1155f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27057,6 +27057,7 @@ M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
+F:	drivers/gpio/gpio-tc956x.c
 F:	drivers/misc/tc956x_pci.c
 
 TOSHIBA WMI HOTKEYS DRIVER
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317a..36631ca722fa3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -743,6 +743,18 @@ config GPIO_TB10X
 	select GPIO_GENERIC
 	select GENERIC_IRQ_CHIP
 
+config GPIO_TC956X
+	tristate "Toshiba TC956X GPIO support"
+	depends on TOSHIBA_TC956X_PCI
+	select GPIO_REGMAP
+	default m
+	help
+	  This enables support for the GPIO controller embedded in the Toshiba
+	  TC956X (and Qualcomm QPS615).  This device connects to the host
+	  via PCIe port, which is the upstream port on an internal PCIe
+	  switch.  On some platforms, a few of the GPIO lines are used to
+	  manage external resets.
+
 config GPIO_TEGRA
 	tristate "NVIDIA Tegra GPIO support"
 	default ARCH_TEGRA
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index b267598b517de..c3584e7cba9b4 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -178,6 +178,7 @@ obj-$(CONFIG_GPIO_SYSCON)		+= gpio-syscon.o
 obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_TB10X)		+= gpio-tb10x.o
 obj-$(CONFIG_GPIO_TC3589X)		+= gpio-tc3589x.o
+obj-$(CONFIG_GPIO_TC956X)		+= gpio-tc956x.o
 obj-$(CONFIG_GPIO_TEGRA186)		+= gpio-tegra186.o
 obj-$(CONFIG_GPIO_TEGRA)		+= gpio-tegra.o
 obj-$(CONFIG_GPIO_THUNDERX)		+= gpio-thunderx.o
diff --git a/drivers/gpio/gpio-tc956x.c b/drivers/gpio/gpio-tc956x.c
new file mode 100644
index 0000000000000..0dc6b1028d970
--- /dev/null
+++ b/drivers/gpio/gpio-tc956x.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+/*
+ * The Toshiba TC956X implements a PCIe Gen 3 switch that connects an
+ * upstream x4 port to two downstream PCIe x2 ports.  It incorporates
+ * an internal endpoint on a internal PCIe port that implements two
+ * Synopsys XGMAC Ethernet interfaces.
+ *
+ * 35 GPIOs are also implemented by an embedded GPIO controller.  Three
+ * registers control the first 32 GPIOs (other than 20 and 21, which are
+ * reserved).  Three other registers control GPIOs 32 through 36. GPIOs
+ * 22-24, 27-28, 31, and 34 are treated as "input only".
+ *
+ * There is a TC956X PCI power controller driver that accesses the
+ * direction and output value registers for GPIOs 2 and 3.  These
+ * GPIOs control the reset signal for the two downstream PCIe ports.
+ * Their values will never change during operation of this driver, and
+ * this driver reserves these two GPIOS.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/gpio/regmap.h>
+
+#define DRIVER_NAME		"tc956x-gpio"
+
+#define TC956X_GPIO_COUNT	37	/* Number of GPIOs (20-21 reserved) */
+
+/* The GPIO offsets are relative to 0x1200 in TC956X SFR space. */
+#define GPIO_IN0_OFFSET		0x00		/* Input value (0-31) */
+#define GPIO_EN0_OFFSET		0x08		/* 0: out; 1: in (0-31) */
+#define GPIO_OUT0_OFFSET	0x10		/* Output value (0-31) */
+
+/*
+ * There are two sets of registers, each representing (up to) 32 GPIOs with a
+ * stride of 4 bytes (IN1 is 4 bytes past IN0, EN1 is 4 bytes past EN0, etc.).
+ */
+#define GPIO_PER_REG		32
+#define GPIO_REG_STRIDE		4
+
+static int tc956x_gpio_init_valid_mask(struct gpio_chip *gc,
+				       unsigned long *valid_mask,
+				       unsigned int ngpios)
+{
+	/*
+	 * GPIOs 2 and 3 are used by the PCI power control driver, and
+	 * we don't allow them to be used.  GPIOs 20 and 21 are reserved
+	 * (and not usable).
+	 */
+	bitmap_fill(valid_mask, ngpios);
+	bitmap_clear(valid_mask, 2, 2);
+	bitmap_clear(valid_mask, 20, 2);
+
+	return 0;
+}
+
+static int tc956x_gpio_probe(struct auxiliary_device *adev,
+			     const struct auxiliary_device_id *id)
+{
+	DECLARE_BITMAP(zeroes, TC956X_GPIO_COUNT);
+	DECLARE_BITMAP(fixed, TC956X_GPIO_COUNT);
+	struct gpio_regmap_config config = { };
+	struct gpio_regmap *gpio_regmap;
+	struct device *dev = &adev->dev;
+
+	/* We need the regmap pointer, stored in our platform data */
+	if (!dev->platform_data)
+		return -EINVAL;
+
+	/*
+	 * Only some of our GPIOs are fixed direction:
+	 *	22, 23, 24, 27, 28, 31, and 34	(all input-only)
+	 * Set up the fixed bitmap to indicate which are fixed.
+	 */
+	bitmap_zero(fixed, TC956X_GPIO_COUNT);
+	bitmap_set(fixed, 22, 3);
+	bitmap_set(fixed, 27, 2);
+	set_bit(31, fixed);
+	set_bit(34, fixed);
+
+	/* All fixed GPIOs are input; the zeroes bitmap indicates that. */
+	bitmap_zero(zeroes, TC956X_GPIO_COUNT);
+
+	config.parent = dev;
+	config.regmap = dev->platform_data;
+	config.label = DRIVER_NAME;
+	config.ngpio = TC956X_GPIO_COUNT;
+	config.reg_dat_base = GPIO_REGMAP_ADDR(GPIO_IN0_OFFSET);
+	config.reg_set_base = GPIO_REGMAP_ADDR(GPIO_OUT0_OFFSET);
+	config.reg_dir_in_base = GPIO_REGMAP_ADDR(GPIO_EN0_OFFSET);
+	config.reg_stride = GPIO_REG_STRIDE;
+	config.ngpio_per_reg = GPIO_PER_REG;
+	config.init_valid_mask = tc956x_gpio_init_valid_mask;
+	config.fixed_direction_mask = fixed;
+	config.fixed_direction_output = zeroes;
+
+	gpio_regmap = devm_gpio_regmap_register(dev, &config);
+	if (IS_ERR(gpio_regmap))
+		return PTR_ERR(gpio_regmap);
+
+	return 0;
+}
+
+static const struct auxiliary_device_id tc956x_gpio_ids[] = {
+	{ .name = "tc956x_pci.tc9564-gpio", },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, tc956x_gpio_ids);
+
+static struct auxiliary_driver tc956x_gpio_driver = {
+	.name		= DRIVER_NAME,
+	.probe          = tc956x_gpio_probe,
+	.id_table       = tc956x_gpio_ids,
+	.driver = {
+		.name		= DRIVER_NAME,
+		.owner		= THIS_MODULE,
+		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_auxiliary_driver(tc956x_gpio_driver);
+
+MODULE_DESCRIPTION("Toshiba TC956X PCIe GPIO Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("auxiliary:" DRIVER_NAME);
-- 
2.51.0

