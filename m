Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945233;
	b=dJKdmk60W98aiXYHLdIiXqwajUF5v8X03VqL5zzVWg9WQTDnjfE0WaG9yUOukFERje9h
	 3wncJhEo563xtpX9uqeVgj2WTMEkGRLV2GA7e48k+88OSOaoinasofDmFQWtoENRnC4Gw
	 T/nW3JD/YiXux5jLifePZhzwhapYOO0Uq0QxRnSzjUdDAQk3MxTj6GbOqitCnecDKBIRO
	 9KXSuhndn+ALiHGNZYu/H+O5vOFRxl/B7ho6GFKE1uz7cQGeFXJXZUOQNO+QwbkgJz1EO
	 QTjI6mlLnjkzLdVhbCBPeNbHzfZ2aHjaCURYc0AtNcvJssyfcL6rw4XKy134SkxoVGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
	b=Ci131sJt21jyE+EKqSfvHnQzrZvjIbNHxDkz/MG3w1jxa/DOWve7pi177NEPWdDRzFV8
	 Hi1GbuM0Cl0S3x3TKNLpjMWZr5odvhbdZt6kK43cbCkk6Eex06bvV8MGGWYN+216BmJsJ
	 EGRcKSOGYEvIxoSAA2PFrilxlYkmhVxlIKRnt245utWG2kPwC9HZnnuAX408UDXjNct5T
	 TLQ5iZr/GO+TF0C2jrmsCXcesLjDX9IC+OJ0sf7I+1kKXT82sLIyQZpLrZCtF/hsQhhpk
	 wrDLKbwQd2131iEpEYvK7RufJEXdBy4xRLQxfG4HCgxo4ClFNvyqRzuRx01QMX5Rddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+dENenA;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F2606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 06:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F4F2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o+dENenA
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so471845c88.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945233; x=1794550033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
        b=o+dENenAl6+UoTxTD/9ElA/bcVy/nkmYg+F7U/oXM7NhzPneSUIjAhN4TptYdehcUq
         6Z0Nwyt4u4h3s5JFCuUfXIGGkDQ0G4llurynEVpHYedtVWsDGHfzocc3sWNLll2qSQYt
         8edwYMEflEu/GPoE4EWZtJV92lqa+FQFC8J5hNhzWeRz1ZkseDoPD3b4bbG4pMfMpUS6
         0L6PKQ8OcOgdODK8Tbremesxuc73GupJmWuW/T2JfIaGzAguO5JsZ2aNRk5ALCSd6x71
         yHBV3w3q4z7FKe322HMIDlVJqExTsuGJWyYeElLvjvpMBtjUesyg4kCq8uqlEowKIpQU
         dVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945233; x=1794550033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6tf8e1TiIZCPiuqeGmQ9C1JUjOtS/N/aYWA/KP8sylw=;
        b=RdLxoYfeFPkx47soNVSZpngeAR7kLRZbEtpXYSSRQQPpEQd5JmG+xps6z8x00AfOBx
         jhHvQnf8zcXQlnhiwuAQrmjkbpjz4ffGKQqGODHcuOX366NwNYzv3kFsZJUuyXOxGKVi
         wZUMFwGTuf1uRysUFNr2vt9/SfHPCEqvrYDVLFxE8+sAj4V0kU0iBu59lG6flagSyyU5
         0hsOEWriOUU3ioejuAA9kB3xTYX8JX2aTxGvmutixIInnrsZyLrGrUoZ1tR+eJ0RU25r
         FroBmJst4YG7O4Q7gmKmGLxtmrdxTX9KbfCnrBJooZYO+B1kW5P1r6I/ArawyOJ7ugGL
         QiwA==
X-Forwarded-Encrypted: i=1; AKwUvBy4lChvJbNZRo/vKIT8s8pI4G7x+ssMs+48yZfN4RiFjdBFHPl+7cteu10f36J+wVCiMjhqasU7THeR@vger.kernel.org
X-Gm-Message-State: APuU4Z8MtoSDaWC63EvGJwNcdQwgOiVum+Bt5aPmMFoOYXtiIg8ZA7/n
	7okVWHZKYhI2ghZkJJ4mC70ylEJBix3xcM38UJxbBa6MD3BnB1Z2ap7o
X-Gm-Gg: AYBFou0yHkrSd1M+vCU1lwdHSLMA8N5r6WSVyrjnXXuBbN1a4vEa2Obf1XW3qoxuv9x
	SZB4GCzhRcKa2ImvI9BqDWzN66k6+G8ZrJRT7yKWL+F12/GkHR4hlAWi/ZHNjY/pd4uv2mFm7Eb
	bzg4V6M6klu3Bd8kpngRHsnJmtn/u35fFPYPcl+iVztUJDuWE1ElrdkQZXqirhyDm2vJc558n+o
	5kLpIV41kf93lD6kSrL2IimwRzHW9ntpRzDkATK+kuPeGgqVKVXXW9pFkjI06C+YFo9rP7/zRgD
	SoWtiUHFOolvCk4isQWBzy9qD3JPr66oHa7imrb99IIUmPqHdhUp1Tuneqy0Jpqo910ATJ/XQpS
	LRj+3vilrHogpBTa0sW+2ejGY6qB1YmuT5uZc8Vj0fSo+fFDXYMexGxWvLrnKfOQVHLFbBDOzKQ
	KQzJxW2kwmXnUxqMaFphRD0GsujNcKFJd0ZKyxGdDQxHi5WLwB5K6zWQ17gGXtWwu6C9N5gdldD
	AsiEXj8ATHLkW8DbPK5BMM+kqAQ93oAUgS/Zs3a02wV/hWw9N8Bnc41iTaTpinxT84d4eTglKHw
	hsARTo4octY8y3cxxku4KKmAaTZzT3+5sOK4R1GxYd5IO5jbzRbx
