Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792825221;
	b=bBv7Z1PMn1tSL1d4nlNDGTBSvDIx7DTaUmhjsteNaw4+Ne4g9vhLd3x9D2R9aL2iHZ5l
	 dpU2pebv+S7DmTVoMzMwk0YZ/nMbmmPGNC2+1XnuJTp6Qa3DUJc6yBIfaPVSNIGpTfyT5
	 AYhJIbopWea/Net7uPAjczLM769OfjybyR6iCbjx8GGZ7N5dvATrDKSxWs1jZr6DpLtQt
	 /jYD+1gbE+zUf+1NCyTrISP2tLDy7v7sf7vm0S3gqAlaR3jl6bpXwBBCA8UZZM0VkrW8t
	 v2ZeOVWC2+nShISjTRTTBWKj60HgbmK5Hq7BTis9AzW9asJ/ePZkvGWkLZxK1li6y7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792825221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Y6MPlItNnv+GsY20I3sstkpXLDue914ZTPjNUcDG96g=;
	b=hxPwE6CTPAaLMYCvIeJJtP5Pmn3XEv4MDr7z4uwrFlCSIuSbmmqGH6jZh1lGfGkCE549
	 kMoIYLOZPUtOBrg7Mbgx1JEkMYSLjsuueI0+9NWSl/BWqgyBR5BDX45e+p9pqNXVCtZ6z
	 u6Y5Rw4uDHE7x1CoPBMSRBRUCt6i2HvndPfTco2VeVtsEWqV7KGeGDe6cXZ0+/emxQghk
	 LF6gLPFhMRLbi5wOv78oFuLi+VkaA6cdaDbgc/7b9eIfjLb2tzPRSCojaUFuu/2U7tbEk
	 +flgLQlMfRlVc/PoILBH6MeO8kw3+qgJJX2YIrnViOvzd3V7HfZLeTaB40atJ9H206Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UYn1LBbD;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0085C606A322
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 07:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0085C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UYn1LBbD
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so887119f8f.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 00:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792825209; x=1793430009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y6MPlItNnv+GsY20I3sstkpXLDue914ZTPjNUcDG96g=;
        b=UYn1LBbD088fngO6Ea5WxjmUHVrrWb6podP0F3wiQvM0gVTs5C42y7l+i9kh6QpE9k
         /6WBRyKDvXQlY3n4SKrYRVJ+pRqc6Bl0PdS8Jsk4QAU93686VXi7iEfITXHWb3zoEUAp
         ffWyEkT9StzVDCMcGlBUQkv9QbPpYc8HQ+9SYO0UNTkec2wBNqRk8cl+ccUONziuYIYX
         P4RNH7IX+S8Eq5yDP450hPZtzCwBzIPxEIqDC2l/peyBPk7kL5dc8ghmfruKe47puiRE
         e04ghXYmkrCDjWeoVpKvxdUIGkUT5t97QMJg5jcVsnG7tcvK0gPgxd9V63dqrtH4BULX
         yINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792825209; x=1793430009;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6MPlItNnv+GsY20I3sstkpXLDue914ZTPjNUcDG96g=;
        b=eeCKDWhz4NTiL7pZZyZpSr1LFKd5am1W+KTr/zDLuCpgYUgFGiDXBe5sRI/cVlpBJH
         Q6RZM/AlPthxKMC8hWJ1tGjil5qBGu11hBICEP13n+j66fHfi/tsOtmdse9ylfyOB13s
         ejwgi3c+SJHfGnzUs3GEoKjfhzl2/BrbQ1GXEhVFTKeLpMytCeXODm9tCqhrJI67BDoI
         KaEz5RSEaQ38bPCcqehuzxmXKPK+IlxsRUxmjBU6wtfDxjmqTOs+nyuz6OjnzIdqpadt
         KLsu3qeTeTnA0yV/77KVVyC5HqRdLrApf4rl9JXdnyVxoZVge4JtyLsi0tgj8wEqH5ze
         AZWg==
