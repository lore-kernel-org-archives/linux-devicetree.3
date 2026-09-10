Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED50947DFA5
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 14:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049495; cv=none; b=IQ3oRkfGDWx72xr4vOix+TFHzNrS8cncazKvtQy0coZO0ntDfBffikcFPn4tvof0KJYR01VWQDKEocblYA6s6MDRJVe8jrZ/aMTCaJhT7ssmI5wkMW/PKCuewheBeYaQa7Fohj8iv1EFT6uPeBAJkYn7Oznz6TowRQp4CunX7Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049495; c=relaxed/simple;
	bh=2F/d3I50QswX/cMFAGd5wR/M4SA5wduDnN9iYastb9c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JZJiFvSW/b3obRLR2POiZqZk/KOAat2u28vJnvSFAf7MJ/ygZwunMum/gA5fHUX9Ka71K7uAv5PpXsQ29krfPcr7zvgoRGzQGMqhKpR1+A43GgOLFXyo7M/OHfXuCrfG6DlnFXAWcnNx3nWqlGjWEyRiFf8jJ1t9d3U4h0PcBW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMBGNz/a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMBGNz/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752791F00898;
	Thu, 10 Sep 2026 14:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049493;
	bh=NNiksNA8vhEO4yl/Xoiie6JJgXvF3Kb9lyOer/MzAGk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gMBGNz/aDnEY1W5+V6gihoiICVJ0U1qvh1lSjWCU7whiHoihdo29ufddjzYo/z7wI
	 9FRkO2AMlNkyqRUqgGzqv2U/HFIM1mtXwqP5ol9ckp3dWKG6t9wBTf3Dw5GPK+JSLL
	 dxWmkIHT0/EXWICxRn1F35icQzFvJhjalq6FvHCEr4rpDhz05OUvG7Oiqgp7LgQpsg
	 MqvBw8WHk87hEx9L78AcyXHVYOmbp/UVUD8iysbAXvqW7zqFjlJjocSFVWj1ekUxwI
	 6VYWnJ8C0l967CGwu8cfWabIcJCFmpBCv0idwpFvteUg5e+dkpaez9p3n2VMcIZ3Fz
	 NB9OwwTqzgQpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/7] net: dsa: mediatek: add support for
 passthrough mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909140346.2861572-4-cjd@cjdns.fr>
References: <20260909140346.2861572-1-cjd@cjdns.fr>
 <20260909140346.2861572-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:11:33 +0000
Message-Id: <20260910141133.752791F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] mt753x_check_passthrough() incorrectly rejects valid device tree t=
opologies, breaking probe for cascaded switches.

Pre-existing issues:
- [High] mt753x_conduit_state_change() misconfigures trap rules on downstre=
am switches by using a remote switch's port index.
--

commit 1d284e3e71056b81f501b69bacab596eedd52079
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: add support for passthrough mode

This commit adds passthrough mode support for MediaTek MT7530 switches. It
allows the main switch to pass all traffic to and from a downstream switch
without altering the DSA tag, which is useful when the downstream switch is
more capable but the upstream switch is an irremovable part of the SoC.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 9a50a492e6f08..58190e13813c1 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
[ ... ]
> @@ -3302,7 +3351,7 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
> =20
>  	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
>  	 * forwarded to the numerically smallest CPU port whose conduit
> -	 * interface is up.
> +	 * interface is up. NOTE: "CPU port" can also mean an upstream DSA link.
>  	 */
>  	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&

[Severity: High]
This isn't a bug introduced by this patch, but while noting that the CPU
port can mean an upstream DSA link, is it possible that the trap rules
are misconfigured on downstream switches by using a remote switch's index?

When a downstream switch is probed, mt753x_conduit_state_change() retrieves
the upstream conduit's port:

    struct dsa_port *cpu_dp =3D conduit->dsa_ptr;

It then programs the local switch's MT753X_MFC register using the remote
switch's port index:

    mask =3D BIT(cpu_dp->index);
    ...
    val =3D MT7530_CPU_EN | MT7530_CPU_PORT(__ffs(priv->active_cpu_ports));
    regmap_update_bits(priv->regmap, MT753X_MFC, ... val);

If the remote root switch uses port 6 as its CPU port, but the local
downstream switch's upstream link is port 5, wouldn't this route trapped
control frames (like BPDUs or IGMP) to a non-existent or incorrect port
on the downstream switch? Should this logic perhaps be using
dsa_switch_upstream_port(ds) to reference the local port?

[ ... ]
> @@ -3397,6 +3446,76 @@ static int mt7988_setup(struct dsa_switch *ds)
>  	return mt7531_setup_common(ds);
>  }
> =20
> +/* 1 if passthrough, negative if error. */
> +static int mt753x_check_passthrough(struct device *dev)
> +{
[ ... ]
> +	/*
> +	 * A switch is considered passthrough if exactly two available
> +	 * ports have an "ethernet" or "link" phandle.
> +	 */
> +	if (passthrough_ports > 2 ||
> +	    (passthrough_ports =3D=3D 2 && enabled_ports !=3D 2)
> +	) {
> +		dev_err(dev, "Only two ports allowed in passthrough mode\n");
> +		return -EINVAL;
> +	}
> +
> +	return passthrough_ports =3D=3D 2;
> +}

[Severity: High]
Does this logic inadvertently reject valid device tree topologies for
cascaded switches?

If a standard upstream switch has exactly one CPU port and one DSA link
(totaling 2 passthrough_ports), but also has multiple user ports
configured (making enabled_ports > 2), this check evaluates to true and
returns -EINVAL.

Could this cause the probe function to completely fail for standard
cascade topologies or single switches configured with two CPU ports?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909140346.2861=
572-1-cjd@cjdns.fr?part=3D3
