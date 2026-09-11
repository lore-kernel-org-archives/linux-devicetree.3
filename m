Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E0E49B5DE
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789143357; cv=none; b=TxO0QwCMhckHy3uc/aiJqmx8BAoFyjPPwj1aFALClBJOEMDbk02X+nQ+XMvHa6M8vMeSEFSIu37wy6Q7hfk3rM3oVOHEw1q28Frx+1GijbZe3aJQttwEc7qoCvhORQ/VkQC+fF0SCp4+2HMNGWnwKUa0gbXSAnOfcwaGLFBq5a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789143357; c=relaxed/simple;
	bh=oJNV0E7z9oRyolLJOrx2/OZwS7pjuXz8TDxkLuGBa+o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Q3T/x1CyDwtpg7EElVQstyr+8cTNjcPN2Hn6q6NxMzVdcVYxY6sUmKwCYhcgpOGOkSSx7nmYMp6UJfCt0ZIzHcM5U3to+4QnbmnZqW8lDVMwyrU4VJ65fK9nudci5IDXKySJWqEuhGVu+iwIRFZaUFxKI+495Slo/xoJ4P4yiRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MvlgQkqj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MvlgQkqj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244F31F000FF;
	Fri, 11 Sep 2026 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789143355;
	bh=+HOKd2V8JTZECB5u89FI/OEmEuNAt6pcFJPM/bRk4yU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MvlgQkqjhBw24wwytn674lmisOvsZisWuYjzVrN83Iv4Lbo1x5oU/OnNptllRdhKn
	 xZbimgCVlNLnr/Bm66sJN6h0gk1DR9BFmje2Q9Lw2hrlnv/pD3ZWY+V66OdCBoHYvw
	 CfS6HmLZP1N1YaYgsFy624yM1/7tBqYmiiq2SbFiGRKMWQFY6GfdE4EnEQp41Jg16q
	 TT5Ns0uudBPbSVXKo3fmq5VvFtWMcfac0Obj05LvVKkLZdxKC2X/V8wtqiiP5WPoQg
	 XCH9EkIcR7wb7+ov4CMvxSwRWlUq7ZtTfKDbuCLWiXpL68s2o4Q43mgW1dRACgicDD
	 xyrpFR5atGjZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] iio: adc: stm32-adc: manage characterization
 voltage diversity
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260911-adc-stm32mp25-v1-v1-2-cef26eecdef2@foss.st.com>
References: <20260911-adc-stm32mp25-v1-v1-0-cef26eecdef2@foss.st.com>
 <20260911-adc-stm32mp25-v1-v1-2-cef26eecdef2@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 16:15:54 +0000
Message-Id: <20260911161555.244F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing error check after ADC conversion allows division by ze=
ro or division by uninitialized memory if the conversion fails or returns z=
ero.
--

commit 0d19a7183285228478d5cfa82a3785b87f3e1bd1
Author: Olivier Moysan <olivier.moysan@foss.st.com>

iio: adc: stm32-adc: manage characterization voltage diversity

This commit introduces a vref_charac field in stm32_adc_cfg to store=20
SoC-specific characterization voltage. It updates the stm32_adc_read_raw=20
function to use this field in the vref computation formula.

> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
[ ... ]
> @@ -1610,7 +1611,7 @@ static int stm32_adc_read_raw(struct iio_dev *indio=
_dev,
>  			ret =3D -EINVAL;
> =20
>  		if (mask =3D=3D IIO_CHAN_INFO_PROCESSED)
> -			*val =3D STM32_ADC_VREFINT_VOLTAGE * adc->vrefint.vrefint_cal / *val;
> +			*val =3D adc->cfg->vref_charac * adc->vrefint.vrefint_cal / *val;

[Severity: Critical]
This isn't a bug introduced by this patch, but does this division need to
check if the conversion actually succeeded?

Looking at the preceding code in stm32_adc_read_raw():

    if (chan->type =3D=3D IIO_VOLTAGE)
        ret =3D stm32_adc_single_conv(indio_dev, chan, val);
    else
        ret =3D -EINVAL;

If a sysfs read (such as in_voltageX_input) is interrupted by a signal,
stm32_adc_single_conv() can abort via wait_for_completion_interruptible_tim=
eout()
and return an error like -ERESTARTSYS. When this happens, *val remains
uninitialized.

Since there is no error check on ret before the division, this code will
proceed to divide by the uninitialized *val. If the kernel is compiled with
CONFIG_INIT_STACK_ALL_ZERO=3Dy, the uninitialized stack variable will be 0,
which could lead to a division by zero kernel panic.

Should we verify that ret indicates success and that *val is non-zero
before attempting the scaling calculation?

> =20
>  		iio_device_release_direct(indio_dev);
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-adc-stm32m=
p25-v1-v1-0-cef26eecdef2@foss.st.com?part=3D2
