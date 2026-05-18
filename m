Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF333E3162
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094089; cv=none; b=hcrIOD5RaAfhwwh80/JpoUH3rLVQ8nkg+IhYjpeaMWV561IP918b0EdN08zTarLrMSzAwZGVH1NNF60MAzaIUk+yxTyOBl/Dy6Y35oq+VUW6Ivkco/UFiGJqnE1siepRdNT5biEkXvUU7F/TLn3H2cWHl7evn+ohuIv/BC+6mOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094089; c=relaxed/simple;
	bh=fyvkqZ9hXj2sEI8ongjqyp6bYF+oEOsYBPFUYv02r6A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IG8kWhynU3dRUwwqWLmuT3Ik9++sIwYHFJMD872qT1L+ISyyb0r/FGdYtQ0L9YfqJckB9QqvtA+agPElQINuYGLVE+oRJpG1K9kXy3YRVmNiFT/i25Tnrq2UORKzPcjwdfTTLbmjnkqdcaH0d3kB0o2OMkdARHAFN69AeeO7Njk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJqnV9Th; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJqnV9Th"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B8CC2BCB7;
	Mon, 18 May 2026 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779094089;
	bh=fyvkqZ9hXj2sEI8ongjqyp6bYF+oEOsYBPFUYv02r6A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FJqnV9ThvXFK9rKgpfWg9ucrWQf/6Kp7Ojh0xFLanKwdOSQQw+xUxurRpdf1hW9m7
	 Hc98yVohLwqOKBqRG48/qpaOY/sTnnzmC1iveIcUdxoy8RCsEYgOm9Th/rj1pvAzwt
	 845VTC1C4ngAiZ3SxHZ1UMqEn4nln2IoEq+nCGivQ4x9NZEG8lJqNXVa5BAE2JnGe6
	 +UFOP58dzW5BUdxQe9lSeEI/qY9GiCgLcYhRqbMEJjRl90U4OjeBnZ3/6YUtI0xGg3
	 yfCdlMk4eh2xoy2571ibLmCZiSezpgI/m7z54SvyXs3bM0WgutfsQO56ueRoBZ3Lob
	 h+kSED/5TP0+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] iio: adc: Add StarFive SAR-ADC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xingyu Wu" <xingyu.wu@starfivetech.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518081852.116909-3-xingyu.wu@starfivetech.com>
References: <20260518081852.116909-3-xingyu.wu@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 08:48:08 +0000
Message-Id: <20260518084809.36B8CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] System crash due to requesting IRQ before enabling hardware clocks.
- [High] IRQ handler unconditionally returns IRQ_HANDLED without clearing i=
nterrupts, leading to infinite IRQ storms.
- [High] Clock reference count underflow due to incompatible mixing of devr=
es and manual clock management.
- [High] Missing cleanup for runtime PM and shared resets in error and remo=
val paths.
- [High] Data race on the `SARADC_IRQ_EN_ST` register causes lost interrupt=
 enables.
- [High] Active hardware monitor is not stopped during device removal.
- [High] Lockless sysfs store functions cause data corruption and IRQ storm=
s.
- [Medium] Multiple IIO ABI violations regarding standard events and data u=
nits.
- [Medium] Silent failure on ADC read timeouts.
--

commit 38cba5c631bad8026785f6fd6a6919692ab720de
Author: Xingyu Wu <xingyu.wu@starfivetech.com>
Subject: iio: adc: Add StarFive SAR-ADC driver

Add a new IIO ADC driver for the StarFive JHB100 SAR ADC controller.

> diff --git a/drivers/iio/adc/starfive-saradc.c b/drivers/iio/adc/starfive=
-saradc.c
> index 0000000000000..78409cb1bcb29
> --- /dev/null
> +++ b/drivers/iio/adc/starfive-saradc.c
> @@ -0,0 +1,978 @@

[ ... ]

