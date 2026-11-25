Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616624;
	b=hkaqvxXoUgCJYNvDBWxqxL4yykcDGK4i9ZZ5QfJ+ymA0PhBQuot2/kawdshKZUGEK5bA
	 5Oex/cnCDw6h6yisgwCP97LCBaOZVSfOj06x+g+AptRq/OCYQM9xrBTEzyhWfpOS2L/Xg
	 oQbeJ3q4UDjPjufieHNnxRim+TnEKXw7d2OtnJ4AFdy52M2tgHRnUvzl/T/dG6u6yTysG
	 mhisIHvBbA7RLLI4h/tN1fSxhsU4+l020myzYd4Lv7kxjK9zZyJj04PGsSw2Kw+un/Q8i
	 BsYnfmt7g1VLd/neyg+jJLdQ+jBeITio7VBXewLC6pFV0bR1nxKaoDfHosag7VAoFAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
	b=tz/eF1wbZ9nSqPpO4YSl4bjuehz7E2Vs2oX9a9hzKmuLozhKgbv/09UNYCpCXfSMg43y
	 wr0rKOy6ytJGBVWa74IY5+S1EsfT25EpEfw3cE0ME6u/7iGFCa7uyxhHYoI5BHbxeBSJO
	 z7M3cwE5q5fro6lDarwxYyKtaQZVhAbIi7yOofjJLx0UtPkrtKn2X0FabIxuGu4jON0Fo
	 S4vCi/VheTYN+8JfYPIOlhD+ZjeOD7j/eHcbWbk3h7HGkoq8LyhejqO5HxBGDnMOvQxGx
	 rWytqjRLbmWOu/4efiruJKxRNyqR7om5X+nsOlIxh7E58ylMTUkr+4k6ZNFW0V6dU8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zSRPf0Ga;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4561606A32D
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4561606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zSRPf0Ga
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e47347279so3530621f8f.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616622; x=1796221422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
        b=zSRPf0GaSxYn6WB59LekBw8DtzCIiRITMNpj6fxnvi7Mcvl1SVAq2IfQBui3mZrVIZ
         UAzDUFArtgCznflzWqJDcZtEwsZcjh1boX/y++Sty31fL7KE6OrkAfkPrmHVpeErcZzS
         lToPf6l2QHRbYp+aNC7BGrHeK/uIvm1Cg4z1ShCVz3fGx41HwrOO8/Am10NMjKifqCPA
         HAlOXBEr2q8Uv7BL0T/9EyDqgWlTngO8yiOTvldiQ8NeXQMWiPJxxFUHPomHkqrK0OAN
         GwJYyIR8Oe/Usx3KacEOpadWbof3LBP3+MfXfhMZI7ICcFd/ehtN/GWGaJhS3lynteKc
         jdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616622; x=1796221422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcsPi3qvnIrsdxjh28gNxRodworsSCcyn+GNHNwrRhE=;
        b=HcKYDBEKXOAnhjKUeyszSMSL9J012S4KxzpiWgbL1gO+QEmWZ45A6aSqjCm4fSramp
         OsBhSRCvrPhXWWq9hRwHZqYIx5h/zBy7gMeahYNuZ8KCz8TzvnGVBkVZKPXw9LNayhBI
         7pYXi/IiyCDFAATbK4QdHcqKtzWYMkXZhtk6Hs9CYHhX8dpXV2BC+G6zypuM6CcUYQvt
         brQq8xoFRRP0N+gC+NVxjOwHRk3+AL0DT4kWzTOfVK/x9D1KuZj1H1Z0/TdCWhAaF6hz
         YLLrz7dAlPeXfkwe3rPGWhImlSJQpu5MVq75sjzOFm5r9L2nsVjYasd4Sp5QsgUcl+Db
         HfwA==
X-Forwarded-Encrypted: i=1; AL+hErHmu8A48KNMDuj8isnSk3+G4ULaHyr/BhlBBI7Wj0uunuvxUNXPvb0dzTkAPt3CEj67Ka7Oi01reZhX@vger.kernel.org
X-Gm-Message-State: APuU4Z/LNX0R//hj+HUF+cIAeZvauk5byoA9FPiVnLusGxCLjUQo221r
	u9bwT+PwtN5+95Rb/vEH8odkrBL6G2XOPSBw8y31eXt80htc1Z9lN39msZpiutO3bls=
