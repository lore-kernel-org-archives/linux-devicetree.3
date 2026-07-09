Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06569333440
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608344; cv=none; b=WPkWYwqcEO8ThfA36Fn7l8kyWEo0Qs+BgPfLY7T0HnqvhuZNrW8H9BlUhHQoF69ZA2beQ8O89FFdKUWM6NccJBzZ/XHe8FSf0cMiRZReUC6ctUOVZ50a2K0H0KIEtP8gFD7WTqYMFioEQ7kI8KWXaa5YO4R7s1w1gvwaJ3Jlnr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608344; c=relaxed/simple;
	bh=HIml+MyqhrM0fvI5KdhsRuEYP/j52YdwE4GExRT8dog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SF66nHkFEQbf/8C8lkdQhL0MKoVqgACVYl+yHO7DolH4YfchbadCaFAYe6HAWMQe1UTajnVtUgR5dV1wn2ED3LzWcefwL74orZbrdSvjdGxjZiGb12rUURIlRKZKtjnmmRNnAlNW9bBE3o7oU3Fb19LyHsmkngNxxXhvrZFhhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7DyX/Y8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7DyX/Y8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-471eeac43bfso1845118f8f.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783608341; x=1784213141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbhm2y91wOEPq0FWBEAzboduk4MNUncXQAPdVuYnt3s=;
        b=a7DyX/Y8MYnMukvYBDXe7+ZAL394ppcPxlVcJV+TQXAa2Pq5NtFeVWeLqF+Qa/j2LP
         MXjawVr69dRYpFLUems9t5hH3aZt2/3p2KeHPrFYXDM6kWqINSa46v854DeLPES6FGmh
         xEdkctrOcJt/48YL9vKan3L51q6fNIz5Ze8CoioWRB0CgtN/660V3mEe9EP4jlLbU7zW
         cUZgrW9aBO0+lT8DkV10MwDdaD60CBcVLDGNkAVfECJ9+3INlV7NgpAOAa8f9PNdTcLC
         ppHL36IUK6tWxn8pFXO66Ko+Wev9GF1wHpmNhPJi6+1XNyh2SKbGqV8ESa8JKzSYRhD6
         SjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608341; x=1784213141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbhm2y91wOEPq0FWBEAzboduk4MNUncXQAPdVuYnt3s=;
        b=XU9EvTITbJxlTZet6FVVISpw3uaR32T4urWOb9pU/cR03kGzct9bBAlqGQZsPTP0t9
         F6jQ1Bhd2po7kg3Htay6aPxzMocTYFmuEKAr3j2c1tZ/JKh6OJPREv4lXK1LLHZ1mosC
         m2nroRVcpQgUxRO1RwE5+fKYMVdcQ2dHLmjZcnfr0u7n2O0QjLmR/A0Ior+U5ugztl7N
         8K6xekEvCNjYENwNtj5If1ysqCKNuiTSWA0w4ayQ/PpMfysr6IiZf4fHjKFvdU6Pg8rh
         93pwJUYyky41+9jgu+IC0E57hWi+SnoOYeAyBI+soyZ+JUdOgx7OLJUSrWN5M8aIaqpC
         WQRw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/4vfQ5nLVelplE0IR3QWBz7GsSIhENJc3sqgemC6dDcRhFr13dCm1u1kAjOKtJBdZ8DfYRM5mBfbG@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHmV/61zke+hVyPzWmXj0jVsmiToD9Qo9qCNKJrOUmE8924gk
	F3VJ0AFZXJs4kyYtqulAFmmuIdgeKarUAa7KNHyDLUdwOKNLhSQpL54W6vrSQu59Yn4=
X-Gm-Gg: AfdE7cl3s/USuoRbFUG9DU49nTi7Lb8Z9BcFteHJEBo+hJaLh7X1ErQSJNhFW9/+AJu
	yY/oeZ3oU/Bc4bymjTAmVtVm8W/vQj/UauUvFS1Qdu6Ev2PplIGMME3mIln3QJdf57J2nlClBzr
	D6LNcLE4kQAuAmHD94iAaIjaaum3Zwpjv3cwscIvZrHPNOzcKwvvzTT5s0PatFdvO2ZGDfkzVb2
	bpC2KeolO/IRzPR3t/DtpFwZPcY+k+E4om964gQoG798XuAw7TMcZkC2pNmk1av92sdrFaQDIOp
	GDxKjQzCkiMvptN3Z1zXG06RNYqbHeUanBsj9QVCFr1htFrXAr8GrTlx2spWcF9s7y8hkLJAZvt
	5H1wB1sgyk6etC7JhklyuCqjJb6Nlr6teBhEt662Yw8Yc2rKa/hd0dWXI3w2JbKQ5V9I+ooOeFP
	imljse9vgqiJOtjTHEtw3mejxfdnebv5eRFATxWje3femhxPXjb+PGio9w/CkNHekCOLDMpPGZ0
	LcU
