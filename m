Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3A1477E34
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986413; cv=none; b=qmbylboZzoM2sJdtOsRcBmp3iJrVO9GhlKreTBx2qZux26amraQsmn347fTwcTdxCSTaQ0ofuQAoBDR32x3SFH30FaygYOcPNDwkNIqFQGCysszBtC+9ThYRJTXjy02kGPfQkOOCQLbZ3F2HTDi6+bryuyNjAqsPNVBxu4yNxoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986413; c=relaxed/simple;
	bh=iGIY3MHkjnJPNZ8uoxYoEZ8zBqyWFn6s/1eA+iOMU3k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mT3Wn5kgNe9G90deCoSpzkIJWwHS6Pc52iAnlJBHy3UBwYqKNz8bJ+LGMqigMYJQDfKldlTpKuRIOXfdSxmIbnDSBfuivuEQAa5Q0O6bLXEoD43Nwj8vNME5wLno8yxd+nrUwyTlDNa9egOG3JVbXYp+LEoWOjkAAWd1FWIRY6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ano9fLU0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ano9fLU0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E021F000E9;
	Thu,  2 Jul 2026 10:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782986412;
	bh=keMx1RpANlxX0sbmsUK8g3i33XhLoE7A/zsxY8xp4+Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ano9fLU0ENrBJ2BQZ8Rnq3JeIUnqMB4rl2qtopiesMmDBGWgKGw93Zqvug9zKvIHB
	 j1c6vRoHBvFqJwBVHFNlKsQwExXYPeJmZoxdPrQsldi+WCqonP9DkWRuzev4eA8kwy
	 KZ2AHJgXOOr5VIOSfpSUFEUXphqIFL9dhDNq55zjlLDyNvsSf/LGBC1Iglv4aVdFNQ
	 oNGeYLfhO2LkibBispfqVKnVJnpiIE663zHueVlQaIqjQBjxw63Imh/ro/fXEr3KND
	 nKi1D7kkp0yTa8FWGphk/Qns8q6yb/n4Y/jsjLUpyxN0eJ1KjWHobk92k+fQbsEfke
	 0Fd7QeQg3h75Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/7] thermal/drivers: airoha: fix copy paste error on
 clamp_t low temp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702094846.17325-2-ansuelsmth@gmail.com>
References: <20260702094846.17325-1-ansuelsmth@gmail.com>
 <20260702094846.17325-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 10:00:11 +0000
Message-Id: <20260702100011.C7E021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to update or disable hardware trip point threshol=
ds when the thermal framework clears the boundaries, causing continuous spu=
rious interrupts.
- [High] The thermal IRQ handler silently drops valid thermal events if bot=
h high and low interrupt status bits are asserted simultaneously.
--

commit c9ebb221cc728a9aaa865333e7d5b41b485e09e1
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: fix copy paste error on clamp_t low temp
   =20
In airoha_thermal_set_trips, there is a copy paste error on clamping the
value for the low trip temp point. Fix it to the correct value and actually
clamp for the low variable.

> diff --git a/drivers/thermal/airoha_thermal.c b/drivers/thermal/airoha_th=
ermal.c
> index b9fd6bfc88e5e..439aa011b75c7 100644
> --- a/drivers/thermal/airoha_thermal.c
> +++ b/drivers/thermal/airoha_thermal.c
> @@ -273,7 +273,7 @@ static int airoha_thermal_set_trips(struct thermal_zo=
ne_device *tz, int low,
> =20
>  	if (low !=3D -INT_MAX) {
>  		/* Validate low and clamp it to a supported value */
> -		low =3D clamp_t(int, high, RAW_TO_TEMP(priv, 0),
> +		low =3D clamp_t(int, low, RAW_TO_TEMP(priv, 0),
>  			      RAW_TO_TEMP(priv, FIELD_MAX(EN7581_DOUT_TADC_MASK)));
> =20
>  		/* We offset the low temp of 1=C2=B0C to trigger correct event */
>  		writel(TEMP_TO_RAW(priv, low) >> 4,
>  		       priv->base + EN7581_TEMPOFFSETL);
> =20
>  		enable_monitor =3D true;
>  	}
> =20
>  	/* Enable sensor 0 monitor after trip are set */
>  	if (enable_monitor)
>  		writel(EN7581_SENSE0_EN, priv->base + EN7581_TEMPMONCTL0);
>
> 	return 0;
> }

[Severity: High]
This is a pre-existing issue, but I noticed the hardware monitor thresholds
aren't disabled when the boundaries are cleared.

If the thermal framework passes INT_MAX for high and -INT_MAX for low
to clear active trip points, enable_monitor will be false, but there is no
code to write 0 to disable the hardware monitor.

Could this lead to spurious interrupts since the stale thresholds remain ac=
tive?


Looking at airoha_thermal_irq() in the same file:

static irqreturn_t airoha_thermal_irq(int irq, void *data)
{
	...
	status =3D readl(priv->base + EN7581_TEMPMONINTSTS);
	switch (status & (EN7581_HOFSINTSTS0 | EN7581_LOFSINTSTS0)) {
	case EN7581_HOFSINTSTS0:
		event =3D THERMAL_TRIP_VIOLATED;
		update =3D true;
		break;
	case EN7581_LOFSINTSTS0:
		event =3D THERMAL_EVENT_UNSPECIFIED;
		update =3D true;
		break;
	default:
		/* Should be impossible as we enable only these Interrupt */
		break;
	}

[Severity: High]
This isn't a bug introduced by this patch, but does this switch statement
silently drop events if both high and low interrupt status bits are asserted
simultaneously?

If status & (EN7581_HOFSINTSTS0 | EN7581_LOFSINTSTS0) results in both bits=
=20
being set, it will fall through to the default case and ignore the events.

Since the IRQ handler is a threaded IRQ, could scheduling delays allow both
bits to be latched before the thread executes and cause us to lose thermal
notifications?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702094846.1732=
5-1-ansuelsmth@gmail.com?part=3D1
