Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795565196;
	b=bzsnPXCeQ14JgBJ6x1u65GYujlQNAoOCcOqHfX6XGcflJxIh6RkW2t9ZjN2oO5SQsYBK
	 uZPhbqg+fwUcNUfAMTrugS+LoPat0bXdZtcrVzaHJj9mX9Gxk3O62lK8aBBb3rne4q8ti
	 568t9rDIpbKYCMKyXBIuwQEdYns/SPAJV724fHZvQPSPv6f4fiUTIyRddCjoxovu/SufC
	 u1Ytg22ur+pmDdwOZpZ0OQBaDQnNVTnDg27YIgbt9t7eofSsPmdTUA5j4zivmbYXJbBMl
	 C1PIL9jnez/R2hA1VrRVv7GDwrAU/z6dYi0N39mt5Vj/3BRI6JzJx2qiFFpiYJ2UtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795565196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
	b=r+wUjXUBogLbyO5LtXo64eQ0iEukPtIXmQfBNCh9iiDmJksm7E6mzCyKHd1xiTOI9sr8
	 Vbkn6bzXlULOVoZnAa9WMUlUNXgDg2p/dCTzvP2exArNMWPCTc9wi69QKQuiuvZAEw5fV
	 gYhUfHHVJ4yRMCXMSeskL5z2PuTAisfB+YkGMrb10MBxql6XnPsPVWtPEFPNuxo2dYJVJ
	 t/QVHwySEIo5XSk0Dxy9HpW8WTdpDhyqEbIARr2uwapRuxNG7oliWaw4sVzJRsR2yo31b
	 cAZyjAYaE05l/+zV9xgV03Ix81AezqQF+ufN8yryq7VpBcYR6DnQBA1WOMmIARcUWxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XfvXTVpG;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9D606A698
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 00:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A9D606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XfvXTVpG
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386b8f2f671so2345076eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565195; x=1796169995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
        b=XfvXTVpGy1YzZ3zEnOAmNLaGkgp8sFFr04vw63nGc3s97S9lTl0vqtfIhIfKDetYmY
         cp087BaoKFQYTrYrITRYyohs39+efC3g5+STFsCp1vLHVJ8tVCsFaoFNJ2XaxfwrZPSt
         ek+KmxYPPEbCMUN3aRMxzqHDxAQHsJer9IrMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565195; x=1796169995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwqXgM2FKN08CB+8H4O0/VbJ4ckFqMzW77Fps/c3mB0=;
        b=AVWkgBhrbjS5USPoCSYsH0fvnCZ+10nCsCcvsOqvjtkejClPb1CecjGxpjvVqYhqtl
         xeuVZ86ORwLL4pOZSpg6TEFouCVlCT9pjRA0DEyuUmgygFIpLaa2tDiCCWWFYVYzkp+s
         fUREbXWqesYUa80lvCWXoKB1CTGl9Wv+5u+fyWEQkR61ts2HTc6MhJjKLBcmVo+YthMF
         N5Jk2mlGgIA8ID3EH5Zm+TwPgG1mdyLsw9PBxLHYNG/1dKQSbsB1bAi6/lW6MJKKk29f
         lVVBLk9XM3H06rFDxrsf84coR5lhhnkEwPTqooqODhbHBWvBDsfAOS5IIwowP1pTVlRj
         9kaQ==
X-Forwarded-Encrypted: i=1; AL+hErH1zFdotDgX7muoE2ikj6LGQz4it858BPSeqdLvyoM8E+XXD4iyP0l2prCuUmJyFpcNjwQyV5RZO5gN@vger.kernel.org
X-Gm-Message-State: APuU4Z9qJlhzxel4kBHqS2eytudFW0WpET/WUIWkJ6Te7YPFYeBh8ooo
	RAfpUUg85Uf9V1tQ1IfjZCfzViXdmiKDYww/Ndaa369AJyYVVHHsZ4TyTY/AmTq6LA==