X-Received: by 2002:a05:6000:41f7:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47df079051fmr8084209f8f.39.1783608341484;
        Thu, 09 Jul 2026 07:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([2.122.8.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm50995732f8f.28.2026.07.09.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:45:40 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 09 Jul 2026 15:45:37 +0100
Subject: [PATCH v4 2/2] mailbox: exynos: Add support for Exynos850 mailbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-exynos850-ap2apm-mailbox-v4-2-caf2fe9a237d@linaro.org>
References: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
In-Reply-To: <20260709-exynos850-ap2apm-mailbox-v4-0-caf2fe9a237d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3

Exynos850-based platforms support ACPM and has similar workflow
of communicating with ACPM via mailbox, however mailbox controller
registers are located at different offsets and writes/reads could be
different. To distinguish between such different behaviours,
the registers offsets for Exynos850 and the platform-specific data
structs are introduced and configuration is described in such structs
for gs101 and exynos850 based SoCs. Probe routine now selects the
corresponding platform-specific data via device_get_match_data().

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/mailbox/exynos-mailbox.c | 72 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 6 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index fa02f18948cf..ff75c1c7633c 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -24,14 +24,60 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
+#define EXYNOS850_MBOX_INTGR0_MASK	GENMASK(31, 16)
+
+#define EXYNOS850_MBOX_CHAN_COUNT	HWEIGHT32(EXYNOS850_MBOX_INTGR0_MASK)
+
+/**
+ * struct exynos_mbox_driver_data - platform-specific mailbox configuration.
+ * @intgr:		offset to the IRQ generation register, doorbell
+ *			to APM co-processor.
+ * @intgr_shift:	shift to apply to the value written to IRQ generation
+ *			register.
+ * @intmr:		offset to the IRQ mask register.
+ * @intmr_mask:		value to write to the mask register to mask out all
+ *			interrupts.
+ * @num_chans:		number of channels the mailbox can support (hardware
+ *			capability).
+ */
+struct exynos_mbox_driver_data {
+	u32 intgr;
+	u32 intgr_shift;
+	u32 intmr;
+	u32 intmr_mask;
+	int num_chans;
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
+	.intgr = EXYNOS850_MBOX_INTGR0,
+	.intgr_shift = 16,
+	.intmr = EXYNOS850_MBOX_INTMR1,
+	.intmr_mask = EXYNOS850_MBOX_INTMR1_MASK,
+	.num_chans = EXYNOS850_MBOX_CHAN_COUNT,
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.intgr = EXYNOS_MBOX_INTGR1,
+	.intgr_shift = 0,
+	.intmr = EXYNOS_MBOX_INTMR0,
+	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
+	.num_chans = EXYNOS_MBOX_CHAN_COUNT,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -50,7 +96,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	/* Ring the doorbell */
+	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+	       exynos_mbox->regs + exynos_mbox->data->intgr);
 
 	return 0;
 }
@@ -80,19 +128,31 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
 	struct mbox_chan *chans;
 	struct clk *pclk;
 
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
 	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
 	if (!exynos_mbox)
 		return -ENOMEM;
@@ -101,8 +161,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
-			     GFP_KERNEL);
+	chans = devm_kcalloc(dev, data->num_chans, sizeof(*chans), GFP_KERNEL);
 	if (!chans)
 		return -ENOMEM;
 
@@ -115,7 +174,8 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(pclk),
 				     "Failed to enable clock.\n");
 
-	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
+	exynos_mbox->data = data;
+	mbox->num_chans = data->num_chans;
 	mbox->chans = chans;
 	mbox->dev = dev;
 	mbox->ops = &exynos_mbox_chan_ops;
@@ -126,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0

