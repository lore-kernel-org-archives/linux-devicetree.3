Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D76F46982F
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099504; cv=none; b=ndf21ny5J0zuxF/STQls6Ojvy1AqkMtbrsxkRy+OsGQ9eNHvF/Z0VZ6AS3EcgOKurvEF4vsDlBcrSoGxgfsQ+nQMD2VLbnqADPdrV4XrLzGQsHRZSmUbvtL88sWlwSxUVx1KW1hgVkfgmt9IeSmymY0BjVGt6y3TMqoGKRSWzco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099504; c=relaxed/simple;
	bh=gRUwySTFehgV/XT07ehtZgr1FUenYmiEVVsBpN6uBLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LquQcZg2yz302kLtWG7eolhVXKfRVvyRqD9llr3yCZUUw6enek7w/Xb5AoRRbI74Jiml1aCYhHjnMjYaHhSGGENEOSek+sybEypkvtY7KcG/lDPaRknQqRvoB7PqEGrIqye0hWTseCFzBJxCmcwMDpixX+32pJEJgRcedx1iHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eNuXBxkN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eNuXBxkN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8578D1F000FF;
	Tue, 22 Sep 2026 17:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790099500;
	bh=rbbtJJN3xchuI87gglmeVW10S+JbnrDw6nc9i69QYY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eNuXBxkN/XPAfw6Ojwg8PxJwtolAbjOQ04wB47MLZfLxmOwhJmZIPWHAuFg1W0lZY
	 BIouq1g0coaKaf9B7r00DU/0HzJOtHPX7Kv2nzaA8CeUY5BYn3eCXAJMund1y46aS/
	 0Ny0muIyq+Kxo1w53DeObxqfVCXSNb6/ao7v7hWa3jeJNmwgmsfnXL1MOpna1OMg6y
	 PdRgti0j4ayaOWRS9mcq9X0W6zxO6rQCcoBYDijFE5HHeIZmnLVjMbii3E7XX3r2Hb
	 f6akJhhRs13AohfSme15S5EK40z6qYbb3VMq6dvIC4agRbrDrjHYSPXGyi3zIy9HeR
	 oFMd/RMJKIcEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 10/10] net: ethernet: ravb: Add gPTP support
 for Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921175037.4084310-11-niklas.soderlund+renesas@ragnatech.se>
References: <20260921175037.4084310-1-niklas.soderlund+renesas@ragnatech.se>
 <20260921175037.4084310-11-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 17:51:40 +0000
Message-Id: <20260922175140.8578D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] net: ravb: reference leak of of_gptp device node on probe failure
--

commit b1512d2d01596b4db2e1647ebacba3babfa69468
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Add gPTP support for Gen4

This commit utilizes the refactoring of the RAVB gPTP code to add support
for a system-wide clock on Gen4 devices. It adds ravb_gen4_ptp_probe()
which parses the ptp-timer property and stores the device node reference.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index ea1c7e536791e..5a07cc0180d8b 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c

[ ... ]

> @@ -2973,12 +3067,10 @@ static int ravb_probe(struct platform_device *pde=
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
> -		}
>  	}
> =20
>  	priv->refclk =3D devm_clk_get_optional(&pdev->dev, "refclk");

[Severity: Medium]
Does this code leak the device node reference on probe failure?

When info->ptp->probe() succeeds, ravb_gen4_ptp_probe() acquires a reference
to the ptp-timer node via of_parse_phandle() and stores it in priv->of_gptp.

If a subsequent initialization step in ravb_probe() fails (for example,
devm_clk_get_optional() or pm_runtime_resume_and_get()), the function jumps=
 to
error labels that return without dropping the reference:

drivers/net/ethernet/renesas/ravb_main.c:ravb_probe() {
    ...
out_reset_assert:
	reset_control_assert(rstc);
out_free_netdev:
	free_netdev(ndev);
	return error;
}

> @@ -3157,6 +3245,7 @@ static void ravb_remove(struct platform_device *pde=
v)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(dev);
>  	clk_unprepare(priv->refclk);
> +	of_node_put(priv->of_gptp);
>  	reset_control_assert(priv->rstc);
>  	free_netdev(ndev);
>  	platform_set_drvdata(pdev, NULL);

This properly drops the reference during removal, but shouldn't we also
have an of_node_put(priv->of_gptp) in the error path of ravb_probe()
to handle cold probe failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921175037.4084=
310-1-niklas.soderlund+renesas@ragnatech.se?part=3D10
