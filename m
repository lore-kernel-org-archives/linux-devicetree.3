Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369135;
	b=W/XWKlyD2WBtW9fcWzfwEbbXr8gWxQtmLU7R8l8GzSDQpvdj40TRjNXLIODgvHVS4kpG
	 PPy+a2Z7aJWUn26WnMtHu0gNWI/yszBLzgLdluP2rFr/VQ+cIx4C0SbJpPrnGqPSAK2oZ
	 zSnfYJ8VOG/p+DP8j8COz/rzoMYVkJQdym1+fWB0HDvqn6IgdOkb4gq/oAKmMYM2J/ux4
	 gA9Ls6+z0jlvbHbwBBMBQ2zTioMyOLj8RO0VPTma5XBuAaGcmHtflhm4fuTJj8wSxgP7c
	 6LmHKwnJ4pzj+EsoTyJI+gbOfg5FdM5eJ+JfOvLDb8kXRbXDiNhyzewOqbW2Lcs5Scw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
	b=kU0R0d5JtrrALp2ZsUFg3Ivg9jGdwCTSrp4l9LyPV2o8la48splofSMvu2UWKit/QO4P
	 c+II7SM8NIuP2h4HWds5DfKHxQaPptT340F+u5/e45evLoW6mDV9jvpE49JZuv+LHYKHr
	 fGAqDX56ddky+dg0g0vvAsm0NwU3AurJTute6KHCQHdMmyLWG1LHxnHFcHH0DVWXmiWZs
	 OLmO/nyMPieQ9KTNNiaZaigDDFgqdsXEaWIB81JKdj0WM2Tv5xofzesuPp35SPlTC98DK
	 O9RHMXYxIivthcqMq5L7hOHC1oaCSGTraYnUXPd3GlRWIaHuYqIEOyzB2lx6GUQoupQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0FQ1xAP;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D32606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D32606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J0FQ1xAP
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3869b68caecso2896804eec.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369134; x=1795973934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
        b=J0FQ1xAPHkmRAV8GmB6ikN3G+hCQkM+N4arxW5kq1MsvSavp9BP0uZePqfVVauQ8C0
         mwWuKyAO67s0x/qXTh8nG1eM3cPhCCO5zpbOtGZB2/KuOpXKEac/+fd5nTedrcEz8NXC
         4Aj6SrpwrDqKKfCJhYZdIYMmu48TeE98ezgzBJ1LAjwB/xnWxWzjb1+UdtXgiHGk6Njj
         6Mwku9SiEmH6ZLscUCUUrL7Oicn/sbQdrZ47Y/gdGgAPLMcx1OoKQgBHDeKyapOyJ7P/
         YXJejU9mMLv0ZVEajN9fW1BYP6SVRJGjnET27OWr9fuoHRPWwpeX6RfmGqhxeBUAMOAx
         EbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369134; x=1795973934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orB6lrzLivgtrtBBhDCdt1CSbjhX161s0L8BSLZHQSc=;
        b=2mSUzI7IYZTLZCWUVT6T0mf3pRBK5xPrQHIxS9niQbcMw66uCcCq7RI6azoAvQTmjJ
         F/xq8sWYTUQfcgySGmEkdQxx7lWI421uGJBWzWIYSmj8H19t8LIXs51QKvTLgQnw6XnF
         9rl7jN4AVUIrOh3b5r15DnRmtBErHo0kgQ01ZFGfCS16+JVnblS7O+trf6i9ihsT6dtK
         WA/Q2gKmIMqrjW9rR5tzYJf6XIH7aV/7i2gVJAdztKnYNhw3A9sPxbvE3tOy6gCdpE5V
         CpVb+R3y9PRcQTLyTeFJGTOMO5guWfEX+Xq18WkG3u/1zzFPJ8wPLSMSM9ncKHEy3gSD
         HwSg==
X-Forwarded-Encrypted: i=1; AL+hErEF67zQq4IyWLVztjAnXU9y9tGPvlZM+lA3CvY1/ieV1VK7nntdOm4y8HXYaE9HMarW4cf6baquiPMj@vger.kernel.org
X-Gm-Message-State: APuU4Z/6UdP64B6yviIjno29KtrsNX/yavkmTMDPkTFmOD+mcvCFC/ft
	IqosH8X6VkRTNPLKAjYIj2hGnnTkmg4GvmQo9Xv5VIjQP3Y6t5YLWxah
