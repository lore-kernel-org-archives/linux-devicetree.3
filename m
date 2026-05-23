Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D8937FF58
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526289; cv=none; b=rGROFmSyHcr9HtaCjjDX1pZIcpah1JO80bgdRagSKt+D0iOWRnS1gfq+FmVvlK2tbAcR5DJRvQiOqPowPwd4GYAYqdApp+3ETiQ6BareXJzUgEb6FkPRgUd6Jey+dAC+MDv3u3OeQ4DJS9+qnV8yZHmZH7HZytAxCoy8KfZunvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526289; c=relaxed/simple;
	bh=WGCtPIsx1klGYXiM4u2u/0+bc1X9oZto4hbGtOGOHPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAMm2bq8IVAW2LOStFYK9h0M5OIvuLViTnHb7ZPG6A8fntp7PseSWXS9FOfcfcPDWBPGVySb6ahEH6Eg0GwjPdndETvimmXa3wLZ/qqW/VKc9ckMwfHz6/kRvGjp9Jd/6E0hfTFaAH42prh/Iy1VlP4hGUmt9PFlpu0lAcyY8GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIucBs1j; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIucBs1j"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67e43a8996fso10237409a12.0
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779526285; x=1780131085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UjB01wT884BtqcqCl2rm6i6c4hxd/SXr47aw6UGJ4g=;
        b=VIucBs1juq/Qsi8DLjn0YOjmGO01KnzQx5OVmVtoO0jHiZBbvkGW3aO5FzdluK5oD/
         2F+Ym0T4zjc9xs4r0aTHIKkwVJdaKjzEPVd4YzricF8bv5Ub4yLhimSbomLk8hoVaPFa
         G7RzPrEQwE9gctM1k0KJ7YRRWaRtOgC7NH8y4YpYb2wR6V5PPDNmlvwj5nJpMsRue/xx
         /456oh2Qw5yKp54aNh8yxY9oJ8QTDilWcGfISRQt7WmkLgb4AV+jTewbRunW9bthhUZz
         AhP39O+ZNmukS7L+QSu0MEdHBdSPjSBTVDyV95Xj5OvjWo31p+ytn84rk3ZdzDkF9tmb
         MkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526285; x=1780131085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/UjB01wT884BtqcqCl2rm6i6c4hxd/SXr47aw6UGJ4g=;
        b=T3Ry89QdcSmXBN9ygK+TwUbYseppuhwq0gSk538230ZHHeqXPg1PH6u1tiWsEYZu54
         U6omZ5gJmGhD/bHh+mh9//ZtgBGERiTqY/P5f11pkhetxArsCtv7YoSG6GXHr1X6V5wT
         Fi3TWLPm92jf1JXLGMjR3wWkx7xs8TkVwglsELDj3b6xbr1B5WKFScl54xdQi/N/3efp
         RIMxEO+KfwPb2DYXxd4gY/3utS4aFot5Mg8PV/sgrxPN87dhRqFVzlnFwR7i7hueRLNH
         vX1ITy842maQUdYcYaa/a4WzI3ntb/gzXb/CudI5euWmWqgE1HD9Jox/hlprdiKvuhX5
         wAMg==
X-Gm-Message-State: AOJu0Yw7K1rwF/2xSRbbl7BckpFPSnkQwCOqepCbJF1KE2Mcd9von2vV
	i/BzruTAww74w9tXnaytaTgVeccAzogLyinlfHqqdKF1ZwSzQslEezOT
X-Gm-Gg: Acq92OGdSI4wag17qG8eOA8KTf0GcvNU+DYu/Kv6wcE/vjynNKx7rKGX2qWITqyy5fn
	osCOrbeoFSLYXEpVNBY+jSSVACLYYhc8v1cETi8XnNDIcVPw96PX4505E9p0bBWXlYhpvl7zvRu
	eQlR6B824T4jViODzBQtoh4fCh3IBaT3R6hvlm9NyqrkQf/rkGOHj41a9gjzPGQarGp3kf2yoE4
	7eaMx9rvXaHrsCUagBqbNPpWqXpjdG2pvsc05JFSjdguMGvSbKIfM8EiuyzE1X4TBtbImEtmL6O
	zGuani21fQuYMpsVSyt8UBSwSqD7W0ZnDdL1rgzdkhn+ByjODseP28uNx+z6JTO5VO2R25n8baJ
	uCavzu2lGVyMs1nJuHZmRZRkwg0lLlQkjb6qPdf9W+2y/nHPJ+61cMcs41qT7FA2BCyuaXOwaaQ
	xJimxMCZQ+NJ7E
