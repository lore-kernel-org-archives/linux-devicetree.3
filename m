Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335521;
	b=TdIpc6Y6xCqZbFTEpj4own66r0EU/Zh8aAcy5ZO5jTSnURgR0gdPbWXc2V+GPjk7K4Ih
	 U4ujn96vQz7V8ZAFbiQIL6MfmBqAy/ZMIgsylqi609Z8PMHZFcQ4TkKFlniGq0q15b5Yp
	 ljalg3JyBfWcSLikRis3/i6aWZ0p5SRS1x7sH5eo8TWPUASyI2QjwB04W+WCjYo53DvGE
	 Dpave0iFG3aX+rTaw5lO5OTCMdbOF7Ajg0E8Er4K0TS+s318+Y7c3Er9YQxnuGqpdmZAw
	 eM2UdTRbr0zZAiTq2XxuZWWBuit0gJBbpqOECXf/W8Ynm4kDbwFcSR+lUYbQJLdLt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kgJ11kR8MDIirtL/E+1+e5KMYPFXjcYM24whM1l8SKE=;
	b=fSrC39vJzftsY9NE7U5Ka25OMn6Xigxzrzs2Ya3DPVjpxMkkX+ma9Q++W3y5d0AigoDX
	 Pi3pJWAQdF4K0tYeE4Y4TkOJ3DBUOZbVAYk2uvxQXiiHhmvNuXTS5lmrXJEN4TsGPMzia
	 oxbC/W2KeCwKjI11GnCtHa6GLDrh9R7i5GMQCgt+sWK+AijD4XhgXRHmHnadzmItexmFG
	 TRpd2iH5Wy88NtjwQqx9KmZ4k8xe+iluDjU8ZMK5QyjdPYguNPKjFa91Ei4s3tUYT2/IT
	 O0eHuxr6O8V1Wd1nrYbHNY8+95KTNOkI1njxMrTBGP5nk7Gbq98bLVa/Gn5M64rNwMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DGh0ieB;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA966606A331
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA966606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0DGh0ieB
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so427435066b.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335519; x=1795940319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgJ11kR8MDIirtL/E+1+e5KMYPFXjcYM24whM1l8SKE=;
        b=0DGh0ieBp22VfPY+sSo9QmBFovlLTtAVssIoutdw55+j+Iq4/vMH6go8RD61z6mqzQ
         DX5MVbsvko1InAkGxX0ouVetwTTCZqI9TnQ4NbTr229tMOIuTJ6RufjnNra0b26j6uxB
         q8IfwgpngRwonPNECnm6vHco4+H0+phHRP/N2nWZUAnF3yfMvyUyCINCR0g1lgbEPdvZ
         mCGApANkQjxh9TKF0gUX7Cj1rAz7izX7aD2byLk32kco2qGyxdjf1bNqwzSyoRYJJb12
         JLG4akUH+v+sm6PnBnbZe9kmQ1gfLWpkwhQt2O8/mPZTAZBQnMRaCm7N4zkYB3FCf80Y
         b/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335519; x=1795940319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgJ11kR8MDIirtL/E+1+e5KMYPFXjcYM24whM1l8SKE=;
        b=LS0dwGiekzSy2oh+cUYmElkjveomk3NJqtSiXNECIQzDhkOm5/WALdc5kWirof1X3s
         qp/ZG0NDvCcZC0LPUK2oOaNymygop12CANgZm0tc9LMGM8KFoqAVT5eqdi2eeKOrtl+V
         3ouGDDNJilT3Z4XweQGLaV9PsEDxvXFJVsPg1GNcldM42y2vQVof2jjQH9uChCcxfs5j
         Td2sF+sqCR/yEn+8gya9NX/ZRQTyEIkEUklmzxoLOOCnwup8QJ2tSTWhXiJ/KsDxa1Br
         GcGkPMIhLbJ7jqSPb3Yx/dvGNvy0gl+Vt/uHzifjyfuvLHUdhGCdQp2LQD0/5caCyq12
         fyJA==
