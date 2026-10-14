Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DF04A68B5
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963966; cv=none; b=FFjkEJyvPUaPFmRWBk5kINKevRG5lyCoMXnLKp6PmmIs5j04g17F+nSxvJHc1oTWddG4oeDAM3t44ktm1poFkjL9qGWj8lfruUMSxMu59HpIEgVWqgMtsxL73KMHJNxvO/aS1LQknjnis8UY49vU+F11sxu4YvRmvSyjIr95JZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963966; c=relaxed/simple;
	bh=RfqMKSFM0scXEd3t9DBM9oELeQHeOiEd/sfSVVzp2EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngusVkIwJjn3ZNGQcl2uke4JpI6oHjqihsoUoDDng1nG09oEjnANzT6qkBWbYa+k+/mSM1JyUBQZXowE++RLXB+m0s7Z6JZRmbGAlTuP6Zv6bhmRBMzE4KqQjG8WTK/DBikTh25aR2mWjJScA599sVfAb4u/oXIwH9iewM7IKQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrSJzumr; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrSJzumr"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e901e114fdso12508875ad.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 00:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963961; x=1792568761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mIieeGY1UVHx10SysmP5f2W/As1aw4zkNpA5Xc1vkM=;
        b=qrSJzumrtJkg+B4RfgqnPxs+SfHgjezLd/LPt4rFusPBaWjEM23Bw76vdsrR3ZjOvS
         ouC4UNPTZ8eZmaBW0JJFmGC2w+B3mCmYlyadvs7Mj6vsOi+ZUUuO49UEzBwR2LiCt4+f
         hthXc9rMDfaInropjGsGfaIIAlBSMGAGNnp5nBydPOWGLPuwp0bW9uMjyA1GMbi10cz7
         8e7NsJmDLpYi6b+/BXRM1W4b2Nv2NIctaE4F18IIF8qT70xrGMV8lDA/Pc34HZevE7rU
         ackWyk/VTYOsZEKdv6Lav0Ki91J0b7lYja9QSIn9uPqayZ+vtcV7104Qvyl8L+tmz7H6
         K8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963961; x=1792568761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+mIieeGY1UVHx10SysmP5f2W/As1aw4zkNpA5Xc1vkM=;
        b=eI+OFES3fr06/5Lhq/CahozQDzNMHd36WeHxCytoLsFIDercJylJbGSUpNvVRGa5GH
         vcviUrBNekwc2pQbPHwCA3O/hn5SrHqWeEW87IUYik0+XmRHIglYpT4ouzkRxj78zAWi
         CxHshNDu4Mw/SlL99P9x6brRD4i4S3s4+uIn+s49x8A7ej8PDujsCVP5AIpOmGezHpoN
         qZ0jS66S16/L3UoVJe6VKPds2spUNPOYwZlAzpIeauG+iKE53tdIhzUHUI7FHDNNv6k0
         GswVck+bDllVV89YZFMTjvKmQZgp8c5tQbBSo+VEJ6XdWq/yMK0R6YDftKyuO3qMoLJD
         BmfQ==
X-Gm-Message-State: AFq9FYLx338kNf4GOqTp4sT5+PiWYCgW4/8pxhKECH42W2CAokw8kDe/
	kIM3dgzOXCtFBTDp6wXd7j4q/pV1tee+wlDmGUcKc1wFv40GPFseygQL
