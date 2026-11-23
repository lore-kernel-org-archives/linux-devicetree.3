Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427164;
	b=J0s5AH6I4GlxkeBG8XZffVDdl6rDXmunbHDXo3uKCFIBN/w6tOztL+cwgSRxakdbsuNd
	 WxR0V+xapTQLsUrV+QumQKF+TYhJgr7SBeQ0KLvPlUsIZ1okIxQFJeamKBu0z8UcJaTIQ
	 wXe9LdxMYiSd4ASlg5cYxPE4A/3b1G1WsSuxMmtWqxtlCPoZh8GAoIfz6PknHAFH65Txw
	 Gm6s5f7bCl4HjiSTaLFWD66shYOXhGF3aXh3ejKsnk6o4u3QbzWkAmVa7PH1pRmE4Hxpn
	 XKdxYd+vzZ+E8mDzPjF5uX5LjLJ6UAo5lJHqkkd4fKUNF7qzF1RXVyDe/v6fNMchErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427164;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=pJ+7nfcFzRim3a/y3yfomDmbdCPIRW2m246LLxOsgHo=;
	b=fRPY9ZKfamOfu1M7DY4zPBdqYkWjQrvbLqXomAVUGi3eqKTdzsXpWVgSKEYUee6k0cXp
	 kw2FXjW3p3CwLti8khlPx2rstUU88FKFaQwQkKW66Jy7dCAmE4iWsdXckZBTxE8H4LuaQ
	 tdNuIQD0JpeFSF8zsaLO6ep5xQRs5SSLjY91+bEt2qJvGTg99PCWQ/9aLKI/Mdylp2cHE
	 V+aP2OVQakjmpUvjhTzf2jznX7w4E/r2YlZFVpKJqoAOHbaudar/xFyxonivXcuwrxZtA
	 0CN2u1zsfQSZ4jpfA5flxU97/O/BW5jtE76v8sGujNWAtErcNI8iUKzea/wBi9BFWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O74+mP8Z;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E37606A338
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E37606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=O74+mP8Z
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 577C74E41708;
	Mon, 23 Nov 2026 09:46:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 237E35FAEB;
	Mon, 23 Nov 2026 09:46:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5744C11E689B4;
	Mon, 23 Nov 2026 10:45:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795427159; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pJ+7nfcFzRim3a/y3yfomDmbdCPIRW2m246LLxOsgHo=;
	b=O74+mP8ZmvzyzI2bI0oj38gnLSeiRp+5MkiOcAmEgdhePkFb6d3Yc4JNdu3VkbtcSJrkXc
	VGq3VBFkiZFT4lnCxqkDUglABuOU7SCoAsWM3eaRNn1O/SO0oDfPRV4JOqAv9ne+jyS9X4
	VzAjG6SiPFpUYNQm/mF+G5vw145dEyVQOScWzhG+jvWY2ek6KYzsEZKxL6oVOe9ALdvUg8
	3bxDeKI89DF6IYyhjLajTQhqSxKdW1t3ytpoeEZ6HC7rI3BsMy7AMAjpbqcKtD6ylIadEq
	wH0FFNxFjJx+SXJ/rByDrnSlIXtEVzsP9bJfVx8Q1bcnPoElGyfkFgV++mbcTg==
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
Subject: [PATCH v3 2/2] mailbox: marvell-mhu: add Marvell MHU driver
Date: Mon, 23 Nov 2026 10:45:42 +0100
Message-ID: <20261123094542.44101-3-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123094542.44101-1-paul.cercueil@bootlin.com>
References: <20261123094542.44101-1-paul.cercueil@bootlin.com>
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
 drivers/mailbox/marvell_mhu.c | 238 ++++++++++++++++++++++++++++++++++
 4 files changed, 252 insertions(+)
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
index 000000000000..de7690897cc9
--- /dev/null
+++ b/drivers/mailbox/marvell_mhu.c
@@ -0,0 +1,238 @@
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
+	iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
+
+	return 0;
+}
+
+static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
+{
+	struct mrvl_mhu *mhu = chan->con_priv;
+	u64 status;
+
+	status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
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