X-Gm-Gg: AZFdTZewn+KEt9WXa9ozA2n+GvON+rcgGFF0127eeQINlGAtSkqMkjomAPAOe/k7Sk/
	PSOOITYQ7M++NeCQ0UWZ/bABqbsK+DAFdje7JNVk8snaWAOkt4rjJAHtsebm/NQ0ATeNZYz5Xje
	jGZgvDVV1xGgqvn7t/rFhtWgndzKbXHORewDxJmoiNx4Y84MfRNveCD1MQVnD6RL9J03z3wjWUY
	elGFaGoOJt94vxNyUsLa4XDlpPHFHfREyH2FOZ2sLc1AsFh9vpmtoYz5WAFVfM+C2C+AfkKBHOm
	OPaR7/w3/F4xR/Ews/j51kInSLu2ndDrX0R15bQws9/M1jDBogVSqDkM8iAghf0X4dFi4gRMn1z
	D1d0RfWz13DXbfS+v5/WzVcyyqCmzUmyk6hosKy/Rekc1Lkc7w107OPE4+ciSAJAAwOEp6fJWaa
	RLTyusvKtqFL7ocw+emdN7hsgiNQ1xGbmd0KM/SKnrwu0R2SWFKT5bbuXganQtvAYwqfdCZQQa+
	jZ60OnRuBwmFKwA+9MpPr5GCZc2U9Hl97QyZj24H3lOgoDkZlHw7iB+/WeGtrFuzKyMNTVxLQjd
	7PT3keF0l6epdjj63c+YlfDD8So7N7GybPA06bVVzQLyDjCjzS2ws7RSk7qfBX4k04LWO9HTyVJ
	F88tOEYFlip03QaQd13Qi6w==
X-Received: by 2002:a5d:428b:0:b0:49d:78ad:a2ec with SMTP id ffacd0b85a97d-4abb47b1ba6mr27250862f8f.25.1795616622030;
        Wed, 25 Nov 2026 06:23:42 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:5e34:8000:720:5dc9:500c:65bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm33638667f8f.47.2026.11.25.06.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:23:41 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 25 Nov 2026 14:23:34 +0000
Subject: [PATCH v2 2/5] iio: adc: exynos_adc: add ->read_value() callback
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-exynos850_adc-v2-2-26de1c6f1717@linaro.org>
References: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
In-Reply-To: <20261125-exynos850_adc-v2-0-26de1c6f1717@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 Sam Protsenko <joe.skb7@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.3

The ADC data register offset differs between SoCs. In preparation for
adding Exynos850 support, abstract reading the conversion result into a
->read_value() callback in struct exynos_adc_data.

Add exynos_adc_v1_read_value() for the existing SoCs and use it from the
interrupt handler. No functional change intended.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/iio/adc/exynos_adc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
index c1a0061b16ca..a1124a418f29 100644
--- a/drivers/iio/adc/exynos_adc.c
+++ b/drivers/iio/adc/exynos_adc.c
@@ -133,6 +133,7 @@ struct exynos_adc_data {
 	void (*exit_hw)(struct exynos_adc *info);
 	void (*clear_irq)(struct exynos_adc *info);
 	void (*start_conv)(struct exynos_adc *info, unsigned long addr);
+	u32 (*read_value)(struct exynos_adc *info);
 };
 
 static void exynos_adc_unprepare_clk(struct exynos_adc *info)
@@ -195,6 +196,11 @@ static int exynos_adc_enable_clk(struct exynos_adc *info)
 	return 0;
 }
 
+static u32 exynos_adc_v1_read_value(struct exynos_adc *info)
+{
+	return readl(ADC_V1_DATX(info->regs)) & info->data->mask;
+}
+
 static void exynos_adc_v1_init_hw(struct exynos_adc *info)
 {
 	u32 con1;
@@ -252,6 +258,7 @@ static const struct exynos_adc_data exynos4212_adc_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_v1_data = {
@@ -264,6 +271,7 @@ static const struct exynos_adc_data exynos_adc_v1_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos_adc_s5pv210_data = {
@@ -274,6 +282,7 @@ static const struct exynos_adc_data exynos_adc_s5pv210_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_v1_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_s3c64xx_start_conv(struct exynos_adc *info,
@@ -295,6 +304,7 @@ static struct exynos_adc_data const exynos_adc_s3c64xx_data = {
 	.exit_hw	= exynos_adc_v1_exit_hw,
 	.clear_irq	= exynos_adc_v1_clear_irq,
 	.start_conv	= exynos_adc_s3c64xx_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_v2_init_hw(struct exynos_adc *info)
@@ -356,6 +366,7 @@ static const struct exynos_adc_data exynos_adc_v2_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct exynos_adc_data exynos3250_adc_data = {
@@ -369,6 +380,7 @@ static const struct exynos_adc_data exynos3250_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static void exynos_adc_exynos7_init_hw(struct exynos_adc *info)
@@ -395,6 +407,7 @@ static const struct exynos_adc_data exynos7_adc_data = {
 	.exit_hw	= exynos_adc_v2_exit_hw,
 	.clear_irq	= exynos_adc_v2_clear_irq,
 	.start_conv	= exynos_adc_v2_start_conv,
+	.read_value	= exynos_adc_v1_read_value,
 };
 
 static const struct of_device_id exynos_adc_match[] = {
@@ -484,10 +497,9 @@ static int exynos_read_raw(struct iio_dev *indio_dev,
 static irqreturn_t exynos_adc_isr(int irq, void *dev_id)
 {
 	struct exynos_adc *info = dev_id;
-	u32 mask = info->data->mask;
 
 	/* Read value */
-	info->value = readl(ADC_V1_DATX(info->regs)) & mask;
+	info->value = info->data->read_value(info);
 
 	/* clear irq */
 	if (info->data->clear_irq)

-- 
2.53.0

