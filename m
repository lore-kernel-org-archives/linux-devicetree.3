Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33324370D6E
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658146; cv=none; b=fLr8Ic2Zw11bmTc6OMD5wJSi8r8exZZL0WaXsoON2zIl5Q0rUJDMdLMQstN42tbCI5QwBgsrASOaTpjYcjOgL1RzvYHgiA0W1DaZN/aQHAr1dzlrVDWbWe4Co7YZ+gI86psVzYAC9cEjNtwngpwf4bCgYfQQtyfraiZUV++Q+nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658146; c=relaxed/simple;
	bh=blu+gsV8hbYUHK+OVpv4KGy2geC0khA/DvJkT4pXHWM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=NeL4vkYHkXfrWY2pu9HxaoRx3J6upiMrzgFRv5+Zr9B7NfUKoL8DNTPqfhOwQbAbu2sz8FRhPkFuvd6z7VX+VWY7NyXTwd3kmE5ox0RiWzzBZlkgJ3FBEcwqEKUXjO/Du39t0dmH1w9OXK51MV7r5sqpdg/ng8aAqzi2tb9bgnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+Mh/QP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+Mh/QP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E9101F000FF;
	Sat, 10 Oct 2026 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791658144;
	bh=ODAbBMgK7asDmVqmoES0VZyolNc2nc0vs13YkhgQtso=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m+Mh/QP0Y5mL3CYo2xqnBYaPpc49GEhNnqOYjx9zV8B2DeqcU8gwC4styqmCL15kn
	 Imamt1Px5qB85sBl0nX40kY6f7gjbMHOFSapnhX+dYMgRtl7cpN6tu2xSBktTGOGEj
	 SMoZchPf9UXTlfZqb/kuibX97J+ln425bqtnveHtq7vLEc/EYkvAtVOYZa5a8dGpcG
	 alf73RJRd9I9ZAwJa33E64euGVwaEdWqSItb7v8bq/L1osDofhPcuJHW5j8PrLAlCo
	 GnYCPMhAiDkt4cs6l1eutW1exMiewSfC6FBx7NyPdDRUKMKqGJYBzbWEi1s2fr4MHV
	 jhD9vTHke6a9A==
Message-ID: <sashiko-outbox-166832@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v18 06/12] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009182836.50631-7-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
 <20261009182836.50631-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:49:03 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: phylink: data race on link configuration bitmaps during phyli=
nk_create()
- [High] net: phylink: missing ownership check in phylink_add_pcs() allows =
list corruption
- [High] net: phylink: missing NULL check on fwnode_pcs_get_from_provider()=
 causes panic
--

commit a11bebdd45314996a29386a57e56a7d9d05dc180
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 019ce3d89da04..59283564f72ed 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1928,6 +1928,30 @@ int phylink_set_fixed_link(struct phylink *pl,
>  }
>  EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
> =20
> +static bool phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	struct phylink_pcs *tmp;
> +
> +	/*
> +	 * Make sure state mutex is locked to protect concurrent
> +	 * access to phylink instance PCS list from
> +	 * initial fill_available_pcs and late PCS attach
> +	 */
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	/* Make sure PCS is not already in the list */
> +	list_for_each_entry(tmp, &pl->pcs_list, list)
> +		if (tmp =3D=3D pcs)
> +			return false;
> +
> +	list_add_tail(&pcs->list, &pl->pcs_list);
> +
> +	/* Link PCS to phylink */
> +	pcs->phylink =3D pl;

[Severity: High]
Does this code allow corrupting another phylink instance's list?

If a firmware node misconfigures multiple MACs to reference the same PCS,
or a provider returns a singleton without exclusivity checks, the same
phylink_pcs could be returned to multiple phylink instances.

This checks if the PCS is already in the current instance's list, but
doesn't check if it is already owned by another instance (for example,
by checking if pcs->phylink && pcs->phylink !=3D pl).

If list_add_tail() is called when the PCS is already linked elsewhere,
could this silently overwrite its list pointers and corrupt the first
instance's list?

> +
> +	return true;
> +}
> +

[ ... ]

> @@ -2006,27 +2030,51 @@ static int pcs_provider_notify(struct notifier_bl=
ock *self,
>  	struct fwnode_pcs_provider *pp =3D data;
>  	struct phylink_pcs *pcs, *tmp;
>  	bool resolve =3D false;
> +	int count, i;
> =20
>  	rtnl_lock();
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

[Severity: High]
Does this create a data race between phylink_create() and pcs_provider_noti=
fy()?

In phylink_create(), the pl instance is exposed to the notifier chain before
the bitmaps are initialized:

phylink_create() {
  ...
  register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
  ...
  linkmode_fill(pl->supported);
  linkmode_copy(pl->link_config.advertising, pl->supported);
}

Because phylink_create() does not hold rtnl_lock(), if a new PCS provider is
added concurrently, this notification could fire on another CPU, acquire
rtnl_lock(), and modify these exact same bitmaps simultaneously. Could this
corrupt the advertised interfaces or capabilities?

> +		count =3D fwnode_phylink_pcs_count(pl->fwnode);
> +		for (i =3D 0; i < count; i++) {
> +			pcs =3D fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
> +			if (IS_ERR(pcs))
> +				continue;

[Severity: High]
Is it possible for fwnode_pcs_get_from_provider() to return NULL here?

Subsystem translation callbacks (like the provider's fwnode_xlate)
commonly return NULL to indicate no device is found. However, IS_ERR(NULL)
is false, which means a NULL pointer would bypass this check.

If pcs is NULL, it will be passed to phylink_add_pcs() where
list_add_tail(&pcs->list, &pl->pcs_list) and pcs->phylink =3D pl
will dereference it. Could this cause a kernel panic?

> +
> +			/* Trigger a resolve only if a PCS is actually added */
> +			if (phylink_add_pcs(pl, pcs))
> +				resolve =3D true;
> +		}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009182836.5063=
1-1-ansuelsmth@gmail.com?part=3D6
