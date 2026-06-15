Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442123FF88C
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539130; cv=none; b=A/w0/ghlCuT7D4aObwfPhh0a85Y2A6erzqvBG9F/wX6G7vCPtAHHyLmtPDlTxS0pSTHrMi7+nlbvAfst+nfAiH4Fpu1YUQX2mErBPCHRPAa1ARuANejJK2pAVE2YJv+Px73MIzunjx8IYsd7Ih5JqrlSdtd7dQ4rTLG3tqSo6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539130; c=relaxed/simple;
	bh=GwTyeCcAkmUMi+mtFHDrdyKccpK8Nf1MHUsXu3TPNr0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VSDQKNjRgaW8eTJ0nh7igIUWbPO7VKGxis+R0g+KtaUjCd55qGB/4Ch9h+xzwgSItvTvcgS7KrbrK/PuLnD9SyjEaVMPqzaEzDQB56bVYzYvtPok84Pms2ZacCtowaBDKntXIoOu5oVgsDbKPF947NnsUBDhfbm/s9zUbhzOOhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN9dqZCG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN9dqZCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9874B1F00A3A;
	Mon, 15 Jun 2026 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539128;
	bh=qLUVB67qyPlJXtQ1zJBFYTTWyUDg8hZP5RYyNcjpJwM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aN9dqZCGN1CLZCnTR0ZDD5EfN46EC3zgv7t1CiMu7Ptv5UX+GtjNMYYOLYIT22zkX
	 OVtWk+iexcHgyd6rBcfhlhSpBRUH2q23+EJkHL++Dsa2nDN4kX6Q0DSS6zqKaQpfE1
	 7uzTkAx4iMEThZtq2vtFZEn7lMXSdyeg0AUcr7BDPTA9bsv3ecEhWu+4Pn4sgw2//V
	 rKF8fkpto3I7VJtydN/040GuIW5nk96a4/0p9uylTONTp5hE9Tr71wGNVwCSjyLz5F
	 1zwxCgFySK3krC28tw+06h3gwGMCuiuVh8y3W0LQjveGLkzvV1iuzUsoBzzN0i2agw
	 Ja6f2vsTkKiCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/12] rtc: rzn1: Handle EPROBE_DEFER for optional pps
 interrupt
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260615154805.1619693-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 15:58:48 +0000
Message-Id: <20260615155848.9874B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] If the optional 'xtal' clock is not present, `rtc->sync_time` rema=
ins 0, causing `readl_poll_timeout` to use a 0 timeout (infinite wait) and =
`usleep_range` to use a 0 delay.
--

commit 5d75a1049c228d2049afaf29833f1b2f212837d4
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: rtc: rzn1: Handle EPROBE_DEFER for optional pps interrupt

This commit checks for -EPROBE_DEFER from platform_get_irq_byname_optional()
and handles the deferred probe request properly. It intercepts this specific
error condition, assigns it to the return value, and jumps to the
dis_runtime_pm label to avoid ignoring a valid probe deferral.

Fixes: eea7791e00f33 ("rtc: rzn1: implement one-second accuracy for alarms")
Cc: stable@vger.kernel.org

> diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> index c4ed437354574..f81d691c8b9a2 100644
> --- a/drivers/rtc/rtc-rzn1.c
> +++ b/drivers/rtc/rtc-rzn1.c
> @@ -465,6 +465,10 @@ static int rzn1_rtc_probe(struct platform_device *pd=
ev)
>  	}
> =20
>  	irq =3D platform_get_irq_byname_optional(pdev, "pps");
> +	if (irq =3D=3D -EPROBE_DEFER) {
> +		ret =3D irq;
> +		goto dis_runtime_pm;
> +	}
>  	if (irq >=3D 0)
>  		ret =3D devm_request_irq(&pdev->dev, irq, rzn1_rtc_1s_irq, 0, "RZN1 RT=
C 1s", rtc);

[Severity: High]
If the optional xtal clock is not present, does rtc->sync_time remain 0,
causing readl_poll_timeout() to use a 0 timeout (infinite wait) and
usleep_range() to use a 0 delay?

devm_clk_get_optional() returns NULL if the clock is absent in the device
tree, skipping the calculation:

drivers/rtc/rtc-rzn1.c:rzn1_rtc_probe() {
    ...
    xtal =3D devm_clk_get_optional(dev, "xtal");
    if (IS_ERR(xtal)) {
        ...
    } else if (xtal) {
        rate =3D clk_get_rate(xtal);
        ...
        rtc->sync_time =3D DIV_ROUND_UP(2 * NSEC_PER_MSEC, rate);
    }
    ...
    ret =3D readl_poll_timeout(rtc->base + RZN1_RTC_CTL0, val,
                             !(val & RZN1_RTC_CTL0_CEST), rtc->sync_time,
                             rtc->sync_time * 2);
    ...
}

In include/linux/iopoll.h, a timeout_us of 0 skips the timeout check
entirely, which could lead to a tight infinite loop and a kernel hard lockup
if the hardware fails to clear the CEST bit.

Additionally, rtc->sync_time being 0 causes usleep_range(0, 100) in
rzn1_rtc_set_time(), which may return almost immediately and violate the
hardware's explicit 2-clock-cycle delay requirement (previously hardcoded to
61us).

This regression was introduced by the commit 'rtc: rzn1: Dynamically
calculate synchronization delay based on clock rate' later in this series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.1619=
693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
