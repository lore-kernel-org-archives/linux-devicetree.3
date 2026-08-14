Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD6A3EB7F4
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696598; cv=none; b=LpWpNiv/owg13/oMc9ihD6e4pRR3fHlwdnUJ3sMKPgd4Y99ReHWU8WrxugKyj4qsUT+HVbPnlsi1CArCofILXZtIecFs/mvyG/w+D9vCaO1XzPbL8iSYENJE3nNsUe6S5KN8ZaA/wLQ7zJk0d+TjggX/eiWklNkvm3pp654C2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696598; c=relaxed/simple;
	bh=1WqGkRKa3UYJses2NNFdh+4OynQ7zXVcp0lcl7svQxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UkB/99IlPKTx9ghP9h2sD9uo8uWvWXuAkqr5l4X8SdoggS8Ebb2FRj2Nu/XQeARLC8vBbT8DPulUgHPI9tTMvRSq33091hGD2XKQNDWuc++AxGYsOp1A4lSE/DBKo95Kbe/qen68UejzmW6qlwazN3FHLYJUSBSVmStl4i55ufw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGmnBhQ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGmnBhQ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E521F000E9;
	Fri, 14 Aug 2026 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696590;
	bh=vkdiOAnQruevDwznzINn6pgPVydei8L2EK6ahGNtv2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EGmnBhQ7DpLWJ33ClQpYLwi7dRMoz/YHaSA1a2IUjBDtAItIbQ6B04+kdPzhBn26X
	 U+57IY9t4vE9gGJ3dsXx06xMS9he4iiUZAlF3LEkt8j6L6au6aLYaqMufbMoLpkxuo
	 USIuFEXaTrM4NgeYPh1YrHi7IOP74VaNZn4TgOmfSm7FLiKm598/HVpB77tKUK43vN
	 m06+9z9i6QTt6+fi236Y0UPOqChsHaPCn3sJZEPrqVVkEWUKcumLnlm3i9EgIND83t
	 U6VfpapU22skxFrv4cOplIYDDzV0d72qLTUcAdxM2nJzawJb9G2MCDssOGODRcMZHy
	 TLqDkIZ832sDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 05/12] net: phylink: support PCS provider release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813083536.970196-6-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260813083536.970196-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:36:29 +0000
Message-Id: <20260814083630.05E521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Stale linkmode capabilities when a PCS provider is dynamically d=
eleted.
- [Medium] Data race on the `pcs->phylink` pointer could lead to a NULL poi=
nter dereference.

Pre-existing issues:
- [High] Unchecked error pointer dereference from `mac_select_pcs` in `phyl=
ink_inband_caps`.
--

--- Patch [5]: [PATCH v14 05/12] net: phylink: support PCS provider release=
 ---
commit 33b352668c4f60d5ab772e19eb7823565b80a8ab
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release
   =20
Add support for release of fwnode PCS from a PCS provider.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_DEL every time
a new PCS provider is released.

[ ... ]

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 82eae20daed00..967cc919a3656 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -998,6 +1010,9 @@ static unsigned int phylink_inband_caps(struct phyli=
nk *pl,
>  {
>  	struct phylink_pcs *pcs;
>  	bool pcs_found =3D false;
> +	int ret =3D 0;
> +
> +	mutex_lock(&pl->state_mutex);
> =20
>  	if (pl->mac_ops->mac_select_pcs) {
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config,
> @@ -1013,9 +1028,14 @@ static unsigned int phylink_inband_caps(struct phy=
link *pl,
>  	}
> =20
>  	if (!pcs_found)
> -		return 0;
> +		goto exit;
> +
> +	ret =3D phylink_pcs_inband_caps(pcs, interface);

[Severity: High]
This is a pre-existing issue, but can mac_select_pcs() return an error poin=
ter
here?

If so, the !!pcs check earlier in the function evaluates to true for error
pointers. Is it possible that phylink_pcs_inband_caps() is then passed an
error pointer, which it unconditionally dereferences?

> +
> +exit:
> +	mutex_unlock(&pl->state_mutex);
> =20
> -	return phylink_pcs_inband_caps(pcs, interface);
> +	return ret;
>  }

[ ... ]

> @@ -1937,11 +1962,89 @@ static int phylink_fill_available_pcs(struct phyl=
ink *pl,
>  	}
> =20
>  out:
> +	mutex_unlock(&pl->state_mutex);
> +
>  	kfree(pcss);
> =20
>  	return ret;
>  }
> =20
> +static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	list_del(&pcs->list);
> +	pcs->phylink =3D NULL;

[Severity: Medium]
Is it possible for a lockless reader like phylink_pcs_change() to access
pcs->phylink concurrently when a provider is removed?

If phylink_pcs_change() reads pcs->phylink without READ_ONCE(), and we do a
plain store here without WRITE_ONCE(), could compiler optimizations lead to=
 a
NULL pointer dereference?

> +
> +	/*
> +	 * Check if we are removing the PCS currently
> +	 * in use by this phylink instance. If this is the case,
> +	 * tear down the link, force phylink resolve to reconfigure the

[ ... ]

> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl =3D container_of(self, struct phylink, fwnode_pcs_nb=
);

[ ... ]

> +	/* Refresh supported interfaces */
> +	phy_interface_copy(pl->supported_interfaces,
> +			   pl->config->supported_interfaces);
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);

[Severity: Medium]
When a PCS provider is dynamically deleted and we update
pl->supported_interfaces here, do we also need to recalculate the global
pl->supported and pl->link_config.advertising linkmode masks?

Without calling phylink_validate() to update these masks, is it possible
they retain the stale capabilities of the removed PCS, causing ethtool to
report incorrect capabilities?

> +
> +	mutex_unlock(&pl->state_mutex);
> +
> +	rtnl_unlock();
> +
> +	phylink_run_resolve(pl);
> +
> +	return NOTIFY_OK;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813083536.9701=
96-1-ansuelsmth@gmail.com?part=3D5