X-Gm-Gg: AYBFou38c9vRS7WKx1X8DHLoIqMFJRCBK8HMV+HfaQbXgP0ulktIrh2rgzqAgtcSwMk
	gAQPReWruyNL9rzySN4QhlmWQ9c/Ym3lE0tNfhbLLELFGYcOqVtnpyMcwoLzpQkgR3YOpcokX6k
	ICvgPCpIFpjVikI/rFkm78Gy2BAbqRo0zpJhpVHf5hyRfex7jrOjsamVHzcudV/pgplaTa7dngy
	dYWvPD2Z5O9qdtjtzEmdzkOh1P807iwRn2RjW+tXqMZ38HsDBjAjHShnk3hdVGns1y+0QPpRAGI
	5x8uY65jwgifygbPqbnSWx6J08TUWd1LCRXeeXzieRX79qHCjSewDrTOqwImTEKy24HhK6RswGV
	zs1PSCmZscQ1WOkZt8oJUiICR6lNSSfyT7vN+xk7tfUyoB2fgI1+QfN395lploPwD57Gs2dQ8a6
	CRbZS+VRWR8Jvag3pWyrBebFuw+cnT05nd0i1lcgvkYDIGb++5YFh8MA1XIETAZ9mDDHeI
X-Received: by 2002:a17:903:2307:b0:2e9:401f:f102 with SMTP id d9443c01a7336-2e9401ffc4cmr7724765ad.32.1791963960773;
        Wed, 14 Oct 2026 00:46:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a05f70sm65986985ad.7.2026.10.14.00.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:46:00 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Date: Wed, 14 Oct 2026 15:45:14 +0800
Message-ID: <20261014074516.240247-3-inochiama@gmail.com>
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

Sophgo SoCs such as SG2044 contain eFuses used to store
factory-programmed data.

As for SG2044, HW automatically loads the eFuse content
into shadow registers which are organized as 32bit values
exposed as MMIO.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/nvmem/Kconfig        |  12 +++
 drivers/nvmem/Makefile       |   2 +
 drivers/nvmem/sophgo-efuse.c | 176 +++++++++++++++++++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 drivers/nvmem/sophgo-efuse.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index c36c2a4c2a0b..a7936dd65bdd 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -465,6 +465,18 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SOPHGO_EFUSE
+	tristate "Sophgo eFuse support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	default ARCH_SOPHGO
+	help
+	  Say y here to enable support for reading eFuses on Sophgo SoCs
+	  such as the CV1800B. These are e.g. used to store factory programmed
+	  calibration data required for the builtin ethernet PHY.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-sophgo-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 2bbfb9ff1885..430ddddf8c3c 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -79,6 +79,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
 nvmem-sc27xx-efuse-y			:= sc27xx-efuse.o
 obj-$(CONFIG_NVMEM_SNVS_LPGPR)		+= nvmem_snvs_lpgpr.o
 nvmem_snvs_lpgpr-y			:= snvs_lpgpr.o