X-Gm-Gg: AZFdTZeq0JGDzoyrCo65vPETjA75XmYDPXJNKJiJKI6Er9T/rylDpuK0fJqyz7pkc/+
	F/HW/G1RXOh/pvVogcgbBln1px6H1XIQ4wxy0lWgxJajuQMLA03nLwciGxfziXUOrqMXMT3X4Cw
	3zvYgK8OGAobAV/F+zAE3XgDU5mIz/vD3Q0Df+6uKOU/QkMYZ/7mtrQAR3gE6uQanrt1ZebU+ap
	fx8r9gPN521eVv2bvxN1Ls/5+rsUyKslEKhVOqro83UXByk0Jkr+rjI/xl4TPAGzDvLFbEL7hz8
	XvHgNhz9gGQ4XKAZ5MFO3GhVYJVdlHY5c1ud0CSMVU5D4FvP497nCEatk7E45LhT7CgmU5z7/Hi
	tq0AwnWe4qE+UCp1xRiAICwNiXIYxeiLbD/7DOG0b54uGLkqb/ZfTYkJ9nQ/GTlchtorSProu6P
	Sns7sGrLR9lGIn8wiiPivYEhlwUIfF+f82XYCznw0IA6ISED4J/Apxw6GL2XjM3upH5PAhEWxbe
	b+uLLlCnjv7EwY/zMlgKCTmkR504yUMvhMDbQjo8mMIiZxjNpxF3hOABemt1squmxWNya2U5PZ4
	D2R+97R1+dpLTf5XklbyQ2ptbNSybetpKzc6Z0x5EgrOEe0SRA==
X-Received: by 2002:a05:7301:424a:b0:386:b132:6eaa with SMTP id 5a478bee46e88-386b1327096mr451144eec.16.1795369133997;
        Sun, 22 Nov 2026 09:38:53 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:53 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Mon, 23 Nov 2026 01:38:09 +0800
Message-ID: <20261122173810.2409146-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
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

Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
controller. These banks contain temperature calibration parameters and
other configuration data.

Reload the shadows during probe and cache the data for subsequent reads.
Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
other banks.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  11 ++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 drivers/nvmem/spacemit-k3-efuse.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0a9eb764ffee..e0af83ecee37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26529,6 +26529,7 @@ SPACEMIT K3 EFUSE DRIVER
 M:	Jiayu Du <duge1256@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/nvmem/spacemit,k3-efuse.yaml
