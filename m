Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4D9389107
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425281; cv=none; b=qeTGLnpP84qpBmQCdBu+DHqnJyfwfONymeW3QHNIGc9rMp4X9JulGQ/1FGiVXZqBuxmEJttQnh+alSENd5vtbEluCBJ6sn2V15hGMoxeV7ONIrVQFqkjK2aTujKRM9W4nZLWod9YV7XffLq3W2FUps2/fGg5LJhcToz2Bz7f3WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425281; c=relaxed/simple;
	bh=UiAkNbstzmfBMw5To+3MYznTvZEt55pnYRHCLeLfzHo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u1i+kifdyjy8eDf3LgtnNsT1JC+IQl0eXSBeF3t+kfAwQLnCv1knHEo4gz0d0ILkXYWzMiXr35WepVQ0Y3HyI2bOZEfXlfh7Z+nfzFE2QOwRAOEIwRu1igmbj0kbgcXbeON72NrC9n+F6VDHWx09x0ld+tcYMr0ncZAOz7NkgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQVDV8j4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQVDV8j4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C721F1F00A3D;
	Thu,  3 Sep 2026 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425277;
	bh=36Am/Wy+EqbS9EN0at23Or+gaNITDeBu5EEpd7KHGwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MQVDV8j4nkrFGezRg2sySYQVyUjhDGZiVQCxk4vKMCL0k9VDB09DH7p8RYPsRdLNq
	 qLDH9oVU0AEeHnt1ChMNhTBiP9+7EbFEGREYxO2pCvKlcT0ZQPjSpj5KRl3ICMfejc
	 tQiog/9X3tIuAcxqwdHFKD5bXLLyf/VHSLbEUJfPjX/gN2dWOjI6y/AH6fiPVm+s7X
	 y/L373QHIZLklRwfjX/amjCwjGjkfK2G3yY8lZaN1OPT8OsxjvCgnoIitP5h7GTmT5
	 RH4miXrUvpvNBHR+DVzlLAvV3hyexaTe9Nvv2zbSODiaJA5nRXqk6AiKomNbXtximf
	 RR/vLUHdJTjCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 07/10] net: ethernet: ravb: Add callback for
 gPTP probe
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902084703.3228504-8-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-8-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:47:56 +0000
Message-Id: <20260903084756.C721F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Dangling pointer in `priv->ptp.clock` leads to double free and=
 use-after-free on error recovery paths.
- [High] Early shared IRQ registration in `ravb_probe` leads to Use-After-F=
ree and NULL pointer dereferences.
--

commit 252e91f926cfc67c49e9dd06194245579401d492
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Add callback for gPTP probe

This commit introduces a gPTP probe callback to accommodate different
generations of the RAVB IP and removes the gptp_ref_clk flag. It also
moves GTI computation into the callbacks to prepare for Gen4 support
where the clock is external.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[ ... ]
> @@ -2976,12 +2995,10 @@ static int ravb_probe(struct platform_device *pde=
v)
>  		goto out_reset_assert;
>  	}
> =20
> -	if (info->gptp_ref_clk) {
> -		priv->gptp_clk =3D devm_clk_get(&pdev->dev, "gptp");
> -		if (IS_ERR(priv->gptp_clk)) {
> -			error =3D PTR_ERR(priv->gptp_clk);
> +	if (info->ptp && info->ptp->probe) {
> +		error =3D info->ptp->probe(ndev);
> +		if (error)
>  			goto out_reset_assert;

[Severity: High]
This is a pre-existing issue, but does adding this new failure point expand
a hazard window with the shared interrupt handler?

In ravb_probe(), devm_request_irq() is called to register a shared IRQ
before priv->addr is mapped. If a premature IRQ is delivered, could it force
a panic by accessing an unmapped register?

Additionally, if info->ptp->probe() fails here, the error path jumps to
out_reset_assert and eventually out_free_netdev:

out_free_netdev:
    free_netdev(ndev);
    return error;

Could this leave a live devm-managed IRQ handler targeting freed memory if
the IRQ fires before the devm cleanup removes the handler?


[Severity: Critical]
This is a pre-existing issue, but is there a risk of a double free in the
error recovery paths related to the ptp clock?

When ravb_tx_timeout_work() initiates a reset, it can fail to re-initialize
the DMA. If it takes the error path without neutralizing the clock pointer:

ravb_tx_timeout_work() {
    ...
    error =3D ravb_dmac_init(ndev);
    if (error) {
        ...
        goto out_unlock;
    }
}

The error path leaves the device up, and a secondary teardown in
ravb_ptp_stop() (such as during ravb_close) will attempt to unregister the
clock again:

ravb_ptp_stop() {
    ...
    if (priv->ptp.clock)
        ptp_clock_unregister(priv->ptp.clock);
}

Since the pointer is freed during the initial timeout recovery but not
set to NULL, could this result in a use-after-free and double free when
ravb_close() is subsequently executed?

> -		}
>  	}
> =20
>  	priv->refclk =3D devm_clk_get_optional(&pdev->dev, "refclk");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D7
