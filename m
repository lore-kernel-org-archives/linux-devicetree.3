Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795166653;
	b=NPNb6kQZz28wK98HR5+xo6C0sCECC11sTcFWXs0HKjjx6X/ZrrLaC5Jon6YchmKuIogw
	 sRFveXROgMnxO8dnYmIy4QeJjiPd4/H7Cba30Qhnqy4ZOkFsVdZAO1jSJyeXwqT0O+pAR
	 H2RMU2rQRfvfPtHyNrckDXhRpyYtLuzuNZRer4jQjb06IzyWgaT9rLoS7oO0AjTJadlsP
	 SKOplBCoMTMLhBVi1eEFzyzWGnjwkzF7UUXChe6m2vzPZd2zngI3/9r9yqdlXseAXnkwF
	 Zcl8Ni3hvbOQHLZ/kfnKMrD5wJRs5NtCZktvOaFQxGXnYy9gCZp2VIWw7OjNf+1iPNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166653;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BUOmyUk/YbEedYSsZtCkcQhdZ/wCux4Lncj9Yrl5BoM=;
	b=mqlLpv6mqFQ3WLTrbNNU9EMf2Fy9tzwZabwpKWHIMmbAaacs9k8/ODin4Zs5M6SnrXMq
	 uv1PnduMG94MAkV+How5b+XZCZdX81wc9QOypx6C9Jn/GlwHgIYykG7SJx/cnD2UOfryN
	 hTc0QXcg13HVyljm6ahOP9lWQ7WjH5lElBmgaxt8Yz+nD+EvOuVb512Idw1VA4d5FisIj
	 cPnZFYvHt9O/7H/o3nP/6c6i183u+TAvAPrtoR58MrgIq3BPcli13m1le4L6CUkF+mnRb
	 eXjOksJcxiGrVkLkL+pA0WTQiVEnPOApNfxSEYv5G76NLMGnDxkukJN5QNX3LOD3D2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MOc5z0oG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C71606A320;
	Fri, 20 Nov 2026 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MOc5z0oG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795166653;
	b=b7/Kh8x3KJaUKwxa5q5RmcFR/S2c0CTnq8ihLR1L8Cr3XXik4Bdm3wtOFIoR+XFrrftL
	 K0qjxVpJRItxuAl2nmcZsU+tYZAZbmrBFrDI/nWlWkIH4RkgyaXxZCDBraHsoFQbFl0zv
	 xuHxq/pagGTGKFulluRm/gRql5lhHHSXeMoPmQED2LMd2jDTBMG3fvf/+cHGeDOXtVOQi
	 IgcTfx3unQzC0azMaCO9pnQaqmdSVXpKO5ZdQS8X9te9kDXsfq9eMH15XvsCJYG01P5Gl
	 B/BO9K31Udfr/u/kQyLzVHmQ4S8tS0SAwQFdh3HLc9oOqqZKe7W2kDjj7bgd8qq7rEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795166653;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BUOmyUk/YbEedYSsZtCkcQhdZ/wCux4Lncj9Yrl5BoM=;
	b=YLHFgflCeMAd45T9vOMSBrRcon1x2LgPrMxH4JhHFK0Hw2skI9MjlIwyfkwcCYhRyo1q
	 /rGaPG/tgo805IfhFBUCg0vGIvSOt8PVoX7M32xFa8Dnnh3tgfXOvnPwDs16ZrmphTBOV
	 kycnOCPEDkFKzRnHpbcTaSOO5kPbHO6jzPGecENK5poXbV6ARuRhfcIUlXJ7Qa6CUvmta
	 IWrR+wdGb4xhr2A7yCNCSoyo0aVRz6DB7nvHZE6O7KsBmdvNc1D2Y5tkf9KgbhMmu/Rqw
	 DIOFrc5giBgRnwszmjEESulGBDcYXiZZVy4kW3Hvnw+ZPAIlpR1yJb/XXMaXKiKoN1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C6B31F000D0;
	Fri, 20 Nov 2026 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166653;
	bh=BUOmyUk/YbEedYSsZtCkcQhdZ/wCux4Lncj9Yrl5BoM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MOc5z0oG/5vCL1YJ8NZ/j7SDzXEXNy4H3m1lu4Ddz2jvMTltLR56BJNSWFd/bFoKR
	 uN42iQ90ihJ+/wqSRB0pblIeZDCoAK44dWdvbYwub4oa/LcQ9c6LsqP6bIWFdQv3/I
	 R5nNl7/0MqUrqtcQ7A6UjtQayR9ox0K7Xh4Q2U8depFWt/m0+yb1xB7wb0P3bTSXnm
	 6zQyNgiBv9WQQKxxJRdUhRYHnYk5pOjlwPJ2J1nCniXV/Y/X9koNJkty5zN2cROO8u
	 dREmxU/Z6ZuGbfelTWePhWdAEzhFviyv6Pn5XKXWjUSWemTKQpQ7rAmXZ7moQIDvWb
	 1UuURgmsTtzEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0ABC8497CD;
	Fri, 20 Nov 2026 09:24:12 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Date: Fri, 20 Nov 2026 09:24:04 +0000
