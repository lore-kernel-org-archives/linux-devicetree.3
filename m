Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E58F35F161
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696606; cv=none; b=hhzCdJfrxPPAzN9iid39XuJEy29kXGBE90AIdBS/kegOgwb22/shDv/KUQTEA9O829zNEeE4fFgx0+UGkB+oPm7DXdcP+9EAePYCyk7fKLMjk6umSfJC4gS7tDhbHv2Sf9Dq25IcHy+4H1+RJQ/GyH3lr9umevN/FQFj/wpTtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696606; c=relaxed/simple;
	bh=k8KEmeWsO4IHXct2m0pCLpKV+ZOJgqfTgQCiLti9AA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ge61sxJzzdAqbH5HxptciQxze57WM0RAUOSfbCNaRq7AObShFMIuSqkmAU/k2ZDc1zxDY0KGb30Hmrqveze+0TarTXlNjuGPvWBxEU1TjRKZsraIFjDeoyM6Uqvw/Irfx8Ji32y7sQ2BYPB3eCDzl9/qXjKVKTTrICJZC5cK460=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpOiojos; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpOiojos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C860F1F00A3E;
	Fri, 14 Aug 2026 08:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696596;
	bh=ta4i1lxHDrsopYkPhc6aYcgrMf4LUJkHrkcOvZjl/WE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hpOiojoszRzs4MKIPrUWlC9urgLVKOB3GwRZbu7DGzwtd5KsO6hYt618FMMgETWgu
	 RW5TwWfBQCaeOpExL+T1+cWWCbLCXNTSmsB8jFk6Ib9hNv1wvFl9QfwymrRsMKhG8m
	 xe3S6VjzTd1mFIrth8Qlngbwc3buOjWoFYKwhBv7I0zar832rPGj/FcCpEOb4cx+ZN
	 J1jBK1Cl7xrpQH6zblneNyK57OMMidmXtqukdWtS8BM/diN+FBgoRgd6g0Gu3MAp1L
	 xRlJtOvL4RQTpZ9z7GgkzjXHpA+d5A1/PNKrkxKNAcOLkJcryUfeO/zuuJa1mruy8W
	 SkSXRVCqaXyqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 06/12] net: phylink: support late PCS provider
 attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813083536.970196-7-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260813083536.970196-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:36:35 +0000
Message-Id: <20260814083635.C860F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing `rtnl_lock()` during late PCS provider attachment causes a=
 data race on `pl->supported_interfaces`.
- [High] Late-attached PCS capabilities are not propagated to ethtool suppo=
rted linkmodes (`pl->supported`).
- [High] If the PCS provider's `fwnode_xlate` callback returns `NULL`, it l=
eads to a kernel panic in `phylink_add_pcs()`.
--

