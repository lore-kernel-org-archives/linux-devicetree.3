Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F9D331ED1
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 00:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789692326; cv=none; b=AkTHzh1ij7J+C9yM1K42bBrN5/GUBox5qh545dX8H0Ho2O0aW5D6P7aDq76rBetIf3IEOeYXzZHIJJiqo7OLQR+naUh2vyB5R3u72Kx5A+JH3bkmk5+webXDs8N8fsbgAjr4PcApeHZ3lG+lcz9bxZhzWUMtN49uvNJoMkCnCZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789692326; c=relaxed/simple;
	bh=MShJypa6pDGGS4WxwDdVrVvgzPVZMekRKS6STghnZks=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uQ/7UFjmtyJjbMnXclfPl5Z1qeu0TtW3e5W/fCtMQpfC5+t8D9JccYVDLQkSFQD0/pj+4nQT81i1vCX5n55mtSXhOf9iM1oDlrzDksrPkfB9KtwWyUp3f8rwj+eG4ooR9r123SK5PILIh0x5Z1rIswXRTCtWsOx6D8UoZgJQMp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lReguS16; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lReguS16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30161F00898;
	Fri, 18 Sep 2026 00:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789692323;
	bh=1NJX2k6zIqevNNt3FckxBYjOpV4SgfIpQzk4HRgBn84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lReguS16XOk/+oEkXVcqdI3E21+X/Z0UfZ6IbBO9viJ+dcmYMT1dMV2bdddJ9hy2p
	 x6Bl2ZXj9Dd0IR0nKNQPUQLd6tssWfZJwQWHNnLH7d5gv1u9/jH37RFYfFsdAbz5+i
	 Ma/ZVChFZYywgquy8TpKfcSPLx+KhH7b8c8byEyMT1qbo1xOB4Y7a4z429FZjqau7P
	 Xrq1scnIYxuXsO+iCozKUaYhu+Ny6tOBRErc6851L9iE2nVE6H6U992RTBclKrqPJH
	 xhXVDaXdxSeirP9NkI97hUJGBp61iGdv1hGN6vwjcDEnV+ngUc7/egUH7C9PU8ayHt
	 AfdGD2lcem7mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v16 05/12] net: phylink: support PCS provider
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916235200.20712-6-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
 <20260916235200.20712-6-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:45:22 +0000
Message-Id: <20260918004522.E30161F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] phylink: stale linkmodes in pl->supported after PCS hot-unplug
- [Medium] phylink: torn reads of pl->supported_interfaces during pcs notify
--

commit 729bf8a9cf1a1b007e4c318df0f8ae3838564ec2
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: support PCS provider release

Add support for release of fwnode PCS from a PCS provider. This works by
creating a global notifier for the PCS provider and making each phylink
instance that makes use of fwnode subscribe to this notifier.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -1939,11 +1964,89 @@ static int phylink_fill_available_pcs(struct phyl=
ink *pl,
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
Does this code leave the ethtool linkmodes in a stale state?

When a PCS is removed, this block refreshes pl->supported_interfaces, but it
does not recalculate pl->supported and pl->link_config.advertising via
phylink_validate().=20

Could this result in ethtool continuing to report capabilities for a
dynamically removed PCS, leading to userspace attempting to configure
unsupported modes?

[Severity: Medium]
Is this multi-step update of pl->supported_interfaces safe from concurrent
readers?

The update copies the interface bits and then ORs each PCS in multiple
steps. If this happens during an event (such as FWNODE_PCS_PROVIDER_ADD)
where only state_mutex is held without rtnl_lock, it might expose an
intermediate, torn state to concurrent readers.

For instance, a concurrent thread could read pl->supported_interfaces in
phylink_validate() while holding only rtnl_lock:

phylink_validate() {
    const unsigned long *interfaces =3D pl->supported_interfaces;

    if (state->interface =3D=3D PHY_INTERFACE_MODE_NA)
        return phylink_validate_mask(pl, NULL, supported, state,
                                     interfaces);

    if (!test_bit(state->interface, interfaces))
        return -EINVAL;
}

Could this data race cause readers to observe an incomplete mask and
spuriously reject valid SFP modules or ethtool configurations?

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916235200.2071=
2-1-ansuelsmth@gmail.com?part=3D5
