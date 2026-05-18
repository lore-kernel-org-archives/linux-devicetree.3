Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1FA481ABB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114060; cv=none; b=gfFtIPngwWQM5dRNdxTLjcor7g0/uRBcESe6LS4CYFN2RlqmK2AXkrOAh9IprSThkI6PIvfplNfKRyj+YvN5JxuN9bbBM6TDW1+TU9rbpYIFQ7B5gYN/OJqJZTRoV9Vl7YrLP2y2tzC35yaDEH+v5X7Thppg+avyS7Y2E4CNYIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114060; c=relaxed/simple;
	bh=7IxyLn7/GTQfidiqPllWO1BcJ/tmNAyzxF6iCaiajmc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UorvjWg94ZdZlsw7I7u5WWz/GZjUE5lWU9g+7S6sXKWUvkJJlBg9PncUw/nMQdCOgIPBTdM+7oH88RRTsxn6IIKug7nlioWsp0taJ6MxAl0qtlI0BTCqbpkQk8YQmNySJTAI450uMFMIyhFTts/JOlxpgb2KA0yunpBXKQy79c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B24OJsFo; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B24OJsFo"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44c350a5b87so1355740f8f.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114054; x=1779718854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Two8INXQM5ey4/UQP4u04Ps1i9Z9naN07Q8ziJqEkkw=;
        b=B24OJsFou51aG0q89wR9ewMfHMadWDI6oCCiF8HhIyb0RLL6CeGZI7XRGi3cLq8/z0
         EHPSTc+2rBAvFLBE9p86/KRcm8jc0G7CJnMtdVxmGoOOHWaUBE5cSlkfneUUL105pSjl
         WFzhmNh0BF926dO7IFcQh8lqxFWxGYMVyrcIWxqlKKGKLSxCERoKJnX9jbRQPx0KvR5I
         k4TfrDMp/e1cFvnl+BPOmL8W1N8a4KzEnayM2qRFUUzIon2iB2fzB96C0gsmH1hy2fHQ
         2xT9jyu7q2I2OgRw/UoKoMpi+D6JHMg6r7ZrXl+mmfuhUq4jCBO6lzbVhevPvBFh8UFz
         592A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114054; x=1779718854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Two8INXQM5ey4/UQP4u04Ps1i9Z9naN07Q8ziJqEkkw=;
        b=eT4JJ1MHTzn5CHU+6O9tYowhr85HMX8MIKRPzX3wO80Wz2yWm97Egj3kEjSOp2r+XU
         QFwK5BrCqRPAhej64iOrs+GHD6m1nZY3fyoiNej7Kd8WxwnLCv7U4vbVZICOz/IfUhti
         vndwHOE41peo9dXr6WQHMMGOyFI/bowUh+tQFO8IZTl8egUV6FKEuZE4qjQ6OfZbRC1a
         sSqAQaLXAhh4Qcgngrs9sjJfyyV7Kav3cFUIIqhaZvbzgBkLC3wKHe2JEifdsD5UpDqs
         VrWraXf9BdR+pvDkdEPPMLfIEi9/pz03fYSEJwIUuBM8AITXBR2ddLw6YjgGALOv1Yku
         t1wA==
X-Forwarded-Encrypted: i=1; AFNElJ/R9AHD2EdeaHITFB2U+E9VANcsh1mdYFo8puP58R8wgnjUstQLmFJo7zyg4DSCPI+DOYhpCtStYTCp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy04OJ7+h/7KKan8YnQ0O28q0HiNW1VO16MpVcpvF8aFEwbHScp
	ztlkQzhl2S2ba7fGajGjVFz2PPVXFXJRmi41C51gYrgrbbPV/Gta4L6O
X-Gm-Gg: Acq92OHWsEa3TebeRJyjco1f921ChZiprZvFbvdzpyiAxfpWDX02X3Ai2BF+gXRe83O
	kZ9sFYz766gBPoD1Q3xh3n5enem5NLazKvElB4msP92Vg0mzDkFM6u6swLjfJL4uYdjLw60Xtdu
	VzBM2qHU1Cth5/lUr7A4rgJx5JyKg5xLR3g+VioMShC8uS3Dv7lTiFB/Myz3NyiVXWWratx7uwo
	C9z2CcmV7Kf2J20yU3AucoABrhYCgOLIFcyIG+k4uv/sxJfCgY+gxS6FUtZAgvLo+e/teCul2jr
	xGJFM0odRU3v6RB5JPUkUyHGC5VdZ4t6xNCL5uHTb7ELDqM2gWCJrjPUWYVfJHoBPwTRkh7B0qf
	poZrE0x/RkFGeowduLD6q1Nx+RJvrEOz3+AscV1tOxTkav4pEU8Uc4vi3MUU9lVeZ8/QH2I7Pp7
	mrzmYH51e8zZwRFLbWSASFNuxJ2ADEhqgRKOIW8DfKIIolulemLyB8Jom2XEwE0SdS8bsIxHgrT
	VbZivn8Wg==
X-Received: by 2002:a05:6000:26c4:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-45e5c5e2ee5mr23864236f8f.22.1779114053016;
        Mon, 18 May 2026 07:20:53 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm34905626f8f.26.2026.05.18.07.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:20:52 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] nvmem: airoha: Add support for SMC eFUSE
Date: Mon, 18 May 2026 16:20:32 +0200
Message-ID: <20260518142042.8331-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518142042.8331-1-ansuelsmth@gmail.com>
References: <20260518142042.8331-1-ansuelsmth@gmail.com>
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
 drivers/nvmem/airoha-smc-efuses.c | 118 ++++++++++++++++++++++++++++++
 3 files changed, 133 insertions(+)
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
index 000000000000..bb279d149519
--- /dev/null
+++ b/drivers/nvmem/airoha-smc-efuses.c
@@ -0,0 +1,118 @@
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
+	u8 bank_index;
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
+static const struct regmap_config airoha_efuse_regmap_config = {
+	.reg_read = airoha_efuse_reg_read,
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static int airoha_efuse_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		struct nvmem_config airoha_nvmem_config = {
+			.name = "airoha-efuse",
+			.size = AIROHA_EFUSE_CELLS * sizeof(u32),
+			.stride = sizeof(u32),
+			.word_size = sizeof(u32),
+			.reg_read = airoha_efuse_read,
+		};
+		struct airoha_efuse_bank_priv *priv;
+		struct nvmem_device *nvmem;
+		struct regmap *regmap;
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
+		priv->bank_index = bank;
+
+		regmap = devm_regmap_init(dev, NULL, priv,
+					  &airoha_efuse_regmap_config);
+		if (IS_ERR(regmap))
+			return PTR_ERR(regmap);
+
+		airoha_nvmem_config.priv = regmap;
+		airoha_nvmem_config.dev = dev;
+		airoha_nvmem_config.id = bank;
+		nvmem = devm_nvmem_register(dev, &airoha_nvmem_config);
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

