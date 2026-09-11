Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6FF4A012A
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143964; cv=none; b=FqtG2EAfHA53aT0yldnd8WvfZ6LyyCZzpynXUO6MnAY6LBx0755sRBNFm+B5QWuIdqEsIGtj2HvIyTlsiqGnRVNDn7IBnhnVABgoscH2LsbxuFYiNttx44IammQ8m/uUSBxDX4CHfPzyN2m7seFtXLs8wm1r/+w24fEzehj7oNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143964; c=relaxed/simple;
	bh=R3J7LHi+/+aOn/qeOZybdD0I7LkO5DwksQ74zj/sSao=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQDXsA8oQ744kP64jFhjxC7OT2gtm2AD6KAPsyx/Qzln7ch8+faB+YlbS3A7uowAytgwkb9/7dEyFj0Ncocp2heM3WND8+xY0sdE9P0q7MNWa5nqeMOrGzA3MQ00JbKfE21tKSrTQtJ6MJPRcsp4Ze2jD/qRLyDpV07LLh+FfKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=arVj6vLf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="arVj6vLf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D323F1F000FF;
	Fri, 11 Sep 2026 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789143963;
	bh=40fz33PSs0C6L/Dw6HQ0xSNEEiqcfe378vrJrmGr88k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=arVj6vLfKrX4rCtTnqaj23rnDjOjubNPcz5HuqKl/ztv5Yh2Ayca341BdV+Xqb+o2
	 PnySBzbr3J1gh8LSBbh01a7iU5MHF8JUxMMh4b8oKZdBNXq0RchGW93IMclgTWDDDt
	 xviYMYNNV7jtTAewMFV32JRAetvVNWdSguFtcYLVN9XibUAiLa9CuatWBgkvUNxYWw
	 gb/PmpLyk2krnFKEj0V1EgQYm53vBrQ/Ivn4IzDTWGaqH9HcQe2MMAKV8G99tICI/7
	 cNnOwTnmQR1cTGwRGXj7GboGGx3Gt0+3N+gOC+Fr9Vjvtjy+I1F0WK0UTUU1udoXnt
	 RaUk2fIC2My8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] iio: adc: stm32-adc: add support for stm32mp23 and
 stm32mp25
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-3-cef26eecdef2@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
 <20260911-adc-stm32mp25-v1-v1-3-cef26eecdef2@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 16:26:02 +0000
Message-Id: <20260911162602.D323F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Missing bounds check on the `st,adc-trigger-sel` device tree prope=
rty allows an out-of-bounds array read when indexing `adc->cfg->trigs`.
- [Medium] Missing ADC stop (`ADSTP`) on calibration timeout error path lea=
ves ADC in a locked state.

Pre-existing issues:
- [High] Configuring an unsupported internal channel does not abort setup, =
leading to errant read-modify-write operations on register offset 0 (ISR), =
which silently clears unrelated pending interrupts.
--

commit 07a141434d979402aadc3f3eaff7d932ee702232
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

iio: adc: stm32-adc: add support for stm32mp23 and stm32mp25

This commit adds support for the STM32MP23 and STM32MP25 SoCs to the
stm32-adc driver. It introduces support for diversity in IRQs, clocks,
internal voltage channels, and trigger lists by utilizing a dedicated
compatible string and configuration data.

> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
[ ... ]
> @@ -1503,6 +1503,163 @@ static void stm32h7_adc_unprepare(struct iio_dev =
*indio_dev)
[ ... ]
> +static int stm32mp25_adc_prepare(struct iio_dev *indio_dev)
> +{
> +	struct stm32_adc *adc =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D stm32h7_adc_exit_pwr_down(indio_dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Must enable the ADC before running software-assisted calibration */
> +	ret =3D stm32h7_adc_enable(indio_dev);
> +	if (ret)
> +		goto pwr_dwn;
> +
> +	/* Always run offset calibration */
> +	ret =3D stm32mp25_adc_calib(indio_dev);
> +	if (ret)
> +		goto adc_dis;
> +
> +	stm32_adc_int_ch_enable(indio_dev);
> +
> +	stm32_adc_writel(adc, adc->cfg->regs->difsel.reg, adc->difsel);
> +
> +	if (adc->cfg->has_presel)
> +		stm32_adc_writel(adc, STM32H7_ADC_PCSEL, adc->pcsel);
> +
> +	return 0;
> +
> +adc_dis:
> +	stm32h7_adc_disable(indio_dev);

[Severity: Medium]
If calibration times out, does this error path leave the ADC in a locked
state?

If stm32mp25_adc_calib() times out waiting for ADSTART to clear, it returns
an error that jumps to adc_dis. The error path directly calls
stm32h7_adc_disable(), which tries to disable the ADC by setting ADDIS.

However, the hardware specification generally prohibits setting ADDIS while
ADSTART=3D1. Should the driver first abort the conversion using an
stm32h7_adc_stop_conv() call to set ADSTP and wait for ADSTART to clear
before disabling the hardware?

[ ... ]
> @@ -2641,6 +2641,11 @@ static int stm32_adc_populate_int_ch(struct iio_de=
v *indio_dev, const char *ch_n
>  					dev_warn(&indio_dev->dev,
>  						 "%s channel not available\n", ch_name);
>  				break;
> +			case STM32_ADC_INT_CH_VDDGPU:
> +				if (!adc->cfg->regs->or_vddgpu.reg)
> +					dev_warn(&indio_dev->dev,
> +						 "%s channel not available\n", ch_name);
> +				break;
>  			}
> =20
>  			if (stm32_adc_ic[i].idx !=3D STM32_ADC_INT_CH_VREFINT) {
>  				adc->int_ch[i] =3D chan;
>  				break;
>  			}

[Severity: High]
This is a pre-existing issue, but does this warning branch fail to abort
channel registration?

If an unsupported internal channel like vddgpu is requested, the driver
prints a warning but falls through and assigns it a valid int_ch below.

This causes a problem later during setup:

stm32_adc_int_ch_enable() {
    ...
    case STM32_ADC_INT_CH_VDDGPU:
        stm32_adc_set_bits(adc, adc->cfg->regs->or_vddgpu.reg,
                           adc->cfg->regs->or_vddgpu.mask);
    ...
}

Because the register offset is uninitialized (0), this performs a
read-modify-write on offset 0, which corresponds to the ISR register. Since
the ISR has read-clear-write-1 semantics, this will silently clear all
currently pending unrelated interrupts.

[ ... ]
> @@ -2914,6 +2914,18 @@ static int stm32_adc_probe(struct platform_device =
*pdev)
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (device_property_present(&pdev->dev, "st,adc-trigger-sel")) {
> +		ret =3D device_property_read_u32(dev, "st,adc-trigger-sel", &trig_id);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	adc->trigs =3D adc->cfg->trigs[trig_id];

[Severity: High]
Could an invalid st,adc-trigger-sel value lead to an out-of-bounds read
here?

The st,adc-trigger-sel property is read directly into trig_id and
immediately used to index the adc->cfg->trigs array, which has a fixed
size of 2.=20

If a malformed Device Tree provides a larger value, this skips bounds
validation and might cause a memory safety issue by dereferencing
invalid pointers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-adc-stm32m=
p25-v1-v1-0-cef26eecdef2@foss.st.com?part=3D3
