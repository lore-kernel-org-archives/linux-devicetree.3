Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438397;
	b=yJtTd6SGeURyQ6nowOfK0JVoWTT48jaYsNIK3xki8lVi3AV/Tq3wEP6F+IdaEI8tTJbg
	 BsyEmIof3mQ44o2sdDnfQUlZB7sZI09rPGxc5PDeikcLMd3Oglg49E7vrie1V48ga7V8y
	 UtMcAYcvTL6HCjgeWECo0WwC9dcM2uy348flsKhlVcJDhmmUTreNQj4cCwCGsK2d+TJnN
	 31bG/uVLCbOZqjGM4j2qBKDRy++c3Y1wUtJkUJpo6+47YGKvzHmljrTXDhqFOSE33Bg/E
	 YWUtUpFJo+KZN3CTkcZNj4WjaqmWoxtMy/58PoHgz2b+qHSyM1659FkcJM3TsfvbZmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438397;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=35QlNOZpCdu2KRQ7HBQ0if+iYLEEt/LogrJmHd+ldZA=;
	b=fC43lyp6ci7PU9twHuqPE/LpMJdTrzfit9GWpRFN2Gu9ES5Bo0+61lCpjunqOgc2jawe
	 ZcYwFjC0NxSiD9anbKtRlxkMTKUt+s7mXN1SBkrFOmEDTnR8VDOGLBCST1bO2hgiS4iKf
	 D9i4MpyCD1G8m95LiU5QyuCgMyWW856H9ud4vaZkzOe9AQdVN9oIYlmIiQmBREUgX3vIw
	 tjCWpJtJOdhks1cKf9Ztu7jyGIFh7oPqg4q6m/191nA4fVQvcCK69IWQFS2fPcqO2A4VR
	 K5RGvjovaxUcNCotPKNqyE/LJ/tLMedj7Tm1H4YIzaD8blYu+aV9vZW1JfaXCLmq6Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RQJCa3UX;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEC8606A333
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEC8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=RQJCa3UX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0EAA41A17A1;
	Mon, 23 Nov 2026 12:53:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D13FF601E1;
	Mon, 23 Nov 2026 12:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3415211E6958F;
	Mon, 23 Nov 2026 13:53:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438394; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=35QlNOZpCdu2KRQ7HBQ0if+iYLEEt/LogrJmHd+ldZA=;
	b=RQJCa3UXWvamQLIg04zULPeYF08RKu4kCavHpV6FONMzD9INDgZ5pC+20A6WV+9MVEyJer
	Zo6ZzwUxfebZ4ejX1kh9BLgXhaEmHRj4as79ebxS7wN/2iJH5qdgIrkgS9HMsp32bRq9gR
	GLkFWa4vVcivZOmhC3T8awedgVMmLGjkZLU5DdaFq2L0Wf7X+ApcGVmEVUz4ba493WZ00i
	Y0QbowQ9j4poJG3IBK0rO9XlE4YIYgG8byrShYA3wMmhzXjS17T+AcfMp0YHNZ53vJpXT8
	91vUXrS2QMch3l5bTNe8pecO/iFVcxv/7eCkwl5Z8aChjj+EATiON+JXVxj25w==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: [PATCH v4 2/2] mailbox: marvell-mhu: add Marvell MHU driver
Date: Mon, 23 Nov 2026 13:52:57 +0100
Message-ID: <20261123125257.111219-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123125257.111219-1-paul.cercueil@bootlin.com>
References: <20261123125257.111219-1-paul.cercueil@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: George Cherian <gcherian@marvell.com>

Add support for Message Handling Units on Marvell OcteonTx and OcteonTx2
platforms. The module uses mailbox controller interface to provide
communication between SCP and AP using SCMI protocol over a single
shared memory communication channel.

Signed-off-by: George Cherian <gcherian@marvell.com>
Co-developed-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Sujeet Baranwal <sbaranwal@marvell.com>
Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
---

v4:
 - Use readq / writeq instead of ioread64 / iowrite64, which aren't
   available on every arch.

