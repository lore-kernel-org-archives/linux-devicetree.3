Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965C3074B1
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539128; cv=none; b=iDrzhZO+4iPLSMfz52N8FdupJcjX3j7U0ht3PH8dcOO0kRscM/y4BOWF9sNe8GX5d/WAu5hkVIDUcw8WpQAm8d7u37WvT2JmiFH+Jv6zwMEEAsSqX0ThfHLj7l6HmUVT1OxhOBU77BnMrHPfLGHNuCJzj3K9HXU8AN4ZfcmDZtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539128; c=relaxed/simple;
	bh=7RlC8foCkh+Br4WuYx6qBi1ByqY9ROalJtccalyxmiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Roq3f14aFVECdeh4ZA3YR8oOytrt6T+VlS6IFtO4BrSv+RotA/I9sduXACszkAMISC51w99555sxYhoQ6POew5Bu7Y4+IpecQ9H4MEKeKT99Y/IW+jdNsIVzFDxr0CL46BeeuxD4/ft94b+EvlgFUrQZR4QFBcAFQyZZ85G3VAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMQY3Wc1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMQY3Wc1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 177301F000E9;
	Mon, 15 Jun 2026 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539127;
	bh=lxOKg3QLiaf3s4oJlhlkue9Gx/+5ubH0c6qGpcsGblY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cMQY3Wc1BGkiDvbpSHnFmkh8rn3tRq6vpTGchNUxltFLG36F974oLSjlzBnqJBtin
	 Cni688EilDCNgZo7+f24N7DOjtM2Q5Lvkng+vqCsF09H27Uq9nJSSYKMvEK3JOo5q5
	 ZMQHkhAiOrsWF5zXgLN9PGUkhwgMaoEblsAnPRAfsmb+v4416sqG4JsJJASE/4vUtg
	 qTF4/DIwOOG3iKel0PUGsNeOAaY1UlB4vm30eSLZ2GE3r/V5ToXvyBS5nXLBLa6BJ6
	 cr4XjHht43D2bjv8TSJWWniwKrmplLFZ4GcTTbDyERHZV2XYGJ6DUCYYZm5KtZTkJ2
	 VvChaun298Ocw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and
 RZ/N2H SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 15:58:46 +0000
Message-Id: <20260615155847.177301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing validation allows RZ/T2H variants to fall back to SUBU mod=
e, which accesses physically non-existent registers, potentially causing an=
 SError or Data Abort.

Pre-existing issues:
- [High] If the optional `xtal` clock is omitted in the device tree, `rtc->=
sync_time` remains 0, leading to infinite tight-polling in `readl_poll_time=
out`.
--

commit af1aa184c32ed0a36cb0e267cb73522f881de94d
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs

Add a new compatible string "renesas,r9a09g077-rtc" to the OF match table
to support the RTC IP variant found on the RZ/T2H and RZ/N2H SoCs. These
newer SoCs integrate a closely related variant of the RZ/N1 RTC IP but lack
the RTCA0SUBU and RTCA0TCR registers.

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index 9f9cf9882fc49..dfff8dc8c3212 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -597,6 +597,7 @@ static int rzn1_rtc_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(rzn1_rtc_pm_ops, rzn1_rtc_suspend, rzn1_=
rtc_resume);
> =20
>  static const struct of_device_id rzn1_rtc_of_match[] =3D {
> +	{ .compatible	=3D "renesas,r9a09g077-rtc" },

[Severity: High]
The commit message notes that the new RZ/T2H variants lack the RTCA0SUBU
register and rely on rzn1_rtc_ops_scmp configurations. However, is it safe =
to
rely on the clock configuration to select between SCMP and SUBU operations?

In rzn1_rtc_probe(), the fallback to SUBU mode is based solely on the xtal
clock:

drivers/rtc/rtc-rzn1.c:rzn1_rtc_probe() {
	if (xtal) {
		rate =3D clk_get_rate(xtal);
		...
		if (rate !=3D 32768)
			scmp_val =3D RZN1_RTC_CTL0_SLSB_SCMP;
		...
	}

	if (scmp_val) {
		writel(rate - 1, rtc->base + RZN1_RTC_SCMP);
		rtc->rtcdev->ops =3D &rzn1_rtc_ops_scmp;
	} else {
		rtc->rtcdev->ops =3D &rzn1_rtc_ops_subu;
	}
}

If the device tree misconfigures the clock (e.g., rate is exactly 32768) or
omits the optional xtal clock entirely, scmp_val will be 0. The driver will
dynamically assign rzn1_rtc_ops_subu as the ops.

Subsequent operations like rzn1_rtc_read_offset() will directly access the
missing register:

drivers/rtc/rtc-rzn1.c:rzn1_rtc_read_offset() {
	val =3D readl(rtc->base + RZN1_RTC_SUBU);
}

Could this cause an unhandled SError or Data Abort when accessing the
physically non-existent SUBU register on RZ/T2H? Should the driver explicit=
ly
enforce the use of SCMP operations for this compatible string regardless of=
 the
clock configuration?


[Severity: High]
This is a pre-existing issue, but if the optional xtal clock is omitted in =
the
device tree, rtc->sync_time remains 0 since it is initialized by devm_kzall=
oc()
and the calculation block is skipped.

Later in rzn1_rtc_probe():

	/* Wait 2-4 RTC_PCLK clock cycles for the disabled controller to stop */
	ret =3D readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
				 !(val & RZN1_RTC_CTL0_CEST), rtc->sync_time,
				 rtc->sync_time * 2);

Passing a timeout of 0 to readl_poll_timeout() instructs it to never time o=
ut.
Combined with a sleep_us of 0, could this result in an infinite tight loop
if the hardware condition !(val & RZN1_RTC_CTL0_CEST) is never met during
probe?

>  	{ .compatible	=3D "renesas,rzn1-rtc" },
>  	{},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D12