X-Forwarded-Encrypted: i=1; AL+hErHpcvme62LS3ToviWM6Bwa/CC8tYZaKg00E1XCv8wjAUgSMmWi+KxiMk10tY/ZzcYBRP8G7kXA3Mb5e@vger.kernel.org
X-Gm-Message-State: APuU4Z9P1yIpCEz+fzwW2GhiWmev8FC/bD4qDYI9NVzQ3yFqRYuNfDol
	goK2vduVfmEiFqksiLhjS7dMttlNwQUt0qiheI5gIQxQwD7vdOa19a4I
X-Gm-Gg: AZFdTZd1Ff/GJo55tBr42VfKTTzS9syvfUrKTHpFP+BkiYBZIhksVinM0srHF2j5tcl
	BHhsIU39WDsL0+5Wn5MokWHYAp/4Y9+5Rtpqr44nXmqQhxzK5xQYlHyUaL2To+A6joOcKZu4RAJ
	MOiSgXbwJdaPlCNCjuvIFRE46ofw8cynuH1MnMue3yLDW2lV39ISidnytQlX/JByy9BH5eling+
	nCkxueWcIYvaTMDSRV1Jrg84agqEhM2EkhZ0CBAob5dDjjl/6JeNAPRS3WLnJD02Zi955aZoGC+
	CCd/3zQWbu7UuOyKE7FsCgCnjrDWCq4HnFy9XjdyulAJQrjxvB4kbrUSXSgGvz3HWwQ/AzIpIpd
	AdciysCzwzkKBNmFm1G4syaOFFsTmXosc8/IYGnoIvbKxIHWUhTedfLOedSeFkUaMXMlAoALn2M
	hjiKhEsD+lguu5BbBgOmRATPd25vvBQTGt5z0ElTY2ALXqgI9SZCADy53BDsl2LTqwGVWGYQZxg
	i6xw/KM438pZ+wn26JuEaSOxswLpX8zgLkMRjuWStk7agp7697xePFPpYIQSV5mUc52b+7RQ3+G
	670hQvflAxnaRyKQbN/FK1owBPInZCcmPjIC949vDlE8wBlnI++zOpTZJkfkQmlD7nv57pDuiP5
	/W7HW8ckCjw==
X-Received: by 2002:a05:6402:a592:10b0:6b1:da03:d01d with SMTP id 4fb4d7f45d1cf-6ba37ebfc70mr4036150a12.34.1795335519102;
        Sun, 22 Nov 2026 00:18:39 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:37 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 01/12] drm: Add MIPI DBI bus support for MIPI DBI Type A and B
Date: Sun, 22 Nov 2026 10:18:09 +0200
Message-ID: <20261122081820.53199-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

The MIPI DBI bus allows modeling DBI hosts and peripherals using the Linux
driver model. DBI hosts are registered by their respective drivers. During
registration, DBI peripherals are created from the device tree nodes
provided by the host.

DBI hosts expose operations that can be used by peripheral drivers to
access associated devices.

This implementation adds support for MIPI DBI Type A and Type B only.
Type C support existing in drm_mipi_dbi.c was not altered. The framework
is modeled to closely resemble the existing MIPI DSI setup for seamless
integration.

Suggested-by: Mikko Perttunen <mperttunen@nvidia.com> # preliminary sketch
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/Makefile           |   2 +-
 drivers/gpu/drm/drm_mipi_dbi_bus.c | 287 +++++++++++++++++++++++++++++
 include/drm/drm_mipi_dbi_bus.h     | 148 +++++++++++++++
 3 files changed, 436 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923a..880f0dc930b85 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -166,7 +166,7 @@ obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 
 obj-y			+= tests/
 
-obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o
+obj-$(CONFIG_DRM_MIPI_DBI) += drm_mipi_dbi.o drm_mipi_dbi_bus.o
 obj-$(CONFIG_DRM_MIPI_DSI) += drm_mipi_dsi.o
 obj-y			+= arm/
 obj-y			+= clients/
