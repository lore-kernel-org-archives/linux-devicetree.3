Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D5D40801E
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204499; cv=none; b=l+cdiNTgsWZQe5yF5aOnRIkyYYTE2mm3S8pg7oJ4fH0KhKs6PtvchoT6c+/rUP1Dp/OTSPPaSOCn5bihh36wfrYqDIGwU7tRG/1hsqsmBhejK6Ixk2GXn4+yLuZWv0KxwZqe7cGqZvTAJz/D6PJ1JMebDgLf7H4+ejy3Ek9jQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204499; c=relaxed/simple;
	bh=qaZwUWQxeXPjWRkxNfWYw6kUcDzps+t5748MTI9+Ldw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0UpUJfqB4LRgw47Ayh2z7J4G/ZqHRSqiLiMWxI9BYidJ41UFiIpe0Mzu+IScf0BlxCTPn+SVWFnkrsrjOV7IkkQyPBU2UgudCdhqVuSBKBr1F2HtBNJHRY12ZxWm/1M1z8xPH63V30libXizmpZgzxDY6DKmSWBRT0vk7F/Uog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAgS6lpW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAgS6lpW"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d77f6092eso2066377f8f.2
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779204497; x=1779809297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAFD3a/xT9LTsvvD+jxa4TD+i5y2aSqMXXaQQCJTkcQ=;
        b=KAgS6lpWQaECmwY+rhMs6EiMVwx+LIPqPv8pFV2PxB8bdEFdZWCFM4lXTie/3hHYiN
         3t6F4C1Ij/jC2Lnwwu3acb+skG0B3q/aPRmn5BGIfvSXkecBtQCx0q+pJ8uf7/kXFa03
         2u2T3oQ4lhFsb3lt9Zx36//pgef00r9LF9OzJH3kes1rnzSWr+W7Z6ymN4OQkNMRpHGq
         tDfiE3qPEKF5mXRzwiCIiJGdmOaJKeLT7cGPRJ+KLzcU4nQmhyIM1ZgIHy4XJ6/sORGE
         T6iIlEqHvc/gsXx4SD3If5+qCfRrToDad0EFwDyWbpV2CtZZRqhjPXztP3OLsiA0nDws
         oziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779204497; x=1779809297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tAFD3a/xT9LTsvvD+jxa4TD+i5y2aSqMXXaQQCJTkcQ=;
        b=Ey2Z06bL88ZFHdX8jmBNXsUV9T7ZkWwp6ySnlJmBKfdvccs9iZPHMHmPX4Re+3ks6Z
         Q8QrZOm4CVgMKjbo4GmRGCt0Un8KLHNBPS2xUyMjpZcYeLdIjh8i94XxzG1xQOH4uDfO
         m5cgPbKEABAyLmCXUumOnOxpWM8tDgTw1POZ+fe9SKR7ZzhDRIUQOBFd/pM2Gs6eW6t6
         w6CH4xmN4Lz9DxgePm6gSeuNaK+T7Dbvnj3NZLuEmB8qmrBGRhFTuo2FnQvDs10onQn3
         yipHeSKOpnZY750gK+KrLh4r5spoJ2I6kRfu6iu4tPMk9lcTOV8J6HxCV8RTHm8MIDyQ
         uBVA==
X-Forwarded-Encrypted: i=1; AFNElJ/sxREWtgqi5y1cog7Kf7k62lz9NfBC2LRyOuX+LG+7HKptKKu2BF5+C2UFJomjHjS3+oEFJwHIBM5d@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJcKY/iG7/lyiroaYO9WOBHOUXDYcmaJbeJyIGZE7uTqdVyo7
	BssT7Znuv/Ymc55wSW0gL0VTs/o3op1oDaIH7LbUS70iWmK9sZA9gzZa
X-Gm-Gg: Acq92OGApo3oS1Xe5uLz51zQWWniU0SdQMPGRUnF2d8ns7QuqFr8feHZX2r9d5otNgW
	fc58+l4Qh/6v39spsws8FSWK3bUHPtXz8j7/xdnpxiAhGynjKsVylhxNAnCCjJccFCuF1ODEhX4
	vMUU66JMzKtWXQTtCFv9eQvr9BzYXAl+1GRxom9BuI9rfRid/TeN3ATjpRmWTfC5Cuqjrwl0CsY
	sQq1jWdoj2x9lHiqNRo6ce6KyWkH/A+kpFiflBfZ4CypiHWSpdwKrkvAGDKAs1ec8smo4ABoKxs
	/Sg7C8CUWnrIhhDi+0NIFZv3mfxmMBJHh5ZOiBSFZrzSjvT6AY+Wn0en28eCXBE4MxjDHtzBSHu
	O4hs12hl1Eo9CrXcQAGXBGOY4cJ5BrlFO3O9N15dI5oUnpp+kp+hnLpStgsUb7faBuDECUSLu3C
	E375k2W3y4xgVykSvJF5hKWbv2jyQSRO7zcj7bmEEfFlKCKcmkg55QVuljBuH8iwbznRsRNQsuW
	RzyLzvLbw==
X-Received: by 2002:a05:6000:2405:b0:43b:3e40:2223 with SMTP id ffacd0b85a97d-45e5c5b9673mr33073152f8f.19.1779204496633;
        Tue, 19 May 2026 08:28:16 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm49005662f8f.18.2026.05.19.08.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:28:16 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] nvmem: airoha: Add support for SMC eFUSE