v3:
 - Request an interrupt vector of exactly 3 interrupts
 - Pass IRQF_NO_AUTOEN to devm_request_irq()
 - Invert success condition of mrvl_mhu_last_tx_done()

v2:
 - Add Kconfig dependency on PCI
 - Order includes properly
 - Remove duplicated macros
 - Pass a pointer to the "mhu" variable to mrvl_mhu_setup_irq(), instead
   of getting it from drvdata. Then we don't even need to set drvdata.
 - Use devm functions unconditionally. This fixes an issue where
   pci_free_irq_vectors() was called while IRQs were still in place.
   It also allows to drop mrvl_mhu_remove().
 - Use pcim_iomap_region() instead of pcim_request_region() +
   pcim_iomap().
 - Enable IRQ in .startup(), disable it in .shutdown().
 - ACK the IRQ after calling mbox_chan_received_data()
 - Fix register used for polling TX done
 - Clean up macros
---
 MAINTAINERS                   |   1 +
 drivers/mailbox/Kconfig       |  11 ++
 drivers/mailbox/Makefile      |   2 +
 drivers/mailbox/marvell_mhu.c | 239 ++++++++++++++++++++++++++++++++++
 4 files changed, 253 insertions(+)
 create mode 100644 drivers/mailbox/marvell_mhu.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f6f98acc8fc..06c49bef8390 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15830,6 +15830,7 @@ M:	Sujeet Baranwal <sbaranwal@marvell.com>
 M:	George Cherian <gcherian@marvell.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/mailbox/marvell,mhu.yaml
+F:	drivers/mailbox/marvell_mhu.c
 
 MARVELL MV643XX ETHERNET DRIVER
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..62744399cdb8 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -195,6 +195,17 @@ config MAILBOX_TEST
 	  Test client to help with testing new Controller driver
 	  implementations.
 
+config MARVELL_MHU
+	tristate "Marvell Message Handling Unit"
+	depends on (ARM64 || COMPILE_TEST) && 64BIT
+	depends on PCI && OF
+	help
+	  This driver adds support for Marvell MHU controller.
+	  The MHU mailbox is used by SCMI for OcteonTX and OcteonTX2
+	  to control various aspects of platform operation like cpufreq
+	  or sensors. The controller supports single channel to SCP.
+	  Say Y here to build this module. If unsure say N.
+
 config POLARFIRE_SOC_MAILBOX
 	tristate "PolarFire SoC (MPFS) Mailbox"
 	depends on HAS_IOMEM
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..83b26e7bbd27 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -49,6 +49,8 @@ obj-$(CONFIG_BCM_PDC_MBOX)	+= bcm-pdc-mailbox.o
 
 obj-$(CONFIG_BCM_FLEXRM_MBOX)	+= bcm-flexrm-mailbox.o
 
+obj-$(CONFIG_MARVELL_MHU)	+= marvell_mhu.o
+
 obj-$(CONFIG_POLARFIRE_SOC_MAILBOX)	+= mailbox-mpfs.o
 
 obj-$(CONFIG_MCHP_SBI_IPC_MBOX)		+= mailbox-mchp-ipc-sbi.o
