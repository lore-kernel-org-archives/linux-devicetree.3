Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9519D2673AA
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572551; cv=none; b=FG5/HDJSyw/I+posKO5ILZaQb6VutH4XATaSQ+OP6Cc7ZCPE3Z8DhHW9PPj5UEEFIdn0bOKRdwdsFfP3qRNFFpKGA18cUY0Oh4m0SIBG0cZyyknM6s7WQg6sjfEI/7KvXLS1bPz7Xu43sFpRo4SffSU1l3pttbmuPDQPoSVtd7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572551; c=relaxed/simple;
	bh=Cn/LMR4HrWBRp2wUH4PduCEEj/cSWAwTTT9M1tEN9m8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LTTHpvZyTFwZVJioQJCn6FlC1vF8qyyRolqSfk/d/2KaMToSNT7wQqh4CefvwH31hetl7/gTWrFEc5dKtm01NUc35GgFdLLEVYdVH/CwMvrhcXbJfYuaJTj4PUPxsP0FPeWyS/ChH2ddJPbt1a0ZYkU4KruopACnjtk5PIzi0m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbJddK4p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbJddK4p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB39A1F000FF;
	Fri,  9 Oct 2026 19:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791572550;
	bh=mP4q+RW8YoGIK09fv0V0N/rZaBIsy0jcFB71heqKAuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EbJddK4pUtqRrA7gUFyuB762YwAwG+ECGEEvDZqF74pLJQcxzH7mDHci+aOAGcxqa
	 iEdMwzDVCokf9jeptaoOQsnbaG3k37+0n7lZ/gRRJWEUXfqkYon1toShkejtdR9dQG
	 4UYH0T0Oi2L432ZMTc956b4obMBI/Gvf6klZYT2bpv0SGgrk+JBwcITW+MgDh+q4JB
	 bGfxIU+/pSjCGJE++qd53bYJ43/4LtTuBtNhSeA8haHG9RTWcbfR0cmdiA4/gu+Zsa
	 bcD72Ts5duNcPq+Ab/pUKSeNJFFftZcvu/SVegXN2CwveczJqXHV9aowmiPWvHkBSK
	 WxHdjh66KrkbA==
Message-ID: <sashiko-outbox-165990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] iio: adc: rzt2h: Add support for RZ/V2H(P) SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20261009184122.1378797-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261009184122.1378797-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 19:02:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pm: hardware stabilization delay is bypassed for SoCs without cali=
bration
--

commit b9111d7d4d36117212882ae96747fcfe15f3bdd8
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
iio: adc: rzt2h: Add support for RZ/V2H(P) SoC

Add support for the ADC found on the Renesas RZ/V2H(P) SoC, which shares
the RZ/T2H ADC IP but differs in channel count, sampling, calibration and
resolution support.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 0703c2025e3fc..be8273f3b61d3 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c

[ ... ]

> @@ -818,6 +1005,12 @@ static int rzt2h_adc_pm_runtime_resume(struct devic=
e *dev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D pwrseq_enable(adc->pwrseq);
> +	if (ret) {
> +		reset_control_assert(adc->rstc);
> +		return ret;
> +	}
> +
>  	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
>  		return 0;

[Severity: High]
The datasheet note below indicates a 0.5 =C2=B5s delay is required after
releasing the module-stop state before starting A/D conversion.

With the newly added RZ/V2H(P) SoC that lacks the calibration feature,
rzt2h_adc_pm_runtime_resume() returns early here, completely bypassing the
stabilization delay.

Will this lead to hardware being accessed before the analog circuit has
settled, potentially resulting in corrupted or inaccurate data on this new
SoC?

> =20
>  	/*
>  	 * Datasheet Page 2810, Section 41.5.6:
>  	 * After release from the module-stop state, wait for at least
>  	 * 0.5 =C2=B5s before starting A/D conversion.
>  	 */
>  	fsleep(1);
> =20
>  	ret =3D rzt2h_adc_calibrate(adc);
> -	if (ret)
> +	if (ret) {
> +		pwrseq_disable(adc->pwrseq);
>  		reset_control_assert(adc->rstc);
> +	}
> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009184122.1378=
797-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D8
