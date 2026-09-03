Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB78411FA8
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425283; cv=none; b=o8OW+b05DKFVxdfmgLuf0GVw3n07to3g8l0mCJCNGXZBeHxqBqQs+jh1FMXPY81jhn0YDQ0mWVohIGIpn/HtAx7NcJEC+caJwJIusz6KXj2sSNUMh2F65DFO6/Urg+Z7fuS+/WWPB4qw9nHjsWdQnOdnfdc6QPcP3bCjlwL/tOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425283; c=relaxed/simple;
	bh=neh//r+dVxoFqSYLpwS4f/r6pQ1DmoEj/9tEytHFTKw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Xdw+Ekd8k8jFcOIUb6HgZt41c74HSPm3ACVrFJmtVgzzSIm91WhCmoZIPqxY6yvKwlHxMbU66es2y+jkhbmj/9IWJlKwBbCwLmfTeXg82Sb+Y9JPUVnesm3Umy7IF/F1LZR4nZzqXc8hBa9vC5c7nKxhOoPY4TZMipwLWrj0kxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDex25sS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDex25sS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199B91F00A3E;
	Thu,  3 Sep 2026 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425281;
	bh=lF7GVOj9RxLYp7RD22lm046c74Z5ppxHIHO28n4b8Vk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDex25sSvk3aWGR6Pto5l6o5iuLvQ74b5oEFUt1uYJSnTXMa41iYIEbQWSWL+nuJK
	 mKoZba5CfPlFdoj46OMKN+U42Fd+MVwjaoJ22N1hMntrpyDMhb3lNLXyQy6IAub2b9
	 4AMqhZRhPxUdqI9XhrOVj223ZscY30C5PT+Yv9E6bDdMQe1+iD/6Pt254TlwlskpA/
	 ECvllTFTG3sAnLVv3RmBh5Sl6KsB8pgwU20xaz4a7Y3AA91sIAAOVZ8KskNLqRw0IY
	 QBd5zX/kx1jJ64qEcQnV9M4pXd5y+hRcFPhkIW3Q9OpxA6bgvZn3NMFhPdG5CEN51U
	 5B4Boaz193pCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 10/10] net: ethernet: ravb: Add gPTP support
 for Gen4
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902084703.3228504-11-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-11-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:48:00 +0000
Message-Id: <20260903084801.199B91F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `of_node_put()` in the error paths of `ravb_probe()` cau=
ses a memory leak of the `ptp-timer` device node reference acquired by `rav=
b_gen4_ptp_probe()`.
--

commit d2e45518cd8b99519759a683fe36054ff2cdc88d
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Add gPTP support for Gen4

This commit adds gPTP support for RAVB Gen4 platforms by utilizing a
system-wide clock rather than an internal one. It updates the RAVB gPTP
driver code to parse and use an optional "ptp-timer" device tree property
for Gen4 devices.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -2752,6 +2752,57 @@ static const struct ravb_hw_info ravb_gen3_hw_info=
 =3D {

[ ... ]

> +static int ravb_gen4_ptp_probe(struct net_device *ndev)
> +{
> +	struct ravb_private *priv =3D netdev_priv(ndev);
> +
> +	priv->of_gptp =3D of_parse_phandle(priv->pdev->dev.of_node, "ptp-timer"=
, 0);
> +	if (!priv->of_gptp)
> +		return 0;

[ ... ]

> @@ -3188,6 +3239,7 @@ static void ravb_remove(struct platform_device *pde=
v)
>  	pm_runtime_disable(&pdev->dev);
>  	pm_runtime_dont_use_autosuspend(dev);
>  	clk_unprepare(priv->refclk);
> +	of_node_put(priv->of_gptp);
>  	reset_control_assert(priv->rstc);
>  	free_netdev(ndev);
>  	platform_set_drvdata(pdev, NULL);

[Severity: Medium]
Since priv->of_gptp acquires a node reference via of_parse_phandle() in
ravb_gen4_ptp_probe(), and is correctly released here in ravb_remove(), do =
the
error paths in ravb_probe() also need to call of_node_put(priv->of_gptp)?

If an initialization step fails in ravb_probe() in
drivers/net/ethernet/renesas/ravb_main.c after info->ptp->probe(ndev)
successfully acquires the node reference, the error paths jump to these lab=
els:

out_rpm_disable:
	pm_runtime_disable(&pdev->dev);
	pm_runtime_dont_use_autosuspend(&pdev->dev);
	clk_unprepare(priv->refclk);
out_reset_assert:
	reset_control_assert(rstc);
out_free_netdev:
	free_netdev(ndev);
	return error;

Will this leak the device node reference if probe fails here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D10
