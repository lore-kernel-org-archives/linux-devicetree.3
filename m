Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A793290C7
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425282; cv=none; b=CGhI7yze8WKmvlWSw0L8kLdlb+yfyYiAJxXA+nrMrchtptdY0NLORqfDX/XEmmj61BoJ0cKJwBFfiIkonSmwAVWAOT0LEfZ9Rvq3UDQvUPeViWjHvt6jXU9E9PPoG5FnJloRx0YIOyiUhu4+sNaqlu+ombd/B7alNzwKoOrkbY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425282; c=relaxed/simple;
	bh=kn8byMIwC+WvVlRzwUWsoRf9bYeXQdkLls6bLXq3+0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bjEVrB7lQYYx9Sarlryqfeo1v3qje5PA78rPwsiGEfbAx2QSNPlx0mxst7goc+U17r75OFI3Uk7KweExdeUaIO1Oo13RZsRZ8rFTUVCNB4A8+TQV5s3LVltBuEGejEns233mAoPrg7OytumHB1P2hlqfDsjmcXvdsn178dhgtUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBflZGuq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBflZGuq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B1B1F00A3F;
	Thu,  3 Sep 2026 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425280;
	bh=gK1XUygrVZ9hUORjg9y5N86wbiPwDoaeUcVD5qFxybc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NBflZGuqbUJ/gVjAv6Caaf/Bo3jXmlH60b8KP3IX6nhAnmDZ460tRd1oM6lyM8TLN
	 I06q3D54rZ+OcHCQI+dYBuZtVGkMCPV3IaJgNwV4/rcFHxe+LnjYUTj6reEkhhU0HK
	 gD9oaZP6nfof66x/Uqk1EDe+dx7ZldBd343iCoEQ3dG1c8U/lOTOMvKQEx8A12Kd4m
	 qnspJd8e4E8Eu79HBQycXqjjUo9IcoKxxuYvkSDQIr+z5G+kRFIBZBCgWW3ETSbgST
	 HsL3Z9GuUT0yfy4CtTl5MPtbUQikufRHyFJkD3Rl0zewgkLTdj5Opwt3y2ADOT3gaa
	 tCnKli+xUubiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 02/10] net: ethernet: ravb: Move programming
 of gPTP timer interval
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902084703.3228504-3-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:47:59 +0000
Message-Id: <20260903084800.42B1B1F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The wait condition intended to synchronize GTI (gPTP Timer Incre=
ment) loading completion checks the wrong register bit (GCCR_TCR instead of=
 GCCR_LTI), leading to a tight race condition and potential hardware state =
corruption.
--

commit 9509ae0d35af26310454ae24d344c98a9575f582
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Move programming of gPTP timer interval

This patch moves the programming of the gPTP timer interval from the RAVB
main logic directly into the gPTP initialization function, ensuring it is
done under the gPTP registers lock.

> diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethern=
et/renesas/ravb_ptp.c
> index 43218bc15b151..157fb78209c78 100644
> --- a/drivers/net/ethernet/renesas/ravb_ptp.c
> +++ b/drivers/net/ethernet/renesas/ravb_ptp.c
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
> +
>  	ravb_modify(ndev, GCCR, GCCR_TCSS, GCCR_TCSS_ADJGPTP);

[Severity: Medium]
Are we polling the wrong register bit to wait for GTI loading to complete?

The comment says "Wait for GIT loading to complete", but the wait polls
GCCR_TCR instead of GCCR_LTI which was just set. Because GCCR_TCR is
likely already 0 (NOREQ), the wait returns immediately.

If the hardware is still processing the LTI load when the read-modify-write
on GCCR executes on the next line, could it read GCCR_LTI as 1 and
inadvertently write it back as 1?

By moving the GTI loading directly above this incorrect wait, does this
create a tight race window that might corrupt the hardware state?

>  	spin_unlock_irqrestore(&priv->lock, flags);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D2