Subject: [PATCH v3 2/2] bus: Add Altera AXI Timeout Bridge driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-feature-timeout-ip-v3-2-affcc644af5e@bruker.com>
References: <20261120-feature-timeout-ip-v3-0-affcc644af5e@bruker.com>
In-Reply-To: <20261120-feature-timeout-ip-v3-0-affcc644af5e@bruker.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <uvv.mail@gmail.com>, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795166651; l=10406;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=YFPYOQurzV523DYlG7bc3CNsm/PeeCewidiv0N9HBIc=;
 b=UYuuHvxkL6+AO9YJwKkqr70qfQG3BASrnTH1tJ+fwlge9K9psa8WXvaEKJvOo3M0VEg8cYYfM
 O1LjMzhFfskB8qF4U9dVrTkH4Frm+Kbu3HcHhX14lGs7ocJTW9VdFxL
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>

The Altera AXI Timeout Bridge sits between an AXI host and peripherals
in the FPGA fabric. When a peripheral fails to respond, the bridge
completes the transaction with an error response instead of letting
the host hang, raises an interrupt, and latches the address of the
timed-out transaction.

Add a driver that populates the peripherals behind the bridge as child
devices and handles the timeout interrupt. On each timeout, the driver
logs the address, clears the interrupt, and notifies user space through
sysfs:

  irq_count             number of timeouts since the driver was bound
  last_timeout_address  address of the most recent timed-out transaction

last_timeout_address supports poll(), so a monitoring application can
wait for timeouts without busy-polling.
The sysfs group is registered manually in order to get the kernfs node
in probe, .dev_groups would register it after the probe is already done.

On the host, the error response is reported as an external abort.

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
 .../ABI/testing/sysfs-driver-altera-timeout-bridge |  21 +++
 MAINTAINERS                                        |   7 +
 drivers/bus/Kconfig                                |  13 ++
 drivers/bus/Makefile                               |   1 +
 drivers/bus/altera-timeout-bridge.c                | 184 +++++++++++++++++++++
 5 files changed, 226 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-altera-timeout-bridge b/Documentation/ABI/testing/sysfs-driver-altera-timeout-bridge
new file mode 100644
index 000000000000..7af69e74668f
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-altera-timeout-bridge
@@ -0,0 +1,21 @@
+What:       /sys/bus/platform/devices/<dev>/irq_count
+Date:       October 2026
+KernelVersion:  7.5
+Contact:    Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+Description:
+        (RO) Number of transaction timeouts reported by the
+        Altera AXI Timeout Bridge since the driver was bound.
+
+What:       /sys/bus/platform/devices/<dev>/last_timeout_address
+Date:       October 2026
+KernelVersion:  7.5
+Contact:    Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+Description:
+        (RO) Address of the most recent transaction that timed
+        out, reported as the translated CPU address, formatted as
+        a hexadecimal number with a 0x prefix. Reads 0x0 until
+        the first timeout occurs.
+
+        The attribute supports poll(): user space can wait for
+        POLLPRI | POLLERR to be notified of each new timeout,
+        re-reading the attribute from offset 0 afterwards.
diff --git a/MAINTAINERS b/MAINTAINERS
index 3ed1991cac46..eaf5abba00c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -974,6 +974,13 @@ ALPS PS/2 TOUCHPAD DRIVER
 R:	Pali Rohár <pali@kernel.org>
 F:	drivers/input/mouse/alps.*
 