X-Gm-Gg: AZFdTZfgJqIfZHHyhIoeIJJGhoHhT3z3bP68Q39TJsy8v+9H4yA8itwM6XrSWDvMU0j
	KHxFCqS+xj5V+XFaSOASLabqBi9aPLHh2xjai5aeqDXFqsSdq5GAnTqmqwKHgMxmz3Glmr8SljH
	6VTDt8+UONT4qyFj0UiFj432fRSQobn1VfDeDw7D1s82BOCCJDGL5n0OcHfxyfyT1dwUk85MaUy
	xJHqNMplbRDTjQhmwH6N5nCd9X9ENu2paSTdlcZLWosgbtFTKvE/o1+DKO/AWndKbA8cdVvvb/w
	KKYYpwovHxkstzll3nnd7jUs0gPAuuWISQwzTRjexYhM85ScK7KwI0cyo7mq96ibHMWNBpya0ub
	5kuc3yHRFzk7viuAWOpNPSeJwhaJe234Z6Bbenl7huHRh3irqb8GH7i/Z5OW2183wVtRMvZmx5x
	oojIRwfX++tKtk+FiZgRv5iSOTr02f7sVjQ6b5lW9YTK6GeLYUO86zgiRoZfwlWiWxpR9mGe7Sy
	EXTp1mF7V1Z49vuffWYGJjPbkK80Bueykaaz2gV7/1IWhAOo9pS6+dCvIQwfdpfK3BbAjnB8PmO
	J1c4879sSyhdxNDG50g056Atdarc0Do7MGwLXZhyNhywVOoN6bhM1VupldIhfqFdivv1XA==
X-Received: by 2002:a05:7301:78c1:b0:386:a3fe:44de with SMTP id 5a478bee46e88-386a3fe4616mr10456351eec.28.1795565194862;
        Tue, 24 Nov 2026 16:06:34 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38567abb870sm40418219eec.25.2026.11.24.16.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:34 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 5/9] reset: google: Add CPM reset driver
Date: Tue, 24 Nov 2026 16:03:39 -0800
Message-ID: <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
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

Google Tensor SoCs (used on Pixel phones) manage many resources
(including resets) using a Central Power Manager (CPM) co-processor. We
communicate with CPM using mailboxes, abstracted in the
devm_cpm_get_handle(), etc., API.

For posterity, I list a summary of changes made relative to the
downstream Pixel driver:

* Switch to auxiliary bus, as a child of a CPM device

* Use devm more heavily

* Avoid representing each reset as its own Device Tree node.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Rename symbols from goog_cpm_rst_* to cpm_reset_*
 * Moved shared protocol details to CPM driver
 * Remove custom reset debugfs interface and .remove callback.
 * Remove per-SoC table; we only need naive translation of firmware IDs

 drivers/reset/Kconfig            |   1 +
 drivers/reset/Makefile           |   1 +
 drivers/reset/google/Kconfig     |  11 +++
 drivers/reset/google/Makefile    |   2 +
 drivers/reset/google/reset-cpm.c | 154 +++++++++++++++++++++++++++++++
 5 files changed, 169 insertions(+)
 create mode 100644 drivers/reset/google/Kconfig
 create mode 100644 drivers/reset/google/Makefile
 create mode 100644 drivers/reset/google/reset-cpm.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 673bca1e594e..64c12b479b2c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -475,6 +475,7 @@ config RESET_ZYNQMP
 	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
 
 source "drivers/reset/amlogic/Kconfig"
+source "drivers/reset/google/Kconfig"
 source "drivers/reset/hisilicon/Kconfig"
 source "drivers/reset/realtek/Kconfig"
 source "drivers/reset/spacemit/Kconfig"
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 2fe527a7be8e..a151fe63905e 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y += core.o
 obj-y += amlogic/
+obj-y += google/
 obj-y += hisilicon/
 obj-y += realtek/
 obj-y += spacemit/
