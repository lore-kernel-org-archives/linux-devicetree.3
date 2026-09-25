Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39944EE844
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377384; cv=none; b=qLUly50m2wtUNKF21Qm4TBidIC1MsmyEg//SgsIpip/emDnq7RUbm0umuI9fYQJQSsF3ai4TfvDZ2O+dzgNW+FM1TZVgHkzRy4DkPz4KZ9ERviLB5/rmp68K3/ptpaOObr2kHAmyqYfQCLlqXSf4SQeMzofWsSSDxSkKDXZt8aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377384; c=relaxed/simple;
	bh=UypX/2eOo7o4kRk0bYh7yB+InFbNkuqmbuuu65xMOW8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eDnTpQav5FkD4qNM0itGjnn0ziZOo7N44RGb0WmNI3YnLiJZ9wwW/VPmn7okrIEjfJpgQPC7FPjLPqgNio720WLZCrO3yTwaaLpAbDtBxyFWPXT6k540oXeY7whGtS8cZpI2MiVdTMOZWpZ9Do99u43ckjQtgHun8AhEY8xLPfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIE7TucB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIE7TucB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4310D1F00893;
	Fri, 25 Sep 2026 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377382;
	bh=74kUAdgGbYf0hcBqI97Ebbs4EiQv1Vp53G0v95dNXhI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIE7TucBPPpteW14hIZROyXZCRKiMhTd2Zq06Lio4QAKGz0UZA6kQd75Q3EdVWBLG
	 ou1V/cwH2HM7pfNLsi8xWUecHlG+ysbK+co4uHRYIdEwRXDMlcLbSHugMc7oJYVvJt
	 DAkjw1c3s9q0s2koCUpZWhW3EQb/T9LbLmSDvcMCO7f/VAwULbz5lRQeVZexFtOMJo
	 V9bNfCgXxD2VApBAnLVSAH5vze0rYKALfh72I59l7bYwVGK7zUgpY865ED9tTOOPbo
	 ZAy4fXAuSB/Xne4xIILoVLcI5E/sEFK+P0tdCCUOaE1f9iWL396EnJpMzXj9mg4nIk
	 0ucn70ae8Bq8A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 06/12] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260924230211.11519-7-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
 <20260924230211.11519-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 23:03:01 +0000
Message-Id: <20260925230302.4310D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: phylink: data race on link capabilities during FWNODE_PCS_PRO=
VIDER_ADD
- [Medium] net: phylink: initialization data race via early PCS notifier re=
gistration
- [Medium] net: phylink: spurious link capability recalculation on duplicat=
e PCS add
--

commit a7a4194143ec3bb732179891e559163a1b0eac1e
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support late PCS provider attach

This commit introduces support for late PCS provider attachment in phylink.
It handles FWNODE_PCS_PROVIDER_ADD notifications by looking up and adding
the PCS to the phylink instance. If a PCS is added, it triggers interface
reconfiguration and recalculates link capabilities.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 019ce3d89da04..b87655a09df85 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
[ ... ]
> @@ -2006,27 +2027,57 @@ static int pcs_provider_notify(struct notifier_bl=
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

[Severity: Medium]
Can this new add event race with phylink_create() during initialization?

During phylink_create(), register_fwnode_pcs_notifier() is called to handle
hotplug events, prematurely exposing the instance before its initialization=
 is
complete. Immediately after, phylink_create() mutates pl->supported and
pl->link_config.advertising locklessly.

If a concurrent FWNODE_PCS_PROVIDER_ADD event fires from another CPU,
this handler will execute and also mutate these same fields locklessly. Bec=
ause
neither holds pl->state_mutex or rtnl_lock for these mutations, a data race
occurs.

> +		count =3D fwnode_phylink_pcs_count(pl->fwnode);
> +		for (i =3D 0; i < count; i++) {
> +			pcs =3D fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
> +			if (IS_ERR(pcs))
> +				continue;
> +
> +			phylink_add_pcs(pl, pcs);
> +			resolve =3D true;

[Severity: Medium]
Will this unconditionally set resolve to true even if the PCS was already l=
inked?

In phylink_add_pcs(), if the PCS is already present in pl->pcs_list, it sil=
ently
returns without adding it. Setting resolve =3D true regardless causes an un=
necessary
recalculation of link capabilities and a spurious link resolve.

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
> @@ -2046,7 +2097,8 @@ static int pcs_provider_notify(struct notifier_bloc=
k *self,
>  	phylink_validate_mask(pl, NULL, pl->supported, &pl->link_config,
>  			      pl->supported_interfaces);
> =20
> -	rtnl_unlock();
> +	if (val =3D=3D FWNODE_PCS_PROVIDER_DEL)
> +		rtnl_unlock();

[Severity: High]
Does this code introduce a data race on the link capabilities during an add=
 event?

For the FWNODE_PCS_PROVIDER_ADD event, rtnl_lock is not held. Before this c=
ode
executes, pl->state_mutex is also unlocked.

Then linkmode_fill() and phylink_validate_mask() destructively mutate
pl->supported and pl->link_config.advertising locklessly. This races with
concurrent ethtool operations (which expect rtnl_lock to protect capabiliti=
es)
and with other concurrent add notifications, potentially permanently corrup=
ting
the bitmasks.

> =20
>  	phylink_run_resolve(pl);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924230211.1151=
9-1-ansuelsmth@gmail.com?part=3D6
