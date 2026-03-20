Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20336E480
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041325; cv=none; b=P7/Dl5Gw2IKZIT7zlXOJBGH44qExD2y060Nm1Kk/V25uxmErRCxnbZK1N4d1cEKy0DQWOxrMEmc23wXydt8EsjsfnjoMPGuZjbvyhBGXbeG+sCMBwVoPNHS3BQz0Qt3iMUQJ8W7O4zyUALs+DnUQhmXfpFrYsL0Kx0I30HmW7SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041325; c=relaxed/simple;
	bh=hmCRybVAO3Ql9oQJS0F9EO4DcZ+ZoVfk6/BRBT+8IXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rq+ls+/IXkRize4iIPFegq73utw69oZg5Q28NNVGvxmCZ8KZ/jqNUkfybg3F7PAnbZUUpX6xTEsMNR5u528iqEB8wgNjkux9Zw+74UP+ev+fGzW6BtjYV1xU5ZmuFKkv+Go7HFtapFpP8ycPILQ5Yz3n75E6k8M8sJnfgnZl+78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xb2FKLJK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xb2FKLJK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8df7620so1529104f8f.0
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041322; x=1774646122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqbbWkZUelJgFW3AcjmoveTN0lUpeuVS4Adcj/4N1VM=;
        b=Xb2FKLJKatJr9lSUpdJt6aZGLvnk+Jg8uG7rnipd1UqQRp8SNKT+fMIpq3Oe8LNG72
         CH8gftxzGOF6CVH5qn1qNPtRr0szxrZa5bkO7dIyV3GFx/XpCungfbHhNXCJ9RcIUMhU
         aWDhkd/nxVhqtCfNEU1GdRXi0dh4rJiESyQcdVWzOV4/QTfscYNW9zLPQIYktX3WJQCG
         /L1TElGL77sBBrI4KR5ddZ8DWIE3dKu3a6IsfhGXQOqCwS6sM69/ms+XZWIRJbZUXJMQ
         f3T2ElnyJaEJ2Ot6j3WNqY4BnE9QUTmh8g9j0c8+PYQOibkwuySi1Y9WHR2WYKZe0e/5
         n+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041322; x=1774646122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqbbWkZUelJgFW3AcjmoveTN0lUpeuVS4Adcj/4N1VM=;
        b=XUL5Nh58Yf7C71pPh3kw8JHBPKOld3qHAzzQOzC5rmTnz3UE7EpEzKiqLHRqqFUbbu
         vofZqO95BRD+zgWd5u2UtnEMbx4Gm56oIwQPGNNnKjOshQtRhNJfusfaqPZUOhi20uvb
         XHXQ2HSxTWquOBMmktDK33PvDXb69wz1o64gkHCDQqElXMCr192TDUkp5k3kp78Nx4EI
         IyqFBOWMnfLEQ+S4QOF7K0BMmI2Rx9c5YzBdq2UMNlBKkJMNQyJaPojvlI+AoIaf8D99
         2bm/bJxO9ZUFmVXxrMl5UR71Dka+lhEr0EOULPWTj3kpTb/GvjpE88R5VmZA7NcMYmyA
         tr4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXN+0HSVSwZq3Y6g42nwMPEPOz5oXe8xUWrKqrm8lYvoImnLpewvTmvR1Et0LTKXqNiu/7MODQ+ecPS@vger.kernel.org
X-Gm-Message-State: AOJu0YyAR4KS7w2F6G5+wTuYdOwmHpMDPZTVCm/ozEjtTJUpXLgIOLAW
	t+Uly0YT+GVB0OY6LGpVqvzCLRJfkmGVuRizFC44A+V7lr9awum/p03mjnj8Fdn3oLM=
X-Gm-Gg: ATEYQzxmD/F+oAKnM0ZgSLgJriejTpfLmbCyu9omNjM0TVeoprD58tJHi9pt2MqsQ6H
	y2q05h1ke9/ZrNAL19dmtQW3id2v5mHiPSM1gDGpcrFkAGGcTVqdB0kosu7C7Sp5ouUk5R2d3fb
	yk7+OwHohYKqqESaR6fVn2SZg/HpoEnvM0mtGPFONwPzHvL7qJ2whKf93XcRfiHlhq2KnNvZvMi
	4zdloC/8lFtCON2J2OygfAVSQRQeVz9OOStDEnhx5s2DSCmxOYBZfuJe5CGpPQ1MFF8yVcc7d5e
	kP7gyITxuU65LGMXLQyNdRBN7dlCoNDAMV7Sid7UaxuusaH2ElyzBaMsFGIEbBBomsP4Ejv29Ti
	t2ZSfqaWfVAZgzgPmCp5v23Eb+qKGnhYl4POHay8uRlc61luVMnvLALYY8r7xFoPzK2ZEpMbt8d
	+RHhFJY5jlKs0oyi0CifO2zIlsUDBFyqzTPuwingib6TbjvB7O7usqzakh47kklO8F5ds5T6Etc
	Omc1pU2gZMAo6k=
