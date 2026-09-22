Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE83C141F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 04:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052114; cv=none; b=TnxhtfENkEDQQ4qyeZgb4j0+5DC1Ay/jNkDBQA7xSvqcg4G7JzJdwxGBy82uNml12na9ADYLUD0ujcW6N8poMzxDkp28lePk9e2SdBmHWOLqAImiM/Bt1+SuWXNnqMVfedaaY4p9M5dHDKlRC3dsmrDobMFxnCZakLHylcVYrwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052114; c=relaxed/simple;
	bh=wEgZesjWHRULdj0aq8mqOCyNSBILwvsW4dQtk9G8fJw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IPNn/FqINy9e0fVDGPCBa1OXGYhK5gPKtvbYb3gMyxfeyp1tEvIqa9Amzf934hQvGCnkYD8IM/mjl1a65G9+JQCq7es4OdOayfbN12AIMF0YfW+zvFbdVQKY2/SxfUmMeWQ1Cd1IaYjlGtUJovAgHMEvqDnabkozqFKa29A8AFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgMCz17A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgMCz17A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BCA1F000FF;
	Tue, 22 Sep 2026 04:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790052113;
	bh=FYB5S/b6MJ2mBC00lFkMl9q5wWY/JUieAXntSGr6wtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dgMCz17AvzifqmH82qqJ8AltGhx/QlGEOjui23VzSeACA7KlitQrNWSmBLOGzaSzt
	 XlAn+e4fg2c3GwLtny714YkKbvCwT8ubsskRihG48qjI3+1d1fRUzE9OcVXEX8ZPE0
	 iBMuHxte0uJlvxWexdQrewPS2SP92U79qQSjjIUiP2ELyuKTIPEQlEuFkq7Xj0C3yF
	 siVo92/5Ksiokxwq/rnywckd6karmFGBzyIKVj9vrPR0FdqSQcxlTilGnZPKSwCKWN
	 Yc0Ak8qznG8YUzQ8h4MfsxaHqgH+xF0U7kShQlWG7KQryYUHOL6yYt6VcXyumzLngP
	 6ti6tvCSqlXJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] iio: adc: rzg2l_adc: Add RZ/G3L ADC support for
 TSU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Biju Das" <biju.das.jz@bp.renesas.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260922042707.116378-8-biju.das.jz@bp.renesas.com>
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com>
 <20260922042707.116378-8-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 04:41:52 +0000
Message-Id: <20260922044152.D2BCA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: adc: rzg2l_adc: missing channel validation for RZ/G3L ADC1 ca=
uses state leaks and potential crashes
--

commit 6a30a731629fb5bab54f976d5c01c9fd5c2d8432
Author: Biju Das <biju.das.jz@bp.renesas.com>

iio: adc: rzg2l_adc: Add RZ/G3L ADC support for TSU

Add renesas,r9a08g046-adc1 compatible string and its hardware
parameters for the ADC1 IP on RZ/G3L, which is dedicated to
the on-chip TSU (thermal sensor unit).

> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
> index aaf7e2ceff8ab..c892e355b7398 100644
> --- a/drivers/iio/adc/rzg2l_adc.c
> +++ b/drivers/iio/adc/rzg2l_adc.c
> @@ -500,8 +500,17 @@ static const struct rzg2l_adc_hw_params rzg3s_hw_par=
ams =3D {
>  	.adint_inten_mask =3D GENMASK(11, 0),
>  };
> =20
> +static const struct rzg2l_adc_hw_params rzg3l_adc1_hw_params =3D {
> +	.max_channels =3D 9,
> +	.default_adcmp =3D 0x1d,
> +	.default_adsmp =3D { 0x7f, 0xff },
> +	.adsmp_mask =3D GENMASK(7, 0),
> +	.adint_inten_mask =3D BIT(8),

[Severity: High]
Does this mask inadvertently leak the interrupt enable state for channels 0=
-7 if
they are incorrectly configured in the device tree?

With max_channels set to 9, rzg2l_adc_probe() accepts channels 0 through 8 =
from
the device tree. If an unsupported channel (e.g., 0) is probed and accessed=
 via
sysfs, rzg2l_adc_conversion_setup() sets BIT(0) in the interrupt enable
register.

However, because adint_inten_mask is restricted to BIT(8), the driver's tim=
eout
and cleanup paths will fail to clear BIT(0):

drivers/iio/adc/rzg2l_adc.c:rzg2l_adc_conversion() {
    ...
		rzg2l_adc_writel(adc, RZG2L_ADINT,
				 rzg2l_adc_readl(adc, RZG2L_ADINT) & ~hw_params->adint_inten_mask);
    ...
}

Additionally, reading an unsupported channel data register in the ISR could
cause a synchronous external abort:

drivers/iio/adc/rzg2l_adc.c:rzg2l_adc_isr() {
    ...
	for_each_set_bit(ch, &intst, hw_params->max_channels)
		adc->last_val[ch] =3D rzg2l_adc_readl(adc, RZG2L_ADCR(ch)) & RZG2L_ADCR_A=
D_MASK;
    ...
}

> +};
> +
>  static const struct of_device_id rzg2l_adc_match[] =3D {
>  	{ .compatible =3D "renesas,r9a08g045-adc", .data =3D &rzg3s_hw_params },
> +	{ .compatible =3D "renesas,r9a08g046-adc1", .data =3D &rzg3l_adc1_hw_pa=
rams },
>  	{ .compatible =3D "renesas,rzg2l-adc", .data =3D &rzg2l_hw_params },
>  	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922042707.1163=
78-1-biju.das.jz@bp.renesas.com?part=3D7
