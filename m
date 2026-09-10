Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BDF376BF2
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031485; cv=none; b=fvYLVauLEnA80TSGBAkoO3t/1LJ9LT/jsIBC1HFqg0nJ7aq9/OMFq8IPPanVxsWEjmCyyOC1btO3kp3fgctgaJa+OqnwQP033BlDcWH4fWqOJ8633Td0HQw2ucQkPQwkROOIF0+va5MwsgHY7HUzBUvgIkaONQSiIX1B1i/5A7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031485; c=relaxed/simple;
	bh=4pCWENNfg3AY695/Y+nXhttLGUHxx6hZ9vZy57QYIGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i1T1VrFLGmeOow8T2MZtMQ8bYUZWIugXx7IxEBW7GArCWx/pWcbwZGaaHG9mZw6Lk0JaaO1hCfPWetN/LUMVsDzF1mVTpfOD3ko01nJ7TbE8xA5W+1wnM1n9npuL60fPB7UZnSJ6ci3v6Xv9CKXSr+X+SatiEQaO67nJH+Bej74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=co/dNel8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="co/dNel8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E270B1F000FF;
	Thu, 10 Sep 2026 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789031483;
	bh=zZXDp0LW2kPN1Jc1lXvslFYF4l2HYLdmJnsODP4MDxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=co/dNel88ZTQreSt4WZUaB9BKo2ZEPeyCm8btY+pzzh7QozuAZGzcAk0QgQ9eBETo
	 09M1AdDUtCkqpJkIGqxG9dnlPkLCVbr4MmsaI8yIbe0ixu0b27WR9sAPebjPAlI7kS
	 //VLshV1bN2aGJIeXI/U3Yy7RUC3QgSBLIqVL1kpAJ+XHipPNxIR1D5e+XQ3Ow7/w1
	 hM2Ilo1oSuzmQH/KmZa+Qiy4iqb+G55GU9oEcaEVTCXq6SJxiqODM5VAZ+V9grCSy0
	 qWupEnNXLJ1fBR0flWHcfXy+j98WgvEFIpbeiJP1PLUsMhTvK4D3uM22N9Lx5HG/KT
	 awm7jB5dwm2tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/9] iio: adc: rzt2h: expose sampling frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260910085430.3173166-7-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260910085430.3173166-7-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 09:11:22 +0000
Message-Id: <20260910091122.E270B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Spurious interrupt / stale completion race in the timeout path can=
 persistently corrupt subsequent conversions.
--

commit a15fac37325034f14ef0f8f0fcfbb6e8dc9066ff
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

iio: adc: rzt2h: expose sampling frequency

This commit adds support for exposing the sampling frequency attribute to l=
et
userspace control the conversion time. It reads the adclk rate to derive
the frequency and updates the single read path to use a timeout calculated
from the maximum possible conversion time.

> diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
> index 0460dffe189e2..8ba7b0fde8a19 100644
> --- a/drivers/iio/adc/rzt2h_adc.c
> +++ b/drivers/iio/adc/rzt2h_adc.c

[ ... ]

> @@ -124,13 +146,18 @@ static int rzt2h_adc_read_single(struct rzt2h_adc *=
adc, unsigned int ch, int *va
>  	/* Enable a single channel */
>  	writew(RZT2H_ADANSA0_CH_MASK(ch), adc->base + RZT2H_ADANSA0_REG);
> =20
> +	rzt2h_adc_set_sst(adc, ch, adc->sst[ch]);
> +
>  	rzt2h_adc_start(adc, RZT2H_ADCSR_ADCS_SINGLE);
> =20
>  	/*
> -	 * Datasheet Page 2770, Table 41.1:
> -	 * 0.32us per channel when sample-and-hold circuits are not in use.
> +	 * Conversion can take up to ~4.3us at the maximum configurable ADSSTRn
> +	 * (ADSSTRn + 13 cycles at 62.5 MHz), which rounds up to 1 jiffy. A bare
> +	 * 1-jiffy timeout can expire almost immediately if it's armed right
> +	 * before a tick, so add one more jiffy to guarantee the conversion time
> +	 * actually elapses.
>  	 */
> -	ret =3D wait_for_completion_timeout(&adc->completion, usecs_to_jiffies(=
1));
> +	ret =3D wait_for_completion_timeout(&adc->completion, usecs_to_jiffies(=
5) + 1);
>  	if (!ret) {
>  		ret =3D -ETIMEDOUT;
>  		goto disable;

[Severity: High]
This is a pre-existing issue, but does branching to the disable path on a=20
timeout leave the driver vulnerable to a race with the interrupt handler?

If the timeout expires and the hardware interrupt fires immediately after,
the ISR can execute locklessly and call complete(&adc->completion).

Since the disable path calls rzt2h_adc_stop(), which only masks the interru=
pt
at the device level without waiting for executing handlers via=20
synchronize_irq(), could the delayed interrupt complete the structure after
the next read operation calls reinit_completion() in rzt2h_adc_read_single(=
)?

If this sequence occurs, the next read could return immediately with stale
data, and its own triggered conversion could eventually interrupt and corru=
pt
the subsequent read, leading to a persistent desynchronization.

>  	}
> =20
>  	*val =3D readw(adc->base + RZT2H_ADDR_REG(ch));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910085430.3173=
166-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D6
