Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A942CAE8
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330364; cv=none; b=ngNWHwlRg1rio2JrdKOfE2FuDU0drD6EryNnwHBbebJcZZIK3JQjocE8gBU8IHfjij5s8KU3+AWFOYncHVM2Rlmsuew/F1SQhyLaBliEUKanQTrzuZ0dBw8BPB+aoeC83zGKztngQwtueFLtKfo8feac1F7Evtgqn3z9HrxXpDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330364; c=relaxed/simple;
	bh=gRy0cN4LadJrCLwhwvNgyXM95hAtl0BkbsLdjuQgW6A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUHOZ6OTs47F4rUOV9ApKywkaau3llAjWNqbHmwAfdGt5Sh0tAtoLrhQ7jJVxf8q1HdNQU4VzfqLf50cV/Dqrg4MggEerg33WE2hl6bW1SowUilJ2ASoKqoqJC5p2xPb+PXtLtjfxCyxLin9odXLjQxf3GldjJtFw+hlIqlaugM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AFvRO7xA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AFvRO7xA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso11313285e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330357; x=1783935157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=AFvRO7xAjGEzkpt6ryXRWzKzc+epUD3KhyJ7lVkwpdXW93uBaS6n5Wc2Su+u/10XJB
         9mgJ9QQq22neqpri/QlTXtfm3kP5QsrwYEfXJuLQTvllv+zJ/8XeMqR77dZ0atfYGN4c
         Pf/zQlsItqN80N2e2RwWSYkJflp17h+jMvaVVr1g61rA1yIkuTBLTVl+8NCPylDcXx+g
         ugavKRkkbg2kPpbFd4wZSALp3X4L17vGmUSckpkGIHGJ4jOFzlt4TBZQfwNgNdC7tFYA
         n3Z8YxX1IX9Nr5boCbkdSBseP2JXVc5QH6tGewsFoJKmt7S2zD+exh/HoM/9aCMcnNYF
         Vdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330357; x=1783935157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpZvamYw9AnVrZnk1GFQEFXSHxgLU3wS0Rp+AMjlVD0=;
        b=Z9kqsEGqQrESq9p8bDXPsSvmtcJeeIFCO5/eSGRLnY85D6KqmKXmDskl1pGrIIFYUN
         Q3EMjQRYIFTzRsH5evpZSJdIeZU6UcJucu46ZH3nljoK6A3Mn68GTJqDrjxjftt0itGl
         pK5RPCGk/aZB+7nzTxP+10SMfgP8sEvqeWJiET5FhE5SemvAXnrhd6lcIoq3+1e3823o
         HFvTY+3lDOsxqFvNewIlHZ3dL3vHo0Ua5XOk/YWxKc4rv0Xv6mkABNpXZxXPmkYxbj/u
         dK/Yoai2+tbp85B6oAFioirjK6L5IpnHsNCTeh4VwESsqMhL1HTI48oMgLUAyMe5wqum
         19XQ==
X-Forwarded-Encrypted: i=1; AHgh+RoluDkizQleXpTJXK6ka3+gSK48JC8+lQAOMg+SUtVZhEf7l8JlygJKjbQnITqUM2jF02REM11eRArU@vger.kernel.org
X-Gm-Message-State: AOJu0YymLSvV1/CqUMr8OxI81i/y0i2smO3sOg4ZtXfTjHrzE+W0iZEa
	7LokFJDs+H63kbNlOAobUUlYYGjw5mWrUZS2kyT07dYgrxmXgPeTfVUiXeNpbr3oPhM=
X-Gm-Gg: AfdE7ckSXuuB6mw1o7P8DGNIGfrDKtZRDFvHs+bqrGSiwMv7kegA/C4a4SSWSq6jMPV
	AxYo68XxuYhkoZYgtO3FTztVTwK66+A7EqyN49qmOpEUs57Fd9yIo8onFQyAXeJ6n2nxlrK8PfQ
	YpuHfusVoSuZF1hn/geQCqHHbN2xvKrpEmHguBf9Usl0AOzLSfPU9umn8DMn3QsVW28gNvoNmX1
	ZSmvKOTXNidY1ZhLWsccwJvCiiqhuSdrXlDba/uTH42Fvnc+WRdLCKjRbmAj+tVjJ1nrmo0LIeJ
	2/luBpRM8K+zSfMY4KKVXQYcGwUkBC5cjkjpG8/3o2TWHDSu8tf9cQgvuvNOHTq/uAONNZWKdUS
	yWhU539JRYxuf2yTM8zU/1rproilimFknlStXOGLYRSctbjLTlIS6IdSYmrB/Dw3R1uJ82pf8Tq
	qv1AWdUk1GXXc=
