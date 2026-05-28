Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445B2383C87
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958096; cv=none; b=C2Rdgupp7oV8NVTGiuipsUepcL3MTWyjz9qp5tVFpNNMIJO1JSK6XlkQTNj9MmHOVbQZSg/RGXYl/RCUJsddANWumaRHba7ijCO8gglkE0NiStFxVwmjNlI2e3Vm6MiwUXZBKq8GIzKGF0VGpolp4dV0q0sYirR/Vpm9MBut240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958096; c=relaxed/simple;
	bh=JPUTuk9vfQ7fMXMYULy9+l8DRpMkT7kVNCe4WV4Yl98=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aaO0qylzB0VCg92fWUebvYHMghzcV8ktFUf7s6isL00HH+5FwmHfUwb2c1/1diIichRAT/4D6OJzcUhZpmTKIuxPW5GIVuO1NPONGRuLLz8huLguC05RlzYQjN8tpzHThSYUjqnWK6KWCeUOIyszYHOgWWIx1lG+ilz6CkpQo+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEpnUQsX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEpnUQsX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962511F00A3D;
	Thu, 28 May 2026 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779958094;
	bh=V0ZbP1/dssyOPLY8ecQofmZmZIWkBtj/9Fo5VkNRfEE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEpnUQsXFqn8CZlMTUr3dpRannKXN/ddLa/+0rTogHMs+6ntgbUWdCcHInVWTTMpf
	 bayAupMCco2FVQo2ht7ntcobYXNboy8k+SaC2EfXgyfl9bOwUJdkEvVMSadThkhTua
	 Ay5fi904f9ODGfnEbRE5j5coWmPUMxX5m27yts/LfUjIuwsyNosSMGGJcwCh9BGFVJ
	 wmProGJo531X57ScCz0vciHgtbV1sXnQ6kifpZxeU0IJ2JYxRL+LL/lrgmn/94eAHU
	 //eD1OkZ5t984kRvGBTTD9qp8J/M7ri17oVhbfSF0jmbl56JoW9nsdv7vSpyMCZkKi
	 7PpbBBfKFV7Kw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] pinctrl: renesas: rzg2l: Generalize the power
 source code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Claudiu Beznea" <claudiu.beznea@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260528080439.615958-2-claudiu.beznea@kernel.org>
References: <20260528080439.615958-2-claudiu.beznea@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 08:48:14 +0000
Message-Id: <20260528084814.962511F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Acquiring an IRQ-safe lock without disabling interrupts causes loc=
kdep inconsistency and potential deadlocks.
--

commit 22349bc4fa49f3c73863f4e8930404081ba4603f
Author: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pinctrl: renesas: rzg2l: Generalize the power source code

This commit generalizes the get/set pin power source functions to allow
extension for other functionalities like I3C on RZ/G3S. It introduces a
register masks data structure and updates the register modification in
rzg2l_set_power_source() to use a generic read-modify-write approach.

> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/re=
nesas/pinctrl-rzg2l.c
> index ac42093fc579c..a648d75a2bd23 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c

[ ... ]

> @@ -1077,76 +1144,51 @@ static int rzg2l_get_power_source(struct rzg2l_pi=
nctrl *pctrl, u32 pin, u32 caps
>  static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, =
u32 caps, u32 ps)
>  {

[ ... ]

> -	if (pwr_reg =3D=3D OTHER_POC) {
> -		scoped_guard(raw_spinlock, &pctrl->lock) {
> -			val =3D readb(pctrl->base + pwr_reg);
> -			if (poc_val)
> -				val |=3D mask;
> -			else
> -				val &=3D ~mask;
> -			writeb(val, pctrl->base + pwr_reg);
> -		}
> -	} else {
> -		writeb(poc_val, pctrl->base + pwr_reg);
> +	scoped_guard(raw_spinlock, &pctrl->lock) {
> +		u8 tmp =3D readb(pctrl->base + offset);

[Severity: High]
This isn't a bug introduced by this patch, but since this change expands the
lock usage to all power source updates, could this result in a deadlock?

The lock pctrl->lock is an IRQ-safe raw spinlock, acquired with interrupts
disabled in functions like rzg2l_gpio_irq_disable().

Using scoped_guard(raw_spinlock, &pctrl->lock) disables preemption but
leaves local hardware interrupts enabled. If a GPIO interrupt fires on the
same CPU while this lock is held, and the client interrupt handler calls
disable_irq_nosync(), the system would attempt to acquire the already-held
lock.

Would it be safer to use scoped_guard(raw_spinlock_irqsave, &pctrl->lock)
instead?

> =20
> +		tmp &=3D ~mask;
> +		tmp |=3D field_prep(mask, val);
> +		writeb(tmp, pctrl->base + offset);
>  	}
> =20
>  	pctrl->settings[pin].power_source =3D ps;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528080439.6159=
58-1-claudiu.beznea@kernel.org?part=3D1
