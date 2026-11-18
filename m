Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009595;
	b=lO1A5mUnuWZhnevJLycC1lqE/wFG5cphWvMU/Gd9feHFF8crrMBzRRa4AMDSFjXPqoC3
	 7kdJrd10MKKhLb8kaNCgDtdCp64psd45UMKVHy323Ki67ys9JP+O6r6ylohKIPVjWE0Qg
	 Me2g4u3t1X7AlwgvE/VYYCQ8lgTH1DgZtPy7QB2Z9N4oXsrjf6vx6/Fd1WKNIf6ke7SPk
	 AzH0FACKTacRTSEO2nmrlc08AhzalPJScAj30akA8uYtER8dqNsMojFQMiUr7MxtGnHbm
	 XpMa0Yx+mBSm6S+St/0KG43JlCmYJI5/W4bxsw8k43e/5xo7p/jr/1ND8EgIW5hPMeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZfVol4MgbAljlybEQYovOUJ9wUZiSGGi5nyGGOzVlcw=;
	b=KLQP0TEZY1ln5MiuoUFos/j1sOSRH/9YRKjaRLp0S5tq/Eft9r166HCXvYEtiLQXnjvI
	 mMm3udWC+6865qC2uAXhlX58Dae0AbvZp9Yds28moHihazTW+4owNm+t4djhvG4jtmhpB
	 aPFgGHDIQKuaVijelOmYX5mTinWgPSTpam457VDdoFPEwkfnyWEPb1BEFfozUPYu4t0r7
	 qBKhs+LpdiKsBXDbxrSt6c1pSVgGgNPQvOOMRdWx3bpb2MbgKL0mAkUNrJ/OfWm4KB/Jm
	 ACSyXu82xbefF/pqHRDWF54B0z1YzwcDCVEyl75hQ5E658dKh6TBNgKYZCG6XIAHvuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZOeUZG7;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC652606A325
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC652606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aZOeUZG7
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d427836e9so125354366b.1
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009593; x=1795614393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZfVol4MgbAljlybEQYovOUJ9wUZiSGGi5nyGGOzVlcw=;
        b=aZOeUZG7uabqCoRPhOyi2i1Eb70tV4EhHj20LCqLakOSiWJhEWlzcT3PAtontbOQXU
         VrLh9AG8B4M0140Fh6mcP7s//0WucObIMGlQNGgPNQ5PbAeT+0hRMB4tRlV5/1+elvso
         2PGzN52iZv1rAjXiuYTZw8QlrLMgWG24TYJ3ckkiE7W5LU2RxYPYb3rP6iOGFDRBK7N1
         v+KgbQJBo6GxvdPzfeNaiIQsWNAWRwnaIV1fu8FoGRqDDHTkKI/shk8gU1kkVzYV3Pjw
         pceWFvDHYrhE2TT3LpFrO184QMA8+imraMvyHL/IWSOLmwQfARMDYQCJOEoeuJZQ/Y7u
         amiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009593; x=1795614393;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZfVol4MgbAljlybEQYovOUJ9wUZiSGGi5nyGGOzVlcw=;
        b=cshg8jL/v1ZU60Z6Gx0Fji0gaGgVjdvEsMYdEJ5/O7MxiOfNYyrGD9QPJQ2zjcFaQx
         0FG5Nknwrt0MN98/YJFucalbHCxlLZGuyLiN7is42XiJDHhaCiV9zu0NEQVc+jwigoB7
         52ffGlBwnJTPRBci8N30iBSbq2946C1yJNQCv1tDR3w1S0LH0WBd/DiM3mu+GsxYmomZ
         EuSxm6xlrboAEXmTPcKToJv+W4qFufyAB6hnInbYpPO3+gtiPWpS/HPWjovwQDQmrDw5
         YmzIJw1mYk7CrS1Qb2JIEJXEuDbGE8MzPyxATM1UD7cGhiRV5atNTzl45THXteMfXnPL
         FxDw==
X-Forwarded-Encrypted: i=1; AL+hErF5AXZKORckrv6rF6kcC07cTg1AkpX0HcSMdS+vFXD8G+UOLoA+26W+odvHLaiSxbnoJpBtvwX2LKDA@vger.kernel.org
X-Gm-Message-State: APuU4Z9nDagbesd097l9refqWQAqLx5G3Jp46uFP6+4zPLdTr/8/ExH0
	nfoywrJDlJCcffqjV28VVE9wXue2bnfAR5MXYDCAWQXbnPRAHizmF7UN