X-Received: by 2002:a05:600c:c118:b0:492:3e66:6c84 with SMTP id 5b1f17b1804b1-493d11f918cmr92947785e9.30.1783330356762;
        Mon, 06 Jul 2026 02:32:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef11338sm377772315e9.1.2026.07.06.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:13 +0200
Subject: [PATCH v4 5/9] clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC
 calibration
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-5-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3560; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LjKLqtELI/k5Bm86qG39EiNLmLLQg2pvRCFKcypyAtM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Ykm1EkaDJ069gqM3tqzZUAo6EzOomoBvrrG
 TY60PbIiaqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2JAAKCRDm/A8cN/La
 hY6PEACcL49Jv+12kjoAQsDpUPA5V1xw9VbQsEtOPVlm9vqqWLHZwoaPT4wAlORrO3AdWbLsP99
 3Va3GrObwSKZUgSScUTpAR9hNRd4uB9ay8wsEnI5doSKc0OxjECZvx5YIFWne9fn5wvJSY4dABo
 Nd1qkF+KcOd+L3w+z1WMzohuFIjRPeYo03b4QghplwZxrZrOO3erSNWE/6WdDYAVfiqCz8ozF7T
 sOBaTPh2Ya9YSPxG8OvqNnj8m1N/ozmgUCXMacKz6ZkiZUSWhwNSKytFZLrzlQHAV6d68XpK3Bd
 ztEjka3alClmehE5im7V14RfDcdAlcVDAIrxt2BCWmSHynOdEeykUKnkDaLBjC0VB3J9S0mK/Ea
 rfPUwIey53EGCzJWVafrOw20jOAmZYKXKC9jrmjmGIrrPI3kuQ9cb3jK+OlPdg2Dty7QiTX0Vnv
 smnFnurV6vL6UW4exhKbzae8TERopeRgMXTYpc1OYQuFqA7ayOUzRGbgj7eo/IIxrdfk1Am/LDz
 x9P69Vo0/ZnQUBQfQJD9pJPD30bDdiqSBFh4IGlArPzp/azMB7F7CxxS3rXjTlYfNTQAOOxYVQ4
 VUMsLMUDKkFUmjJH3j5UYg9xA0MhEEwbjcDiIPXoe9Lohy72G0WpUdGGtMMf45iETg/TYiK8S3/
 FwG9c4GpEzDcYfw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Junhui Liu <junhui.liu@pigmoral.tech>

The sun6i-rtc CCU driver currently uses a global static variable to
denote whether calibration is supported, which makes IOSC operations
tightly coupled to this file.

Convert this into a feature bit to decouple the logic. This allows the
IOSC clock code to be moved into a shared module for reuse by other SoCs.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 17 +++++++++--------
 drivers/clk/sunxi-ng/ccu_common.h    |  1 +
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0f528bfaed00..b24c8b196e66 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -52,8 +52,6 @@ struct sun6i_rtc_match_data {
 	u8				osc32k_fanout_nparents;
 };
 
-static bool have_iosc_calibration;
-
 static int ccu_iosc_enable(struct clk_hw *hw)
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
@@ -80,7 +78,7 @@ static unsigned long ccu_iosc_recalc_rate(struct clk_hw *hw,
 {
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		u32 reg = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/*
@@ -119,7 +117,7 @@ static int ccu_iosc_32k_prepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return 0;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -134,7 +132,7 @@ static void ccu_iosc_32k_unprepare(struct clk_hw *hw)
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (!have_iosc_calibration)
+	if (!(cm->features & CCU_FEATURE_IOSC_CALIBRATION))
 		return;
 
 	val = readl(cm->base + IOSC_CLK_CALI_REG);
@@ -148,7 +146,7 @@ static unsigned long ccu_iosc_32k_recalc_rate(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -167,7 +165,7 @@ static unsigned long ccu_iosc_32k_recalc_accuracy(struct clk_hw *hw,
 	struct ccu_common *cm = hw_to_ccu_common(hw);
 	u32 val;
 
-	if (have_iosc_calibration) {
+	if (cm->features & CCU_FEATURE_IOSC_CALIBRATION) {
 		val = readl(cm->base + IOSC_CLK_CALI_REG);
 
 		/* Assume the calibrated 32k clock is accurate. */
@@ -358,7 +356,10 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 		return 0;
 
 	data = match->data;
-	have_iosc_calibration = data->have_iosc_calibration;
+	if (data->have_iosc_calibration) {
+		iosc_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+		iosc_32k_clk.features |= CCU_FEATURE_IOSC_CALIBRATION;
+	}
 
 	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index bbec283b9d99..d9dc24ad5503 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -21,6 +21,7 @@
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
 #define CCU_FEATURE_UPDATE_BIT		BIT(11)
+#define CCU_FEATURE_IOSC_CALIBRATION	BIT(12)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)

-- 
2.47.3