X-Forwarded-Encrypted: i=1; AKwUvBwa6XGW7+NYAiSO2rWEW7waiTLAesDskh65Lwhd4QeabSSTk89/JBjXyp7N+VQR/6tWWWVt1mJrymdh@vger.kernel.org
X-Gm-Message-State: AFq9FYLFUcHQj6e/Z1J9wG4bqVAY/Kg4AcXNgWaYPN0V1Tb7jlblveV7
	XnDL3vzMj9QwsQ89z8tAfaJg2Z1Ur3aVFRr0tfn+8eb7IpG91wknlWU1
X-Gm-Gg: AYBFou0/eGX5dzT/qD5AagzeUPp073tlhNjohxBEtYBgqz2NvcK4cHdeYrqbTh7yoWp
	6BPDMJueC4zPWyHzKzy1wIkwWsp6DmbDtp/Mgx9zRUWGiKOp8nBWDlYQPP8js9J0/VJlIIVt9NC
	ehm5RkruCZGsqDOOW8iwHwI8gdkrnjsfl7J2Yf9jat2K81lWaYEnK+6uPYTpBltapvkTI1ni1iG
	OUXie/cP0D/golc4AVUaDpyjtF7TPIIywPEs6zFEcq1HHyhVdncF8KC6UaLrfWmZFOwQAR3adBq
	i4ep11Q8775ekt9NMYOA/LKEQyG+nP8xgf/B23+suk85C7FcydMnbWYJXjNhW6xZA4FpEZNB2yT
	gHS+8tHbePZs0YvouO0fTglldGJ4c0lKdx6d92stuoxhxzlQcnwhF18lsS4MTZPEPRKxi2OgzxZ
	wS/BPEaIk+FAbBCiJxo1Tpnk0q9yTaHMyQSDa919h+9CgUTEcsiXKl5UjjcCaaNwhoTlF9Wd+pr
	bHeIw3rs4/pYDLqZ3yzgMeMD65cVuQMii02/7rfpv00QTIWTieFJ9EdmoyrDQhH8Ba0/vJIG9Yv
	jn5oDWwl+agiRfVvzVmGwYqbkidtvc1MR845KpGcL6n6N/ta/78hCAmp0VMNEy9OuzkLCFCTj72
	ppJ3ik9F1zSdy4AZOTOHEz0bLtt+vzWsqv04eBfvipxF1tnKvtNkae/gvI3BD2sJ0aFqvL5iKAv
	ws71gR5eFVIOmKYg7lAnGHuyCWF+unkU1W1E/ildHurcNyF5IDGlEZuRpcAUdxDw==
X-Received: by 2002:a05:600c:6748:b0:49e:6050:9fbe with SMTP id 5b1f17b1804b1-4a35aca53camr16321375e9.15.1792825209014;
        Sat, 24 Oct 2026 00:00:09 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm100667405e9.1.2026.10.24.00.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:00:08 -0700 (PDT)
Date: Sat, 24 Oct 2026 09:00:06 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul
 Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] iio: adc: Add a driver for the Ingenic X1600 ADC
Message-ID: <20261024090006.00002720@gmail.com>
In-Reply-To: <20261024041357.34346-2-olivier@mgcrea.io>
References: <20261024041357.34346-1-olivier@mgcrea.io>
	<20261024041357.34346-2-olivier@mgcrea.io>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 24 Oct 2026 06:13:57 +0200
Olivier Louvignes <olivier@mgcrea.io> wrote:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index ecc22d1149d1..bbb63228e330 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12925,6 +12925,13 @@ F:	include/linux/mfd/ingenic-tcu.h
>  F:	sound/soc/codecs/jz47*
>  F:	sound/soc/jz4740/
>  
> +INGENIC X1600 ADC DRIVER
> +M:	Olivier Louvignes <olivier@mgcrea.io>
> +L:	linux-iio@vger.kernel.org

Drop the list, get_maintainer gets this via the directory.

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

The changes above should go into patch 1 (checkpatch will
raise a warning if you're creating a new file and it's not
documented in MAINTAINERS).

> +F:	drivers/iio/adc/ingenic-x1600-adc.c

And this addition goes into patch 2.

...

