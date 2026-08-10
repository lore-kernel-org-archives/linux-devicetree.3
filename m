Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297D30C359
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372332; cv=none; b=YY8qwD4cS59h0VsuMkzk4qrAfWjs340T8NqEQ9q2HA4vEw/2Mqhd1tgqtVQqcQw03MzP73r8Kb5Ypsg1xyhztw0vI0de+uTmjZAFK03mn4bK4A84lTG+XRJ61zDv4pVmO9LuUAx63T7/UDg1M6txHlC4WDPl0bvVoZeMYun3ibY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372332; c=relaxed/simple;
	bh=uyZX4gPRQtl4jmnSZx2ZJRKSrL8w6QqMB+qfRovOzv8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fT8m/ZeaRvWtvRVB86bxMBbMuwkhIZw641KrPlht/V5LhVyn2yWiYd2z9ehAQukUvXS7Fv0wnknhs4H00Y7wQBOYt4x85HEMh3d5NA4QqG5K1Nw2gH3mfwBFEKWcCTzlPPn7cgUtUxPvPUngarN98OQAjLfeS9PVv7KPGQSa26I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l8schReS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l8schReS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980dc26022so20296515e9.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786372329; x=1786977129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M6II6wNoYIH6ltsWqtS7reuxWUbNKPD2fplzN48dIG8=;
        b=l8schReSWqxrKt70ZcC8bkQJrMLEkUzyVIapzNRb1g+hQa00lWNX8zTjfoUl+V6zcR
         vgoTuQyJBfeMwNmqk0fq6sPzMOXpu8vLIZu5wOnW4Ld/urFOKT0mYRVE7UWKsjg9gGGg
         VFCtEm9tt0Pt0Qj+8bICl7WiYcYeungv3HGJwW5Xp69TZAAONqwfMruTuq9ZUwUuhb9N
         XbvLm/m++gb11f7ODe/apGHRZw+gKS/6xMqz0TsvKbQgpzu6dRlDWm7rBk8I7NcsyUYR
         W2C0qcx5A4/YxkJl3uq6TD+1pWuarIaRZpHxwi5VQwEEVf0rZ6r/ltAG34PlbJgF5PHa
         811A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372329; x=1786977129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M6II6wNoYIH6ltsWqtS7reuxWUbNKPD2fplzN48dIG8=;
        b=ry/as3O19sMjIbIfhodj2JAvzO98AhLHyR5S2dfebAjJFiTtk9U05QNzaoWeYpWYYd
         qRNypH1OAa3ZHSb76KpsSs+05b6Gcg2g0M6+sHwlgrN8aiyCCE3ioTsVmLa3FmXpThDI
         5+CtxjYPareMi2NvtBC5pqHASCVjOzBUjIcBlZaE/zB1kkLmayidyxA2mpicSphq0D2l
         6eLPhrdpXCKACbUpU18zQ+jN6eKfBGtafBHYcU0kVC/ewMoMQ82pEEnr3LAj8qpljjjZ
         KbiTDh4JVGEZuzgn7r8CurVytmqNngVCd6ssXDMT1S6GKCOfa4YAtwWo9whyRb2tWmP6
         /dqw==
X-Forwarded-Encrypted: i=1; AHgh+Rrlwf/rJ1O4C3Kd6M0AS61b6Okm9koHUYSBWrj7uC5FdiCQlVfW55KiiwzimBR/zRGQ8d/g20EhNrUc@vger.kernel.org
X-Gm-Message-State: AOJu0YwF4CPNoizfBGNXh6nfkUSUGKD4+p4TubcPaCmUogWcwMO+Qd0v
	QD/mj9JtnFvHpMvlM0umZ76xaoffvHRzM2Acmt/ImtPuUd02yyORlhn+
X-Gm-Gg: AR+sD11C0KizNdyLQs08ljAt9rfw7dRZccWF/8txn4Gc8X0FnrDbh8A04Qzd7IYfbgD
	SbD+64sx7i/CCatEYwNCczhIFm00uNTRIbGAWK0vVLcTLlTVPUhDzEc7vaYWf6HiT/3mw9Q/l/F
	QsBwBUlIqrt66LGc9rodOFktdSwjoB0Z2CpLHQljGbvLU8/lBTQbFmeTQjTWaByklWqCVJovP67
	7YWFQvpUy14Kbra8XJOR7hFZcN0r3Psy9JT16l8jRYZbctudd9CczuPI6VPQH/p7Ra75fDIaCRy
	MGWtqXisD/sx8f6lNM0gBlsB2PnJLuomJoNz9xVeHYTcAy0+nEiWxc7cOpMwVER2p8kiHO2YCQn
	oa+37Lb1+wzN7gY36iX0t+tfD0NUHMxrMmVtKSl+M3yzfCCYnXieKmyZUaZGhc68B6XjeTzpqUv
	W/B4mLksakIGSCIfn/jVh4k7On6jz5FxNm1gP4ngVIE8KukYYmC/VUdmzaA/eXvrP/3tI/Xn3Hg
	QGH6avPAVm0UVhLj9JUJvYftkOsULv1PUPXJnKEdYxCzZgd