> +static void starfive_saradc_ch_monitor_start(struct starfive_saradc *pri=
v, u8 ch)
> +{
[ ... ]
> +	/* Enable IRQ */
> +	reg =3D readl(priv->base + SARADC_IRQ_EN_ST);
> +	writel(reg | SARADC_IRQ_CH_EN(ch), priv->base + SARADC_IRQ_EN_ST);

Could this race with the interrupt handler? The hardirq handler reads and
writes back to SARADC_IRQ_EN_ST to clear status bits without holding locks.
If this thread context reads, modifies, and writes the register, could the
hardirq handler concurrently write back a stale value and overwrite the
interrupt enable bits set here?

[ ... ]

> +static ssize_t starfive_saradc_upper_bound_store(struct device *dev,
> +						 struct device_attribute *attr,
> +						 const char *buf, size_t len)
> +{
[ ... ]
> +	starfive_saradc_ch_upper_bound_set(priv, ch, SARADC_VDD_MV_TO_RAW(upper=
));
> +	priv->up_bounds[ch] =3D upper;
> +	pm_runtime_put(priv->dev);
> +
> +	return len;
> +}

Does this need to hold priv->lock? The starfive_saradc_ch_upper_bound_set
function performs a read-modify-write on shared hardware registers, which
might allow concurrent sysfs writes to corrupt the bounds.

[ ... ]

> +static ssize_t starfive_saradc_monitor_channel_select(struct device *dev,
> +						      struct device_attribute *attr,
> +						      const char *buf, size_t len)
> +{
[ ... ]
> +	if (ch >=3D SARADC_MAX_CHANNELS || ch < 0)
> +		return -EINVAL;
> +
> +	priv->mon_ch =3D ch;
> +
> +	return len;
> +}

Does this update priv->mon_ch without acquiring priv->lock? If the channel
is changed while the monitor is active, could the IRQ handler check the
wrong bit, fail to clear the interrupt, and trigger an infinite IRQ storm?

[ ... ]

> +static IIO_DEVICE_ATTR(in_voltage0_upper, 0644,
> +		       starfive_saradc_upper_bound_show,
> +		       starfive_saradc_upper_bound_store, 0);
[ ... ]
> +static IIO_DEVICE_ATTR(voltage_monitor_en, 0644,
> +		       starfive_saradc_monitor_status,
> +		       starfive_saradc_monitor_enable, 0);

Should this driver use standard IIO events (IIO_EV_TYPE_THRESH) instead of
introducing custom sysfs attributes for threshold monitoring?

[ ... ]

> +static int starfive_saradc_read(struct starfive_saradc *priv)
> +{
[ ... ]
> +	tmp =3D starfive_saradc_data_get(priv);
> +	/* Check that the data is ready to be read. */
> +	if (!(tmp & ADC_DAT_RDY_MSK)) {
> +		ret =3D readl_poll_timeout(priv->base + SARADC_DATAX_REG_GET(priv->usi=
ng_ch), tmp,
> +					 (tmp & ADC_DAT_RDY_MSK), 10, SARADC_TIMEOUT);
> +		if (ret) {
> +			priv->err =3D true;
> +			dev_err(priv->dev, "channel%d is still not ready to be read! Timeout!=
\n",
> +				priv->using_ch);
> +		}
> +	}
> +
> +	if (priv->err)
> +		tmp =3D 0;
> +
> +	starfive_saradc_ch_stop(priv);
> +
> +	return (int)(tmp & ADC_DAT_MSK);
> +}

If the poll times out, this sets tmp to 0 and returns it. Will this result
in starfive_saradc_read_raw passing 0 to userspace as a valid ADC reading
instead of propagating an error code like -ETIMEDOUT?

[ ... ]

> +	case IIO_CHAN_INFO_PROCESSED:
> +		ret =3D starfive_saradc_read(priv);
> +		if (ret < 0)
> +			break;
> +
> +		/* VIN =3D AVDD * data[11:0] / 4096. (AVDD =3D 1.8v) */
> +		tmp =3D SARADC_RAW_TO_VDD_ADJ(ret);
> +		*val =3D (int)(tmp / 1000000);
> +		*val2 =3D (int)(tmp % 1000000);
> +		ret =3D IIO_VAL_INT_PLUS_MICRO;
> +		break;
> +
> +	case IIO_CHAN_INFO_SCALE:
> +		/*
> +		 * AVDD is fixed at 1.8v.
> +		 * 1.8 / (1 << 12) * 1000000
> +		 */
> +		*val =3D 0;
> +		*val2 =3D SARADC_AVDD_VOL / (1 << SARADC_REALBITS);
> +		ret =3D IIO_VAL_INT_PLUS_MICRO;
> +		break;

Does this calculate the scale to expose Volts instead of millivolts? The
calculation yields 439 instead of 0.439453, meaning users multiplying raw
data by the exposed scale will get Volts. This violates the IIO user-space
ABI requirement of millivolts.

Similarly, IIO_CHAN_INFO_PROCESSED appears to be formatting the value as
fractional Volts rather than millivolts.

[ ... ]

> +static irqreturn_t starfive_saradc_irq_handler(int irq, void *data)
> +{
> +	struct starfive_saradc *priv =3D data;
> +	u32 irq_err =3D readl(priv->base + SARADC_IRQ_EN_ST);
> +
> +	if (!priv->mon_working)
> +		return IRQ_HANDLED;
> +
> +	/* Error of out of bounds */
> +	if (irq_err & BIT(priv->mon_ch)) {
> +		/* Clear the interrupt */
> +		writel(irq_err, priv->base + SARADC_IRQ_EN_ST);
> +		priv->err =3D true;
> +		return IRQ_WAKE_THREAD;
> +	}
> +
> +	return IRQ_HANDLED;
> +}

If priv->mon_working is false, or if the interrupt bit is not set, this
returns IRQ_HANDLED without clearing the hardware interrupt status bits.
Since the interrupt is requested with IRQF_TRIGGER_HIGH, won't failing to
clear the source while returning IRQ_HANDLED cause the interrupt controller
to immediately re-trigger, resulting in an infinite IRQ storm?

[ ... ]

> +static void starfive_saradc_init(struct starfive_saradc *priv)
> +{
[ ... ]
> +	if (of_property_read_u16(priv->dev->of_node, "upper-bound-mv", &tmp)) {

Are the default Device Tree bounds being parsed into microvolts here but
exposed to sysfs where users expect millivolts?

[ ... ]

> +static int starfive_saradc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D devm_request_threaded_irq(&pdev->dev, irq,
> +					starfive_saradc_irq_handler,
> +					starfive_saradc_mon_stop_threadfn,
> +					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					dev_name(&pdev->dev), priv);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to request irq handler\n");
> +
> +	priv->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);

Since the IRQ is requested before the clock is enabled, could a pending or
spurious interrupt fire immediately upon registration? If the handler
executes and accesses the clock-gated MMIO register, it could cause a
synchronous external abort or bus stall.

> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
> +				     "failed to get clock\n");
> +
> +	priv->rst =3D devm_reset_control_array_get_shared(&pdev->dev);
> +	if (IS_ERR(priv->rst))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->rst),
> +				     "failed to get resets\n");
> +
> +	ret =3D reset_control_deassert(priv->rst);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to deassert reset\n");
[ ... ]
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	return devm_iio_device_register(&pdev->dev, indio_dev);
> +}