+ALTERA AXI TIMEOUT BRIDGE DRIVER
+M:	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-altera-timeout-bridge
+F:	Documentation/devicetree/bindings/bus/altr,axi-timeout-bridge-1.0.yaml
+F:	drivers/bus/altera-timeout-bridge.c
+
 ALTERA MAILBOX DRIVER
 M:	Tien Sung Ang <tiensung.ang@altera.com>
 S:	Maintained
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e4b1db809187..e0c8c0a6a932 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -247,6 +247,19 @@ config DA8XX_MSTPRI
 	  configuration. Allows to adjust the priorities of all master
 	  peripherals.
 
+config ALTERA_TIMEOUT_BRIDGE
+	tristate "Altera AXI Timeout Bridge bus"
+	depends on ARCH_INTEL_SOCFPGA || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	help
+	  Driver for the Altera AXI Timeout Bridge, an FPGA IP core that
+	  sits between an AXI host and peripherals in the FPGA fabric.
+	  When a peripheral does not respond in time, the bridge
+	  terminates the transaction with an error response and raises
+	  an interrupt. This driver populates the peripherals behind the
+	  bridge and reports the address of each timed-out transaction
+	  through sysfs.
+
 source "drivers/bus/fsl-mc/Kconfig"
 source "drivers/bus/mhi/Kconfig"
 
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index a01f97fef3e8..ad4e6d7b1e49 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)	+= uniphier-system-bus.o
 obj-$(CONFIG_VEXPRESS_CONFIG)	+= vexpress-config.o
 
 obj-$(CONFIG_DA8XX_MSTPRI)	+= da8xx-mstpri.o
+obj-$(CONFIG_ALTERA_TIMEOUT_BRIDGE)	+= altera-timeout-bridge.o
 
 # MHI
 obj-y				+= mhi/
