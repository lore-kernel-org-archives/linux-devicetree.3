Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505378;
	b=ePo2m0Ye+EMjROC2WxBitpzQh0csprocLKuIQ97jhO/U6EExB3FuwjkAOSayB7LPS1yg
	 +hQ44AO9wOOSGiB+zL1Ljj/ggfZq2kythpzJw6HLjSU27mY4UJCeJ2GK5HiH4Ctt3sXqz
	 sbgOhfwxUU7HjzcjNAZmbuL7LXK+Yond688tCc0OJBlVjEhq5hTWsOPeXlr9Sj6l4+Tya
	 wbvI8dcalCM49gkrRKOBbUe5D6EgvjCf4kz9S6uiI7udqozFwqSkhHiB0e7Zdan8fehzJ
	 AwEeNwkxci8iML3uri8AJb/kxOIHMDmLUszRZatptIB2dKj4Eb8bZxsas/9fvyFtGCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
	b=kUS2NBz6n+ti1AtTFe+UgxnJYcwrqPrtrmtVt05AGFzKiqSecvVPPm/e0znse9zbMGcd
	 h14JZzleCb6Ijgrb0SkqwpcbMq5d1KWsvTeSSj36k5e/Ahq9665GzmvK5wTOd+j0BKJvj
	 kEDn05fw4X0eKcRW0/0qrX+D20InnmNHQl+tMP9p47LB7o+n+oK/ECcVx0/bZk4miJZFe
	 7kre3Qsk5N1zYNy3ks6NqfElTikwDzCoiIFsSJI6WRQc4ZIppaPRlclCdrIoglm+FqlHp
	 +oOXgfMDT/SigyYdqXituhNDzO4NRDjVr8kv8/ZChKqWysbHK6IZ13fUXCI+rew1SYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRPDeGiC;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F0606A335
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 07:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2F0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CRPDeGiC
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso2678858a12.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 23:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505377; x=1796110177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
        b=CRPDeGiCKnKoKY4aIHRZyu35iEF1GmR1ERFuarJuTDRWEKGdSKZ1xYWN8Bj1faf1Zu
         lpcKJUTJQHJMAlvdsSh5RvFzNE8Lw69oB39RLGTMQmEMke+HFVC8ImtF3A1JHQqJUeRm
         RtrRqGSt5j32mMpMPLlVo1JcifevCOcxW3e6hlXH49xyDC57zGqLKS9F1CPKO2mhxpwi
         phnAflR3xuk1E4kCjjchhZ++nlQnR4fDtQIAXzsFus9RzWv2xh6aWMFOfagN74DQ7coI
         y+hVlWjjjgdqumIPVUWa+c0oTCHSp3ncGVz7XZQJe4nBmLmL3eUhtPjwk1fB87PPGspo
         5wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505377; x=1796110177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nvS+jc71C12qiJZLy6Pzsl8hjxfmeERzsMTIxPdnLAM=;
        b=ZKmM4o5VysznllKttTu57vgJsENq8fvwLcmzJNa4e3iV7z9qtlooZ/Ox2d169g2eEG
         DixgjYJscvG62m55QvO2LjxXI0NZNRQZoB6v78O7rgsRLqu1Gf24vvoHr5Mpgc9S+PWw
         14ryiADYfu/bc8ljQ0bYIO+m2/pa2IuLy4vOD92tYfesa4o22CIxTB5NUjYe0+unNTmM
         qL1qDXva1WTehWEqt1Moi+K+psW8QkyqzNZn87V9XsOe1R5CHeQpGcf4B7FyrlOz4ok3
         3IJxMWvKDZkZJzx9PXMciSM986IzcczGStPsjyJxTosFclZtp6t4h2C4KfL2bFuVsb6u
         yNQg==
X-Gm-Message-State: APuU4Z9ulolniwJ0Fx8i7i9hZ189BN3nbkHMrjFMaVShKzluYNmzd+DE
	13LjZCww6RHTCQkwDkODmnQRXwtiLuFXgD1ULiSLR1JzQkfHQT4x3j8T
X-Gm-Gg: AZFdTZfeXzybqlKgDNHA+lYLUpLx0klGgvmgQMpSuhROdnMywROhC36+zRL2XymySaF
	AerQNs9PWW7FIDzuVFsMYTw7YuFdh8l4gIP0Cs9wzfVBxup002MXfxz/x/kDmfI4p4nk6g/yNv1
	yBu1MzXElHaCma5D/4vUCOkp8chSi5hIf0rML0Sdhl17gXoRLVoIu/9yy9e7y+QlbExXtsU/pnQ
	942GLZ4ge9ZjKLiOp2K5YnuvziGk+WYmNMHvk5DnPHvVG+rugHhceiBsS9L9wnsSmJ5f/9MEK9i
	pn8SWb53MgsoHi99dIg7w9Y1j764zPRmXu9LAT7X2PxPmFN1cp7OHKsikfKKn1emNTQqM1jsi/K
	QnmJcNibH2nxIjOm/D0bvcyzsjlABMbQnTTaFvmkkGsjgTznr3hqCvASwN8UqZfIs/1Jh8M86nV
	oigfIaDFV06nthHCbbz+bqSRMEqXUIIrhQN/UvhZ7MmzQcdE25ZHFu5SMio7OT1JnOQqdgRpc0u
	DYEgh7MHhlK6sNCXuDYisjkoZl9s3RHD1l2eexf5EI0+hWOPy7tRD2U2N3GDcmf0quf7fSwxIFZ
	0GHEm2EoItpTofuEn0ERf14oC8o=
X-Received: by 2002:a17:90a:e7d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b41c9e52f6mr12937561a91.35.1795505377490;
        Mon, 23 Nov 2026 23:29:37 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8ef99sm22247243a91.12.2026.11.23.23.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:37 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Date: Tue, 24 Nov 2026 15:29:22 +0800
Message-ID: <20261124072924.556678-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
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
index d2f5bb236663..3bcbad51616c 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -476,6 +476,18 @@ config NVMEM_SNVS_LPGPR
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-snvs-lpgpr.
 
+config NVMEM_SOPHGO_EFUSE
+	tristate "Sophgo eFuse support"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	default ARCH_SOPHGO
+	help
+	  Say y here to enable support for reading eFuses on Sophgo SoCs
+	  such as the SG2044. These are e.g. used to store factory programmed
+	  required data for internal device like ROM patch.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called nvmem-sophgo-efuse.
+
 config NVMEM_SPMI_SDAM
 	tristate "SPMI SDAM Support"
 	depends on SPMI
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..aac736057201 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -81,6 +81,8 @@ obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
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
index 000000000000..d42f18f36828
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
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/nvmem-provider.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
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
+static int sg2044_efuses_read_strip(struct sophgo_efuses *efuse,
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
+	buf = kzalloc((end - start) * SG2044_EFUSE_ALIGN, GFP_KERNEL);
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
+	mutex_init(&efuse->mutex);
+
+	config.priv = efuse;
+	config.size = SG2044_EFUSE_CONTENT_SIZE;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id sophgo_efuses_of_match[] = {
+	{ .compatible = "sophgo,sg2044-efuse" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
+
+static struct platform_driver sophgo_efuses_driver = {
+	.driver = {
+		.name = "sophgo_efuse",
+		.of_match_table = sophgo_efuses_of_match,
+	},
+	.probe = sophgo_efuses_probe,
+};
+module_platform_driver(sophgo_efuses_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@gmail.com>");
+MODULE_DESCRIPTION("Sophgo efuse driver");
+MODULE_LICENSE("GPL");
-- 
2.56.1

