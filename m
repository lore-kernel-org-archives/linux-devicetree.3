Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84A2352024
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293485; cv=none; b=tgg7Hykh+i0cF40OFhvMnrlcGOz+ED2s8WarUubeaYXuFyxijb4x+unJA+e4Y7bbIyu/CJmO9bgy1+vZRvKyozfnMBhRpNQnLj3UFu7LyUpTiuwmdd0s9g4VoBOz2jo2x69/zswbIppGG7qYr3oXq0JvE1Hkt1LQFhzhK0mDMiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293485; c=relaxed/simple;
	bh=VcViSfCqKuzRHJHzNBajDg/V1DBPt5STBVHZ1i/cIrU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RsKYLZKlbfu0c4x9kzUD9eoFG4LPE035POXe0S9tMUOBktvhTNSFxSdVmJ3pcayK1IuRNPusMO0abieRaDZxDQvCPh46LmcojqHILjPDpyz8nI2GY2FZ7GJ2In9qb3jsTbHAUul6ufxYiVdGLpM4kbvqw4xVI1pYD8cGMTagkXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyQktzbl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyQktzbl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0291F000E9;
	Wed, 20 May 2026 16:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293483;
	bh=aWqgRPW6W/P6RXTfg8d65pUNlrgUfF/Ex4LHRj3mF4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JyQktzblYKfCSr3/81ZGoNQnCm5ERgGlEdOCuHlyD3sBo8cSQnM7M116c8Ys9ONf9
	 RxrG5biE/OhZ27Qq548M7ZfrSyrNIXgZpnIV95wfKWBCIni0yCLov6R1ccw+Z1E/GK
	 EqOHHyUFxvaOid99Un+5uEc0Y/Qb9nImASmBnl3DL8gI0W7vvMvbZfDznFk0bAjmIs
	 QWw5vsUW/u/rrTcV6UcHSiLChxGmtPGy84m7jMs0oew3/TRft6p0ifDvCMOWVzwPZV
	 bWBNowuyAfDFKXJ3Qq/Q4jCyE2k0i2z6qZ9Z8qII6slK8/b1y/avhfqbqdBUprVvE8
	 8r6dHDpw8Zc5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] thermal/drivers: airoha: fix copy paste error on
 clamp_t low temp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520155525.22239-2-ansuelsmth@gmail.com>
References: <20260520155525.22239-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 16:11:22 +0000
Message-Id: <20260520161123.0F0291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to clear old thresholds or disable the thermal mo=
nitor when trip points are disabled, potentially causing an interrupt storm.
- [High] The interrupt handler uses a `switch` statement on a bitmask, sile=
ntly dropping events if both hot and cold interrupts are asserted simultane=
ously.
- [High] The thermal interrupt is requested before the thermal zone is regi=
stered, which can lead to a NULL pointer dereference.
--

commit e9247122d90d0d1f57f8075a6a171215a771b2d6
Author: Christian Marangi <ansuelsmth@gmail.com>

thermal/drivers: airoha: fix copy paste error on clamp_t low temp

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

[Severity: High]
This is a pre-existing issue, but does this function properly handle the ca=
se
where trip points are disabled?

If a trip point boundary is disabled (e.g., passing INT_MAX for the high tr=
ip),
its corresponding threshold register (EN7581_TEMPOFFSETH) is not updated. If
both boundaries are disabled, enable_monitor is set to false, and the monit=
or is
never explicitly disabled via EN7581_TEMPMONCTL0.

This leaves stale thresholds active in hardware. If the temperature crosses
these stale thresholds, the hardware will continue asserting interrupts.
Because the trip is disabled in software, the thermal core will not take
action to adjust the boundaries, which could lead to an unhandled interrupt
storm that can render the system unusable.


[Severity: High]
This is another pre-existing issue, but could the interrupt handler silently
drop events if both hot and cold interrupts assert simultaneously?

Looking at airoha_thermal_irq():

drivers/thermal/airoha_thermal.c:airoha_thermal_irq() {
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

	/* Reset Interrupt */
	writel(status, priv->base + EN7581_TEMPMONINTSTS);

	if (update)
		thermal_zone_device_update(priv->tz, event);
	...
}

If the hardware asserts both the hot and cold interrupt bits simultaneously
(e.g., due to a delayed IRQ handler combined with temperature fluctuations,
or a hardware glitch), the bitmask value matches neither case.

It will fall through to default, leaving update =3D false, and clear both
interrupts in hardware without notifying the thermal core.


[Severity: High]
This is also a pre-existing issue, but could requesting the interrupt before
registering the thermal zone lead to a NULL pointer dereference?

Looking at airoha_thermal_probe():

drivers/thermal/airoha_thermal.c:airoha_thermal_probe() {
	...
	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
					airoha_thermal_irq, IRQF_ONESHOT,
					pdev->name, priv);
	...
	priv->tz =3D devm_thermal_of_zone_register(dev, 0, priv, &thdev_ops);
	...
}

The driver does not explicitly disable or clear hardware interrupts prior to
requesting the IRQ.

If a bootloader or previous kernel left the thermal monitor running and
interrupts enabled, an interrupt can fire immediately upon request. The
handler airoha_thermal_irq() will execute and call
thermal_zone_device_update(priv->tz, event).

Because priv->tz is not yet populated, this would cause a NULL pointer
dereference during initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520155525.2223=
9-1-ansuelsmth@gmail.com?part=3D1