diff --git a/drivers/bus/altera-timeout-bridge.c b/drivers/bus/altera-timeout-bridge.c
new file mode 100644
index 000000000000..dd84096ec694
--- /dev/null
+++ b/drivers/bus/altera-timeout-bridge.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Altera AXI Timeout Bridge Bus Driver
+ *
+ * Copyright (C) 2026 Bruker Corporation
+ */
+
+#include <linux/atomic.h>
+#include <linux/interrupt.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/sysfs.h>
+
+#define ALTERA_TIMEOUT_BRIDGE_REG_IRQ_STATUS_RESET 0x00
+#define ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS_LO 0x08
+#define ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS_HI 0x0C
+
+struct altera_timeout_bridge_data {
+	struct device *dev;
+	void __iomem *bridge_registers;
+	atomic_t irq_count;
+	u64 last_timeout_address;
+	struct of_range range;
+	spinlock_t lock;
+	struct kernfs_node *irq_node;
+};
+
+static ssize_t last_timeout_address_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct altera_timeout_bridge_data *driver_data = dev_get_drvdata(dev);
+	unsigned long flags;
+	u64 addr;
+
+	spin_lock_irqsave(&driver_data->lock, flags);
+	addr = driver_data->last_timeout_address;
+	spin_unlock_irqrestore(&driver_data->lock, flags);
+
+	return sysfs_emit(buf, "0x%016llx\n", addr);
+}
+
+static ssize_t irq_count_show(struct device *dev,
+			      struct device_attribute *attr,
+			      char *buf)
+{
+	struct altera_timeout_bridge_data *driver_data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%u\n", atomic_read(&driver_data->irq_count));
+}
+
+static DEVICE_ATTR_RO(last_timeout_address);
+static DEVICE_ATTR_RO(irq_count);
+
+static struct attribute *altera_timeout_bridge_sysfs_attrs[] = {
+	&dev_attr_last_timeout_address.attr,
+	&dev_attr_irq_count.attr,
+	NULL /* sentinel */
+};
+
+static const struct attribute_group altera_timeout_bridge_sysfs_group = {
+	.attrs = altera_timeout_bridge_sysfs_attrs,
+};
+
+static irqreturn_t altera_timeout_bridge_isr(int irq, void *data)
+{
+	struct altera_timeout_bridge_data *driver_data = data;
+	u64 raw, addr;
+
+	atomic_inc(&driver_data->irq_count);
+
+	/* Read and print the timed-out address. If the ADDRESS_WIDTH of more
+	 * than 32 bits, two CSR reads (from addresses 0x8 and 0xc) are
+	 * required to get the complete address, given that the data width
+	 * of the CSR interface is only 32 bits wide.
+	 */
+	raw = lo_hi_readq(driver_data->bridge_registers +
+		ALTERA_TIMEOUT_BRIDGE_REG_TIMED_OUT_ADDRESS_LO);
+	addr = driver_data->range.cpu_addr +
+		(raw - driver_data->range.bus_addr);
+
+	spin_lock(&driver_data->lock);
+	driver_data->last_timeout_address = addr;
+	spin_unlock(&driver_data->lock);
+
+	dev_err_ratelimited(driver_data->dev, "timeout at 0x%llx\n", addr);
+
+	/* Reset IRQ status in the bridge */
+	writel(0x1,
+		driver_data->bridge_registers +
+		ALTERA_TIMEOUT_BRIDGE_REG_IRQ_STATUS_RESET);
+	/* notify the user space */
+	sysfs_notify_dirent(driver_data->irq_node);
+
+	return IRQ_HANDLED;
+}
+
+static void altera_timeout_bridge_put_dirent(void *data)
+{
+	sysfs_put(data);
+}
+
+static int altera_timeout_bridge_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct altera_timeout_bridge_data *driver_data;
+	struct of_range_parser parser;
+	int ret;
+	int irq;
+
+	driver_data = devm_kzalloc(dev, sizeof(*driver_data), GFP_KERNEL);
+	if (!driver_data)
+		return -ENOMEM;
+
+	spin_lock_init(&driver_data->lock);
+	driver_data->dev = dev;
+	platform_set_drvdata(pdev, driver_data);
+
+	driver_data->bridge_registers = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(driver_data->bridge_registers))
+		return PTR_ERR(driver_data->bridge_registers);
+
+	ret = of_range_parser_init(&parser, dev->of_node);
+	if (ret)
+		return dev_err_probe(dev, ret, "invalid ranges\n");
+
+	if (!of_pci_range_parser_one(&parser, &driver_data->range))
+		return dev_err_probe(dev, -EINVAL, "missing ranges entry\n");
+
+	if (driver_data->range.cpu_addr == OF_BAD_ADDR)
+		return dev_err_probe(dev, -EINVAL, "untranslatable ranges entry\n");
+
+	ret = devm_device_add_group(dev, &altera_timeout_bridge_sysfs_group);
+	if (ret)
+		return ret;
+
+	driver_data->irq_node = sysfs_get_dirent(dev->kobj.sd, "last_timeout_address");
+	if (!driver_data->irq_node)
+		return -ENOENT;
+
+	ret = devm_add_action_or_reset(dev, altera_timeout_bridge_put_dirent,
+				       driver_data->irq_node);
+	if (ret)
+		return ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq,
+			       altera_timeout_bridge_isr,
+			       0,
+			       dev_name(dev),
+			       driver_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	return devm_of_platform_populate(dev);
+}
+
+static const struct of_device_id altera_timeout_bridge_of_match[] = {
+	{ .compatible = "altr,axi-timeout-bridge-1.0", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, altera_timeout_bridge_of_match);
+
+static struct platform_driver altera_timeout_bridge_driver = {
+	.probe = altera_timeout_bridge_probe,
+	.driver = {
+		.name = "axi-timeout-bridge",
+		.of_match_table = altera_timeout_bridge_of_match,
+	},
+};
+
+module_platform_driver(altera_timeout_bridge_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Altera AXI Timeout Bridge Bus");
+MODULE_AUTHOR("Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>");

-- 
2.34.1