X-Received: by 2002:a05:701a:c907:b0:182:6c6c:d876 with SMTP id a92af1059eb24-1b25d2fe798mr1729112c88.8.1793945232552;
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:12 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
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
Subject: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Date: Fri,  6 Nov 2026 14:05:24 +0800
Message-ID: <20261106060525.346873-3-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
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

Snapshot the shadow registers with aligned 32-bit reads and expose the
data in little-endian order at controller-relative offsets. Serve reads
from the snapshot and use keepouts for the remaining register ranges.
Keep the AES_WTM clock enabled and its shared reset deasserted while the
provider is registered.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 MAINTAINERS                       |   1 +
 drivers/nvmem/Kconfig             |  14 +++
 drivers/nvmem/Makefile            |   1 +
 drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
 4 files changed, 167 insertions(+)
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
index d2f5bb236663..28d6c59fbd74 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SPACEMIT_K3_EFUSE
+	tristate "SpacemiT K3 eFuse support"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	depends on COMMON_CLK && RESET_CONTROLLER
+	help
+	  Say Y here to read configuration and calibration data from the
+	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
+	  the shadow registers before Linux starts. Programming and reloading
+	  the fuses are not supported.
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
index 000000000000..d106053beae8
--- /dev/null
+++ b/drivers/nvmem/spacemit-k3-efuse.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SpacemiT K3 read-only eFuse driver
+ *
+ * Copyright (c) 2026 Spacemit Co. Ltd.
+ */
+
+#include <linux/array_size.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+#define K3_EFUSE_REG_SIZE		0x400
+#define K3_EFUSE_BANK_SIZE		0x20
+#define K3_EFUSE_BANK0_OFFSET	0x104
+#define K3_EFUSE_BANK7_OFFSET	0x190
+
+static const unsigned int k3_efuse_bank_offsets[] = {
+	K3_EFUSE_BANK0_OFFSET,
+	K3_EFUSE_BANK7_OFFSET,
+};
+
+static const struct nvmem_keepout k3_efuse_keepouts[] = {
+	{
+		.start = 0,
+		.end = K3_EFUSE_BANK0_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK0_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_BANK7_OFFSET,
+	}, {
+		.start = K3_EFUSE_BANK7_OFFSET + K3_EFUSE_BANK_SIZE,
+		.end = K3_EFUSE_REG_SIZE,
+	},
+};
+
+struct k3_efuse {
+	u8 data[ARRAY_SIZE(k3_efuse_bank_offsets)][K3_EFUSE_BANK_SIZE];
+};
+
+static int k3_efuse_read(void *context, unsigned int offset, void *val,
+			 size_t bytes)
+{
+	struct k3_efuse *efuse = context;
+	unsigned int bank, index;
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		if (offset < k3_efuse_bank_offsets[bank])
+			continue;
+
+		index = offset - k3_efuse_bank_offsets[bank];
+		if (index >= K3_EFUSE_BANK_SIZE || bytes > K3_EFUSE_BANK_SIZE - index)
+			continue;
+
+		memcpy(val, efuse->data[bank] + index, bytes);
+		return 0;
+	}
+
+	return -EINVAL;
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
+		.size = K3_EFUSE_REG_SIZE,
+		.keepout = k3_efuse_keepouts,
+		.nkeepout = ARRAY_SIZE(k3_efuse_keepouts),
+	};
+	struct reset_control *reset;
+	struct nvmem_device *nvmem;
+	struct k3_efuse *efuse;
+	struct resource *res;
+	void __iomem *base;
+	struct clk *clk;
+	unsigned int bank, i;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	if (resource_size(res) != K3_EFUSE_REG_SIZE ||
+	    res->start % sizeof(u32))
+		return dev_err_probe(dev, -EINVAL, "Invalid register window\n");
+
+	efuse = devm_kzalloc(dev, sizeof(*efuse), GFP_KERNEL);
+	if (!efuse)
+		return -ENOMEM;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to enable clock\n");
+
+	reset = devm_reset_control_get_shared_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset), "Failed to deassert reset\n");
+
+	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
+		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
+			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i);
+
+			put_unaligned_le32(val, efuse->data[bank] + i);
+		}
+	}
+
+	config.priv = efuse;
+
+	nvmem = devm_nvmem_register(dev, &config);
+	if (IS_ERR(nvmem))
+		return dev_err_probe(dev, PTR_ERR(nvmem), "Failed to register NVMEM\n");
+
+	return 0;
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