+obj-$(CONFIG_NVMEM_SOPHGO_EFUSE)	+= nvmem-sophgo-efuse.o
+nvmem-sophgo-efuse-y			:= sophgo-efuse.o
 obj-$(CONFIG_NVMEM_SPMI_SDAM)		+= nvmem_qcom-spmi-sdam.o
 nvmem_qcom-spmi-sdam-y			+= qcom-spmi-sdam.o
 obj-$(CONFIG_NVMEM_SPRD_EFUSE)		+= nvmem_sprd_efuse.o
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
new file mode 100644
index 000000000000..5f90adaf8e4f
--- /dev/null
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Sophgo SoC eFuse driver
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/cleanup.h>
+#include <linux/iopoll.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+
+#define SG2044_EFUSE_CONTENT_SIZE		0x400
+
+#define SG2044_EFUSE_MD				0x000
+#define SG2044_EFUSE_ADR			0x004
+#define SG2044_EFUSE_RD_DATA			0x00c
+
+#define SG2044_EFUSE_MODE			GENMASK(1, 0)
+#define SG2044_EFUSE_MODE_READ			2
+
+#define SG2044_EFUSE_BOOT_DONE			BIT(7)
+#define SG2044_BOOT_TIMEOUT			10000
+
+#define SG2044_EFUSE_ADR_ADDR			GENMASK(7, 0)
+
+#define SG2044_EFUSE_ALIGN			4
+
+struct sophgo_efuses {
+	void __iomem *base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct mutex mutex;
+};
+
+static int sg2044_efuse_wait_mode(struct sophgo_efuses *efuse)
+{
+	u32 value;
+
+	return readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				  FIELD_GET(SG2044_EFUSE_MODE, value) == 0,
+				  1, SG2044_BOOT_TIMEOUT);
+}
+
+static int sg2044_efuse_set_mode(struct sophgo_efuses *efuse, int mode)
+{
+	u32 val = readl(efuse->base + SG2044_EFUSE_MD);
+
+	val &= ~SG2044_EFUSE_MODE;
+	val |= FIELD_PREP(SG2044_EFUSE_MODE, mode);
+
+	writel(val, efuse->base + SG2044_EFUSE_MD);
+
+	return sg2044_efuse_wait_mode(efuse);
+}
+
+static u32 sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
+				    unsigned int offset, u32 *strip)
+{
+	u32 val = FIELD_PREP(SG2044_EFUSE_ADR_ADDR, offset);
+	int ret;
+
+	guard(mutex)(&efuse->mutex);
+
+	writel(val, efuse->base + SG2044_EFUSE_ADR);
+
+	ret = sg2044_efuse_set_mode(efuse, SG2044_EFUSE_MODE_READ);
+	if (ret < 0)
+		return ret;
+
+	*strip = readl(efuse->base + SG2044_EFUSE_RD_DATA);
+
+	return 0;
+}
+
+static int sg2044_efuses_read(void *context, unsigned int offset, void *val,
+			      size_t bytes)
+{
+	struct sophgo_efuses *efuse = context;
+	unsigned int start, start_offset, end, i;
+	u32 value;
+	u8 *buf;
+	int ret;
+
+	start = rounddown(offset, SG2044_EFUSE_ALIGN);
+	end = roundup(offset + bytes, SG2044_EFUSE_ALIGN);
+	start_offset = offset - start;
+
+	start /= SG2044_EFUSE_ALIGN;
+	end /= SG2044_EFUSE_ALIGN;
+
+	ret = readl_poll_timeout(efuse->base + SG2044_EFUSE_MD, value,
+				 (value & SG2044_EFUSE_BOOT_DONE),
+				 1, SG2044_BOOT_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	buf = kzalloc(end - start, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	for (i = start; i < end; i++) {
+		ret = sg2044_efuses_read_strip(efuse, i, &value);
+		if (ret)
+			goto failed;
+
+		memcpy(&buf[(i - start) * 4], &value, SG2044_EFUSE_ALIGN);
+	}
+
+	memcpy(val, buf + start_offset, bytes);
+
+failed:
+	kfree(buf);
+
+	return ret;
+}
+
+static int sophgo_efuses_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sophgo_efuses *efuse;
+	struct nvmem_config config = {
+		.dev = &pdev->dev,
+		.add_legacy_fixed_of_cells = true,
+		.read_only = true,
+		.reg_read = sg2044_efuses_read,
+		.stride = 1,
+		.word_size = 1,
+		.name = "sophgo-efuse",
+		.id = NVMEM_DEVID_AUTO,
+		.root_only = true,
+	};
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	efuse->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(efuse->base))
+		return PTR_ERR(efuse->base);
+
+	efuse->num_clks = devm_clk_bulk_get_all_enabled(&pdev->dev, &efuse->clks);
+	if (efuse->num_clks < 0)
+		return dev_err_probe(dev, efuse->num_clks, "failed to get clocks\n");
+
+	config.priv = efuse;
+	config.size = SG2044_EFUSE_CONTENT_SIZE;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id sophgo_efuses_of_match[] = {
+	{ .compatible = "sophgo,sg2044-efuse", },
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
+
+static struct platform_driver sophgo_efuses_driver = {
+	.driver = {
+		.name = "sophgo_efuse",
+		.of_match_table = sophgo_efuses_of_match,
+	},
+	.probe = sophgo_efuses_probe,
+};
+
+module_platform_driver(sophgo_efuses_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo efuse driver");
+MODULE_LICENSE("GPL");
-- 
2.56.0