> diff --git a/drivers/iio/adc/ingenic-x1600-adc.c b/drivers/iio/adc/ingenic-x1600-adc.c
> new file mode 100644
> index 000000000000..60683f26c693
> --- /dev/null
> +++ b/drivers/iio/adc/ingenic-x1600-adc.c
> @@ -0,0 +1,226 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ADC driver for the Ingenic X1600 SoC
> + *

+ Copyright (c) 2026 YOUR_NAME <YOUR_EMAIL>

> + * The X1600's SAR ADC has four auxiliary channels, each with its own start
> + * bit, interrupt and 12-bit result. The register layout and the clock set-up
> + * were read from the vendor 4.4 kernel's driver.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/iio/iio.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>

+ bits.h, types.h, array_size.h, cleanup.h, jiffies.h, minmax.h

> +
> +#define X1600_ADC_REG_ENABLE		0x00
> +#define X1600_ADC_REG_CTRL		0x08
> +#define X1600_ADC_REG_STATUS		0x0c
> +#define X1600_ADC_REG_DATA(ch)		(0x10 + ((ch) / 2) * 4)
> +#define X1600_ADC_REG_CLKDIV		0x20
> +#define X1600_ADC_REG_STABLE		0x24
> +
> +/* ENABLE: bits 3..0 start a channel's conversion; bit 15 powers down. */
> +#define X1600_ADC_ENABLE_POWER_DOWN	BIT(15)
> +/* CTRL: bits 3..0 mask the channels' interrupts. STATUS: write 1 to clear. */
> +#define X1600_ADC_CHANNELS_MASK		GENMASK(3, 0)
> +#define X1600_ADC_DATA_MASK(ch)		(GENMASK(11, 0) << ((ch) % 2 * 16))
> +#define X1600_ADC_CLKDIV_DIV0		GENMASK(7, 0)
> +#define X1600_ADC_CLKDIV_DIV1		GENMASK(15, 8)
> +#define X1600_ADC_CLKDIV_DIV2		GENMASK(31, 16)
> +#define X1600_ADC_STABLE_TIME		GENMASK(15, 0)
> +
> +#define X1600_ADC_NUM_CHANNELS		4
> +#define X1600_ADC_VREF_mV		3300
> +#define X1600_ADC_BITS			12
> +/* The vendor kernel brings its 140 MHz APB clock down to about this. */
> +#define X1600_ADC_CLK_RATE		1166667
> +#define X1600_ADC_TIMEOUT_MS		20
> +
> +struct x1600_adc {
> +	void __iomem *base;
> +	struct clk *clk;
> +	struct completion done;
> +	/* Serialises conversions: there is one completion for all channels. */
> +	struct mutex lock;
> +};
> +
> +static irqreturn_t x1600_adc_irq(int irq, void *data)
> +{
> +	struct x1600_adc *adc = data;
> +	u32 status;
> +
> +	status = readl(adc->base + X1600_ADC_REG_STATUS) & X1600_ADC_CHANNELS_MASK;
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	writel(status, adc->base + X1600_ADC_REG_STATUS);
> +	complete(&adc->done);
> +	return IRQ_HANDLED;
> +}
> +
> +static int x1600_adc_read_raw_channel(struct x1600_adc *adc, unsigned int ch, int *val)
> +{
> +	u32 data;
> +	int ret = 0;

Reverse xmas tree.

> +
> +	guard(mutex)(&adc->lock);
> +
> +	reinit_completion(&adc->done);
> +	writel(BIT(ch), adc->base + X1600_ADC_REG_STATUS);
> +	writel(readl(adc->base + X1600_ADC_REG_ENABLE) | BIT(ch),
> +	       adc->base + X1600_ADC_REG_ENABLE);
> +
> +	if (!wait_for_completion_timeout(&adc->done,
> +					 msecs_to_jiffies(X1600_ADC_TIMEOUT_MS)))
> +		ret = -ETIMEDOUT;
> +
> +	writel(readl(adc->base + X1600_ADC_REG_ENABLE) & ~BIT(ch),
> +	       adc->base + X1600_ADC_REG_ENABLE);
> +	if (ret)
> +		return ret;
> +
> +	data = readl(adc->base + X1600_ADC_REG_DATA(ch));
> +	*val = field_get(X1600_ADC_DATA_MASK(ch), data);
> +	return 0;
> +}
> +
> +static int x1600_adc_read_raw(struct iio_dev *iio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int *val, int *val2, long mask)
> +{
> +	struct x1600_adc *adc = iio_priv(iio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret = x1600_adc_read_raw_channel(adc, chan->channel, val);
> +		return ret ? ret : IIO_VAL_INT;

You can use the Elvis operator here.

> +	case IIO_CHAN_INFO_SCALE:
> +		*val = X1600_ADC_VREF_mV;
> +		*val2 = X1600_ADC_BITS;
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct iio_info x1600_adc_info = {
> +	.read_raw = x1600_adc_read_raw,
> +};
> +
> +#define X1600_ADC_CHANNEL(ch) {					\

Small nit, but align the \ with the others.

> +	.type = IIO_VOLTAGE,					\
> +	.indexed = 1,						\
> +	.channel = (ch),					\
> +	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),		\
> +	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),	\
> +}
> +
x
...

