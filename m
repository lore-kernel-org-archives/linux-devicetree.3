Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864173C9881
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173563; cv=none; b=jw2xWlz3xtyhudZfhvAeD+jd3Nt8FddFsfYs9PkYPO8RwAissjs7dvXnybBNwvphoxr8L1gUTrkq7Isg+njkhO8gNMoTZ4uGnAdixaciaKTjUSDIttt+5TMK+U/hok9fivHIL4SasCrwq1a2NCq9qrRTLKxrC9mMKfZmyueoSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173563; c=relaxed/simple;
	bh=hSDKZQ4tTmSNzfAPJvy+Nolz2bEyMYfcoNR+njZ/Yiw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YIE/ambI6ST4caoILWapx7zQtW/pkuNuUZAwxaB2CVpY2VYsjtmNEZqJENh+6N7Gd5azHvrKIivTdNLUeilCmyjw+b6wQKKFufgYE5/RV5MOBPrtUaxLLc0HiBF5dbqRxr4f+xbyylseaKlVobM27si9DhS5klkQ44naOxELBP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mnU+2Bfm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mnU+2Bfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ED31F00898;
	Thu, 11 Jun 2026 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781173562;
	bh=BG1WbmJEN+vaiDDvcFovlXWOyh88WiyL68y7hqZTuz0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mnU+2BfmZcxCvAyN1w6Lsfvxw+kexE1dkr7jlBTCyKMS8DKhrEO5Qcv+EJ3mrH9w5
	 VbcuxC+D8iM/+M0vXWzSoCoyTf38kiCdxcsUG02G6GIklKA6dkhPhQqHu7HgOQzEFq
	 Hu66bcDHhPlVKuInJ2sSOXSlCkZ9FEWD0DathQi9U6ujdHarEcbSMe3uEUNyFz9lVo
	 ekE0FWTPQJd7NGR1Uz8mtaAK/gRD+OkkeUBerZR46E5TFdc5gzMyIFjs/pI70CDnNa
	 slA3/MLfEHTbByK9cgjvfWxb3uY/rVks1Ot2Xs9fHiihejBCu3lARZmFBwUexM3ARO
	 KrFy3iVvK3g9g==
From: sashiko-bot@kernel.org
Subject: Re: [net-next 2/9] net: ethernet: ravb: Move programming of gPTP
 timer interval
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610102432.3538432-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260610102432.3538432-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:26:01 +0000
Message-Id: <20260611102601.F2ED31F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The gPTP initialization sequence incorrectly waits on the GCCR_T=
CR field instead of GCCR_LTI after requesting a timer increment load.

Pre-existing issues:
- [High] ravb_ptp_init() assigns the result of ptp_clock_register() to priv=
->ptp.clock without an IS_ERR() check, leading to invalid pointer dereferen=
ces.
--

commit 105bd561296a957da9d4e09fecae37137d532c98
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Move programming of gPTP timer interval

This commit moves the programming of the gPTP timer interval into the gPTP
initialization function. This allows the programming to occur while holding
the gPTP registers lock.

> diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethern=
et/renesas/ravb_ptp.c
> index 226c6c0ab945b..7c78f75cb284a 100644
> --- a/drivers/net/ethernet/renesas/ravb_ptp.c
> +++ b/drivers/net/ethernet/renesas/ravb_ptp.c
[ ... ]
> @@ -319,11 +319,20 @@ void ravb_ptp_init(struct net_device *ndev, struct =
platform_device *pdev)
[ ... ]
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

[Severity: Medium]
The commit message states the goal is to wait for the timer interval
programming to be acknowledged by the hardware. Does waiting on GCCR_TCR
achieve this?

The code requests the load by setting GCCR_LTI, but the wait immediately
follows on GCCR_TCR. Since GCCR_TCR is typically 0 at this stage, the wait
will return immediately instead of waiting for the hardware to clear GCCR_L=
TI.

Could the subsequent ravb_modify() on GCCR execute before the hardware
clears GCCR_LTI, potentially writing a 1 back to it and disrupting the
initialization sequence?

> +
>  	ravb_modify(ndev, GCCR, GCCR_TCSS, GCCR_TCSS_ADJGPTP);
>  	spin_unlock_irqrestore(&priv->lock, flags);

[Severity: High]
This is a pre-existing issue, but looking at the rest of ravb_ptp_init()
just below this lock:

	priv->ptp.clock =3D ptp_clock_register(&priv->ptp.info, &pdev->dev);
}

Should there be an IS_ERR() check here?

If ptp_clock_register() fails, it returns an ERR_PTR. Because the driver
does not validate the return value, priv->ptp.clock would hold this error
pointer.

When the interface is brought down via ravb_ptp_stop(), or when a hardware
PTP interrupt occurs, this pointer is passed to ptp_clock_unregister() or
ptp_clock_event(). Since neither function checks for error pointers, would
this lead to a panic from an invalid pointer dereference?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610102432.3538=
432-3-niklas.soderlund+renesas@ragnatech.se?part=3D1
