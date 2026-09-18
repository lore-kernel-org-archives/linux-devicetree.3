Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04084331EA3
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692327; cv=none; b=GuppLAdmSAL2y4AXScYMf31zPzVwa7DomKSlcZ5XAQj1A78GsBRQKMLxaWlw/hpyDCbXBB/m4UX50T4/MEgEgFF8QOTzOHyoiINODGbo7CA3hEE4x7sXlMIZYoLnkLkk/rQvzQcRL8caZrLk5C/7WPjfPDWLelw37sT3lOPV+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692327; c=relaxed/simple;
	bh=0X/qpC3ZotYLkHua4A/RXAAs0CbF+KWhp5eFeOeDJ0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r5xG9IWbcbCKvd4E31rMEag29s3XS5ScIxV8hrZgTRPYBV+/lHxO+8pENftSVkP46S617asdZRF2koEo0coMJLn43cLwQAl43+R+kTMbEzAXIzIcjjuj7FxKVGYEessxWLM6jidp3BRyJHg4iCtgXsrcWxA762+vLH0APs/NHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPfoVJYE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPfoVJYE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5B21F00899;
	Fri, 18 Sep 2026 00:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789692324;
	bh=1+oeZhYbwY/ubAEl5/b/PTHfJxDjDe7UYzQF8hC9OZQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IPfoVJYERqSTwKDHekx3z1IQLcHQaFuGWjAPz2quzg1UquiLDT6xzS/eAPB5FAzGV
	 T5MqRRTwHt8l9SYS3BX76u+O3K5mTVKW5plzjnIiD5KEEcxLu4fit9k7hqYHQNNhWh
	 zb2RTxjixv1PWFNYCaodOxJI+lsW+sr+Yyk3dHWKN1/6oYCCjqZ7C5NE6+kY6LEbMD
	 ld7WgoI0xjVS/j+u0tIEV0eegPZ6oKI7/t/BKs8DhOIzOkwIVmdYn0aYnrlXHtE9ne
	 ddw789O39X39AIPb7fLYYdYE6Ohv6a7WHdqNnW/zd4PbAPHilkTwfxpdAKRZODgIYv
	 H6nMQodojn1yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 06/12] net: phylink: support late PCS
 provider attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916235200.20712-7-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260916235200.20712-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:45:23 +0000
Message-Id: <20260918004523.AF5B21F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] phylink: missing pl->supported update on late PCS attach
- [Medium] phylink: data race on pl->supported_interfaces during PCS hotplug
--

commit 09779c4042c55422798d0cff65f1f25068da26a9
Author: Christian Marangi <ansuelsmth@gmail.com>
Subject: net: phylink: support late PCS provider attach

This commit adds support for late PCS provider attachment to a phylink
instance. It introduces a FWNODE_PCS_PROVIDER_ADD event that allows a
PCS provider to be linked and supported interfaces to be refreshed if the
provider is added after the instance is created. If a link was previously
down, it can be re-established when the PCS returns.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 88570a59ba9e7..fb3fb522769b6 100644
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

[Severity: Medium]
Is it safe to conditionally skip rtnl_lock() on the FWNODE_PCS_PROVIDER_ADD
path?

Later in this function, pl->supported_interfaces is modified:

	phy_interface_copy(pl->supported_interfaces,
			   pl->config->supported_interfaces);
	list_for_each_entry(pcs, &pl->pcs_list, list)
		phy_interface_or(pl->supported_interfaces,
				 pl->supported_interfaces,
				 pcs->supported_interfaces);

Functions like phylink_validate_mask() read this multi-word bitmap
word-by-word while holding only rtnl_lock, without acquiring pl->state_mute=
x.
Could this lead to a torn read, causing concurrent ethtool operations to see
an invalid interface mask and reject valid configurations?

[ ... ]
>  	/* Exit early if nothing has changed */
>  	if (!resolve) {
>  		mutex_unlock(&pl->state_mutex);
> -		rtnl_unlock();
> +
> +		if (val =3D=3D FWNODE_PCS_PROVIDER_DEL)
> +			rtnl_unlock();
> +
>  		return NOTIFY_DONE;
>  	}
> =20
> @@ -2040,7 +2091,8 @@ static int pcs_provider_notify(struct notifier_bloc=
k *self,
> =20
>  	mutex_unlock(&pl->state_mutex);
> =20
> -	rtnl_unlock();
> +	if (val =3D=3D FWNODE_PCS_PROVIDER_DEL)
> +		rtnl_unlock();
> =20
>  	phylink_run_resolve(pl);

[Severity: Medium]
When a late PCS is attached, does pl->supported need to be recalculated
alongside pl->supported_interfaces?

If a late PCS provides new interface capabilities (such as new 10G link
modes), updating pl->supported_interfaces without also recalculating
pl->supported (via phylink_validate()) could leave the ethtool capabilities
stale. Could this result in phylink_ethtool_ksettings_set() rejecting valid
configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916235200.2071=
2-1-ansuelsmth@gmail.com?part=3D6