Date: Tue, 19 May 2026 17:28:06 +0200
Message-ID: <20260519152807.29407-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519152807.29407-1-ansuelsmth@gmail.com>
References: <20260519152807.29407-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SMC eFUSE on AN7581 SoC. The SoC have 2 set of 2048 bits of
eFUSE that are used to read calibration value for PCIe, Thermal, USB and
other specific info of the SoC like revision and HW device present.

eFuse value are taken by sending SMC command. ATF is responsible of
validaing the data and rejecting reading protected data (like Private
Key). In such case the SMC command will return non-zero value on a0
register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/nvmem/Kconfig             |  13 ++++
 drivers/nvmem/Makefile            |   2 +
 drivers/nvmem/airoha-smc-efuses.c | 125 ++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/nvmem/airoha-smc-efuses.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 74ddbd0f79b0..95a399258538 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -28,6 +28,19 @@ source "drivers/nvmem/layouts/Kconfig"
 
 # Devices
 
+config NVMEM_AIROHA_SMC_EFUSES
+	tristate "Airoha SMC eFuse support"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on HAVE_ARM_SMCCC
+	default ARCH_AIROHA
+	help
+	  Say y here to enable support for reading eFuses on Airoha AN7581
+	  SoCs. These are e.g. used to store factory programmed
+	  calibration data required for the PCIe or the USB-C PHY or Thermal.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-airoha-smc-efuses.
+
 config NVMEM_AN8855_EFUSE
 	tristate "Airoha AN8855 eFuse support"
 	depends on COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 7252b8ec88d4..f6f2bc51dee1 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -10,6 +10,8 @@ nvmem_layouts-y			:= layouts.o
 obj-y				+= layouts/
 
 # Devices
+obj-$(CONFIG_NVMEM_AIROHA_SMC_EFUSES)	+= nvmem-airoha-smc-efuses.o
+nvmem-airoha-smc-efuses-y 		:= airoha-smc-efuses.o
 obj-$(CONFIG_NVMEM_AN8855_EFUSE)	+= nvmem-an8855-efuse.o
 nvmem-an8855-efuse-y 			:= an8855-efuse.o
 obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
diff --git a/drivers/nvmem/airoha-smc-efuses.c b/drivers/nvmem/airoha-smc-efuses.c
new file mode 100644
index 000000000000..e56a99f4aa1f
--- /dev/null
+++ b/drivers/nvmem/airoha-smc-efuses.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Author: Christian Marangi <ansuelsmth@gmail.com>
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define AIROHA_SMC_EFUSE_FID		0x82000001
+#define AIROHA_SMC_EFUSE_SUB_ID_READ	0x44414552
+
+#define AIROHA_EFUSE_CELLS		64
+
+struct airoha_efuse_bank_priv {
+	u32 bank_index;
+};
+
+static int airoha_efuse_read(void *context, unsigned int offset,
+			     void *val, size_t bytes)
+{
+	struct regmap *regmap = context;
+
+	return regmap_bulk_read(regmap, offset,
+				val, bytes / sizeof(u32));
+}
+
+static int airoha_efuse_reg_read(void *context, unsigned int offset,
+				 unsigned int *val)
+{
+	struct airoha_efuse_bank_priv *priv = context;
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_invoke(AIROHA_SMC_EFUSE_FID,
+			     AIROHA_SMC_EFUSE_SUB_ID_READ,
+			     priv->bank_index, offset, 0, 0, 0, 0, &res);
+
+	/* check if SMC reported an error */
+	if (res.a0)
+		return -EIO;
+
+	*val = res.a1;
+	return 0;
+}
+
+static int airoha_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		struct nvmem_config nvmem_config = {
+			.size = AIROHA_EFUSE_CELLS * sizeof(u32),
+			.stride = sizeof(u32),
+			.word_size = sizeof(u32),
+			.reg_read = airoha_efuse_read,
+		};
+		struct regmap_config regmap_config = {
+			.reg_read = airoha_efuse_reg_read,
+			.reg_bits = 32,
+			.val_bits = 32,
+			.reg_stride = 4,
+		};
+		struct airoha_efuse_bank_priv *priv;
+		struct nvmem_device *nvmem;
+		struct regmap *regmap;
+		const char *name;
+		u32 bank;
+
+		ret = of_property_read_u32(child, "reg", &bank);
+		if (ret)
+			return ret;
+
+		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "airoha-efuse-%u",
+				      bank);
+		if (!name)
+			return -ENOMEM;
+
+		priv->bank_index = bank;
+
+		regmap_config.name = name;
+		regmap = devm_regmap_init(dev, NULL, priv,
+					  &regmap_config);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+
+		nvmem_config.name = name;
+		nvmem_config.priv = regmap;
+		nvmem_config.dev = dev;
+		nvmem_config.id = bank;
+		nvmem_config.of_node = child;
+		nvmem = devm_nvmem_register(dev, &nvmem_config);
+		if (IS_ERR(nvmem))
+			return PTR_ERR(nvmem);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id airoha_efuse_of_match[] = {
+	{ .compatible = "airoha,an7581-efuses", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, airoha_efuse_of_match);
+
+static struct platform_driver airoha_efuse_driver = {
+	.probe = airoha_efuse_probe,
+	.driver = {
+		.name = "airoha-efuse",
+		.of_match_table = airoha_efuse_of_match,
+	},
+};
+module_platform_driver(airoha_efuse_driver);
+
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_DESCRIPTION("Driver for Airoha SMC eFUSEs");
+MODULE_LICENSE("GPL");
-- 
2.53.0

