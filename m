Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA39A3D7D90
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386414; cv=none; b=By56fjWOzZg3vzmdvUN56hnILIvIkFd+bHi0yrCT+t8dWpfVqjjg4OSBqrzquf9ItJThaUrlFq7hXVJ93tGaFibpDaqPJ4ny0ViQE+orMg6Qcp4qwGmX4Ngtaee63ZlVXwzrE9mlxNGMkQfiL1s05/kBQTuC6BcB6W2Ahw/EcLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386414; c=relaxed/simple;
	bh=+Ru5MpapoPW9CEJLUVBrt4UAN1B01LK9JqzyiUJmsPg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rPm4R1WSmXlhz684/TldmSDLyRFJIK6qlmLrD7xzasrflbFYDtp9/lEU8QumF/w44n+tWBJqLD3n/YkFijgyQlsbNRLEOEDpCz1k4zPXKO2uzwR3lkXH32DeAbRU/FrK1FBCKJxWs2+zPDsPb+kE69p1bzG+si03Ah9F/PGEt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzX/pOa4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzX/pOa4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8EE1F000E9;
	Thu, 25 Jun 2026 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782386409;
	bh=YM93BSADDkTm8aQwrFk+5zuJQlCMRIyAeq6e6rfIMPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BzX/pOa49TAWA2o3TtkUGYA+X5gTGGtFulhx8r2/Ddcmd9p7T1X6hTo+sL7kAPOVI
	 uFzYtqu4vThX7lrNx6C8Fd3YBFHEtwaoLXuq1+J8MhkUKWz93BJQZx7QstB2BfHVow
	 2fNBzUiXFtOH1K6ro/TCXOls+tz1Y7flIDm+zqIilDCUJJZT9Ruo3oUZgoFgQdHBm8
	 JidNu0LqzW0wkA/yL7Jx/otHc1j59zrYUoupj9Z5tsa++xqSBjjhqqX+wSCBS9mUDx
	 +YT8T/l+LOmPIkolvuV2bAga4M7ZptqrAGblsslrpDjq2LUsUsvrdVxJe/9KhDszIG
	 MkaXuske7rvTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: adc: Add Nuvoton MA35D1 EADC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chi-Wen Weng" <cwweng.linux@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260625110638.38438-3-cwweng.linux@gmail.com>
References: <20260625110638.38438-1-cwweng.linux@gmail.com>
 <20260625110638.38438-3-cwweng.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 11:20:08 +0000
Message-Id: <20260625112009.4E8EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Multi-channel buffered scans read stale or actively converting dat=
a for subsequent channels due to premature interrupt mapping.
- [High] Unpaced software re-triggering loop in the buffer interrupt handle=
r causes an IRQ storm and livelock.
- [High] Missing sign-extension and incorrect scan type for negative differ=
ential readings.
- [High] Device suspend does not synchronize with ongoing direct conversion=
s, leading to potential hardware aborts.
- [Medium] Differential negative channel configuration from device tree is =
accepted but completely ignored by hardware configuration.
--

commit 71778e9c3ef41a6d7da62ab5f861733a638e3f61
Author: Chi-Wen Weng <cwweng@nuvoton.com>

iio: adc: Add Nuvoton MA35D1 EADC driver

This patch adds an IIO driver for the Nuvoton MA35D1 Enhanced ADC
controller, supporting both direct reads and triggered buffered capture.

> diff --git a/drivers/iio/adc/ma35d1_eadc.c b/drivers/iio/adc/ma35d1_eadc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/adc/ma35d1_eadc.c

[ ... ]

> +static void ma35d1_adc_config_sample(struct ma35d1_adc *adc,
> +				     unsigned int sample, unsigned int channel)
> +{
> +	u32 reg =3D MA35D1_EADC_SCTL(sample);
> +
> +	ma35d1_adc_rmw(adc, reg,
> +		       MA35D1_EADC_SCTL_CHSEL_MASK |
> +		       MA35D1_EADC_SCTL_TRGSEL_MASK,
> +		       FIELD_PREP(MA35D1_EADC_SCTL_CHSEL_MASK, channel) |
> +		       MA35D1_EADC_SCTL_TRGSEL_ADINT0);
> +}

[Severity: Medium]
Will the hardware properly sample differential pairs if only the positive
channel is configured here?

The driver parses differential configurations using diff-channels and stores
the negative channel in chan->channel2, but only the positive channel is ev=
er
written to the hardware CHSEL mask here.

If the hardware relies on arbitrary negative channel configurations rather
than fixed hardware pairings, the negative pin won't be sampled correctly.
Additionally, ma35d1_adc_parse_channels() doesn't seem to validate against
any fixed hardware pair requirements.

