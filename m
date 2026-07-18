Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030E6369D4E
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 09:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365279; cv=none; b=ge1W3W0OQqzoJ2wEC0CV4OE2GApM0E+yUm6XPkDgxm85uAGJkLBSvxmUFA6B6w2cgNU28de3sukvK4xw8FDHEJTXzpjw53i1tE5OsU6H9veSy9As8paic6VeTiM9mTlzSnQwhr41ykjRsVKrh4yiRCMn9gY4x7xKPec4FTvZi/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365279; c=relaxed/simple;
	bh=gN72ZDEprL3AZi/fDwfEPfymnwrgQn1CkeTXlxRCqxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lICVHENA1/VNuOlrGvB1IV8f0tUsPY4M2NVpEMCfDKzR2maZh93G4PDzR527jBWVHI6TduLym9pEWxzJMOxLWBao9ca0RZWpaMBKk0SSTRV5B6XvCRnjVPPvBT1b7lXwfPnhMg7GYqmUtiYlgXpp666gswiwRw4Rce7Q9+teUX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngJsDzge; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngJsDzge"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD06A1F00A3D;
	Sat, 18 Jul 2026 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784365277;
	bh=zZRuZficSQajuqeRkmQ1oJa/9dReyJ3gu0Ofvm5hwsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ngJsDzgePrspaZ8Rk8DX9agLuQQ+slAQFcEVa4jehvNmeGI7kaiFgbeT73Fn1tCkO
	 VWDhLR/Dn57T+HsXT3zsfwOASd8CFN6DE718cPU4/+7WTchuMGgw8ZxAY9eobfWx7P
	 9CQ+1nPnTh/KC9VYk2RsgjyCO+bKYaG+A8oNq/Xwyzepg4qIEXMsCWpLO+x5HdPz6g
	 ruvCRUZMHKDAOW/boORLzI9QpeTZjcsvCkF1Bz/Y8Yx5+C9V56d/kYPO899YZz0Jcf
	 YIyMtNxi6fLKRXOOCpMA9Ex0IopB5EJoOCSwp5nM9X0fyh7hh0X8KHvClm9aFvGrJ4
	 TMlF0WaIWUW6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 06/12] net: Document PCS subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717065448.1498335-7-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 09:01:17 +0000
Message-Id: <20260718090117.AD06A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] phylink_create() returns an invalid non-error pointer (or NULL) on=
 invalid config->type.
--

--- Patch [6]: [PATCH net-next v9 06/12] net: Document PCS subsystem ---
commit 867ad4be39467be718a5df59cf2a9739b1c43531
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces internal handling of PCS for phylink, moving the
selection logic to phylink using the supported_interface value. It updates
phylink_create() to allocate and populate an array of PCS pointers from the
MAC, creating a linked list of available PCS devices. The changes also incl=
ude
new validation to ensure a selected PCS supports the requested interfaces.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 3464e3ec56997..d96941d4c5235 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -1854,13 +1964,17 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
[ ... ]
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret =3D phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
[ ... ]
>  	pl->config =3D config;
>  	if (config->type =3D=3D PHYLINK_NETDEV) {
>  		pl->netdev =3D to_net_dev(config->dev);
> @@ -1882,8 +2012,7 @@ struct phylink *phylink_create(struct phylink_confi=
g *config,
>  	} else if (config->type =3D=3D PHYLINK_DEV) {
>  		pl->dev =3D config->dev;
>  	} else {
> -		kfree(pl);
> -		return ERR_PTR(-EINVAL);
> +		goto unlink_pcs_list;

[Severity: High]
Can this jump to unlink_pcs_list return an invalid pointer instead of an er=
ror?

If config->type is invalid, the code jumps to unlink_pcs_list without setti=
ng
'ret =3D -EINVAL'. Because 'ret' still holds the non-negative result from
phylink_fill_available_pcs(), ERR_PTR(ret) will return a valid-looking poin=
ter
(or NULL) instead of an error pointer.

This would bypass the caller's IS_ERR() check and could lead to a crash when
they attempt to use the returned phylink pointer.

>  	}
> =20
[ ... ]
> +unlink_pcs_list:
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D NULL;
> +free_pl:
> +	kfree(pl);
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(phylink_create);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065448.1498=
335-1-ansuelsmth@gmail.com?part=3D6