X-Received: by 2002:a05:6402:11d3:b0:66e:56a2:b67b with SMTP id 4fb4d7f45d1cf-6889cc44111mr3813692a12.20.1779526284988;
        Sat, 23 May 2026 01:51:24 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688baf1f0afsm1642658a12.17.2026.05.23.01.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:51:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 2/2] power: sequencing: Add support for Nvidia Tegra modem pwrseq
Date: Sat, 23 May 2026 11:51:02 +0300
Message-ID: <20260523085102.51000-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260523085102.51000-1-clamor95@gmail.com>
References: <20260523085102.51000-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nvidia Tegra modem power sequence is a set of configurations used in Tegra
SoCs to provide proper interaction between the application processor and
the modem, as well as control over one of the SoC's USB lines for the
modem.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/power/sequencing/Kconfig              |  12 +
 drivers/power/sequencing/Makefile             |   1 +
 drivers/power/sequencing/pwrseq-tegra-modem.c | 209 ++++++++++++++++++
 3 files changed, 222 insertions(+)
 create mode 100644 drivers/power/sequencing/pwrseq-tegra-modem.c

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..e04a6bacb476 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -46,4 +46,16 @@ config POWER_SEQUENCING_PCIE_M2
 	  connectors. This driver handles the power sequencing for the M.2
 	  connectors exposing multiple interfaces like PCIe, SATA, UART, etc...
 
+config POWER_SEQUENCING_TEGRA_MODEM
+	tristate "NVIDIA Tegra modem power sequencing driver"
+	depends on ARCH_TEGRA && USB_NET_XMM6260 && USB_SUPPORT
+	help
+	  Enable this to support power sequence for XMM6260 modem found in
+	  various Tegra devices with cellular capabilities, like
+	  LG Optimus 4X P880, LG Optimus Vu P895, Google Nexus 7 (2012) 3G
+	  and ASUS Transformer Pad 3G TF300TG.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called pwrseq-tegra-modem.
+
 endif
diff --git a/drivers/power/sequencing/Makefile b/drivers/power/sequencing/Makefile
index 0911d4618298..c36be7edb8ca 100644
--- a/drivers/power/sequencing/Makefile
+++ b/drivers/power/sequencing/Makefile
@@ -6,3 +6,4 @@ pwrseq-core-y				:= core.o
 obj-$(CONFIG_POWER_SEQUENCING_QCOM_WCN)	+= pwrseq-qcom-wcn.o
 obj-$(CONFIG_POWER_SEQUENCING_TH1520_GPU) += pwrseq-thead-gpu.o
 obj-$(CONFIG_POWER_SEQUENCING_PCIE_M2)	+= pwrseq-pcie-m2.o