[ ... ]

> +static irqreturn_t ma35d1_adc_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +	struct ma35d1_adc *adc =3D iio_priv(indio_dev);
> +	int i;
> +
> +	for (i =3D 0; i < adc->scan_chancnt; i++)
> +		adc->scan.channels[i] =3D
> +			ma35d1_adc_read(adc, MA35D1_EADC_DAT(i)) &
> +			MA35D1_EADC_DAT_MASK;

[Severity: High]
Will this loop read stale or actively converting data for channels 1 throug=
h N
during multi-channel scans?

In ma35d1_adc_buffer_postenable(), the interrupt source is hardcoded to sam=
ple
module 0:

    ma35d1_adc_rmw(adc, MA35D1_EADC_INTSRC0,
                   MA35D1_EADC_INTSRC0_ADINT0,
                   MA35D1_EADC_INTSRC0_ADINT0);

This means the interrupt fires as soon as the first channel finishes
converting. When this threaded handler wakes up and immediately reads all
DAT(i) registers, the subsequent sample modules may not have completed their
conversions yet.

> +
> +	iio_push_to_buffers_with_timestamp(indio_dev, &adc->scan, pf->timestamp=
);
> +	iio_trigger_notify_done(adc->trig);
> +
> +	ma35d1_adc_rmw(adc, MA35D1_EADC_CTL, MA35D1_EADC_CTL_ADCIEN0,
> +		       MA35D1_EADC_CTL_ADCIEN0);
> +	ma35d1_adc_write(adc, MA35D1_EADC_SWTRG, 1);

[Severity: High]
Does unconditionally triggering the next conversion here cause an interrupt
storm?

Since the driver starts the conversion in postenable by writing SWTRG =3D 1,
and then unconditionally restarts it immediately at the end of the handler,
this creates a 0-delay free-running loop without any hardware timer or
pacing mechanism. This can livelock the system by flooding the CPU with
interrupts as fast as the ADC converts.

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ma35d1_adc_read_conversion(struct iio_dev *indio_dev,
> +				      const struct iio_chan_spec *chan,
> +				      int *val)
> +{

[ ... ]

> +	timeout =3D wait_for_completion_interruptible_timeout(&adc->completion,
> +							    MA35D1_EADC_TIMEOUT);
> +	ma35d1_adc_disable_irq(adc);
> +
> +	if (timeout < 0)
> +		return timeout;
> +	if (!timeout)
> +		return -ETIMEDOUT;
> +
> +	*val =3D ma35d1_adc_read(adc, MA35D1_EADC_DAT(0)) & MA35D1_EADC_DAT_MAS=
K;

[Severity: High]
Will this return massive positive values for negative differential readings?

Differential channels return two's complement values. Without using
sign_extend32() before assigning to the 32-bit *val, negative voltage
differences will be incorrectly returned to userspace as large positive
integers instead of signed values.

[ ... ]

> +static void ma35d1_adc_init_channel(struct ma35d1_adc *adc,
> +				    struct iio_chan_spec *chan, u32 vinp,
> +				    u32 vinn, int scan_index, bool differential)
> +{

[ ... ]

> +	chan->info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW);
> +	chan->scan_type.sign =3D 'u';

[Severity: High]
Should differential channels be marked as signed instead of unsigned?

When differential is true, this forces the scan type sign to 'u', which
incorrectly informs the IIO subsystem that the differential data is unsigned
instead of two's complement.

[ ... ]

> +static int ma35d1_adc_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct ma35d1_adc *adc =3D iio_priv(indio_dev);
> +
> +	if (iio_buffer_enabled(indio_dev))
> +		return -EBUSY;
> +
> +	ma35d1_adc_hw_disable(adc);
> +	clk_disable_unprepare(adc->clk);

[Severity: High]
Can this race with active direct conversions and cause a bus fault?

ma35d1_adc_suspend() disables the peripheral clock without acquiring
adc->lock or checking iio_device_claim_direct_mode().

If a concurrent direct read is waiting in ma35d1_adc_read_conversion():

    timeout =3D wait_for_completion_interruptible_timeout(&adc->completion,
                                                        MA35D1_EADC_TIMEOUT=
);
    ma35d1_adc_disable_irq(adc);

and suspend disables the clock, the wait may time out or be interrupted.
Accessing the ADC registers immediately afterward in ma35d1_adc_disable_irq=
()
with the clock disabled could result in a synchronous external abort.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625110638.3843=
8-1-cwweng.linux@gmail.com?part=3D2
