Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284724FECF3
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 23:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790377388; cv=none; b=SD/YRBAad/TlY97r64g6MYenpM0yJxe4PZCzN1ymJJOR0W6NQ2mTdEWHRAPcGkEpCa2C+UGLH4FMLRKEzWZxyBluWFaA1N10s1Wi79gcmkXHVXwkNGtGaMSgvsCgOCosTlS+pD0i7prGT4UCbVvr2xFeay1eBns+KvSoQP6G3kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790377388; c=relaxed/simple;
	bh=8S0g24tD1fn1pNylSypmAX9S4kJvt4hae1mps3ZQvQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BQx8rlklHEviOL+4dNvyK3vUbfDw56hey4TwU4WBen++U1KmCxSFcsP4jJkqPPFpsGJS+gjQPlUxM9Dtyk6//ZALBMeKT5jD+clYXlzmNj6tKADeMmI0Wg0KHzdk+dIHQailltcl5UcqVmUbmNVf+wjwIymF0/BmCLN3pN3Cjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHG5z4t4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHG5z4t4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760AB1F000FF;
	Fri, 25 Sep 2026 23:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790377383;
	bh=ZsdMuXe+1FY/L6qPtJOSKL5dNfA9fJJhx/VQju6dCgA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GHG5z4t45qiwkZsOjPC1VCdJb4/lYIlqrsUuqrq+jXqWQbFOFI7jFn3iSoWOe9N6Z
	 m3YjVZeswweyX04ivHjxH4itcjgSdGeROZxF8e4vGvg+GmammKSkYXMGEI2Ua08Mdv
	 hZQKG5ztAGDNqiKzQ2Plx6Q4SP3aiKz2321bgRSYy7otIiKfEhHzFBcyzXBEHIXv+G
	 DALmZV+p8qNiCxElFZTBIKeBaiDmKLdMjlS0/8SUGjEDyU1bxGnIP/zUOPPdn8tfm1
	 YK5kBCr4eM9RhdWrZUEcxO2Jqj7J2xLetTbQ8OGF64MKicN7uP5VvDE7kYIOu1pojK
	 dC9JfjfeZbgsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v17 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260924230211.11519-3-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
 <20260924230211.11519-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 23:03:02 +0000
Message-Id: <20260925230303.760AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] net: phylink: validation succeeds even if required PCS is missing
- [Medium] net: phylink: unsafe expansion of MAC supported interfaces with =
PCS capabilities
--

commit 3acb4b7eb5c7e2219464ad7dfac9f59c3b6954b8
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces internal handling of PCS for phylink, allowing MAC
drivers to provide a list of available PCS elements instead of implementing
the legacy mac_select_pcs callback.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a98e62fa4bd26..1156e6c61a08b 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -530,6 +549,21 @@ static int phylink_validate_mac_and_pcs(struct phyli=
nk *pl,
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +	/*
> +	 * Find a PCS in available PCS list for the requested interface.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		struct phylink_pcs *tmp;
> +
> +		list_for_each_entry(tmp, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
> +				pcs =3D tmp;
> +				break;
> +			}
> +		}
>  	}
> =20
>  	if (pcs) {

[Severity: Medium]
When a dedicated PCS is required but none is found, does this skip the
validation block entirely since pcs remains NULL?

If the loop over pl->pcs_list finds no matching PCS, the function bypasses
the if (pcs) block but falls through to validate MAC capabilities,
ultimately returning 0 (success) instead of -EINVAL. Could this result
in phylink falsely advertising support for an interface mode the hardware
cannot use, breaking auto-negotiation fallback?

[ ... ]

> @@ -2031,16 +2150,31 @@ struct phylink *phylink_create(struct phylink_con=
fig *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
> =20
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret =3D phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		pcs->phylink =3D pl;
> +
>  	phy_interface_copy(pl->supported_interfaces,
>  			   pl->config->supported_interfaces);
> =20
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);
> +

[Severity: Medium]
Does this bitwise OR safely combine the MAC capabilities with the PCS
capabilities?

It appears to unconditionally elevate the generic PCS capabilities to the
top-level phylink instance, overwriting the MAC's strict capability
declarations. If phylink advertises support for interface modes that the
generic PCS supports but the specific MAC hardware does not, mac_prepare()
and mac_config() might be called with unrecognized modes, potentially
causing hardware configuration failures.

[ ... ]

> @@ -2076,11 +2215,20 @@ EXPORT_SYMBOL_GPL(phylink_create);
>   */
>  void phylink_destroy(struct phylink *pl)
>  {
> +	struct phylink_pcs *pcs, *tmp;
> +
>  	sfp_bus_del_upstream(pl->sfp_bus);
>  	if (pl->link_gpio)
>  		gpiod_put(pl->link_gpio);
> =20
>  	cancel_work_sync(&pl->resolve);
> +
> +	/* Remove every PCS from phylink PCS list */
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +		pcs->phylink =3D NULL;
> +		list_del(&pcs->list);
> +	}
> +
>  	kfree(pl);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does this cleanup properly
handle the legacy mac_select_pcs users?

While this loop correctly cleans up new users populated in pl->pcs_list, it
seems to neglect clearing pl->pcs->phylink for the currently active PCS
assigned dynamically via the legacy mac_select_pcs.

If pl->pcs->phylink is left pointing to the freed pl struct for legacy MAC
drivers, could a subsequent late interrupt from the PCS trigger a
use-after-free when phylink_pcs_change() is called?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924230211.1151=
9-1-ansuelsmth@gmail.com?part=3D2
