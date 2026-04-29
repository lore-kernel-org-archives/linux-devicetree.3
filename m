Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E19423162
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777489235; cv=none; b=bgAXhsoLIngegW1rb612MhmgUJjDeF4TqDi1ELXdg2KF/AS1IBVgxJaVYf21gWhRLp2hUzd473NuvCGL1CHANlba53dzBW8B5SPIsaO+l74nNCHGnFBo2D8SLF8gohO9xi8JnY9nWeHn93P7EPMIY30Kk1Fe0LoLAH3v5huQZeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777489235; c=relaxed/simple;
	bh=2wrIkCg2F0ORc8+hMPtq5Mv5GcVpiU80g1pcRdLD/fE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZKAlcXvT2ayeHZglALqrBZ0fh8eOSX5nUxf86ZdrzfyVbiHLFZFCEyq/w6MAQ5xUIytUSst0MayyfTVxezypJVjNslOWBeznmQnyermK0hxoE3v05SFmth/bBhS52/0MYT5LsZ0tyiRG7XMhr7yIX9sJv4iE7KiLJSEG24rf40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xrkp8dJx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xrkp8dJx"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488d2079582so753715e9.2
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 12:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777489232; x=1778094032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qBYA5nKt8YmzIPAJc6uOBQ1k/4UmKz7MxOXdNyaxiqk=;
        b=Xrkp8dJxjf3OIyIE4gAktt2vidMxt9afGtxdvsh8l8UDjH1rwJ/LmVle2LmltkP/ow
         GSHbOd07Sqs5v4a/QV5UEK0qvzw4IyU4y+zLZz/3vTu+9JFLQDlI4iuJjtwrT7RbInVB
         bQitzJHLeeO45nelM7z/KVDx+0gxNYTGUGatlWicpgZuIgFbsXLuaYBMifTZZ3zfsi1u
         laU4L8tjjrnRGdIXlqzVj7JkUhtFJEiZEEq72yKPkr/bIx0ABMWwTqAz60PX77WSGxL3
         oEvjs9QFfKCw8RJPkUmHmoGhHFGPZy9gUB8OV+jBaCngTKii9eBsGZD2ebvUyGLrT0IR
         A6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777489232; x=1778094032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qBYA5nKt8YmzIPAJc6uOBQ1k/4UmKz7MxOXdNyaxiqk=;
        b=m9yE7RXb+BRqTkdszuwyJSiFgwnNT9Z2YLAtFwJfx7k9jQ8+b4kO3oOL2pBptDhJPG
         BvIv5GqP1bA76I8y4lx2Zg/gMACXVzPglQvc0i5qldQIcsnkXeU33stUEzss2osRIQGN
         Owi9wxyexqc55LvMGi1DIqZfWX3GKcldlRe6XvY6zn96oRW5UIXcA0HfiEYrSZXQI7Z2
         CZt2H7oj10jRuQj9vKvI2HOUKkPCMSMJUPCLORIY5zlN8mksVjHzVye3h682jPmrKVGD
         9gF/jL619lyN9T2cqnL6KxatNEKwaI90tmtNt1s84v0Op8ZHwYGcCRP2Y/kGHS5iRabJ
         xJEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8oAKLdVRX2cpPoSho8aNdeVDhaJx2koU0uxecwra4HYFnIEFhCpywgla2itcqYjupmlhov6eRkqL38@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUeMwlzOiklGG2T5OK9zRtNIOUnUHk/DkiVSrvrAFQqaqBn13
	6TPlwVjb6oBVZus1+7T7zm/wISChx6HWeEFcGPW5oKYNqMjyVJZbcmFdg8xm1+XBeh8=