diff --git a/drivers/reset/google/Kconfig b/drivers/reset/google/Kconfig
new file mode 100644
index 000000000000..38431b4f9001
--- /dev/null
+++ b/drivers/reset/google/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config RESET_CPM
+	tristate "Google CPM Reset Controller"
+	depends on ARCH_GOOGLE || COMPILE_TEST
+	depends on GOOGLE_CPM_MBA
+	help
+	  Driver support for reset controllers found on Google Tensor SoCs,
+	  operating over the CPM mailbox interface. This allows peripheral
+	  drivers to assert and deassert resets on LPCM hardware blocks.
+
+	  If unsure, say N.
diff --git a/drivers/reset/google/Makefile b/drivers/reset/google/Makefile
new file mode 100644
index 000000000000..437c19459464
--- /dev/null
+++ b/drivers/reset/google/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_RESET_CPM) += reset-cpm.o
diff --git a/drivers/reset/google/reset-cpm.c b/drivers/reset/google/reset-cpm.c
new file mode 100644
index 000000000000..ef0863f25cac
--- /dev/null
+++ b/drivers/reset/google/reset-cpm.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Device driver to control Google SoC LPCM resets via CPM.
+ * Copyright 2023-2026 Google LLC
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/limits.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+#include <soc/google/google-cpm-mba.h>
+
+#define ASSERT_OP_ID			0
+#define DEASSERT_OP_ID			1
+
+#define CPM_RST_LPCM_ID_MASK		GENMASK(31, 16)
+#define CPM_RST_ID_MASK			GENMASK(15, 0)
+/* Object fields are 8 bits */
+#define CPM_RST_ID_MAX			U8_MAX
+
+static inline unsigned long to_rstc_idx(u32 lpcm_id, u32 rst_id)
+{
+	return FIELD_PREP(CPM_RST_LPCM_ID_MASK, lpcm_id) |
+	       FIELD_PREP(CPM_RST_ID_MASK, rst_id);
+}
+
+static inline u32 lpcm_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_LPCM_ID_MASK, idx);
+}
+
+static inline u32 rst_from_idx(unsigned long idx)
+{
+	return FIELD_GET(CPM_RST_ID_MASK, idx);
+}
+
+struct cpm_reset_provider {
+	struct reset_controller_dev rcdev;
+	struct cpm_handle *cpm;
+};
+
+static inline struct cpm_reset_provider *to_provider(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct cpm_reset_provider, rcdev);
+}
+
+static int cpm_reset_send_lpcm(struct reset_controller_dev *rcdev,
+			       unsigned long idx, u8 opcode)
+{
+	struct cpm_reset_provider *provider = to_provider(rcdev);
+	const struct cpm_lpcm_message msg = {
+		.cmd = LPCM_CMD_SET_RST,
+		.opcode = opcode,
+		.lpcm_id = lpcm_from_idx(idx),
+		.obj_id = rst_from_idx(idx),
+	};
+
+	return cpm_send_lpcm_message(provider->cpm, &msg);
+}
+
+static int cpm_reset_assert(struct reset_controller_dev *rcdev,
+			    unsigned long idx)
+{
+	return cpm_reset_send_lpcm(rcdev, idx, ASSERT_OP_ID);
+}
+
+static int cpm_reset_deassert(struct reset_controller_dev *rcdev,
+			      unsigned long idx)
+{
+	return cpm_reset_send_lpcm(rcdev, idx, DEASSERT_OP_ID);
+}
+
+static const struct reset_control_ops cpm_reset_ops = {
+	.assert = cpm_reset_assert,
+	.deassert = cpm_reset_deassert,
+};
+
+static int cpm_reset_of_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	u32 lpcm_id, rst_id;
+
+	if (reset_spec->args_count != 2)
+		return -EINVAL;
+
+	lpcm_id = reset_spec->args[0];
+	rst_id = reset_spec->args[1];
+
+	if (lpcm_id > CPM_RST_ID_MAX)
+		return -EINVAL;
+	if (rst_id > CPM_RST_ID_MAX)
+		return -EINVAL;
+
+	return to_rstc_idx(lpcm_id, rst_id);
+}
+
+static int cpm_reset_probe(struct auxiliary_device *auxdev,
+			   const struct auxiliary_device_id *id)
+{
+	struct device *dev = &auxdev->dev;
+	struct cpm_reset_provider *provider;
+	int ret;
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	provider->cpm = devm_cpm_get_handle(dev);
+	if (IS_ERR(provider->cpm))
+		return dev_err_probe(dev, PTR_ERR(provider->cpm),
+				     "Failed to get CPM handle\n");
+
+	provider->rcdev.dev = dev;
+	provider->rcdev.owner = THIS_MODULE;
+	provider->rcdev.of_node = dev->of_node;
+	provider->rcdev.ops = &cpm_reset_ops;
+	provider->rcdev.of_reset_n_cells = 2;
+	provider->rcdev.of_xlate = cpm_reset_of_xlate;
+
+	ret = devm_reset_controller_register(dev, &provider->rcdev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register reset controller: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id cpm_reset_id_table[] = {
+	{ .name = "google_cpm_mba.reset" },
+	{}
+};
+MODULE_DEVICE_TABLE(auxiliary, cpm_reset_id_table);
+
+static struct auxiliary_driver cpm_reset_driver = {
+	.probe = cpm_reset_probe,
+	.name = "google-reset-cpm",
+	.id_table = cpm_reset_id_table,
+};
+module_auxiliary_driver(cpm_reset_driver);
+
+MODULE_DESCRIPTION("Google CPM Reset Driver");
+MODULE_LICENSE("GPL");
-- 
2.56.1.831.g720f3f5937-goog