> +	/* Powered down, interrupts masked and cleared, as the vendor does. */
> +	writel(X1600_ADC_ENABLE_POWER_DOWN, adc->base + X1600_ADC_REG_ENABLE);
> +	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_CTRL);
> +	writel(X1600_ADC_CHANNELS_MASK, adc->base + X1600_ADC_REG_STATUS);
> +
> +	rate = clk_get_rate(adc->clk);
> +	div0 = clamp(DIV_ROUND_UP(rate, X1600_ADC_CLK_RATE), 1UL, 256UL) - 1;
> +	/* DIV1 and DIV2 as the vendor kernel sets them. */
> +	writel(FIELD_PREP(X1600_ADC_CLKDIV_DIV0, div0) |
> +	       FIELD_PREP(X1600_ADC_CLKDIV_DIV1, 1) |
> +	       FIELD_PREP(X1600_ADC_CLKDIV_DIV2, 99),
> +	       adc->base + X1600_ADC_REG_CLKDIV);
> +	reg = readl(adc->base + X1600_ADC_REG_STABLE) & ~X1600_ADC_STABLE_TIME;
> +	writel(reg | FIELD_PREP(X1600_ADC_STABLE_TIME, 1),
> +	       adc->base + X1600_ADC_REG_STABLE);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_irq(dev, irq, x1600_adc_irq, 0, dev_name(dev), adc);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request irq\n");

devm_request_irq() already prints an error message on failure, just
"return ret;" is fine.

> +
> +	/*
> +	 * Powered up for good: the keys poll it every few tens of milliseconds,
> +	 * and powering up takes 2 ms.
> +	 */
> +	writel(0, adc->base + X1600_ADC_REG_ENABLE);
> +	fsleep(2000);
> +	writel(0, adc->base + X1600_ADC_REG_CTRL);

+ blank line.

> +	ret = devm_add_action_or_reset(dev, x1600_adc_power_down, adc);
> +	if (ret)
> +		return ret;
> +
> +	iio_dev->name = "x1600-adc";
> +	iio_dev->modes = INDIO_DIRECT_MODE;
> +	iio_dev->channels = x1600_adc_channels;
> +	iio_dev->num_channels = ARRAY_SIZE(x1600_adc_channels);
> +	iio_dev->info = &x1600_adc_info;
> +
> +	return devm_iio_device_register(dev, iio_dev);
> +}
> +
> +static const struct of_device_id x1600_adc_of_match[] = {
> +	{ .compatible = "ingenic,x1600-adc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, x1600_adc_of_match);
> +
> +static struct platform_driver x1600_adc_driver = {
> +	.driver = {
> +		.name = "ingenic-x1600-adc",
> +		.of_match_table = x1600_adc_of_match,
> +	},
> +	.probe = x1600_adc_probe,
> +};
> +module_platform_driver(x1600_adc_driver);
> +MODULE_DESCRIPTION("ADC driver for the Ingenic X1600 SoC");

MODULE_AUTHOR()?

> +MODULE_LICENSE("GPL");



-- 
Kind regards,
Joshua Crofts