X-Gm-Gg: AeBDievkFfRJzdD68GrkMMVRD8aF+Ce56rHau/bwI+8nJlRuhNjgPycRBt++kmc2yMs
	ou+TmHc3GGJjTBKsJ2pQOAZ+B1iJYUt3T0TUAaa4rnPANkxwgIEy/l64O/tFY0ITrQE+VDTCrhX
	m6vQ4lGcI7HpvXwmfo84tE/gh9Q+YsV4cgDVDveJ6+BN/hZouMchqnW8MYO0JPYWhe4t6owWB4p
	t2TObF455jVhicp0V2ouQrItLc0dgIBU1pp5NdZNVnVu+x5Z5ICBILni7/bQdroElq+mwNTGA7C
	nBv26+vwfolRDLCZdQhjJ3xr7XXFK8VEOxjgnblFzluIu1BENmDlRG7aLxvAjdC9W21pjxDSclO
	kaQ43yg9362+chFTDjjZmY2ftQwzueUrdZwYNOJnLPJ9XYpKcmkeDyUuuSdAFKQ+B+GfwXR+EIv
	GfguLlrfZZ5rsV2Y5qH0mvaGReodESuBh3/FHdiHnlSiSzeVLqEsTFtM72oBBnYQbLhCsQVeycc
	RLN8GW2S9vE95cobOPQ4uz4BbA=
X-Received: by 2002:a05:600c:a409:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48a7b531980mr72931285e9.15.1777489231411;
        Wed, 29 Apr 2026 12:00:31 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900b40sm26187785e9.2.2026.04.29.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:00:30 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 29 Apr 2026 20:00:25 +0100
Subject: [PATCH v3 2/2] mailbox: exynos: Add support for Exynos850 mailbox
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-exynos850-ap2apm-mailbox-v3-2-8e2719608c46@linaro.org>
References: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
In-Reply-To: <20260429-exynos850-ap2apm-mailbox-v3-0-8e2719608c46@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
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
 drivers/mailbox/exynos-mailbox.c | 59 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/exynos-mailbox.c b/drivers/mailbox/exynos-mailbox.c
index d2355b128ba4..11657dd475c0 100644
--- a/drivers/mailbox/exynos-mailbox.c
+++ b/drivers/mailbox/exynos-mailbox.c
@@ -31,14 +31,52 @@
 
 #define EXYNOS_MBOX_CHAN_COUNT		HWEIGHT32(EXYNOS_MBOX_INTGR1_MASK)
 
+#define EXYNOS850_MBOX_INTGR0		0x8	/* Interrupt Generation Register 0	*/
+#define EXYNOS850_MBOX_INTMR1		0x24	/* Interrupt Mask Register 1		*/
+
+#define EXYNOS850_MBOX_INTMR1_MASK	GENMASK(15, 0)
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
+ */
+struct exynos_mbox_driver_data {
+	u16 intgr;
+	u16 intgr_shift;
+	u16 intmr;
+	u16 intmr_mask;
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
+};
+
+static const struct exynos_mbox_driver_data exynos_gs101_mbox_data = {
+	.intgr = EXYNOS_MBOX_INTGR1,
+	.intgr_shift = 0,
+	.intmr = EXYNOS_MBOX_INTMR0,
+	.intmr_mask = EXYNOS_MBOX_INTMR0_MASK,
 };
 
 static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
@@ -57,7 +95,9 @@ static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EINVAL;
 	}
 
-	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
+	/* Ring the doorbell */
+	writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+	       exynos_mbox->regs + exynos_mbox->data->intgr);
 
 	return 0;
 }
@@ -87,13 +127,21 @@ static struct mbox_chan *exynos_mbox_of_xlate(struct mbox_controller *mbox,
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
@@ -122,6 +170,11 @@ static int exynos_mbox_probe(struct platform_device *pdev)
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
@@ -133,7 +186,7 @@ static int exynos_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, exynos_mbox);
 
 	/* Mask out all interrupts. We support just polling channels for now. */
-	writel(EXYNOS_MBOX_INTMR0_MASK, exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
+	writel(data->intmr_mask, exynos_mbox->regs + data->intmr);
 
 	return devm_mbox_controller_register(dev, mbox);
 }

-- 
2.51.0

