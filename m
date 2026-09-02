Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7053370EA
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337855; cv=none; b=hXKiwN9e1yV1NjJR99z35oYB70ope1c+cnPw7kCmJ6InAVIbB1LsbrU9FIS7IZoabDSM2pd057/tx3//uZSGW3eMdRfZijMG6p6n+0PUCvMBe56DUAytFC+uQcan5wkFh7u9OpxdvYpU2YLRPv41ZS2rupg/rrp3uMxbtTkt+zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337855; c=relaxed/simple;
	bh=1C+a85/ZpM8MQqdNsT4kifxiAVQ4TDVD2hL+ZbQwk6s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mGJALu9matYibQacJKQTu3lcaZSnqnDvH7EGC2VuGLdyLQFEF5g1xGOBOtS6XM3bHKQipKLx/U2US4W9AzXTzDOvC8ZM+NtnBYdcUGyNf/JaDWaqmmhaJB2F6yTCR0IzlIy6ehOzH7na4oVDqA2YtHEIvYMMcSw/C4GfRO1Zl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGox8+6c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGox8+6c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DB01F00A3A;
	Wed,  2 Sep 2026 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788337854;
	bh=hNbD7VEm0z037MGXCyu4gs2xgPh4fhIFV3nF13TVlMk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cGox8+6cGCsV2iDrFrLXerlD+lQTN2sI0lvp2zP/QqxtL6hX5F71SVPo9km3gW2ar
	 RtySnn2ZJkI/CRzV7ruO6M92ByVyPeJG0EAgHxsSh8o+uzq6A3OuS9BomSo+rUzW/9
	 1aVs8AEDX5vetlZtgi+3TvccXyCckZjgZJwlajEzJmd+HoI+NgqGf1vG93rPC09byU
	 tFg5nA/I5ATYZCaAoqvh8kHDv3ECm52nyhKkRC1I64TKjUMwxk96fv0OXl8DbD6iCL
	 pc/vKoHRUq8Da/hkTFOLgo1Sj2eMd4DbWDqCTEJzJcLvUN+E2Zd2ANkbDedt9l7TNG
	 F9RyDk0y5FU6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v15 02/12] net: phylink: introduce internal
 phylink PCS handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901083001.8044-3-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
 <20260901083001.8044-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 08:30:53 +0000
Message-Id: <20260902083054.10DB01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] phylink_validate_mac_and_pcs() fails to reject interfaces when a r=
equired PCS is not found, leading to invalid link configurations being acce=
pted.
- [High] phylink_create() improperly unions MAC and PCS supported interface=
s, leaking unsupported generic PCS modes to the phylink configuration.
--

commit 29d359b25a130406a2e1a1837648f9bffccf1373
Author: Christian Marangi <ansuelsmth@gmail.com>

    net: phylink: introduce internal phylink PCS handling
   =20
    Introduce internal handling of PCS for phylink. This is an alternative
    way to .mac_select_pcs that moves the selection logic of the PCS entire=
ly
    to phylink with the usage of the supported_interface value in the PCS
    struct.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 7f7a7328124f2..d7391a60f01f6 100644
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

[Severity: High]
If a MAC declares pcs_interfaces for a mode, but no PCS in the list matches
that interface, pcs remains NULL. Does this code incorrectly proceed to=20
validate the MAC capabilities without returning an error (such as -EINVAL)
when a required PCS is missing?

[ ... ]
> @@ -1909,16 +2028,31 @@ struct phylink *phylink_create(struct phylink_con=
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
Does this unintentionally leak unsupported generic PCS modes to the phylink
configuration?

By ORing the PCS interfaces into pl->supported_interfaces, the phylink
instance may falsely advertise support for modes that the PCS supports but
the MAC hardware does not natively support, bypassing the MAC capability
restrictions. Should this restrict to the intersection instead?

>  	linkmode_fill(pl->supported);
>  	linkmode_copy(pl->link_config.advertising, pl->supported);
>  	phylink_validate(pl, pl->supported, &pl->link_config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901083001.8044=
-1-ansuelsmth@gmail.com?part=3D2