diff --git a/drivers/mailbox/marvell_mhu.c b/drivers/mailbox/marvell_mhu.c
new file mode 100644
index 000000000000..5cb1dd5a911c
--- /dev/null
+++ b/drivers/mailbox/marvell_mhu.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Marvell Message Handling Unit
+ *
+ * Copyright (c) 2023, 2026 Marvell
+ */
+
+#define DRIVER_NAME	"marvell-mhu"
+
+#define pr_fmt(fmt)	DRIVER_NAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/device/devres.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mailbox_controller.h>
+#include <linux/pci.h>
+
+#define SCP_INDEX	0x0
+#define DEV_AP0		0x2
+#define SCP_TO_AP_INTERRUPT	2
+#define INT_VECS	3
+
+#define XCP_ADDR(offt, xcp_core, device_id) \
+	((offt) | ((uint64_t)(xcp_core) << 36) | ((uint64_t)(device_id) << 4))
+
+#define DEV_TO_XCP_MBOX_LINT(xcp_core, device_id)  \
+	XCP_ADDR(0x000E1C00, xcp_core, device_id)
+
+/* The transmit interrupt status register */
+#define AP0_TO_SCP_MBOX_LINT    DEV_TO_XCP_MBOX_LINT(SCP_INDEX, DEV_AP0)
+
+/*
+ * Doorbell-Register: XCP(0..1)_DEV(0..7)_XCP_MBOX
+ * Communication data from devices to XCP. When written, sets
+ * XCP(0..1)_DEV(0..7)_XCP_MBOX.
+ * PS: it doesn't matter what is written into this register,
+ * Attempting to writing 'anything' would cause an interrupt
+ * to the target!
+ */
+#define DEV_TO_XCP_MBOX(xcp_core, device_id) \
+	XCP_ADDR(0x000E1000, xcp_core, device_id)
+
+/* AP0-to-SCP doorbell */
+#define AP0_TO_SCP_MBOX         DEV_TO_XCP_MBOX(SCP_INDEX, DEV_AP0)
+
+/*  Register offset: Enable interrupt from SCP to AP */
+#define XCP_TO_DEV_XCP_MBOX_RINT_ENA_W1S(xcp_core, device_id) \
+	XCP_ADDR(0x000D1C40, xcp_core, device_id)
+
+#define SCP_TO_AP0_MBOX_RINT_ENA_W1S XCP_TO_DEV_XCP_MBOX_RINT_ENA_W1S(SCP_INDEX, DEV_AP0)
+
+/* Rx interrupt from SCP to Non-secure AP (linux kernel) */
+#define XCP_TO_DEV_MBOX_RINT(xcp_core, device_id) \
+	XCP_ADDR(0x000D1C00, xcp_core, device_id)
+
+/* The receive interrupt status register */
+#define SCP_TO_AP0_MBOX_RINT  XCP_TO_DEV_MBOX_RINT(SCP_INDEX, DEV_AP0)
+
+struct mrvl_mhu {
+	/* SCP link information */
+	void __iomem *base; /* tx_reg, rx_reg */
+
+	int irq;
+
+	struct mbox_controller ctrl;
+	struct mbox_chan chan;
+};
+
+static irqreturn_t mrvl_mhu_rx_interrupt(int irq, void *p)
+{
+	struct mrvl_mhu *mhu = p;
+	u64 val;
+
+	/* Read interrupt status register */
+	val = readq_relaxed(mhu->base + SCP_TO_AP0_MBOX_RINT);
+	if (val) {
+		/* Poke mbox */
+		mbox_chan_received_data(&mhu->chan, (void *)&val);
+
+		/* Clear the interrupt */
+		writeq_relaxed(1ul, mhu->base + SCP_TO_AP0_MBOX_RINT);
+
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
+}
+
+static int mrvl_mhu_send_data(struct mbox_chan *chan, void *data)
+{
+	const u64 doorbell = 0xff;  /* Arbitrary value, SCP requires a value */
+	struct mrvl_mhu *mhu = chan->con_priv;
+
+	/* signal SCP */
+	writeq(doorbell, mhu->base + AP0_TO_SCP_MBOX);
+
+	return 0;
+}
+
+static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
+{
+	struct mrvl_mhu *mhu = chan->con_priv;
+	u64 status;
+
+	status = readq(mhu->base + AP0_TO_SCP_MBOX_LINT);
+
+	return status == 0;
+}
+
+static int mrvl_mhu_startup(struct mbox_chan *chan)
+{
+	struct mrvl_mhu *mhu = chan->con_priv;
+
+	/* Enable interrupts only if there is client for data */
+	writeq_relaxed(1ul, mhu->base + SCP_TO_AP0_MBOX_RINT_ENA_W1S);
+
+	enable_irq(mhu->irq);
+
+	return 0;
+}
+
+static void mrvl_mhu_shutdown(struct mbox_chan *chan)
+{
+	struct mrvl_mhu *mhu = chan->con_priv;
+
+	/* Could be using SCP_TO_AP0_MBOX_RINT_DIS_W1S if we knew where it was */
+	disable_irq(mhu->irq);
+}
+
+/* Define operations related to mbox */
+static const struct mbox_chan_ops mrvl_mhu_chan_ops = {
+	.startup = mrvl_mhu_startup,
+	.shutdown = mrvl_mhu_shutdown,
+	.send_data = mrvl_mhu_send_data,
+	.last_tx_done = mrvl_mhu_last_tx_done,
+};
+
+static void mrvl_mhu_free_irq_vector(void *pdev)
+{
+	pci_free_irq_vectors(pdev);
+}
+
+static int mrvl_mhu_setup_irq(struct mrvl_mhu *mhu, struct pci_dev *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret, nvec;
+
+	nvec = pci_alloc_irq_vectors(pdev, INT_VECS, INT_VECS, PCI_IRQ_MSIX);
+	if (nvec < 0)
+		return nvec;
+
+	ret = devm_add_action_or_reset(dev, mrvl_mhu_free_irq_vector, pdev);
+	if (ret)
+		return ret;
+
+	mhu->irq = pci_irq_vector(pdev, SCP_TO_AP_INTERRUPT);
+	if (mhu->irq < 0)
+		return mhu->irq;
+
+	return devm_request_irq(dev, mhu->irq, mrvl_mhu_rx_interrupt,
+				IRQF_NO_AUTOEN, "mvl-mhu", mhu);
+}
+
+static const struct of_device_id mrvl_mhu_dt_ids[] = {
+	{ .compatible = "marvell,octeontx-mhu" },
+	{ .compatible = "marvell,octeontx2-mhu" },
+	{ .compatible = "marvell,cn10-mhu" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mrvl_mhu_dt_ids);
+
+#define PCI_DEVICE_ID_CAVIUM_OCTEON_MHU	0xa067
+static const struct pci_device_id mrvl_mhu_ids[] = {
+	{ PCI_VDEVICE(CAVIUM, PCI_DEVICE_ID_CAVIUM_OCTEON_MHU) },
+	{ 0 },
+};
+MODULE_DEVICE_TABLE(pci, mrvl_mhu_ids);
+
+static int mrvl_mhu_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct mrvl_mhu *mhu;
+	int ret;
+
+	/* Only support PCI devices with a corresponding OF node. */
+	if (!dev->of_node)
+		return -ENODEV;
+	if (!of_match_node(mrvl_mhu_dt_ids, dev->of_node))
+		return -EINVAL;
+
+	mhu = devm_kzalloc(dev, sizeof(*mhu), GFP_KERNEL);
+	if (!mhu)
+		return -ENOMEM;
+
+	mhu->chan = (struct mbox_chan) {
+		.con_priv = mhu,
+	};
+
+	mhu->ctrl = (struct mbox_controller){
+		.chans = &mhu->chan,
+		.num_chans = 1,
+		.txdone_poll = true,
+		.txpoll_period = 100,
+		.ops = &mrvl_mhu_chan_ops,
+		.dev = dev,
+	};
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	mhu->base = pcim_iomap_region(pdev, 0, DRIVER_NAME);
+	if (IS_ERR(mhu->base))
+		return PTR_ERR(mhu->base);
+
+	/* Configure IRQ from SCP to AP */
+	ret = mrvl_mhu_setup_irq(mhu, pdev);
+	if (ret)
+		return ret;
+
+	return devm_mbox_controller_register(dev, &mhu->ctrl);
+}
+
+static struct pci_driver mrvl_mhu_driver = {
+	.name = DRIVER_NAME,
+	.id_table = mrvl_mhu_ids,
+	.probe = mrvl_mhu_probe,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table = mrvl_mhu_dt_ids,
+	},
+};
+module_pci_driver(mrvl_mhu_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Marvell Message Handling Unit");
+MODULE_AUTHOR("Sujeet Baranwal <sbaranwal@marvell.com>");
+MODULE_AUTHOR("George Cherian <gcherian@marvell.com>");
-- 
2.47.3

