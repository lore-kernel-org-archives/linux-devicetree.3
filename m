Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A803AB27D
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539079; cv=none; b=Djzz9FjtjqEWcj02yihOdAS612/Z8A2DWdeYrfgjInmlegsWXqz84QFxfRSjZkwF+bzgUARaHXRbwGRCzL/WFCJc6RKXPfH5XW+7GVobwAIZx6z4vu4PrOcztIxkUzAbDZS78/6laJrR5gFLW1gjEbRZd3DUm7yqrxx1IyN+y9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539079; c=relaxed/simple;
	bh=/UZG00siKHTT8jwtIQPu6VVYGHcgEHbiZR433t8i/HQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CsjDKuYxZoJ8LJ5HctISRiT6uOaKY7MyQ3w2p7Tfafb9P6Zf8x3SSdNY7AATSQV24yl89kqj0wiq9b8tgNGqTJpithcO7TAnxyaPQNXxGqeZRgwv03oZ8FnWrVs1NYgBljOJ7qlQIP1RVZEUDA55PJGfibfWDBRg2l4JtT+HtHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYCofIoc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYCofIoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98F811F000E9;
	Mon, 15 Jun 2026 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539077;
	bh=2KJNyRPvTKUepdB7NhYywdPioE5Fl8BfIJqCE/Svk7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oYCofIocb9Vo8Y1J2+i2kWv5LmhKSlHBeWg6uMT5lQULvND9IoP87uXO82S21wUe7
	 KsY/KpUqzMtLoRPy2cZaWVVM7ts76juQTevQYU1/BSsO355WAUPW73GDhMIy31uE1u
	 Y+0l+fQXEmVFaTnn6okPBWTJ7KK9MzvoM1nJYagn3/2rr58XHsIcNKi+JYEfblZvKR
	 NCndtgg/FTZAZ+A4S7jdV6fmxCQi8Veg8wC2nJjbS/tUYvKJWW7wajwwSjyaMRmJqO
	 e0udSu7+coaX9u77nwPdtk3jfdOUa2PDrOCVXPeJZuoGKiUME7EtTtbjSIUrfOAKD3
	 8wshpnpQJAP2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/12] rtc: rzn1: Dynamically calculate synchronization
 delay based on clock rate
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260615154805.1619693-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 15:57:57 +0000
Message-Id: <20260615155757.98F811F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Uninitialized `rtc->sync_time` causing infinite polling loop and m=
issing hardware delays when optional `xtal` clock is absent.
- [Low] Semantic unit mismatch using `NSEC_PER_MSEC` for microsecond durati=
on calculation.
--

commit 1c4e11a547342229c6e4a580cb676efaab170aba
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rtc: rzn1: Dynamically calculate synchronization delay based on clock rate

This commit replaces hardcoded hardware synchronization delays with a
dynamically calculated time window derived from the runtime clock rate.
It stores the calculated clock cycles in the driver private structure to
adjust sleep boundaries dynamically.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 06339adae71f6..bc6af59744e48 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
[ ... ]
> @@ -124,8 +125,8 @@ static int rzn1_rtc_set_time(struct device *dev, stru=
ct rtc_time *tm)
>  		/* Hold the counter if it was counting up */
>  		writel(RZN1_RTC_CTL2_WAIT, rtc->base + RZN1_RTC_CTL2);
> =20
> -		/* Wait for the counter to stop: two 32k clock cycles */
> -		usleep_range(61, 100);
> +		/* Wait for the counter to stop: two RTC_PCLK clock cycles */
> +		usleep_range(rtc->sync_time, rtc->sync_time + 100);

[Severity: High]
If the optional xtal clock is missing, rtc->sync_time remains 0 because the
calculation block in rzn1_rtc_probe() is skipped.

Does this evaluate to usleep_range(0, 100), bypassing the hardware's
required minimum 2-cycle synchronization wait period?

[ ... ]
> @@ -433,17 +434,25 @@ static int rzn1_rtc_probe(struct platform_device *p=
dev)
>  			ret =3D -EOPNOTSUPP;
>  			goto dis_runtime_pm;
>  		}
> -
>  		if (rate !=3D 32768)
>  			scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
> +
> +		/*
> +		 * The internal clock counter operates in synchronization with the
> +		 * RTC_PCLK clock. Calculate the duration of two RTC_PCLK clock
> +		 * cycles in microseconds required for operations to complete.
> +		 */
> +		rtc->sync_time =3D DIV_ROUND_UP(2 * NSEC_PER_MSEC, rate);

[Severity: Low]
This isn't a bug, but the calculation uses NSEC_PER_MSEC to compute
microseconds. While mathematically equivalent to 1,000,000, could this
use USEC_PER_SEC to clearly reflect a Hz-to-microseconds conversion?

[Severity: High]
The driver retrieves the xtal clock using devm_clk_get_optional() earlier
in rzn1_rtc_probe(). If the clock is missing, the else if (xtal) block is
skipped entirely.

Does this leave rtc->sync_time uninitialized at 0 for the default internal
clock?

> +
>  	}
> =20
>  	/* Disable controller during SUBU/SCMP setup */
>  	val =3D readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
>  	writel(val, rtc->base + RZN1_RTC_CTL0);
> -	/* Wait 2-4 32k clock cycles for the disabled controller */
> +	/* Wait 2-4 RTC_PCLK clock cycles for the disabled controller to stop */
>  	ret =3D readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
> -				 !(val & RZN1_RTC_CTL0_CEST), 62, 123);
> +				 !(val & RZN1_RTC_CTL0_CEST), rtc->sync_time,
> +				 rtc->sync_time * 2);

[Severity: High]
If rtc->sync_time is 0 from the missing optional clock, the timeout argument
(rtc->sync_time * 2) evaluates to 0.

Since readl_poll_timeout() treats a 0 timeout as explicitly disabling the
timeout check, will this turn the wait into an infinite tight loop if the
hardware fails to respond?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D8