+F:	drivers/nvmem/spacemit-k3-efuse.c
 
 SPACEMIT RESET CONTROLLER DRIVER
 M:	Guodong Xu <docular.xu@gmail.com>
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..4a8f975b35c7 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,17 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPACEMIT_K3_EFUSE
+	tristate "SpacemiT K3 eFuse support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	help
+	  Say Y here to read configuration and calibration data from the
+	  SpacemiT K3 eFuse shadow banks. Programming the fuses is not supported.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called spacemit-k3-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..d29716957faf 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SPACEMIT_K3_EFUSE)	+= spacemit-k3-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
new file mode 100644
index 000000000000..48e072602583
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 read-only eFuse driver
+ *
+ * Copyright (c) 2026 Spacemit Co. Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include <asm/byteorder.h>
+
+#define K3_EFUSE_NR_BANKS		16
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_NVMEM_SIZE		(K3_EFUSE_NR_BANKS * K3_EFUSE_BANK_SIZE)
+#define K3_EFUSE_BANK7_OFFSET		(7 * K3_EFUSE_BANK_SIZE)
+#define K3_EFUSE_CONFIG			0x004
+#define K3_EFUSE_SOFTWARE_RESET		BIT(22)
+#define K3_EFUSE_BANK0_REG		0x104
+#define K3_EFUSE_STATUS			0x184
+#define K3_EFUSE_READY			BIT(1)
+#define K3_EFUSE_BANK7_REG		0x190
+#define K3_EFUSE_RELOAD_PULSE_US	1
+#define K3_EFUSE_POLL_INTERVAL_US	1
+#define K3_EFUSE_POLL_TIMEOUT_US	10000
+
+static const struct {
+	unsigned int reg;
+	unsigned int offset;
+} k3_efuse_banks[] = {
+	{
+		.reg = K3_EFUSE_BANK0_REG,
+		.offset = 0,
+	}, {
+		.reg = K3_EFUSE_BANK7_REG,
+		.offset = K3_EFUSE_BANK7_OFFSET,
+	},
+};
+
+static const struct nvmem_keepout k3_efuse_keepouts[] = {
+	{
+		.start = K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_BANK7_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK7_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_NVMEM_SIZE,
+	},
+};
+
+struct k3_efuse {
+	__le32 data[ARRAY_SIZE(k3_efuse_banks)][K3_EFUSE_BANK_SIZE / sizeof(u32)];
+};
+
+static int k3_efuse_read(void *context, unsigned int offset, void *val,
+			 size_t bytes)
+{
+	struct k3_efuse *efuse = context;
+	unsigned int bank, index;
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_banks); bank++) {
+		if (offset < k3_efuse_banks[bank].offset)
+			continue;
+
+		index = offset - k3_efuse_banks[bank].offset;
+		if (index >= K3_EFUSE_BANK_SIZE ||
+		    bytes > K3_EFUSE_BANK_SIZE - index)
+			continue;
+
+		memcpy(val, (u8 *)efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int k3_efuse_reload_shadows(void __iomem *base)
+{
+	u32 val;
+
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val | K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+	readl(base + K3_EFUSE_CONFIG);
+	udelay(K3_EFUSE_RELOAD_PULSE_US);
+	val = readl(base + K3_EFUSE_CONFIG);
+	writel(val & ~K3_EFUSE_SOFTWARE_RESET, base + K3_EFUSE_CONFIG);
+
+	return readl_poll_timeout(base + K3_EFUSE_STATUS, val,
+				  val & K3_EFUSE_READY,
+				  K3_EFUSE_POLL_INTERVAL_US,
+				  K3_EFUSE_POLL_TIMEOUT_US);
+}
+
+static int k3_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct nvmem_config config = {
+		.dev = dev,
+		.name = dev_name(dev),
+		.id = NVMEM_DEVID_NONE,
+		.owner = THIS_MODULE,
+		.type = NVMEM_TYPE_OTP,
+		.read_only = true,
+		.root_only = true,
+		.reg_read = k3_efuse_read,
+		.word_size = 1,
+		.stride = 1,
+		.size = K3_EFUSE_NVMEM_SIZE,
+		.keepout = k3_efuse_keepouts,
+		.nkeepout = ARRAY_SIZE(k3_efuse_keepouts),
+	};
+	struct reset_control *reset;
+	struct nvmem_device *nvmem;
+	struct k3_efuse *efuse;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int bank, i;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to get clock\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable clock\n");
+
+	reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = dev_err_probe(dev, PTR_ERR(reset),
+				    "Failed to get and deassert reset\n");
+		goto disable_clk;
+	}
+
+	ret = k3_efuse_reload_shadows(base);
+	if (ret) {
+		dev_err_probe(dev, ret, "Timed out waiting for shadow reload\n");
+		goto disable_clk;
+	}
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_banks); bank++) {
+		for (i = 0; i < ARRAY_SIZE(efuse->data[bank]); i++) {
+			u32 val = readl(base + k3_efuse_banks[bank].reg +
+					i * sizeof(u32));
+
+			efuse->data[bank][i] = cpu_to_le32(val);
+		}
+	}
+
+	clk_disable_unprepare(clk);
+
+	config.priv = efuse;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem),
+				     "Failed to register NVMEM\n");
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(clk);
+	return ret;
+}
+
+static const struct of_device_id k3_efuse_of_match[] = {
+	{ .compatible = "spacemit,k3-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, k3_efuse_of_match);
+
+static struct platform_driver k3_efuse_driver = {
+	.probe = k3_efuse_probe,
+	.driver = {
+		.name = "spacemit-k3-efuse",
+		.of_match_table = k3_efuse_of_match,
+	},
+};
+module_platform_driver(k3_efuse_driver);
+
+MODULE_AUTHOR("Jiayu Du <duge1256@gmail.com>");
+MODULE_DESCRIPTION("SpacemiT K3 read-only eFuse driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

