Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53E5367B83
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 10:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173562; cv=none; b=UEtlWy0qn1/YysTPNt5wx66LtLexhUJa2OrHnrPOpjU8S7BKRHhSFOTRj5lK/YJ4FwBs0rT+Fa03gUt9Z8uQe+64EZ+0zc5ZEVT7UFQ3TItyfrBHXpFYrneaFacXH7U0wZOJaBrayCuDZJnMJw5MBFO5Wip/obru/440fMWs8yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173562; c=relaxed/simple;
	bh=pZctcd1PryL5EoGrIsJlimGfwsmgSofeJNhNJtnB8tY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dKr+Xp2dXRzaZHEpacUfkPSKNoIytoD0gyTmdv9QyPKZ7oDm2UlLAG45ldZUfEDVbR40GRTDXV5lBHdt3g7Djk2kBTO3Lho3owfayafAMQx2pM4omKyvK3+fmaQFCBKfD3GV8DVPV+bnFW0zLJ3rkqW3Ulx0tooRSBrr90d1lA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gvt5C1f3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gvt5C1f3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1BC1F00893;
	Thu, 11 Jun 2026 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781173561;
	bh=a/SrpuYXNyYDR1KM8nnrUZSMl5wTcZFs+3TBeQ7esaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gvt5C1f3ZDTEqURxJhCItJnyECHLmbwgMDxdyN9q37coHLmiw31JuDOFS53B33uGg
	 pp9Yy4hjpHddmXFbBbFgt9G8IdpLvUkOPgbguo3mAxIVpp3/IPHZ5jT2KthL5fquMB
	 UGIOuTCarapFAPUf/Bbf+PhNlc5RqwXEdgw3x1+MOOhJ1VOigXMPMaF73NQLaCiksX
	 mSiw1JAuOpJcNuVMISpRZD27ColRa5xtW5lDHptUG2YvNwodEZzc5Y9m3TK+PfRpPB
	 LhAf6dLN136zBJqbUU09tmK4RHV5l3RR8H7JCi7O9KsAmE/phFImmWikkCG6tEaGj5
	 F4wE/HM012t7A==
From: sashiko-bot@kernel.org
Subject: Re: [net-next 1/9] net: ethernet: ravb: Remove gPTP control from
 WoL setup and restore
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se>
References: <20260610102432.3538432-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 10:26:00 +0000
Message-Id: <20260611102601.2B1BC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked return value of ptp_clock_register() leads to a kernel p=
anic in ravb_ptp_stop() on failure.
--

commit 4d5ada4dabf46fceeae07f219f72c4daaba09e17
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Remove gPTP control from WoL setup and restore

This commit removes the explicit stopping and starting of the gPTP clock
during Wake-on-LAN (WoL) setup and restore. This is because the ndev is
always closed and re-opened during system suspend and resume, which handles
the clock state automatically.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index 5f88733094d0f..77c0645a1c4d3 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[ ... ]
> @@ -3201,9 +3198,6 @@ static int ravb_wol_restore(struct net_device *ndev)
>  	if (error)
>  		return error;
> =20
> -	if (priv->info->ccc_gac)
> -		ravb_ptp_init(ndev, priv->pdev);
> -

[Severity: High]
This is a pre-existing issue, but since this patch involves the usage of
ravb_ptp_init() and ravb_ptp_stop(), does ravb_ptp_init() need to check
the return value of ptp_clock_register()?

In drivers/net/ethernet/renesas/ravb_ptp.c:ravb_ptp_init(), the return value
is assigned directly without using IS_ERR():

    priv->ptp.clock =3D ptp_clock_register(&priv->ptp.info, &pdev->dev);

If ptp_clock_register() fails and returns an error pointer like
ERR_PTR(-ENOMEM), priv->ptp.clock will hold this error pointer instead of
a valid clock or NULL.

Later, when ravb_ptp_stop() is unconditionally called during teardown or
driver removal, it executes:

    ptp_clock_unregister(priv->ptp.clock);

Could this cause a kernel panic when ptp_clock_unregister() dereferences
the error pointer (e.g., when locking the internal mutex via
ptp_vclock_in_use)?

>  	if (info->nc_queues)
>  		napi_enable(&priv->napi[RAVB_NC]);
>  	napi_enable(&priv->napi[RAVB_BE]);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610102432.3538=
432-2-niklas.soderlund+renesas@ragnatech.se?part=3D1