diff --git a/drivers/gpu/drm/drm_mipi_dbi_bus.c b/drivers/gpu/drm/drm_mipi_dbi_bus.c
new file mode 100644
index 0000000000000..4b51de5bdf0b5
--- /dev/null
+++ b/drivers/gpu/drm/drm_mipi_dbi_bus.c
@@ -0,0 +1,287 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * MIPI DBI devices with command transport through parallel interface
+ *
+ * Copyright 2026 Mikko Perttunen <mperttunen@nvidia.com>
+ * Copyright 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+
+#include <drm/drm_mipi_dbi.h>
+#include <drm/drm_mipi_dbi_bus.h>
+
+/**
+ * DOC: overview
+ *
+ * There are three MIPI DBI implementation types:
+ *
+ * A. Motorola 6800-type parallel bus
+ *
+ * B. Intel 8080-type parallel bus
+ *
+ * C. SPI-type with three options:
+ *
+ *    1. 9-bit with the Data/Command signal as the ninth bit
+ *    2. Same as above, except it is sent as 16 bits
+ *    3. 8-bit with the Data/Command signal as a separate D/CX pin
+ *
+ * This library provides a framework for MIPI Display Bus Interface (DBI)
+ * compatible display controllers using Type A and Type B. This
+ * implementation closely matches existing DSI framework behavior to
+ * allow seamless integration.
+ *
+ * Type C options 1 and 3 are covered by drm_mipi_dbi.c with
+ * mipi_dbi_spi_init().
+ */
+
+static int mipi_dbi_match(struct device *dev, const struct device_driver *driver)
+{
+	return of_driver_match_device(dev, driver);
+}
+
+static int mipi_dbi_uevent(const struct device *dev, struct kobj_uevent_env *env)
+{
+	return of_device_uevent_modalias(dev, env);
+}
+
+static const struct dev_pm_ops mipi_dbi_device_pm_ops = {
+	.runtime_suspend = pm_generic_runtime_suspend,
+	.runtime_resume = pm_generic_runtime_resume,
+	.suspend = pm_generic_suspend,
+	.resume = pm_generic_resume,
+	.freeze = pm_generic_freeze,
+	.thaw = pm_generic_thaw,
+	.poweroff = pm_generic_poweroff,
+	.restore = pm_generic_restore,
+};
+
+static const struct bus_type mipi_dbi_bus_type = {
+	.name = "mipi-dbi",
+	.match = mipi_dbi_match,
+	.uevent = mipi_dbi_uevent,
+	.pm = &mipi_dbi_device_pm_ops,
+};
+
+static void mipi_dbi_device_release(struct device *dev)
+{
+	of_node_put(dev->of_node);
+	kfree(to_mipi_dbi_device(dev));
+}
+
+static void mipi_dbi_device_unregister(void *data)
+{
+	struct device *dev = data;
+
+	of_node_clear_flag(dev->of_node, OF_POPULATED);
+	device_unregister(dev);
+}
+
+/**
+ * devm_mipi_dbi_device_register() - create a managed peripheral MIPI DBI
+ *				     Type A or B device.
+ * @dev: device to tie the MIPI-DBI device lifetime to
+ * @host: DBI host to which this device is connected
+ * @np: device tree node associated with the panel MIPI DBI device
+ *
+ * This function is called by DBI host driver to create panel device.
+ * It automatically calls mipi_dbi_device_unregister() when @dev is
+ * unbound. It does not automatically free passed device node pointer,
+ * it must be put manually.
+ *
+ * Returns:
+ * A pointer to the newly created MIPI DBI device, or, a pointer encoded
+ * with an error.
+ */
+struct mipi_dbi_device *
+devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_host *host,
+			      struct device_node *np)
+{
+	struct mipi_dbi_device *dbidev;
+	int ret;
+
+	if (!host || !host->dev || !host->dbi || !host->dbi->command ||
+	    !host->ops || !host->ops->attach || !host->ops->detach || !np)
+		return ERR_PTR(-EINVAL);
+
+	if (!of_device_is_available(np))
+		return ERR_PTR(-ENODEV);
+
+	dbidev = kzalloc_obj(*dbidev);
+	if (!dbidev)
+		return ERR_PTR(-ENOMEM);
+
+	if (of_node_test_and_set_flag(np, OF_POPULATED)) {
+		kfree(dbidev);
+		return ERR_PTR(-EBUSY);
+	}
+
+	dbidev->host = host;
+	dbidev->dbi = host->dbi;
+	device_initialize(&dbidev->dev);
+	dbidev->dev.parent = host->dev;
+	dbidev->dev.bus = &mipi_dbi_bus_type;
+	dbidev->dev.release = mipi_dbi_device_release;
+	device_set_node(&dbidev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = dev_set_name(&dbidev->dev, "%s:%s", dev_name(host->dev), np->full_name);
+	if (ret)
+		goto put_device;
+
+	ret = device_add(&dbidev->dev);
+	if (ret)
+		goto put_device;
+
+	ret = devm_add_action_or_reset(dev, mipi_dbi_device_unregister,
+				       &dbidev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return dbidev;
+
+put_device:
+	of_node_clear_flag(np, OF_POPULATED);
+	put_device(&dbidev->dev);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(devm_mipi_dbi_device_register);
+
+static void mipi_dbi_detach(void *data)
+{
+	struct mipi_dbi_device *dbidev = data;
+
+	dbidev->host->ops->detach(dbidev->host, dbidev);
+	dbidev->attached = false;
+}
+
+/**
+ * devm_mipi_dbi_attach() - managed attach of peripheral DBI device to its MIPI
+ *			    DBI Type A or B devices.
+ * @dev: device to tie the MIPI-DBI device lifetime to
+ * @dbidev: DBI peripheral
+ */
+int devm_mipi_dbi_attach(struct device *dev, struct mipi_dbi_device *dbidev)
+{
+	int ret;
+
+	if (dbidev->attached)
+		return -EBUSY;
+
+	ret = dbidev->host->ops->attach(dbidev->host, dbidev);
+	if (ret)
+		return ret;
+
+	dbidev->attached = true;
+	return devm_add_action_or_reset(dev, mipi_dbi_detach, dbidev);
+}
+EXPORT_SYMBOL_GPL(devm_mipi_dbi_attach);
+
+/**
+ * mipi_dbi_write_buffer_multi() - mipi_dbi_command() w/ accum_err but for
+ *				   MIPI DBI Type A and B
+ * @ctx: context for multiple DBI transactions
+ * @cmd: command to be sent
+ * @data: buffer containing data to be transmitted
+ * @len: size of transmission buffer
+ *
+ * Acts like mipi_dbi_command() for MIPI DBI Type C but for Types A and B
+ * and deals with errors in a way that makes it convenient to make several
+ * calls in a row.
+ */
+void mipi_dbi_write_buffer_multi(struct mipi_dbi_multi_context *ctx,
+				 u8 cmd, const u8 *data, size_t len)
+{
+	struct mipi_dbi_device *dbidev = ctx->dbidev;
+	struct device *dev = &dbidev->dev;
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dbi_command_stackbuf(dbidev->dbi, cmd, data, len);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "sending dcs data %*ph failed: %d\n",
+			(int)len, data, ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dbi_write_buffer_multi);
+
+static int mipi_dbi_drv_probe(struct device *dev)
+{
+	struct mipi_dbi_driver *drv = to_mipi_dbi_driver(dev->driver);
+	struct mipi_dbi_device *dbidev = to_mipi_dbi_device(dev);
+
+	return drv->probe(dbidev);
+}
+
+static int mipi_dbi_drv_remove(struct device *dev)
+{
+	struct mipi_dbi_driver *drv = to_mipi_dbi_driver(dev->driver);
+	struct mipi_dbi_device *dbidev = to_mipi_dbi_device(dev);
+
+	drv->remove(dbidev);
+
+	return 0;
+}
+
+static void mipi_dbi_drv_shutdown(struct device *dev)
+{
+	struct mipi_dbi_driver *drv = to_mipi_dbi_driver(dev->driver);
+	struct mipi_dbi_device *dbidev = to_mipi_dbi_device(dev);
+
+	drv->shutdown(dbidev);
+}
+
+/**
+ * __mipi_dbi_driver_register() - register a driver for MIPI DBI Type A or B devices.
+ * @drv: DBI driver structure
+ * @owner: owner module
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int __mipi_dbi_driver_register(struct mipi_dbi_driver *drv, struct module *owner)
+{
+	drv->driver.bus = &mipi_dbi_bus_type;
+	drv->driver.owner = owner;
+
+	if (drv->probe)
+		drv->driver.probe = mipi_dbi_drv_probe;
+	if (drv->remove)
+		drv->driver.remove = mipi_dbi_drv_remove;
+	if (drv->shutdown)
+		drv->driver.shutdown = mipi_dbi_drv_shutdown;
+
+	return driver_register(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(__mipi_dbi_driver_register);
+
+/**
+ * mipi_dbi_driver_unregister() - unregister a driver for MIPI DBI Type A or B devices.
+ * @drv: DBI driver structure
+ */
+void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv)
+{
+	driver_unregister(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(mipi_dbi_driver_unregister);
+
+static int __init mipi_dbi_bus_init(void)
+{
+	return bus_register(&mipi_dbi_bus_type);
+}
+subsys_initcall(mipi_dbi_bus_init);
+
+static void __exit mipi_dbi_bus_exit(void)
+{
+	bus_unregister(&mipi_dbi_bus_type);
+}
+module_exit(mipi_dbi_bus_exit);
+
+MODULE_DESCRIPTION("MIPI DBI devices with command transport through parallel interface");
+MODULE_LICENSE("GPL");
diff --git a/include/drm/drm_mipi_dbi_bus.h b/include/drm/drm_mipi_dbi_bus.h
new file mode 100644
index 0000000000000..6f00a8eef9c67
--- /dev/null
+++ b/include/drm/drm_mipi_dbi_bus.h
@@ -0,0 +1,148 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * MIPI DBI devices with command transport through parallel interface
+ *
+ * Copyright 2026 Mikko Perttunen <mperttunen@nvidia.com>
+ * Copyright 2026 Svyatoslav Ryhel <clamor95@gmail.com>
+ */
+
+#ifndef __DRM_MIPI_DBI_BUS_H__
+#define __DRM_MIPI_DBI_BUS_H__
+
+#include <linux/device.h>
+#include <linux/module.h>
+
+struct device_node;
+struct mipi_dbi;
+struct mipi_dbi_device;
+struct mipi_dbi_host;
+
+/**
+ * struct mipi_dbi_host_ops - DBI bus operations for MIPI DBI Type A and B.
+ * @attach: attach DBI device to DBI host
+ * @detach: detach DBI device from DBI host
+ */
+struct mipi_dbi_host_ops {
+	int (*attach)(struct mipi_dbi_host *host, struct mipi_dbi_device *dev);
+	void (*detach)(struct mipi_dbi_host *host, struct mipi_dbi_device *dev);
+};
+
+/**
+ * struct mipi_dbi_host - DBI host device for MIPI DBI Type A and B.
+ * @dev: driver model device node for this DBI host
+ * @dbi: MIPI DBI interface
+ * @ops: DBI host operations
+ */
+struct mipi_dbi_host {
+	struct device *dev;
+	struct mipi_dbi *dbi;
+	const struct mipi_dbi_host_ops *ops;
+};
+
+/**
+ * struct mipi_dbi_device - DBI peripheral device for MIPI DBI Type A and B.
+ *			    This structure describes a peripheral DBI device,
+ *			    an endpoint for DSC commands and video data, and must
+ *			    be paired with a DBI host device for MIPI DBI Type A
+ *			    and B. This layout is built to closely resemble
+ *			    the DSI framework.
+ *
+ *			    If your device is MIPI DBI Type C (with an SPI
+ *			    control bus) and incorporates DBI within, you
+ *			    should use the mipi_dbi_dev structure and Type C
+ *			    framework from drm_mipi_dbi.c.
+ * @dev: driver model device node for this peripheral
+ * @dbi: MIPI DBI interface
+ * @host: DBI host for this peripheral
+ * @attached: the DBI device has been successfully attached
+ */
+struct mipi_dbi_device {
+	struct device dev;
+	struct mipi_dbi *dbi;
+	struct mipi_dbi_host *host;
+	bool attached;
+};
+
+/**
+ * struct mipi_dbi_multi_context - Context to call multiple MIPI DBI funcs in a row
+ * @dbidev: Pointer to the peripheral MIPI DBI Type A and B device
+ * @accum_err: Storage for the accumulated error over the multiple calls
+ *	       Init to 0. If a function encounters an error then the error code
+ *	       will be stored here. If you call a function and this points to a
+ *	       non-zero value then the function will be a noop. This allows calling
+ *	       a function many times in a row and just checking the error at the
+ *	       end to see if any of them failed.
+ */
+
+struct mipi_dbi_multi_context {
+	struct mipi_dbi_device *dbidev;
+	int accum_err;
+};
+
+#define to_mipi_dbi_device(__dev)	container_of_const(__dev, struct mipi_dbi_device, dev)
+
+void mipi_dbi_write_buffer_multi(struct mipi_dbi_multi_context *ctx,
+				 u8 cmd, const u8 *data, size_t len);
+
+/**
+ * mipi_dbi_write_seq_multi() - transmit a command with payload
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @ctx: context for multiple DBI transactions
+ * @cmd: command to be sent
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dbi_write_seq_multi(ctx, cmd, seq...)				\
+	do {									\
+		static const u8 d[] = { seq };					\
+		mipi_dbi_write_buffer_multi(ctx, cmd, d, ARRAY_SIZE(d));	\
+	} while (0)
+
+struct mipi_dbi_device *
+devm_mipi_dbi_device_register(struct device *dev, struct mipi_dbi_host *host,
+			      struct device_node *np);
+int devm_mipi_dbi_attach(struct device *dev, struct mipi_dbi_device *dbidev);
+
+/**
+ * struct mipi_dbi_driver - DBI driver for MIPI DBI Type A and B.
+ * @driver: device driver model driver
+ * @probe: callback for device binding
+ * @remove: callback for device unbinding
+ * @shutdown: called at shutdown time to quiesce the device
+ */
+struct mipi_dbi_driver {
+	struct device_driver driver;
+	int (*probe)(struct mipi_dbi_device *dbi);
+	void (*remove)(struct mipi_dbi_device *dbi);
+	void (*shutdown)(struct mipi_dbi_device *dbi);
+};
+
+static inline struct mipi_dbi_driver *
+to_mipi_dbi_driver(struct device_driver *driver)
+{
+	return container_of(driver, struct mipi_dbi_driver, driver);
+}
+
+static inline void *mipi_dbi_get_drvdata(const struct mipi_dbi_device *dbi)
+{
+	return dev_get_drvdata(&dbi->dev);
+}
+
+static inline void mipi_dbi_set_drvdata(struct mipi_dbi_device *dbi, void *data)
+{
+	dev_set_drvdata(&dbi->dev, data);
+}
+
+int __mipi_dbi_driver_register(struct mipi_dbi_driver *drv, struct module *owner);
+void mipi_dbi_driver_unregister(struct mipi_dbi_driver *drv);
+
+#define mipi_dbi_driver_register(driver) \
+	__mipi_dbi_driver_register(driver, THIS_MODULE)
+
+#define module_mipi_dbi_driver(__mipi_dbi_driver) \
+	module_driver(__mipi_dbi_driver, mipi_dbi_driver_register, \
+			mipi_dbi_driver_unregister)
+
+#endif /* __DRM_MIPI_DBI_BUS__ */
-- 
2.53.0