If devm_iio_device_register fails, this returns the error without calling
pm_runtime_disable. Does this leave the PM framework active on freed
devres memory?

Additionally, the shared reset line is deasserted here, but
reset_control_assert is never called in the error paths or in
starfive_saradc_remove. Could this permanently leak the shared reset line's
reference count and prevent the hardware block from ever being reset again?

> +static void starfive_saradc_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_dont_use_autosuspend(&pdev->dev);
> +}

If continuous monitor mode is enabled (priv->mon_en =3D true), the hardware
is actively sampling and generating interrupts. Does this leave the monitor
running and the interrupt unmasked when the driver unbinds, potentially
causing bus lockups when devres subsequently disables the clock?

> +static int starfive_saradc_runtime_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct starfive_saradc *priv =3D iio_priv(indio_dev);
> +
> +	starfive_saradc_pwr_on(priv, false);
> +	clk_disable_unprepare(priv->clk);
> +
> +	return 0;
> +}

The clock is acquired via devm_clk_get_enabled in probe, which queues an
automatic disable. Here, the driver manually manages the clock. If the
driver is unbound while the device is runtime-suspended, devres will
execute its queued clk_disable_unprepare. Will this drop the enable
count below zero, causing a kernel warning and resource tracking
corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518081852.1169=
09-1-xingyu.wu@starfivetech.com?part=3D2
