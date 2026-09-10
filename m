Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3130559CBF
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 17:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061523; cv=none; b=YiQXaZUmdfePlhEv6m2IVuDujHCSZgHfbhoZIyJgZsYYqM6KJFy2uvtVEWNuw05QOMTSAUqVy2nYKac6igZ1VBUe8PxL6iVLWnH98oBnPmuo4B2QD3QBH6cDZvcmgaV3yrupbF6zUkPsm82+xLaYBisoS9rjjeIqZCi6dZX/JWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061523; c=relaxed/simple;
	bh=7nYC2v25P7NIcnw5mpNYbuba08KaOhU0Twrf018QRAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BJJa5IVGG2Y0hZ3X8uOmQ2jNvNOGR/uRgYQ+BWC0PeabRYTZ0LwncZQxU0krlInsTz1iX+zABHaewJHP12ZDBVL44Qy8HFI9df9iQnZQvPEqLsy72MIJl6ENxH6iZN+WtXl8C0/IFDOR+s7vwBylh//YBC1p6/t9BmCIYqkJeA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKywjI/1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKywjI/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B8F1F0089D;
	Thu, 10 Sep 2026 17:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061507;
	bh=1N+0jw4vXB3tHffOgF5eM8o22mnSjKJyG+NffHaSxsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HKywjI/1zBI6vDd7ryPtp8Ny/Zt7jlZpVlMW6m7ZP/l35+Lh8RecCiv1qsjguw/Rs
	 8Ug39EyT6TAs00tw2AwUOleeE9sAZvg3m9pNbPEbhmzQ03qW66BJDaX9exQjTXntGj
	 w87nQJb64V5FnQ9TDtpdIS2EVLHD65dQyt7UCN+mLyNZrX7cM/2ShEHRU9Dm1yK55y
	 bJOIEDvrSk/kNtYqUfNbRJAP5WYXRndbSYNBa1/ADavIryLfPMxXVFwOj4Ftk9PvYu
	 npSmWmLOJ2kpAL78/dD/fC0drzAd87JFOMIo4STzSTp8pm3HIIliid8bb62QBO+WdN
	 3Fe159arKiE8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 02/10] net: ethernet: ravb: Move programming
 of gPTP timer interval
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260909173027.2201560-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260909173027.2201560-1-niklas.soderlund+renesas@ragnatech.se>
 <20260909173027.2201560-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:31:46 +0000
Message-Id: <20260910173147.08B8F1F0089D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect wait condition for GTI loading completion causes a read-=
modify-write race on GCCR.
--

commit f10e77bf451957f130f23e3dcc282e0d86b9d848
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Move programming of gPTP timer interval

This commit moves the programming of the gPTP timer interval from the
main RAVB logic into the gPTP initialization function. It also executes
this operation while holding the gPTP registers lock and attempts to
wait for the hardware to acknowledge the programming.

> diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethern=
et/renesas/ravb_ptp.c
> index 43218bc15b151..157fb78209c78 100644
> --- a/drivers/net/ethernet/renesas/ravb_ptp.c
> +++ b/drivers/net/ethernet/renesas/ravb_ptp.c

[ ... ]

> @@ -321,11 +321,20 @@ void ravb_ptp_init(struct net_device *ndev, struct =
platform_device *pdev)
> =20
>  	priv->ptp.info =3D ravb_ptp_info;
> =20
> -	priv->ptp.default_addend =3D ravb_read(ndev, GTI);
> +	priv->ptp.default_addend =3D priv->gti_tiv;
>  	priv->ptp.current_addend =3D priv->ptp.default_addend;
> =20
>  	spin_lock_irqsave(&priv->lock, flags);
> +
> +	/* Set gPTP Timer Increment Value. */
> +	ravb_write(ndev, priv->ptp.default_addend, GTI);
> +
> +	/* Request GTI loading. */
> +	ravb_modify(ndev, GCCR, GCCR_LTI, GCCR_LTI);
> +
> +	/* Wait for GIT loading to complete. */
>  	ravb_wait(ndev, GCCR, GCCR_TCR, GCCR_TCR_NOREQ);

[Severity: High]
Does this wait on the correct bits for GTI loading? The comment mentions
waiting for the load to complete, which is triggered by GCCR_LTI, but the
code polls GCCR_TCR instead.

Since the wait condition on GCCR_TCR is likely already met (no TCR request
active), this wait will return immediately.

> +
>  	ravb_modify(ndev, GCCR, GCCR_TCSS, GCCR_TCSS_ADJGPTP);

If the hardware is still processing the LTI request, could this read-modify=
-write
operation cause a race condition?

It might read the still-active GCCR_LTI bit and write it back to 1,
erroneously re-triggering the loading and potentially corrupting the gPTP
hardware state machine during normal interface configuration.

>  	spin_unlock_irqrestore(&priv->lock, flags);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909173027.2201=
560-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