+obj-$(CONFIG_POWER_SEQUENCING_TEGRA_MODEM) += pwrseq-tegra-modem.o
diff --git a/drivers/power/sequencing/pwrseq-tegra-modem.c b/drivers/power/sequencing/pwrseq-tegra-modem.c
new file mode 100644
index 000000000000..61df645e642d
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-tegra-modem.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/export.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/pwrseq/provider.h>
+#include <linux/regulator/consumer.h>
+#include <linux/usb.h>
+#include <linux/usb/chipidea.h>
+#include <linux/usb/tegra_usb_phy.h>
+
+struct pwrseq_tegra_modem_ctx {
+	struct device *dev;
+	struct pwrseq_device *pwrseq;
+
+	struct gpio_desc *enable_gpio;
+	struct regulator *power_supply;
+
+	struct platform_device *usb_dev;
+	struct tegra_usb *usb;
+};
+
+static int pwrseq_tegra_modem_power_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_tegra_modem_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_enable(ctx->power_supply);
+}
+
+static int pwrseq_tegra_modem_power_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_tegra_modem_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_disable(ctx->power_supply);
+}
+
+static const struct pwrseq_unit_data pwrseq_tegra_modem_power_unit_data = {
+	.name = "power-enable",
+	.enable = pwrseq_tegra_modem_power_enable,
+	.disable = pwrseq_tegra_modem_power_disable,
+};
+
+static const struct pwrseq_unit_data *pwrseq_tegra_modem_unit_deps[] = {
+	&pwrseq_tegra_modem_power_unit_data,
+	NULL,
+};
+
+static int pwrseq_tegra_modem_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_tegra_modem_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	struct tegra_usb *usb = ctx->usb;
+	int ret;
+
+	/*
+	 * USB controller registers shouldn't be touched before PHY is
+	 * initialized, otherwise CPU will hang because clocks are gated.
+	 * PHY driver controls gating of internal USB clocks on Tegra.
+	 */
+	ret = usb_phy_init(usb->phy);
+	if (ret) {
+		dev_err(ctx->dev, "failed to init USB PHY\n");
+		return ret;
+	}
+
+	usb->dev = ci_hdrc_add_device(&ctx->usb_dev->dev,
+				      ctx->usb_dev->resource,
+				      ctx->usb_dev->num_resources,
+				      &usb->data);
+	if (IS_ERR(usb->dev)) {
+		usb_phy_shutdown(usb->phy);
+		dev_err(ctx->dev, "failed to register USB controller\n");
+		return PTR_ERR(usb->dev);
+	}
+
+	gpiod_set_value_cansleep(ctx->enable_gpio, 1);
+
+	return 0;
+}
+
+static int pwrseq_tegra_modem_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_tegra_modem_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	struct tegra_usb *usb = ctx->usb;
+
+	gpiod_set_value_cansleep(ctx->enable_gpio, 0);
+	ci_hdrc_remove_device(usb->dev);
+	usb_phy_shutdown(usb->phy);
+
+	/* For USB to settle after turning off */
+	msleep(500);
+
+	return 0;
+}
+
+static const struct pwrseq_unit_data pwrseq_tegra_modem_unit = {
+	.name = "modem-power-sequence",
+	.deps = pwrseq_tegra_modem_unit_deps,
+	.enable = pwrseq_tegra_modem_enable,
+	.disable = pwrseq_tegra_modem_disable,
+};
+
+static const struct pwrseq_target_data pwrseq_tegra_modem_target = {
+	.name = "modem-power",
+	.unit = &pwrseq_tegra_modem_unit,
+};
+
+static const struct pwrseq_target_data *pwrseq_tegra_modem_targets[] = {
+	&pwrseq_tegra_modem_target,
+	NULL
+};
+
+static int pwrseq_tegra_modem_match(struct pwrseq_device *pwrseq,
+				    struct device *dev)
+{
+	/* We only match the specific modem compatible for now */
+	if (!of_device_is_compatible(dev->of_node, "infineon,xmm6260"))
+		return PWRSEQ_NO_MATCH;
+
+	return PWRSEQ_MATCH_OK;
+}
+
+static void pwrseq_tegra_modem_put_device(void *dev)
+{
+	put_device(dev);
+}
+
+static int pwrseq_tegra_modem_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *usb_node;
+	struct pwrseq_tegra_modem_ctx *ctx;
+	struct pwrseq_config config = { };
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->dev = dev;
+
+	ctx->enable_gpio = devm_gpiod_get_optional(dev, "enable",
+						   GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->enable_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->enable_gpio),
+				     "failed to get enable GPIO\n");
+
+	ctx->power_supply = devm_regulator_get(dev, "power");
+	if (IS_ERR(ctx->power_supply))
+		return dev_err_probe(dev, PTR_ERR(ctx->power_supply),
+				     "failed to get power supply\n");
+
+	usb_node = of_parse_phandle(dev->of_node, "nvidia,usb-bus", 0);
+	if (!usb_node)
+		return dev_err_probe(dev, -ENODEV,
+				     "failed to parse modem USB bus\n");
+
+	ctx->usb_dev = of_find_device_by_node(usb_node);
+	of_node_put(usb_node);
+	if (!ctx->usb_dev)
+		return -EPROBE_DEFER;
+
+	ret = devm_add_action_or_reset(dev, pwrseq_tegra_modem_put_device,
+				       &ctx->usb_dev->dev);
+	if (ret)
+		return ret;
+
+	ctx->usb = platform_get_drvdata(ctx->usb_dev);
+	if (!ctx->usb)
+		return -EPROBE_DEFER;
+
+	config.parent = dev;
+	config.owner = THIS_MODULE;
+	config.drvdata = ctx;
+	config.match = pwrseq_tegra_modem_match;
+	config.targets = pwrseq_tegra_modem_targets;
+
+	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
+	if (IS_ERR(ctx->pwrseq))
+		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
+				     "failed to register the power sequencer\n");
+
+	return 0;
+}
+
+static const struct of_device_id pwrseq_tegra_modem_of_match[] = {
+	{ .compatible = "nvidia,tegra-modem-pwrseq" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pwrseq_tegra_modem_of_match);
+
+static struct platform_driver pwrseq_tegra_modem_driver = {
+	.driver = {
+		.name = "pwrseq-tegra-modem",
+		.of_match_table = pwrseq_tegra_modem_of_match,
+	},
+	.probe = pwrseq_tegra_modem_probe,
+};
+module_platform_driver(pwrseq_tegra_modem_driver);
+
+MODULE_AUTHOR("Svyatolsav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("Tegra modem power sequencer driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0

