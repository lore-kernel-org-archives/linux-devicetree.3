Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2445C3451AB
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425281; cv=none; b=iC2LITO4UrL/41T2D+jVPC9y+WCFb2ifs/aR8gPxd5KZPyOu2SBUOKZCvr/vPiKROIjWXjMLDAyJGXOz2zFbq4ynS+1QEZhVKOB6Rd9c+/5g5oNsDsJ3XvTq9c9WGMO2ge85k+/iMjmrWIEYQPvPyYAyvJz7+O2OJ9ZOY5i3/4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425281; c=relaxed/simple;
	bh=sVdPt2M5fgJKvTBh2vJ7PNoW/uEAtOmmvGhWKB3duaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gAeCRKMlmL0vIzgFFA5leL94u1+kCtt3In9WjYm+ioxjd4cuYjuLTETYlo+Xr/K7243t5AqqNWMk4qXMheNfUkLFEMD7F1zbRyOb50Q5eVNbNllhC9v7IJuBPpVIhe2Tj0xXxsMatj3CKRE8bANxe6FbQsU0J8P+P67H6yziphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/zvo2x5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/zvo2x5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9B31F000E9;
	Thu,  3 Sep 2026 08:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788425279;
	bh=WqR4gIQd93tN/iN6GA80X++i23fkJdL3Ed8F7aLGm8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V/zvo2x5WBUpFx0MdUobLTd5I5OND8/5U6bMt9BjLYGrIQ4uYO+zsjs0K+vMQIp0i
	 wI8t5uSDD4MK4Xl/5QsYFf4hBxJscBmMTrqTOW0AhbLQV2k3u5f19boP+qOtt9aGYu
	 esaBYll96pQSEojIkEa6D/wCGPtdq97rxMqwg7TyFYRA7fAIDW5KG7Ne1Joxh050+F
	 GRUlGMkZrc+uj+knX5husryY4UyeLFI82Z+oHr1N301HbkRbL3mQ4wBLQQx2VuA55K
	 cEVzGWfcjGR3tQXB3OIx1JpgFwtE1IhJ9bs8M88eu6Rk48UyhsM7ayGUfhLweXv/u4
	 gfjGZLiRQ+UQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 08/10] net: ethernet: ravb: Add callback for
 gPTP clock index
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902084703.3228504-9-niklas.soderlund+renesas@ragnatech.se>
References: <20260902084703.3228504-1-niklas.soderlund+renesas@ragnatech.se>
 <20260902084703.3228504-9-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 08:47:58 +0000
Message-Id: <20260903084759.3F9B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Calling ethtool -T (get_ts_info) when the interface is down causes=
 a kernel panic due to a NULL pointer dereference in ptp_clock_index().
--

commit 861424103c229fb3c19f621c9c92a3cf127c7143
Author: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>

net: ethernet: ravb: Add callback for gPTP clock index

This patch prepares for adding Gen4 support which has an optional external
gPTP clock. It adds a callback to get the clock index and uses it to
determine if the device should report gPTP support.

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ether=
net/renesas/ravb_main.c
> index 7e53eca5327f5..402370e1be634 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -1773,8 +1773,13 @@ static int ravb_get_ts_info(struct net_device *nde=
v,
>  {
>  	struct ravb_private *priv =3D netdev_priv(ndev);
>  	const struct ravb_hw_info *hw_info =3D priv->info;
> +	int index =3D -1;
> =20
> -	if (hw_info->ptp) {
> +	if (hw_info->ptp && hw_info->ptp->clock_index)
> +		index =3D hw_info->ptp->clock_index(ndev);

[Severity: High]
This is a pre-existing issue, but does this safely handle an absent clock
when the interface is down?

If userspace queries timestamping capabilities (e.g., via ethtool -T) while
the interface is down, ravb_get_ts_info() will call the clock_index callbac=
k.
However, priv->ptp.clock is only initialized when the interface is brought =
up
in ravb_ptp_init().

[ ... ]

> @@ -2653,6 +2658,13 @@ static int ravb_gen2_ptp_probe(struct net_device *=
ndev)
>  	return ravb_compute_gti(ndev, priv->clk);
>  }
> =20
> +static int ravb_gen2_ptp_clock_index(struct net_device *ndev)
> +{
> +	struct ravb_private *priv =3D netdev_priv(ndev);
> +
> +	return ptp_clock_index(priv->ptp.clock);

[Severity: High]
This isn't a bug introduced by this patch, but will this crash if
priv->ptp.clock is NULL?

Because ptp_clock_index() dereferences the passed pointer without validatio=
n,
calling it when the interface is down and the clock hasn't been initialized
appears to lead to a NULL pointer dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902084703.3228=
504-1-niklas.soderlund+renesas@ragnatech.se?part=3D8