X-Received: by 2002:a05:600c:4688:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4997277b7f1mr22756405e9.8.1786372264913;
        Mon, 10 Aug 2026 07:31:04 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995420bd1csm438950695e9.3.2026.08.10.07.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:31:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] PM / devfreq: add Airoha SoC devfreq driver
Date: Mon, 10 Aug 2026 16:30:55 +0200
Message-ID: <20260810143057.651478-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260810143057.651478-1-ansuelsmth@gmail.com>
References: <20260810143057.651478-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add simple Airoha SoC devfreq driver. This simple driver register a
driver from a given clock and register a passive governor to scale the
frequency with the CPU frequency.

required-opp on the CPU frequency will be used to correctly bind the
clock to the related CPU frequency.

GSW, NPU, SOE, BUS and many other clock will register this devfreq
driver to scale all these internal peripheral  from idle to performance
mode.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/devfreq/Kconfig          | 10 ++++
 drivers/devfreq/Makefile         |  1 +
 drivers/devfreq/airoha-devfreq.c | 99 ++++++++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 drivers/devfreq/airoha-devfreq.c

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c999c4a1e567..1e857a7e9caf 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -75,6 +75,16 @@ config DEVFREQ_GOV_PASSIVE
 
 comment "DEVFREQ Drivers"
 
+config ARM_AIROHA_DEVFREQ
+	tristate "Scaling support for Airoha SoC"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	select DEVFREQ_GOV_PASSIVE
+	help
+	  This adds the DEVFREQ driver for the Airoha SoC.
+
+	  The driver register with the cpufreq notifier and find the right frequency
+	  based on the required OPP set in DT.
+
 config ARM_EXYNOS_BUS_DEVFREQ
 	tristate "ARM Exynos Generic Memory Bus DEVFREQ Driver"
 	depends on ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 404179d79a9d..5ca27684dee3 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 
 # DEVFREQ Drivers
+obj-$(CONFIG_ARM_AIROHA_DEVFREQ)	+= airoha-devfreq.o
 obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
 obj-$(CONFIG_ARM_HISI_UNCORE_DEVFREQ)	+= hisi_uncore_freq.o
 obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
diff --git a/drivers/devfreq/airoha-devfreq.c b/drivers/devfreq/airoha-devfreq.c
new file mode 100644
index 000000000000..cb6d8b49e4a4
--- /dev/null
+++ b/drivers/devfreq/airoha-devfreq.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/cpufreq.h>
+#include <linux/devfreq.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/slab.h>
+#include <linux/pm_opp.h>
+
+struct airoha_devfreq_data {
+	struct clk *clk;
+
+	struct devfreq_passive_data gov_data;
+};
+
+static int airoha_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
+{
+	struct airoha_devfreq_data *data = dev_get_drvdata(dev);
+
+	*freq = clk_get_rate(data->clk);
+
+	return 0;
+};
+
+static int airoha_devfreq_target(struct device *dev, unsigned long *freq,
+				 u32 flags)
+{
+	struct airoha_devfreq_data *data = dev_get_drvdata(dev);
+
+	return clk_set_rate(data->clk, *freq);
+};
+
+static int airoha_devfreq_get_dev_status(struct device *dev,
+					 struct devfreq_dev_status *stat)
+{
+	struct airoha_devfreq_data *data = dev_get_drvdata(dev);
+
+	stat->busy_time = 0;
+	stat->total_time = 0;
+	stat->current_frequency = clk_get_rate(data->clk);
+
+	return 0;
+};
+
+static struct devfreq_dev_profile airoha_devfreq_devfreq_profile = {
+	.target = airoha_devfreq_target,
+	.get_dev_status = airoha_devfreq_get_dev_status,
+	.get_cur_freq = airoha_devfreq_get_cur_freq
+};
+
+static int airoha_devfreq_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct airoha_devfreq_data *data;
+	struct devfreq *devfreq;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(data->clk))
+		return dev_err_probe(dev, PTR_ERR(data->clk), "failed to get clk\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to parse fab freq thresholds\n");
+
+	dev_set_drvdata(dev, data);
+
+	data->gov_data.parent_type = CPUFREQ_PARENT_DEV;
+	devfreq = devm_devfreq_add_device(dev, &airoha_devfreq_devfreq_profile,
+					  DEVFREQ_GOV_PASSIVE, &data->gov_data);
+
+	return PTR_ERR_OR_ZERO(devfreq);
+};
+
+static const struct of_device_id airoha_devfreq_match_table[] = {
+	{ .compatible = "airoha,devfreq" },
+	{}
+};
+
+static struct platform_driver airoha_devfreq_driver = {
+	.probe		= airoha_devfreq_probe,
+	.driver		= {
+		.name   = "airoha-devfreq",
+		.of_match_table = airoha_devfreq_match_table,
+	},
+};
+module_platform_driver(airoha_devfreq_driver);
+
+MODULE_DESCRIPTION("Airoha Devfreq driver");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.53.0