X-Gm-Gg: AYBFou3l8q+EdnkUC7EiqBy18N0+uhKZc8V41fBSRqQYKn5hJaXdr1wXL90BL5zgsms
	b42H4YjulaRG0mpSzHYw44/sp+JhNUuEliACMJSGTVRxEQo5+6Srs8n+eZhXnGQIEEUTO+Q8h+x
	qWVPoZbtgtUlZiNK3kz74Z9josbc8aSu27pea2nvS1MFWTnmsDsBaa74CXnDMkv6yRscjjnJQms
	ERw+kKq2o9Qm1mBLV7gnPYPcOlXgYgklB63qvw/aO8WNN3Kt1Tx+LTRf3H3kBcs79irxV6TKyAY
	NCFHWeRYzv/6TXK8QXsKa/sv3BNw/WXuKCKugHO6nFWrQrfrijoW8LrdVKbtIpfKcFZjl3Qo1wU
	gkiWIeyOLQMGFYRUJnJ873nz1O8P3P9+nZqXzzIEEW66VeUCIQN5Jw2Yank8cRAjhenHWTMNNF8
	20ykxJvshVwDrs3sxlwpr9ZoriYE5VxlsGLxHUn06wl6KatY7JOBW/vNWjMKFy0PoX76bc0yaGE
	ZAdZ88eLcZeed+wNf08BXGHqhWg/PT9nP3vnhdewvjKMBIW4149/AZJMapQvy0rU4wQ65FNQKLG
	rvUhjOh6DNK+7kOpsuAEy39qOvYtR/F2X5Glg5sU/inZib7KRvaY0Kc4DsjJwEpOFYITdX7/th4
	jPsRxIu6h1w==
X-Received: by 2002:a17:907:db02:b0:c4d:3208:5781 with SMTP id a640c23a62f3a-c510dec676emr249068266b.1.1795009592689;
        Wed, 18 Nov 2026 05:46:32 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab33aasm95461766b.52.2026.11.18.05.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:46:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] platform/asus: Add driver for ASUS Transformer's Dock of Tegra based devices
Date: Wed, 18 Nov 2026 15:45:47 +0200
Message-ID: <20261118134555.195479-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118134555.195479-1-clamor95@gmail.com>
References: <20261118134555.195479-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

The ASUS Transformer dock used by Tegra-based devices has an extended I2C
bus where certain devices are hot-pluggable and their presence
is indicated by a GPIO line. The set of hot-pluggable devices must be
predetermined and static.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/platform/asus/Kconfig                 |  11 +
 drivers/platform/asus/Makefile                |   1 +
 drivers/platform/asus/asus-transformer-dock.c | 260 ++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 drivers/platform/asus/asus-transformer-dock.c

diff --git a/drivers/platform/asus/Kconfig b/drivers/platform/asus/Kconfig
index 0219418ce3523..af670a3c0d014 100644
--- a/drivers/platform/asus/Kconfig
+++ b/drivers/platform/asus/Kconfig
@@ -113,6 +113,17 @@ config ASUS_ARMOURY
 	  To compile this driver as a module, choose M here: the module will
 	  be called asus-armoury.
 
+config ASUS_TRANSFORMER_DOCK
+	tristate "ASUS Transformer Dock for Tegra based devices"
+	depends on GPIOLIB
+	depends on OF
+	help
+	  Say Y here if you want support for ASUS Transformer Dock for
+	  Tegra devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called asus-transformer-dock.
+
 config ASUS_WMI
 	tristate "ASUS WMI Driver"
 	depends on ACPI_WMI
diff --git a/drivers/platform/asus/Makefile b/drivers/platform/asus/Makefile
index 7bb25cba4853d..f130141dda534 100644
--- a/drivers/platform/asus/Makefile
+++ b/drivers/platform/asus/Makefile
@@ -10,5 +10,6 @@ obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
 obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
 obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
 obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
+obj-$(CONFIG_ASUS_TRANSFORMER_DOCK)	+= asus-transformer-dock.o
 obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
 obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
