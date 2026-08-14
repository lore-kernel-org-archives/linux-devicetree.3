Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFE53CA4A0
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696603; cv=none; b=BhS8iErcRuCIROj9ihcjC6IW5qBcO5A2UaUq4WKn2RoZIGua1gbGD/ZEVA9XSpg94RLcj24aQajKxXxIJ3RVy6j7LpkgR0vGiZ2rRjJdtoWSuAh59kaUnBjoMXfQ31bRdxopKpc4ekRlBNVpYflXGBelsW0UzLD9h6Ph5gtV8Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696603; c=relaxed/simple;
	bh=LcFVPn7QA1k3hZ65d9KMFAVLND8+qe+Tc4YpY5VxMY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vj69iulp/h5s+RHWNkRCmRHDp3s++LUwxbvgoM1nDwdhJZLhUDUsafxyYjXht6s6Rg50L8m3B+ZIcuG7Pv+Ot7ZU5TNdWXVwu8B/T7tcuEmYln3XH95I+aO5HsRUjVhlJxpWAqIERW/MDVKEpfqmeZ6oWTtpyKz1NNH11NmtyYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7GYTAr/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7GYTAr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B6C1F00A3A;
	Fri, 14 Aug 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786696594;
	bh=yyP+tbEv0sBLXylUdY7CT1t6ulBK7pZ/o5Sll0uOJvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H7GYTAr/EAN8hN530UFbofKD0O35/YK+WGR/IMCIs9iAsq3I0rRqIg4VC1N4cFszT
	 n2fAtWpNbFcgAt+wvrjsWYydGSDmudtzzxzY6QFusIA5aSzDBWhbXSRhfth/9rqf+2
	 pHzUM1WXLC9Ey8cSInsX+BKkVKdLRpcY44ELmTALdoN+jF2dIiDdlLzT1AllZpDMqS
	 SdBzegIqP0EpDyqagxeeteksscKDeWefpkiGV0xHXM35qy3wjIScgP0D7kiSSHjN2l
	 mpKAkn6hRoUcS6bs5P2qKsIX1uUzzgys1IALNgXcrfbORdfZNwNPW+31H1wMisMPXU
	 4+bZyKOdxZYZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 02/12] net: phylink: introduce internal phylink PCS
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813083536.970196-3-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
 <20260813083536.970196-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 08:36:33 +0000
Message-Id: <20260814083634.41B6C1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] phylink_create() unconditionally expands the MAC's supported inter=
faces with all PCS-supported interfaces, enabling unsupported MAC hardware =
modes.
- [Medium] phylink_validate_mac_and_pcs() fails to reject interfaces that r=
equire a dedicated PCS when no matching PCS is found.
--

--- Patch [2]: [PATCH v14 02/12] net: phylink: introduce internal phylink P=
CS handling ---
commit 6086d011ffb72e143c6102bee959c780b432bd7a
Author: Christian Marangi <ansuelsmth@gmail.com>

net: phylink: introduce internal phylink PCS handling

This commit introduces internal handling of PCS for phylink by allowing
MACs to provide a list of available PCS via phylink_config. It parses
this array and links the PCS list to the phylink instance. phylink
validation and configuration functions are updated to use this PCS list
instead of relying exclusively on .mac_select_pcs.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index e1e9f07f51bc6..6204e3bba16d7 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -530,9 +550,24 @@ static int phylink_validate_mac_and_pcs(struct phyli=
nk *pl,
>  		pcs =3D pl->mac_ops->mac_select_pcs(pl->config, state->interface);
>  		if (IS_ERR(pcs))
>  			return PTR_ERR(pcs);
> +
> +		pcs_found =3D !!pcs;
> +	/*
> +	 * Find a PCS in available PCS list for the requested interface.
> +	 *
> +	 * Skip searching if the MAC doesn't require a dedicated PCS for
> +	 * the requested interface.
> +	 */
> +	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
> +		list_for_each_entry(pcs, &pl->pcs_list, list) {
> +			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
> +				pcs_found =3D true;
> +				break;
> +			}
> +		}
>  	}
> =20
> -	if (pcs) {
> +	if (pcs_found) {

[Severity: Medium]
Should there be an explicit error return here if a dedicated PCS is
required but none is found?

If pcs_found remains false after the loop in phylink_validate_mac_and_pcs(),
the code skips the validation block without returning -EINVAL.

This allows the unsupported mode to pass MAC validation, which later fails
during phylink_major_config().

[ ... ]

> @@ -1908,16 +2028,31 @@ struct phylink *phylink_create(struct phylink_con=
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

[Severity: High]
Does this bitwise OR operation inadvertently expand the system's supported
interfaces beyond the MAC's physical capabilities?

By injecting all PCS-supported interfaces into pl->supported_interfaces,
generic PCS modules might expose high-speed modes that the attached MAC
does not actually support. Could this lead to the MAC driver receiving
configuration requests for unhandled interface types?

A similar capability expansion also appears to happen dynamically in
pcs_provider_notify() when a PCS provider is added:

    /* Refresh supported interfaces */
    phy_interface_copy(pl->supported_interfaces,
               pl->config->supported_interfaces);
    list_for_each_entry(pcs, &pl->pcs_list, list)
        phy_interface_or(pl->supported_interfaces,
                 pl->supported_interfaces,
                 pcs->supported_interfaces);

Is this intended?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813083536.9701=
96-1-ansuelsmth@gmail.com?part=3D2