X-Received: by 2002:a05:6000:248a:b0:43b:4921:8744 with SMTP id ffacd0b85a97d-43b64244339mr7400984f8f.22.1774041322360;
        Fri, 20 Mar 2026 14:15:22 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:21 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:16 +0000
Subject: [PATCH 4/5] mailbox: exynos: Add support for Exynos850 mailbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-4-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Exynos850-based platforms support ACPM and has similar workflow
of communicating with ACPM via mailbox, however mailbox controller
registers are located at different offsets and writes/reads could be
different. To distinguish between such different behaviours,
the registers offsets for Exynos850 and the platform-specific data
structs are introduced and configuration is described in such structs
for gs101 and exynos850 based SoCs. Probe routine now selects the
corresponding platform-specific data via device_get_match_data().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 65 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index 5f2d3b81c1db..3727e1ff0fc2 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -31,14 +31,59 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_MCUCTRL		0x0	/* Mailbox Control Register		*/
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTCR0		0x0C	/* Interrupt Clear Register 0		*/
+#define EXYNOS850_MBOX_INTMR0		0x10	/* Interrupt Mask Register 0		*/
+#define EXYNOS850_MBOX_INTSR0		0x14	/* Interrupt Status Register 0		*/
+#define EXYNOS850_MBOX_INTMSR0		0x18	/* Interrupt Mask Status Register 0	*/
+#define EXYNOS850_MBOX_INTGR1		0x1C	/* Interrupt Generation Register 1	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+#define EXYNOS850_MBOX_INTSR1		0x28	/* Interrupt Status Register 1		*/
+#define EXYNOS850_MBOX_INTMSR1		0x2C	/* Interrupt Mask Status Register 1	*/
+#define EXYNOS850_MBOX_VERSION		0x70
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
+
+/**
+ * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
+ * @irq_doorbell_offset:	offset to the IRQ generation register, doorbell
+ *				to APM co-processor.
+ * @irq_doorbell_shift:		shift to apply to the value written to IRQ
+ *				generation register.
+ * @irq_mask_offset:		offset to the IRQ mask register.
+ */
+struct exynos_mbox_driver_data {
+	u16 irq_doorbell_offset;
+	u16 irq_doorbell_shift;
+	u16 irq_mask_offset;
+	u16 irq_mask_value;
+};
+
 /**
  * struct exynos_mbox - driver's private data.
  * @regs:	mailbox registers base address.
  * @mbox:	pointer to the mailbox controller.
+ * @data:	pointer to driver platform-specific data.
  */
 struct exynos_mbox {
 	void __iomem *regs;
 	struct mbox_controller *mbox;
+	const struct exynos_mbox_driver_data *data;
+};
+
+static const struct exynos_mbox_driver_data exynos850_mbox_data = {
+	.irq_doorbell_offset = EXYNOS850_MBOX_INTGR0,
+	.irq_doorbell_shift = 16,
+	.irq_mask_offset = EXYNOS850_MBOX_INTMR1,
+	.irq_mask_value = EXYNOS850_MBOX_INTMR1_MASK,
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.irq_doorbell_offset = EXYNOS_MBOX_INTGR1,
+	.irq_doorbell_shift = 0,
+	.irq_mask_offset = EXYNOS_MBOX_INTMR0,
+	.irq_mask_value = EXYNOS_MBOX_INTMR0_MASK,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -57,7 +102,8 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
+	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
 
 	return 0;
 }
@@ -87,13 +133,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
 }
 
 static const struct of_device_id exynos_mbox_match[] = {
-	{ .compatible = "google,gs101-mbox" },
+	{
+		.compatible = "google,gs101-mbox",
+		.data = &exynos_gs101_mbox_data
+	},
+	{
+		.compatible = "samsung,exynos850-mbox",
+		.data = &exynos850_mbox_data
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, exynos_mbox_match);
 
 static int exynos_mbox_probe(struct platform_device *pdev)
 {
+	const struct exynos_mbox_driver_data *data;
 	struct device *dev = &pdev->dev;
 	struct exynos_mbox *exynos_mbox;
 	struct mbox_controller *mbox;
@@ -123,6 +177,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	exynos_mbox->data = data;
 	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
 	mbox->chans = chans;
 	mbox->dev = dev;
@@ -137,7 +196,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->irq_mask_value, exynos_mbox->regs + data->irq_mask_offset);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0