diff --git a/drivers/platform/asus/asus-transformer-dock.c b/drivers/platform/asus/asus-transformer-dock.c
new file mode 100644
index 0000000000000..7c9346af5e1f3
--- /dev/null
+++ b/drivers/platform/asus/asus-transformer-dock.c
@@ -0,0 +1,260 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define ASUS_TF_DOCK_ATTACHED		0
+
+struct asus_tf_dock_priv {
+	struct i2c_adapter adap;
+	struct i2c_adapter *parent;
+	struct device *dev;
+	struct gpio_desc *gpio;
+	unsigned long state_flags;
+};
+
+static inline struct i2c_adapter *asus_tf_dock_parent(struct i2c_adapter *adap)
+{
+	struct asus_tf_dock_priv *priv =
+		container_of(adap, struct asus_tf_dock_priv, adap);
+
+	return priv->parent;
+}
+
+static int asus_tf_dock_master_xfer(struct i2c_adapter *adap,
+				    struct i2c_msg msgs[], int num)
+{
+	struct i2c_adapter *parent = asus_tf_dock_parent(adap);
+
+	return parent->algo->master_xfer(parent, msgs, num);
+}
+
+static int asus_tf_dock_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+				   unsigned short flags, char read_write,
+				   u8 command, int protocol,
+				   union i2c_smbus_data *data)
+{
+	struct i2c_adapter *parent = asus_tf_dock_parent(adap);
+
+	return parent->algo->smbus_xfer(parent, addr, flags, read_write,
+					command, protocol, data);
+}
+
+static u32 asus_tf_dock_functionality(struct i2c_adapter *adap)
+{
+	u32 parent_func = i2c_get_functionality(asus_tf_dock_parent(adap));
+
+	return parent_func & ~I2C_FUNC_SLAVE;
+}
+
+static const struct i2c_algorithm asus_tf_dock_algo_i2c = {
+	.master_xfer = asus_tf_dock_master_xfer,
+	.functionality = asus_tf_dock_functionality,
+};
+
+static const struct i2c_algorithm asus_tf_dock_algo_smbus = {
+	.smbus_xfer = asus_tf_dock_smbus_xfer,
+	.functionality = asus_tf_dock_functionality,
+};
+
+static const struct i2c_algorithm asus_tf_dock_algo_both = {
+	.master_xfer = asus_tf_dock_master_xfer,
+	.smbus_xfer = asus_tf_dock_smbus_xfer,
+	.functionality = asus_tf_dock_functionality,
+};
+
+static const struct i2c_algorithm *const asus_tf_dock_algo[2][2] = {
+	/* non-I2C */
+	{ NULL, &asus_tf_dock_algo_smbus },
+	/* I2C */
+	{ &asus_tf_dock_algo_i2c, &asus_tf_dock_algo_both }
+};
+
+static void asus_tf_dock_lock_bus(struct i2c_adapter *adap, unsigned int flags)
+{
+	i2c_lock_bus(asus_tf_dock_parent(adap), flags);
+}
+
+static int asus_tf_dock_trylock_bus(struct i2c_adapter *adap,
+				    unsigned int flags)
+{
+	return i2c_trylock_bus(asus_tf_dock_parent(adap), flags);
+}
+
+static void asus_tf_dock_unlock_bus(struct i2c_adapter *adap,
+				    unsigned int flags)
+{
+	i2c_unlock_bus(asus_tf_dock_parent(adap), flags);
+}
+
+static const struct i2c_lock_operations asus_tf_dock_lock_ops = {
+	.lock_bus = asus_tf_dock_lock_bus,
+	.trylock_bus = asus_tf_dock_trylock_bus,
+	.unlock_bus = asus_tf_dock_unlock_bus,
+};
+
+static int asus_tf_dock_recover_bus(struct i2c_adapter *adap)
+{
+	return i2c_recover_bus(asus_tf_dock_parent(adap));
+}
+
+static struct i2c_bus_recovery_info asus_tf_dock_recovery_info = {
+	.recover_bus = asus_tf_dock_recover_bus,
+};
+
+static int asus_tf_dock_activate(struct asus_tf_dock_priv *priv)
+{
+	int ret;
+
+	if (test_bit(ASUS_TF_DOCK_ATTACHED, &priv->state_flags))
+		return 0;
+
+	/*
+	 * Store the dev data in adapter dev, since
+	 * previous i2c_del_adapter might have wiped it.
+	 */
+	priv->adap.dev.parent = priv->dev;
+	priv->adap.dev.of_node = priv->dev->of_node;
+
+	dev_dbg(priv->adap.dev.parent, "connection detected");
+
+	ret = i2c_add_adapter(&priv->adap);
+	if (!ret)
+		set_bit(ASUS_TF_DOCK_ATTACHED, &priv->state_flags);
+
+	return ret;
+}
+
+static void asus_tf_dock_deactivate(struct asus_tf_dock_priv *priv)
+{
+	if (!test_bit(ASUS_TF_DOCK_ATTACHED, &priv->state_flags))
+		return;
+
+	dev_dbg(priv->adap.dev.parent, "disconnection detected");
+
+	i2c_del_adapter(&priv->adap);
+	clear_bit(ASUS_TF_DOCK_ATTACHED, &priv->state_flags);
+}
+
+static irqreturn_t asus_tf_dock_interrupt(int irq, void *dev_id)
+{
+	struct asus_tf_dock_priv *priv = dev_id;
+
+	/* debounce */
+	msleep(20);
+
+	if (gpiod_get_value_cansleep(priv->gpio))
+		asus_tf_dock_activate(priv);
+	else
+		asus_tf_dock_deactivate(priv);
+
+	return IRQ_HANDLED;
+}
+
+static void wrap_i2c_put_adapter(void *adapter)
+{
+	i2c_put_adapter(adapter);
+}
+
+static void wrap_asus_tf_dock_deactivate(void *priv)
+{
+	asus_tf_dock_deactivate(priv);
+}
+
+static int asus_tf_dock_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np;
+	struct i2c_adapter *parent;
+	struct asus_tf_dock_priv *priv;
+	bool is_i2c, is_smbus;
+	int err;
+
+	priv = devm_kzalloc_obj(dev, struct asus_tf_dock_priv);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->dev = dev;
+
+	parent_np = of_parse_phandle(dev->of_node, "i2c-parent", 0);
+	if (IS_ERR(parent_np))
+		return dev_err_probe(dev, PTR_ERR(parent_np),
+				     "Failed to parse i2c-parent\n");
+
+	parent = of_find_i2c_adapter_by_node(parent_np);
+	of_node_put(parent_np);
+	if (IS_ERR(parent))
+		return dev_err_probe(dev, PTR_ERR(parent),
+				     "Failed to get parent I2C adapter\n");
+	priv->parent = parent;
+
+	err = devm_add_action_or_reset(dev, wrap_i2c_put_adapter, parent);
+	if (err)
+		return err;
+
+	priv->gpio = devm_gpiod_get(dev, "detect", GPIOD_IN);
+	if (IS_ERR(priv->gpio))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio),
+				     "Failed to get detect GPIO\n");
+
+	is_i2c = parent->algo->master_xfer;
+	is_smbus = parent->algo->smbus_xfer;
+
+	priv->adap.algo = asus_tf_dock_algo[is_i2c][is_smbus];
+	if (!priv->adap.algo)
+		return -EINVAL;
+
+	snprintf(priv->adap.name, sizeof(priv->adap.name),
+		 "asus-transformer-dock (master i2c-%d)", i2c_adapter_id(parent));
+	priv->adap.owner = THIS_MODULE;
+	priv->adap.lock_ops = &asus_tf_dock_lock_ops;
+	priv->adap.class = parent->class;
+	priv->adap.retries = parent->retries;
+	priv->adap.timeout = parent->timeout;
+	priv->adap.quirks = parent->quirks;
+	if (parent->bus_recovery_info)
+		priv->adap.bus_recovery_info = &asus_tf_dock_recovery_info;
+
+	err = devm_add_action_or_reset(dev, wrap_asus_tf_dock_deactivate, priv);
+	if (err)
+		return err;
+
+	err = devm_request_threaded_irq(dev, gpiod_to_irq(priv->gpio), NULL,
+					asus_tf_dock_interrupt,
+					IRQF_TRIGGER_RISING |
+					IRQF_TRIGGER_FALLING |
+					IRQF_ONESHOT | IRQF_SHARED,
+					"asus-transformer-dock", priv);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register IRQ %d\n",
+				     gpiod_to_irq(priv->gpio));
+
+	irq_wake_thread(gpiod_to_irq(priv->gpio), priv);
+
+	return 0;
+}
+
+static const struct of_device_id asus_tf_dock_of_match[] = {
+	{ .compatible = "asus,transformer-dock" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, asus_tf_dock_of_match);
+
+static struct platform_driver asus_tf_dock_driver = {
+	.driver	= {
+		.name = "asus-transformer-dock",
+		.of_match_table = asus_tf_dock_of_match,
+	},
+	.probe = asus_tf_dock_probe,
+};
+module_platform_driver(asus_tf_dock_driver);
+
+MODULE_DESCRIPTION("ASUS Transformer's Dock for Tegra based devices");
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_LICENSE("GPL");
-- 
2.53.0