--- Patch [6]: [PATCH v14 06/12] net: phylink: support late PCS provider at=
tach ---
commit b6137c0cfab8a7a646c6cbf7cf50ad62dca0f51b
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach
   =20
Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> index 25b3248e8b93b..fef560eddf2a9 100644
> --- a/drivers/net/pcs/pcs.c
> +++ b/drivers/net/pcs/pcs.c
[ ... ]
> @@ -201,6 +205,24 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwno=
de_handle *fwnode, unsigned
>  }
>  EXPORT_SYMBOL_GPL(fwnode_pcs_get);
> =20
> +struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provi=
der *provider,
> +						 const struct fwnode_handle *fwnode,
> +						 int index)
> +{
> +	struct fwnode_reference_args pcsspec;
> +	struct phylink_pcs *pcs;
> +	int ret;
> +
> +	ret =3D fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	pcs =3D __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
> +	fwnode_handle_put(pcsspec.fwnode);
> +	return pcs;

[Severity: High]
If the provider's fwnode_xlate callback returns NULL, this function will
return NULL.

Unlike fwnode_pcs_get_from_pcsspec(), which sanitizes NULL to
ERR_PTR(-ENODEV), this function returns NULL directly.

Could this return value lead to a NULL pointer dereference in
pcs_provider_notify() where IS_ERR() is checked instead of IS_ERR_OR_NULL()?

> +}
> +EXPORT_SYMBOL_GPL(fwnode_pcs_get_from_provider);
> +
[ ... ]
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 967cc919a3656..ba3efdb0a1948 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -2004,27 +2025,57 @@ static int pcs_provider_notify(struct notifier_bl=
ock *self,
>  	struct fwnode_pcs_provider *pp =3D data;
>  	struct phylink_pcs *pcs, *tmp;
>  	bool resolve =3D false;
> +	int count, i;
> =20
> -	rtnl_lock();
> +	/*
> +	 * On PCS provider deletion hold rtnl lock as one of
> +	 * PCS can be currently in use by the phylink instance
> +	 * and ethtool OPs can reference it.
> +	 */
> +	if (val =3D=3D FWNODE_PCS_PROVIDER_DEL)
> +		rtnl_lock();
> =20
>  	mutex_lock(&pl->state_mutex);
> =20
> -	/*
> -	 * Loop all the PCS for phylink instance and check if
> -	 * this notification is relevant for some of them.
> -	 */
> -	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> -		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> -			continue;
> +	switch (val) {
> +	case FWNODE_PCS_PROVIDER_ADD:
> +		count =3D fwnode_phylink_pcs_count(pl->fwnode);
> +		for (i =3D 0; i < count; i++) {
> +			pcs =3D fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
> +			if (IS_ERR(pcs))
> +				continue;
> +
> +			phylink_add_pcs(pl, pcs);

[Severity: High]
If pcs is NULL here (because fwnode_pcs_get_from_provider() returned NULL),
the IS_ERR() check will pass.=20

Would this cause a kernel panic when phylink_add_pcs() dereferences pcs
to add it to the list via list_add_tail(&pcs->list, &pl->pcs_list)?

> +			resolve =3D true;
> +		}
> +
> +		/* Force an interface reconfig if major config fail */
> +		if (resolve && pl->major_config_failed)
> +			pl->force_major_config =3D true;
> =20
> -		phylink_del_pcs(pl, pcs);
> -		resolve =3D true;
> +		break;
[ ... ]
> @@ -2038,7 +2089,8 @@ static int pcs_provider_notify(struct notifier_bloc=
k *self,
> =20
>  	mutex_unlock(&pl->state_mutex);
> =20

[Severity: High]
Is it safe to update pl->supported_interfaces without holding rtnl_lock()
during FWNODE_PCS_PROVIDER_ADD?

The FWNODE_PCS_PROVIDER_ADD path intentionally omits taking rtnl_lock() and
modifies pl->supported_interfaces non-atomically via phy_interface_or()
and phy_interface_copy() just above this.

Concurrently, phylink_sfp_config_optical() reads pl->supported_interfaces
under rtnl_lock() but outside pl->state_mutex. Could this lead to a torn
read of the bitmap, causing valid link modes to be spuriously rejected and
SFP links failing to come up?

[Severity: High]
Does pl->supported (the ethtool linkmode mask) need to be recalculated when
new PCS capabilities are added?

This code refreshes pl->supported_interfaces, but it doesn't appear to
recalculate the ethtool capabilities mask pl->supported, which is normally
done in phylink_create() via linkmode_fill(), linkmode_copy(), and
phylink_validate().=20

If pl->supported is not updated here, will it remain permanently stale and
prevent the use of new speeds or link modes introduced by the late-attached
PCS?

> -	rtnl_unlock();
> +	if (val =3D=3D FWNODE_PCS_PROVIDER_DEL)
> +		rtnl_unlock();
> =20
>  	phylink_run_resolve(pl);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813083536.9701=
96-1-ansuelsmth@gmail.com?part=3D6
